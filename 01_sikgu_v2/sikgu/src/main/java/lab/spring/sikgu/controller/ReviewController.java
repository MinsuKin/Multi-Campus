package lab.spring.sikgu.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Calendar;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.api.client.auth.oauth2.Credential;
import com.google.api.client.googleapis.json.GoogleJsonResponseException;
import com.google.api.client.googleapis.media.MediaHttpUploader;
import com.google.api.client.googleapis.media.MediaHttpUploaderProgressListener;
import com.google.api.client.http.InputStreamContent;
import com.google.api.services.youtube.YouTube;
import com.google.api.services.youtube.model.Video;
import com.google.api.services.youtube.model.VideoSnippet;
import com.google.api.services.youtube.model.VideoStatus;
import com.google.common.collect.Lists;

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.FilenameFilter;
import java.io.InputStreamReader;
import java.io.Reader;
import java.util.ArrayList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import com.google.api.client.extensions.java6.auth.oauth2.AuthorizationCodeInstalledApp;
import com.google.api.client.extensions.jetty.auth.oauth2.LocalServerReceiver;
import com.google.api.client.googleapis.auth.oauth2.GoogleAuthorizationCodeFlow;
import com.google.api.client.googleapis.auth.oauth2.GoogleClientSecrets;
import com.google.api.client.http.HttpTransport;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.JsonFactory;
import com.google.api.client.json.jackson2.JacksonFactory;


import lab.spring.sikgu.model.ReviewVO;
//import lab.spring.sikgu.naver.MultipartUtil;
import lab.spring.sikgu.service.ReviewService;

@Controller
public class ReviewController {

   @Autowired
   ReviewService service;

   @RequestMapping(value = "/upup.do")
   public String upload() {
      return "upload";
   }

   @RequestMapping(value = "/getStoreContent.do", method = RequestMethod.POST)
   @ResponseBody
   public List<ReviewVO> getStoreContent(@RequestBody Map<String, Object> Map) {
      HashMap<String, Object> searchKey = (Map instanceof HashMap) ? (HashMap<String, Object>) Map
            : new HashMap<String, Object>(Map);
      List<ReviewVO> reviews = service.getStoreContent(searchKey);
      return reviews;
   }

   //   @RequestMapping(value = "/getCustomerContent.do", method = RequestMethod.POST)
   //   @ResponseBody
   //   public List<ReviewVO> getCustomerContent(@RequestBody Map<String, Object> Map) {
   //      HashMap<String, Object> searchKey = (Map instanceof HashMap) ? (HashMap<String, Object>) Map
   //            : new HashMap<String, Object>(Map);
   //      List<ReviewVO> reviews = service.getCustomerContent(searchKey);
   //      return reviews;
   //   }

   @RequestMapping(value = "/imageUpload.do", method = RequestMethod.POST)
   @ResponseBody
   public String imageUpload(MultipartHttpServletRequest contents) {

      ReviewVO reVO = null;
      ReviewVO urlVO = null;
      String content_title1 ="";
      String store_id = contents.getParameterValues("store_id")[0];
      String content_description = contents.getParameterValues("content_description")[0];
      String face_check = contents.getParameterValues("face_check")[0];
      String naver_check = contents.getParameterValues("naver_check")[0];
      String face_link = contents.getParameterValues("face_link")[0];
      String naver_link = contents.getParameterValues("naver_link")[0];
      String youtube_link = contents.getParameterValues("youtube_link")[0];
      String token = contents.getParameterValues("accesstoken")[0];
      List<File> filesList = new LinkedList<File>();

      for(int x = 0; x<contents.getFiles("files").size(); x++) {
         MultipartFile imageFile = contents.getFiles("files").get(x);
         System.out.println("1.reviewFile :" + imageFile);
         File content_url = loadImage(store_id, imageFile);
         filesList.add(content_url);
         System.out.println("2.content_url :" + content_url);
         String fileName = content_url.getName();
         System.out.println("3.fileName :" + fileName);
         int pos = fileName.lastIndexOf(".");
         String content_title = fileName.substring(0, pos);
         content_title1 = content_title;
         System.out.println("4.content_title :" + content_title);
         String content_type = fileName.substring(pos + 1);
         System.out.println("5.content_type :" + content_type);
         long content_size = imageFile.getSize();
         reVO = new ReviewVO(store_id,content_description,content_url.toString(),content_type,content_size,content_title,face_check,naver_check,face_link,naver_link);
         service.reviewUpload(reVO);
      }
     
      if(naver_check.equals("T")) {

         String header = "Bearer " + token; // Bearer ������ ���� �߰�
         String line1 = "";
         String line2 = "";
         try {
            // api url ����
            String apiURL = "https://openapi.naver.com/blog/writePost.json";
            MultipartUtil mu = new MultipartUtil(apiURL);

            // ��ū ��ū ��� �߰�
            mu.addHeaderField("Authorization", header);
            mu.readyToConnect();
            // blog �۾��� �ʼ� ��û���� title �߰�
            String title = "우리 가게 홍보";
            // blog �۾��� �ʼ� ��û���� contents - ÷���̹����� <img src='#0' />, <img src='#1' /> ... ���� ���� ����

            //���� ���� ���� ������ �ڵ�
            //String content = "<font color='red'>multi-part</font>�� ÷���� ���Դϴ�. <br>  �̹��� ÷�� <br> ";
            //for(int i = 0; i<contents.getFiles("files").size();i++) {
            //   content = content.concat("<img src='#"+i+"' />");  
            //   System.out.println(content);
            //}

            
            //���� �ڿ� ���� ���� �ڵ�
            // blog �۾��� �ʼ� ��û���� contents - ÷���̹����� <img src='#0' />, <img src='#1' /> ... ���� ���� ����
            String content = "";
            for(int i = 0; i<contents.getFiles("files").size();i++) {
             content = content.concat("<img src='#"+i+"' />");  
            }
            content += content_description;
            
            
            mu.addFormField("title", title);
            mu.addFormField("contents", content);

            for(int x = 0; x<filesList.size(); x++) {
               File uploadFile = filesList.get(x);
               mu.addFilePart("image", uploadFile);
            }

            // HTTP ȣ�� ��� ����
            List<String> response = mu.finish();
            System.out.println("SERVER REPLIED:");


            for (String line : response) {
               System.out.println(line);
               line2 += line;
            }

         } catch (Exception e) {
            System.out.println(e);
         }
         String str = line2;
         String target = "http://";
         int target_num = str.indexOf(target); 
         String result; 
         result = str.substring(target_num,(str.substring(target_num).indexOf("\"")+target_num));
         System.out.println(result); 
         line1 = result;
         naver_link = line1;
         urlVO = new ReviewVO(content_title1,face_link,naver_link,youtube_link);
         System.out.println(naver_link); 
         service.reviewUrl(urlVO);
         return line1;
      }

      return "ok";
   }


   @RequestMapping(value = "/videoUpload.do", method = RequestMethod.POST)
   @ResponseBody
   public String videosUpload( MultipartHttpServletRequest request) {
      
    
      ReviewVO reVO = null;
      ReviewVO urlVO = null;
      String store_id = request.getParameterValues("store_id")[0];
      String content_description = request.getParameterValues("content_description")[0];
      String face_check = request.getParameterValues("face_check")[0];
      String naver_check = request.getParameterValues("naver_check")[0];
      String you_check = request.getParameterValues("you_check")[0];
      String face_link = request.getParameterValues("face_link")[0];
      String naver_link = request.getParameterValues("naver_link")[0];
      String youtube_link = request.getParameterValues("youtube_link")[0];
      HttpTransport HTTP_TRANSPORT = new NetHttpTransport();
      JsonFactory JSON_FACTORY = new JacksonFactory();
      YouTube youtube;
      String VIDEO_FILE_FORMAT = "video/*";

      System.out.println(store_id);
      System.out.println(content_description);
      System.out.println(request);
      MultipartFile videoFile = request.getFile("input_video");

      //InputStream inputStream = new ByteArrayInputStream(videoFile.getBytes());
            
      MultipartFile thumbnail = request.getFile("input_thumbnail");
      System.out.println("1.reviewFile :" + videoFile);
      File content_url = loadVideo(store_id, videoFile);
      System.out.println("2.content_url :" + content_url);
      String fileName = content_url.getName();
      System.out.println("3.fileName :" + fileName);
      
      int pos = fileName.lastIndexOf(".");
      String content_title = fileName.substring(0, pos);
      System.out.println("4.content_title :" + content_title);
      String thumbnailName = loadThumbnail(store_id, thumbnail, content_title);
      String content_type = fileName.substring(pos + 1);
      System.out.println("5.content_type :" + content_type);
     
      System.out.println("6.thumbnail :" + thumbnailName);
      long content_size = videoFile.getSize();
      reVO = new ReviewVO(store_id,content_description,content_url.toString(),content_type,content_size,content_title,face_check,naver_check,you_check,face_link,naver_link,thumbnailName);
      service.reviewUpload(reVO);

      if(you_check.equals("T")) { //you_check
         
         String line1 = "";
         String line2 = "";
         
         List<String> scopes = Lists.newArrayList("https://www.googleapis.com/auth/youtube.upload");

           try {
             // Authorization.
             Credential credential = UploadVideo.authorize(scopes);

             // YouTube object used to make all API requests.
             youtube = new YouTube.Builder(HTTP_TRANSPORT, JSON_FACTORY, credential).setApplicationName(
                 "youtube-cmdline-uploadvideo-sample").build();

             // We get the user selected local video file to upload.
             //File videoFile = getVideoFromUser();
             System.out.println("You chose " + videoFile + " to upload.");

             // Add extra information to the video before uploading.
             Video videoObjectDefiningMetadata = new Video();

             /*
              * Set the video to public, so it is available to everyone (what most people want). This is
              * actually the default, but I wanted you to see what it looked like in case you need to set
              * it to "unlisted" or "private" via API.
              */
             VideoStatus status = new VideoStatus();
             status.setPrivacyStatus("public");
             videoObjectDefiningMetadata.setStatus(status);

             // We set a majority of the metadata with the VideoSnippet object.
             VideoSnippet snippet = new VideoSnippet();

             /*
              * The Calendar instance is used to create a unique name and description for test purposes, so
              * you can see multiple files being uploaded. You will want to remove this from your project
              * and use your own standard names.
              */
             Calendar cal = Calendar.getInstance();
             //cal.getTime()
             snippet.setTitle("우리가게홍보");
             snippet.setDescription(
                   content_description);

             //Set your keywords.
//             List<String> tags = new ArrayList<String>();
//             tags.add("test");
//             tags.add("example");
//             tags.add("java");
//             tags.add("YouTube Data API V3");
//             tags.add("erase me");
//             snippet.setTags(tags);

             // Set completed snippet to the video object.
             videoObjectDefiningMetadata.setSnippet(snippet);

             //InputStreamContent mediaContent = new InputStreamContent(
             //    VIDEO_FILE_FORMAT, new BufferedInputStream(new FileInputStream(videoFile)));
             //mediaContent.setLength(videoFile.length());

             InputStream is = new ByteArrayInputStream(videoFile.getBytes());
              InputStreamContent mediaContent = new InputStreamContent(VIDEO_FILE_FORMAT, is);

             /*
              * The upload command includes: 1. Information we want returned after file is successfully
              * uploaded. 2. Metadata we want associated with the uploaded video. 3. Video file itself.
              */
             YouTube.Videos.Insert videoInsert = youtube.videos()
                 .insert("snippet,statistics,status", videoObjectDefiningMetadata, mediaContent);

             // Set the upload type and add event listener.
             MediaHttpUploader uploader = videoInsert.getMediaHttpUploader();

             /*
              * Sets whether direct media upload is enabled or disabled. True = whole media content is
              * uploaded in a single request. False (default) = resumable media upload protocol to upload
              * in data chunks.
              */
             uploader.setDirectUploadEnabled(false);

             MediaHttpUploaderProgressListener progressListener = new MediaHttpUploaderProgressListener() {
               public void progressChanged(MediaHttpUploader uploader) throws IOException {
                 switch (uploader.getUploadState()) {
                   case INITIATION_STARTED:
                     System.out.println("Initiation Started");
                     break;
                   case INITIATION_COMPLETE:
                     System.out.println("Initiation Completed");
                     break;
                   case MEDIA_IN_PROGRESS:
                     System.out.println("Upload in progress");
                     System.out.println("Upload percentage: " + uploader.getProgress());
                     break;
                   case MEDIA_COMPLETE:
                     System.out.println("Upload Completed!");
                     break;
                   case NOT_STARTED:
                     System.out.println("Upload Not Started!");
                     break;
                 }
               }
             };
             uploader.setProgressListener(progressListener);

             // Execute upload.
             Video returnedVideo = videoInsert.execute();
             line1 = returnedVideo.getId();
             // Print out returned results.
             System.out.println("\n================== Returned Video ==================\n");
             System.out.println("  - Id: " + returnedVideo.getId());
             System.out.println("  - Title: " + returnedVideo.getSnippet().getTitle());
             System.out.println("  - Tags: " + returnedVideo.getSnippet().getTags());
             System.out.println("  - Privacy Status: " + returnedVideo.getStatus().getPrivacyStatus());
             System.out.println("  - Video Count: " + returnedVideo.getStatistics().getViewCount());

           } catch (GoogleJsonResponseException e) {
             System.err.println("GoogleJsonResponseException code: " + e.getDetails().getCode() + " : "
                 + e.getDetails().getMessage());
             e.printStackTrace();
           } catch (IOException e) {
             System.err.println("IOException: " + e.getMessage());
             e.printStackTrace();
           } catch (Throwable t) {
             System.err.println("Throwable: " + t.getMessage());
             t.printStackTrace();
           }
           line2 = "https://www.youtube.com/watch?v="+line1;
           youtube_link = line2;
           System.out.println(youtube_link);
           urlVO = new ReviewVO(content_title,face_link,naver_link,youtube_link);
           service.reviewUrl(urlVO);
         return line2;
      }
      return "ok";

   }

   private File loadImage(String store_id, MultipartFile imageFile) {
      File outFile = null;

      if (!imageFile.isEmpty()) {
         String filename = imageFile.getOriginalFilename();
         String fn = FilenameUtils.getBaseName(filename);
         String fe = FilenameUtils.getExtension(filename);

         try {
            if (fe.equalsIgnoreCase("JPG") || fe.equalsIgnoreCase("JPEG") || fe.equalsIgnoreCase("GIF")
                  || fe.equalsIgnoreCase("PNG")){

               byte[] bytes = imageFile.getBytes();

               String path = "c:\\content\\" + store_id + "\\img";
               File outFilePath = new File(path);
               if (!outFilePath.exists()) {
                  outFilePath.mkdirs();
               }

               outFile = GetUniqName(path, fn, fe);
               FileOutputStream fos = new FileOutputStream(outFile);
               fos.write(bytes);
               fos.close();

            } else {
               System.err.println("File type error! ");
            }
         } catch (Exception e) {
            e.printStackTrace();
         }
      }
      return outFile;
   }
   
   private File loadVideo(String store_id, MultipartFile video) {
      File outFile = null;
      
      if (!video.isEmpty()) {
         String filename = video.getOriginalFilename();
         String fn = FilenameUtils.getBaseName(filename);
         String fe = FilenameUtils.getExtension(filename);
         
         try {
            if (fe.equalsIgnoreCase("MP4") || fe.equalsIgnoreCase("MPEG")
             || fe.equalsIgnoreCase("WMV") || fe.equalsIgnoreCase("MOV") 
             || fe.equalsIgnoreCase("AVI")){
               
               byte[] bytes = video.getBytes();
               
               String path = "c:\\content\\" + store_id + "\\vid";
               File outFilePath = new File(path);
               if (!outFilePath.exists()) {
                  outFilePath.mkdirs();
               }
               
               outFile = GetUniqName(path, fn, fe);
               FileOutputStream fos = new FileOutputStream(outFile);
               fos.write(bytes);
               fos.close();
               
            } else {
               System.err.println("File type error! ");
            }
         } catch (Exception e) {
            e.printStackTrace();
         }
      }
      return outFile;
   }

   private String loadThumbnail(String store_id, MultipartFile thumbnail, String filename) {
      File outFile = null;
      String fn = "";
      String fe = "";
      if (!thumbnail.isEmpty()) {
         String thumbnailFile = thumbnail.getOriginalFilename();
         fn = filename; //
         fe = FilenameUtils.getExtension(thumbnailFile); //
         
         try {
            if (fe.equalsIgnoreCase("JPG") 
                  || fe.equalsIgnoreCase("JPEG") 
                  || fe.equalsIgnoreCase("GIF")
                  || fe.equalsIgnoreCase("PNG")){
               
               byte[] bytes = thumbnail.getBytes();
               
               String path = "c:\\content\\" + store_id + "\\vid\\thumbnail";
               File outFilePath = new File(path);
               
               // ��� ����
               if (!outFilePath.exists()) {
                  outFilePath.mkdirs();
               }
               
               outFile = GetUniqName(path, fn, fe);
               FileOutputStream fos = new FileOutputStream(outFile);
               fos.write(bytes);
               fos.close();
               
            } else {
               System.err.println("File type error! ");
            }
         } catch (Exception e) {
            e.printStackTrace();
         }
      }
      return fe;
   }

   private File GetUniqName(String DirName, String fn, String fe) {

      File info = new File(DirName + "/" + fn + "." + fe);
      int i = 1;
      while (true) {
         if (info.exists()) {
            info = new File(DirName + "/" + fn + "_" + i + "." + fe);
            i++;
            continue;
         } else {
            break;
         }
      }
      return info;
   }

}