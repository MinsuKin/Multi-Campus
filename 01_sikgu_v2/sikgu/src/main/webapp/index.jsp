<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
	<div id="ju-loading-screen">
		<div class="sk-wandering-cubes">
			<div class="sk-cube sk-cube1"></div>
			<div class="sk-cube sk-cube2"></div>
		</div>
	</div>
<!-- index.jsp를 호출하면 redirect로 스쳐지나가게 할 예정. -->
<%
    response.sendRedirect("./main.do");
%>
	<script
		src="resources/assets/vendor/loadscreen/js/ju-loading-screen.js"></script>
</body>
</html>
