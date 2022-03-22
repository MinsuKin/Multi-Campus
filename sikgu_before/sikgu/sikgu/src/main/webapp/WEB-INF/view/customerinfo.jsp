<%@ page  contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>


<!DOCTYPE html >
<html>
<head>
<meta   charset="utf-8">
<TITLE>개인 정보 입력 화면</TITLE>
<link rel=stylesheet href="../css/user.css" type="text/css">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=11385b89f73bcc9d4dc2406ea538f4b9&libraries=services"></script>
<script type="text/javascript">
function AddC(){		
	customerinfo.action="./addC.do";
	customerinfo.submit();	
}
/* function userList(){
	customerinfo.action="./list.do";
	customerinfo.submit();
} */
function submitForm(){
var geocoder = new kakao.maps.services.Geocoder();
var callback = function(result, status) {
    if (status === kakao.maps.services.Status.OK) {
        document.getElementById('default_x1').value = result[0].x;
        document.getElementById('default_y1').value = result[0].y;
    }
};
geocoder.addressSearch(FullAddress, callback);

AddC()
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
			<td bgcolor="f4f4f4" height="22">&nbsp;&nbsp;<b>회원가입</b></td>
		  </tr>
	  </table>  
	  <br>
	  
	  
 <form:error path"user"/>
 
	  <!-- write Form  -->
	  
	  <form name="customerinfo" method="post" action="">
<!-- 	  <form action="fileUpload.jsp" method="post" enctype="multipart/form-data"> -->
	  <table border="0" cellpadding="0" cellspacing="1" width="590" bgcolor="BBBBBB">
		

		  <tr>
			<td width=100 align=center bgcolor="E6ECDE" height="22">사용자 아이디</td>
			<td width=490 bgcolor="ffffff" style="padding-left:20">
				<input type="text" style="width:150" name="sikgu_id" value="${user.sikgu_id}" readonly>

			</td>
		  </tr>

		  <tr>
			<td width=100 align=center bgcolor="E6ECDE" height="22">닉네임</td>
			<td width=490 bgcolor="ffffff" style="padding-left:20">
				<input type="text" style="width:150" name="customer_nickname" value="">

			</td>
		  </tr>
		  
		<input type = "hidden" name ="customer_image_path" value = "">
		  
		  <tr>
			<td width=100 align=center bgcolor="E6ECDE" height="22">전화번호</td>
			<td width=490 bgcolor="ffffff" style="padding-left:20">
				<input type="text" style="width:150" name="customer_phone" value="">

			</td>
		  </tr>
		  
		  
		  <tr>
			<td width=100 align=center bgcolor="E6ECDE" height="22">집주소</td>
			<td width=490 bgcolor="ffffff" style="padding-left:20">
				<input type="text" name="customer_address" id="customer_address" placeholder="주소">
				<input type="button" onclick="sample5_execDaumPostcode('customer_address')" value="주소 검색"><br>
				<div id="map" style="width:300px;height:300px;margin-top:10px;display:none"></div>

			</td>
		  </tr>
		 
		  <tr>
			<td width=100 align=center bgcolor="E6ECDE" height="22">자주가는동네1</td>
			<td width=490 bgcolor="ffffff" style="padding-left:20">
				<input type="text" id="favorite_address1" placeholder="주소">
				<input type="button" onclick="sample5_execDaumPostcode('favorite_address1')" value="주소 검색"><br>
				<div id="map" style="width:300px;height:300px;margin-top:10px;display:none"></div>

			</td>
		  </tr>
		  
		   <tr>
			<td width=100 align=center bgcolor="E6ECDE" height="22">자주가는동네2</td>
			<td width=490 bgcolor="ffffff" style="padding-left:20">
				<input type="text" id="favorite_address2" placeholder="주소">
				<input type="button" onclick="sample5_execDaumPostcode('favorite_address2')" value="주소 검색"><br>
				<div id="map" style="width:300px;height:300px;margin-top:10px;display:none"></div>

			</td>
		  </tr>
		  
		   <tr>
			<td width=100 align=center bgcolor="E6ECDE" height="22">자주가는동네3</td>
			<td width=490 bgcolor="ffffff" style="padding-left:20">
				<input type="text" id="favorite_address3" placeholder="주소">
				<input type="button" onclick="sample5_execDaumPostcode('favorite_address3')" value="주소 검색"><br>
				<div id="map" style="width:300px;height:300px;margin-top:10px;display:none"></div>

			</td>
		  </tr>
		 
 		<tr>
			<td width=100 align=center bgcolor="E6ECDE" height="22">성별</td>
			<td width=490 bgcolor="ffffff" style="padding-left:20">
				<input type="radio" style="width:150" name="customer_gender" value="M">남성
				<input type="radio" style="width:150" name="customer_gender" value="F">여성

			</td>
		  </tr>
		  
		  <tr>
			<td width=100 align=center bgcolor="E6ECDE" height="22">나이</td>
			<td width=490 bgcolor="ffffff" style="padding-left:20">
				<input type="text" style="width:150" name="customer_age" value="">

			</td>
		  </tr>
		  
		  <tr>
			<td width=100 align=center bgcolor="E6ECDE" height="22">가족형태</td>
			<td width=490 bgcolor="ffffff" style="padding-left:20">
				<input type="radio" style="width:150" name="customer_family_type" value=1>1인가족
				<input type="radio" style="width:150" name="customer_family_type" value=2>2인가족
				<input type="radio" style="width:150" name="customer_family_type" value=3>3인이상

			</td>
		  </tr>
		  
	  </table>
	  
	  <br>
	  
	  <table width=590 border=0 cellpadding=0 cellspacing=0>
		  <tr>
			<td align=center>
			<input type="button" value="확인" onClick="submitForm()"> &nbsp;
<!-- 			<input type="button" value="목록" onClick="userList()"> -->
			
			</td>
		  </tr>
	  </table>

	  </td>
	</tr>
</table>  

<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div
mapOption = {
    center: new kakao.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
    level: 5 // 지도의 확대 레벨
};

//지도를 미리 생성
var map = new kakao.maps.Map(mapContainer, mapOption);
//주소-좌표 변환 객체를 생성
var geocoder = new kakao.maps.services.Geocoder();
//마커를 미리 생성
var marker = new kakao.maps.Marker({
position: new kakao.maps.LatLng(37.537187, 127.005476),
map: map
});

function sample5_execDaumPostcode(whoami) {
new daum.Postcode({
    oncomplete: function(data) {
        var addr = data.address; // 최종 주소 변수

        // 주소 정보를 해당 필드에 넣는다.
        document.getElementById(whoami).value = addr;

        // 주소로 상세 정보를 검색
        geocoder.addressSearch(data.address, function(results, status) {
            // 정상적으로 검색이 완료됐으면
            if (status === kakao.maps.services.Status.OK) {

                var result = results[0]; //첫번째 결과의 값을 활용

                // 해당 주소에 대한 좌표를 받아서
                var coords = new kakao.maps.LatLng(result.y, result.x);
                // 지도를 보여준다.
                mapContainer.style.display = "block";
                map.relayout();
                // 지도 중심을 변경한다.
                map.setCenter(coords);
                // 마커를 결과값으로 받은 위치로 옮긴다.
                marker.setPosition(coords)
               if(fX != null && fY != null){
               document.getElementById(default_x1).value = result.x;
               document.getElementById(default_y1).value = result.y;
               } 
                }
        });
    }
}).open();
}
</script>




<input type = "hidden" name ="default_x1" id ="default_x1" value = "">
<input type = "hidden" name ="default_y1" id ="default_y1" value = "">
<input type = "hidden" name ="default_x2" id ="default_x2" value = "">
<input type = "hidden" name ="default_y2" id ="default_y2" value = "">
<input type = "hidden" name ="default_x3" id ="default_x3" value = "">
<input type = "hidden" name ="default_y3" id ="default_y3" value = "">

 </form>
</body>
</html>