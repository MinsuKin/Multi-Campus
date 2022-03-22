<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
	function AddS() {
		storeinfo.action = "./addS.do";
		storeinfo.submit();
	}
	function submitForm() {

		var FullAddress = document.getElementById('sample5_address').value;
		console.log(FullAddress + "1address");
		var list = FullAddress.split(" ")
		document.getElementById('store_sido').value = list[0];
		document.getElementById('store_sigungu').value = list[1];
		//alert(document.getElementById('store_sigungu').value); null이 아니고 undefined로 넘어감
		document.getElementById('store_dong').value = list[2];
		document.getElementById('store_biz_number').value = document
				.getElementById('store_biz_num1').value
				+ "-"
		document.getElementById('store_biz_num2').value + "-"
		document.getElementById('astore_biz_num3').value;
		document.getElementById('store_phone').value = document
				.getElementById('store_phone1').value
				+ "-"
		document.getElementById('store_phone2').value + "-"
		document.getElementById('store_phone3').value;
		document.getElementById('store_video_path').value = `./resources/videos/${user.sikgu_id}/`;

		var geocoder = new kakao.maps.services.Geocoder();
		var callback = function(result, status) {
			if (status === kakao.maps.services.Status.OK) {
				document.getElementById('store_x').value = result[0].x;
				console.log(result[0].x + "1.x");
				document.getElementById('store_y').value = result[0].y;
				console.log(result[0].y + "1.y");
				console.log(document.getElementById('store_y').value);
			}//작동안함
		};
		console.log(FullAddress + "2address");
		geocoder.addressSearch(FullAddress, callback);

		AddS()
	}
</script>
</head>
<body>
	<div>
		<form id="storeinfo" method="post" action="">
			업종 <select name="category_id">
				<option value=1>한식
				<option value=2>카페
				<option value=3>중식
				<option value=4>치킨
				<option value=5>분식
				<option value=6>양식
				<option value=7>퓨전
				<option value=8>일식
				<option value=9>제빵
			</select><br> 아이디 <input type="text" name="sikgu_id" id="sikgu_id"
				value="${user.sikgu_id}" readonly> 사업자 등록 번호 <input
				type="text" id="store_biz_num1" maxlength="3" size="3">- <input
				type="text" id="store_biz_num2" maxlength="2" size="2">- <input
				type="text" id="store_biz_num3" maxlength="4" size="4"><br>
			<input type="hidden" id="store_biz_number"> 상호 <input
				type="text" name="store_name" id="store_name"><br> 대표
			연락처 <input type="text" id="store_phone1" maxlength="3" size="3">-
			<input type="text" id="store_phone2" maxlength="4" size="4">-
			<input type="text" id="store_phone3" maxlength="4" size="4"><br>
			<input type="hidden" name="store_phone" id="store_phone"> <input
				type="text" name="store_address" id="sample5_address"
				placeholder="주소"> <input type="button"
				onclick="sample5_execDaumPostcode()" value="주소 검색"><br>
			<div id="map"
				style="width: 300px; height: 300px; margin-top: 10px; display: none"></div>


			<script>
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div
				mapOption = {
					center : new kakao.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
					level : 5
				// 지도의 확대 레벨
				};

				//지도를 미리 생성
				var map = new kakao.maps.Map(mapContainer, mapOption);
				//주소-좌표 변환 객체를 생성
				var geocoder = new kakao.maps.services.Geocoder();
				//마커를 미리 생성
				var marker = new kakao.maps.Marker({
					position : new kakao.maps.LatLng(37.537187, 127.005476),
					map : map
				});

				function sample5_execDaumPostcode() {
					new daum.Postcode(
							{
								oncomplete : function(data) {
									var addr = data.address; // 최종 주소 변수

									// 주소 정보를 해당 필드에 넣는다.
									document.getElementById("sample5_address").value = addr;
									// 주소로 상세 정보를 검색
									geocoder
											.addressSearch(
													data.address,
													function(results, status) {
														// 정상적으로 검색이 완료됐으면
														if (status === kakao.maps.services.Status.OK) {

															var result = results[0]; //첫번째 결과의 값을 활용

															// 해당 주소에 대한 좌표를 받아서
															var coords = new kakao.maps.LatLng(
																	result.y,
																	result.x);
															// 지도를 보여준다.
															mapContainer.style.display = "block";
															map.relayout();
															// 지도 중심을 변경한다.
															map
																	.setCenter(coords);
															// 마커를 결과값으로 받은 위치로 옮긴다.
															marker
																	.setPosition(coords)
														}
													});
								}
							}).open();
				}
			</script>


			store_profile_url <input type="text" name="store_profile_url"><br>
			store_web_url <input type="text" name="store_web_url"><br>
			store_sns_url <input type="text" name="store_sns_url"><br>



			<input type="hidden" name="store_sido" id="store_sido" value="">
			<input type="hidden" name="store_sigungu" id="store_sigungu" value="">
			<input type="hidden" name="store_dong" id="store_dong" value="">
			<input type="hidden" name="store_street" id="store_street" value="">
			<input type="hidden" name="store_x" id="store_x" value=""> <input
				type="hidden" name="store_y" id="store_y" value=""> <input
				type="hidden" name="store_video_path" id="store_video_path" value="">




			<input type="button" value="전송" onclick="submitForm()">
		</form>


	</div>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
		<div class="my-4 my-lg-5 col-sm-8" id="background_modal" hidden="true"
		style="background: white; z-index: 10; position: absolute; padding: 1rem 3rem; top: 50%; left: 50%; transform: translate(-50%, -50%);">
		<div class="close" id="closeInfo" style="margin-left: auto;">
			<i class="far fa-times-circle"></i>
		</div>

		<div
			class="owl-carousel owl-theme default-carousel nav-0 blog-single-slider fables-second-dots">
			<div>
				<a> <img src="resources/assets/custom/images/single-blog.jpg"
					alt="" class="w-100">
				</a>
			</div>
			<div>
				<a> <img src="resources/assets/custom/images/single-blog.jpg"
					alt="" class="w-100">
				</a>
			</div>
			<div>
				<a> <img src="resources/assets/custom/images/single-blog.jpg"
					alt="" class="w-100">
				</a>
			</div>
		</div>
		<h2 class="font-23 semi-font my-3">
			<a href="#" class="fables-main-text-color fables-second-hover-color">이벤트내용?</a>
		</h2>
		<div class="fables-forth-text-color fables-blog-date">
			<div class="row">
				<div class="col-12 col-sm-10 pt-2">
					<span class="fables-icondata fables-second-text-color mr-1"></span>
					<span class="mr-3"> 09 November, 2019 </span> <span
						class="fables-iconcomment fables-second-text-color mr-1"></span> <a
						href=""
						class="fables-forth-text-color fables-second-hover-color position-relative z-index">2</a>
					<span class="fables-forth-text-color fables-single-tags ml-4">
						<span class="fables-icontags-light fables-second-text-color"></span>
						<a href="#">태그</a> <a href="#">태그</a>
					</span>

				</div>
			</div>

		</div>
		<p class="fables-forth-text-color font-14 my-3">바비레드는 사람이 존나많고
			언덕위에 있습니다. 저녁을 뭘 먹을지 고민이 되는군요.배가 고픕니다. 집에 가고싶다 시벌태우ㅜ바비레드는 사람이 존나많고
			언덕위에 있습니다 바비레드는 사람이 존나많고 언덕위에 있습니다. 저녁을 뭘 먹을지 고민이 되는군요.배가 고픕니다. 집에
			가고싶다 시벌태우ㅜ 바비레드는 사람이 존나많고 언덕위에 있습니다. 저녁을 뭘 먹을지 고민이 되는군요.배가 고픕니다. 집에
			가고싶다 시벌태우ㅜ</p>
		<div class="fabales-single-share">
			<div class="row mt-3 mb-4">
				<div class="col-3 col-sm-2">
					<span
						class="fables-forth-text-color underline  mt-2 font-18 d-inline-block">Share</span>
				</div>
				<div class="col-9 col-md-7">
					<ul class="nav mt-2">
						<li><a href=""
							class="fables-forth-text-color fables-single-link fables-second-hover-color"><span
								class="fables-icongooglePlus"></span></a></li>
						<li><a href=""
							class="fables-forth-text-color fables-single-link fables-second-hover-color"><span
								class="fables-iconfacebook"></span></a></li>
						<li><a href=""
							class="fables-forth-text-color fables-single-link fables-second-hover-color"><span
								class="fables-iconinstagram"></span></a></li>
						<li><a href=""
							class="fables-forth-text-color fables-single-link fables-second-hover-color"><span
								class="fables-iconpinterest"></span></a></li>
						<li><a href=""
							class="fables-forth-text-color fables-single-link fables-second-hover-color"><span
								class="fables-icontwitter"></span></a></li>
						<li><a href=""
							class="fables-forth-text-color fables-single-link fables-second-hover-color"><span
								class="fables-iconlinkedIn"></span></a></li>
					</ul>
				</div>
				<div class="col-12 col-sm-3 mt-3 mt-sm-0 text-center">
					<button
						class="btn btn-link fables-forth-border-color fables-forth-hover-backround-color fables-forth-text-color text-center font-14 float-none float-sm-right py-2 px-4">
						<i class="fas fa-edit"></i>수정하기
					</button>
				</div>

			</div>
		</div>

	</div>
	
</body>
</html>