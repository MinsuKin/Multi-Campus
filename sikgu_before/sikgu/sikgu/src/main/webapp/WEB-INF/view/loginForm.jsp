<%@ page  contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<div id="main">
<h3 style="text-align : center;"> 로그인</h3>

<form method='post' action='./login.do'  >
 <table >
     <tr>
       <td style="width:100;text-align:left;">아이디</td>
       <td><input type="text" id="sikgu_id" name="sikgu_id" size="20" maxlength="15"/></td>
      </tr>
     <tr>
      <td style="width:100;text-align:left;">비밀번호</td>
        <td><input type="password" id="sikgu_pwd" name="sikgu_pwd" size="20" maxlength="15"/></td>
        </tr>
        <tr><td colspan="2" align="center">
        <input type="submit" id="login" value="로그인" />&nbsp;&nbsp;
        <a href="./add.do"  ><span style="font-size:small">회원가입</span></a>&nbsp;&nbsp;<a href=""><span style="font-size:small;">아이디/비밀번호 찾기</span></a></td>
        </tr>
      </table>
</form>

</div>