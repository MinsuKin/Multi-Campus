/*
 * Copyright (c) 2012 Google Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except
 * in compliance with the License. You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software distributed under the License
 * is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express
 * or implied. See the License for the specific language governing permissions and limitations under
 * the License.
 */

package lab.spring.sikgu.controller;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FilenameFilter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.Reader;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import com.google.api.client.auth.oauth2.Credential;
import com.google.api.client.extensions.java6.auth.oauth2.AuthorizationCodeInstalledApp;
import com.google.api.client.extensions.java6.auth.oauth2.FileCredentialStore;
import com.google.api.client.extensions.jetty.auth.oauth2.LocalServerReceiver;
import com.google.api.client.googleapis.auth.oauth2.GoogleAuthorizationCodeFlow;
import com.google.api.client.googleapis.auth.oauth2.GoogleClientSecrets;
import com.google.api.client.googleapis.json.GoogleJsonResponseException;
import com.google.api.client.googleapis.media.MediaHttpUploader;
import com.google.api.client.googleapis.media.MediaHttpUploaderProgressListener;
import com.google.api.client.http.HttpTransport;
import com.google.api.client.http.InputStreamContent;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.JsonFactory;
import com.google.api.client.json.jackson2.JacksonFactory;
import com.google.api.services.youtube.YouTube;
import com.google.api.services.youtube.model.Video;
import com.google.api.services.youtube.model.VideoSnippet;
import com.google.api.services.youtube.model.VideoStatus;
import com.google.common.collect.Lists;

/**
 * Demo of uploading a video to a user's account using the YouTube Data API (V3) with OAuth2 for
 * authorization.
 *
 *  TODO: PLEASE NOTE, YOU MUST ADD YOUR VIDEO FILES TO THE PROJECT FOLDER TO UPLOAD THEM WITH THIS
 * APPLICATION!
 *
 * @author Jeremy Walker
 */
public class UploadVideo {

  /** Global instance of the HTTP transport. */
  private static final HttpTransport HTTP_TRANSPORT = new NetHttpTransport();

  /** Global instance of the JSON factory. */
  private static final JsonFactory JSON_FACTORY = new JacksonFactory();

  /** Global instance of Youtube object to make all API requests. */
  private static YouTube youtube;

  /* Global instance of the format used for the video being uploaded (MIME type). */
  private static String VIDEO_FILE_FORMAT = "video/*";

  /**
   * Authorizes the installed application to access user's protected data.
   *
   * @param scopes list of scopes needed to run youtube upload.
   */
  public static Credential authorize(List<String> scopes) throws Exception {

    // Load client secrets.
    GoogleClientSecrets clientSecrets = GoogleClientSecrets.load(JSON_FACTORY,
             new InputStreamReader(UploadVideo.class.getResourceAsStream("/client_secrets.json")));


    // Checks that the defaults have been replaced (Default = "Enter X here").
    if (clientSecrets.getDetails().getClientId().startsWith("Enter")
        || clientSecrets.getDetails().getClientSecret().startsWith("Enter")) {
      System.out.println(
          "Enter Client ID and Secret from https://console.developers.google.com/project/_/apiui/credential"
          + "into youtube-cmdline-uploadvideo-sample/src/main/resources/client_secrets.json");
      System.exit(1);
    }

    // Set up file credential store.
    FileCredentialStore credentialStore = new FileCredentialStore(
        new File(System.getProperty("user.home"), ".credentials/youtube-api-uploadvideo.json"),
        JSON_FACTORY);

    // Set up authorization code flow.
    GoogleAuthorizationCodeFlow flow = new GoogleAuthorizationCodeFlow.Builder(
        HTTP_TRANSPORT, JSON_FACTORY, clientSecrets, scopes).setCredentialStore(credentialStore)
        .build();

    // Build the local server and bind it to port 9000
    LocalServerReceiver localReceiver = new LocalServerReceiver.Builder().setPort(8081).build();

    // Authorize.
    return new AuthorizationCodeInstalledApp(flow, localReceiver).authorize("user");
  }

  /**
   * Uploads user selected video in the project folder to the user's YouTube account using OAuth2
   * for authentication.
   *
   * @param args command line args (not used).
   */


  /**
   * Gets the user selected local video file to upload.
   */
  private static File getVideoFromUser() throws IOException {
    File[] listOfVideoFiles = getLocalVideoFiles();
    return getUserChoice(listOfVideoFiles);
  }

  /**
   * Gets an array of videos in the current directory.
   */
  private static File[] getLocalVideoFiles() throws IOException {

    File currentDirectory = new File(".");
    System.out.println("Video files from " + currentDirectory.getAbsolutePath() + ":");

    // Filters out video files. This list of video extensions is not comprehensive.
    FilenameFilter videoFilter = new FilenameFilter() {
      public boolean accept(File dir, String name) {
        String lowercaseName = name.toLowerCase();
        if (lowercaseName.endsWith(".webm") || lowercaseName.endsWith(".flv")
            || lowercaseName.endsWith(".f4v") || lowercaseName.endsWith(".mov")
            || lowercaseName.endsWith(".mp4")) {
          return true;
        } else {
          return false;
        }
      }
    };
    return currentDirectory.listFiles(videoFilter);
  }

  /**
   * Outputs video file options to the user, records user selection, and returns the video (File
   * object).
   *
   * @param videoFiles Array of video File objects
   */
  private static File getUserChoice(File videoFiles[]) throws IOException {

    if (videoFiles.length < 1) {
      throw new IllegalArgumentException("No video files in this directory.");
    }

    for (int i = 0; i < videoFiles.length; i++) {
      System.out.println(" " + i + " = " + videoFiles[i].getName());
    }

    BufferedReader bReader = new BufferedReader(new InputStreamReader(System.in));
    String inputChoice;

    do {
      System.out.print("Choose the number of the video file you want to upload: ");
      inputChoice = bReader.readLine();
    } while (!isValidIntegerSelection(inputChoice, videoFiles.length));

    return videoFiles[Integer.parseInt(inputChoice)];
  }

  /**
   * Checks if string contains a valid, positive integer that is less than max. Please note, I am
   * not testing the upper limit of an integer (2,147,483,647). I just go up to 999,999,999.
   *
   * @param input String to test.
   * @param max Integer must be less then this Maximum number.
   */
  public static boolean isValidIntegerSelection(String input, int max) {
    if (input.length() > 9) return false;

    boolean validNumber = false;
    // Only accepts positive numbers of up to 9 numbers.
    Pattern intsOnly = Pattern.compile("^\\d{1,9}$");
    Matcher makeMatch = intsOnly.matcher(input);

    if (makeMatch.find()) {
      int number = Integer.parseInt(makeMatch.group());
      if ((number >= 0) && (number < max)) {
        validNumber = true;
      }
    }
    return validNumber;
  }
}