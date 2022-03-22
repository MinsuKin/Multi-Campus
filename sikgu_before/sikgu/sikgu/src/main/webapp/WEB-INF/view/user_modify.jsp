<%@ page  contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html >
<html>
<head>
<meta   charset="utf-8">
<TITLE>개인 정보 입력 화면</TITLE>
<link rel=stylesheet href="../css/user.css" type="text/css">
<script type="text/javascript">
function updateUser(){		
	f.action="./update.do";
	f.submit();	
}
function removeUser(){		
	f.action="./remove.do";
	f.submit();	
}
function userList(){
	f.action="./list.do";
	f.submit();
}
</script>
</head>
<body bgcolor=#FFFFFF text=#000000 leftmargin=0 topmargin=0 marginwidth=0 marginheight=0>
<br>
<table width=780 border=0 cellpadding=0 cellspacing=0>
	<tr>
	  <td width="20"></td>
	  <td>
  <!--contents-->
	  <table width=590 border=0 cellpadding=0 cellspacing=0>
		  <tr>
			<td bgcolor="f4f4f4" height="22">&nbsp;&nbsp;<b>사용자 관리</b></td>
		  </tr>
	  </table>  
	  <br>
	  
	  
 
	  <!-- write Form  -->
	  <form name="f" method="post" action="">
	  
	  <table border="0" cellpadding="0" cellspacing="1" width="590" bgcolor="BBBBBB">
		  <tr>
			<td width=100 align=center bgcolor="E6ECDE" height="22">사용자 아이디</td>
			<td width=490 bgcolor="ffffff" style="padding-left:20">
				<input type="text" style="width:150" name="userid" value="${user.userid}">
				 
			</td>
		  </tr>
		  <tr>
			<td width=100 align=center bgcolor="E6ECDE" height="22">비밀번호</td>
			<td width=490 bgcolor="ffffff" style="padding-left:20">
				<input type="password" style="width:150" name="userpwd" value="${user.userpwd}">
				  
			</td>
		  </tr>
		   
		  <tr>
			<td width=100 align=center bgcolor="E6ECDE" height="22">이름</td>
			<td width=490 bgcolor="ffffff" style="padding-left:20">
				<input type="text" style="width:200" name="username" value="${user.username}">
		 		 
			</td>
		  </tr>
		  

	  </table>
	  
	  <br>
	  
	  <table width=590 border=0 cellpadding=0 cellspacing=0>
		  <tr>
			<td align=center>
			<input type="button" value="수정" onClick="updateUser()"> &nbsp;
			<input type="button" value="삭제" onClick="removeUser()"> &nbsp;
<!-- 			<input type="button" value="목록" onClick="userList()"> -->
			</td>
		  </tr>
	  </table>

	  </td>
	</tr>
</table>  
 </form>
</body>
</html>