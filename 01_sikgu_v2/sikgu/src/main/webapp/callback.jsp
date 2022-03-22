<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.net.HttpURLConnection" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>네이버로그인</title>
  </head>
  <body>
  <%
    String clientId = "d2P0eCEHcyvS2ui1JQHk";//애플리케이션 클라이언트 아이디값";
    String clientSecret = "9szRQ2nxKt";//애플리케이션 클라이언트 시크릿값";
    String code = request.getParameter("code");
    String state = request.getParameter("state");
    String redirectURI = URLEncoder.encode("http://localhost:8080/sikgu/callback.jsp", "UTF-8");
    String apiURL;
    apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
    apiURL += "client_id=" + clientId;
    apiURL += "&client_secret=" + clientSecret;
    apiURL += "&redirect_uri=" + redirectURI;
    apiURL += "&code=" + code;
    apiURL += "&state=" + state;
    String access_token = "";
    String refresh_token = "";
    System.out.println("apiURL="+apiURL);
    String result1 = "";
    try {
      URL url = new URL(apiURL);
      HttpURLConnection con = (HttpURLConnection)url.openConnection();
      con.setRequestMethod("GET");
      int responseCode = con.getResponseCode();
      BufferedReader br;
      System.out.print("responseCode="+responseCode);
      if(responseCode==200) { // 정상 호출
        br = new BufferedReader(new InputStreamReader(con.getInputStream()));
      } else {  // 에러 발생
        br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
      }
      String inputLine;
      StringBuffer res = new StringBuffer();
      while ((inputLine = br.readLine()) != null) {
        res.append(inputLine);
      }
      br.close();
      if(responseCode==200) {
//         out.println(res.toString());
      //특정단어(부분)만 자르기
        String str = res.toString();
        String target = "AAAA";
        int target_num = str.indexOf(target); 
        String result; 
        result = str.substring(target_num,(str.substring(target_num).indexOf("\"")+target_num));
        System.out.println(result); 
        result1 = result;
      }
    } catch (Exception e) {
      System.out.println(e);
    }
  %>
  
  <form action="./naverpost.do" method="post" name="naverpost" id="naverpost">
  <input type="submit" id="accesstoken" name="accesstoken" value="<%=result1%>">로그인 성공
  </form>
<script src="resources/assets/vendor/jquery/jquery-3.3.1.min.js"></script>
<script>
$(document).ready(function() {
 opener.document.getElementById("accesstoken").value = document.getElementById("accesstoken").value;
 window.close();
})
</script>
  
  </body>


</html>