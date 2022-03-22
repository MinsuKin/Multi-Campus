<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<%@ include file="include.jsp"%>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=11385b89f73bcc9d4dc2406ea538f4b9&libraries=services"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#closeInfo').click(function() {
			$('#store_detail').hide();
		});
	});
</script>
</head>

<body>
	<%@ include file="header.jsp"%>
	<!-- Start page content -->
	<div class="container">
		<div class="row overflow-hidden">
			<div class="col-12 col-md-10 offset-md-1">
				<div class="mt-0 mb-5 my-md-5">
					<h3
						class="font-35 font-weight-bold fables-main-text-color text-center">
						현 위치</h3>
					<p class="mt-3 fables-forth-text-color  text-center">강남구</p>
				</div>
			</div>
		</div>

		<div class="row mb-4 mb-md-5 overflow-hidden">
			<div class="col-12 col-sm-9 wow fadeInLeft">
				<div id="map"></div>
				<script src="resources/js/map.js"></script>
			</div>
			<div class="col-12 col-sm-2 wow fadeInRight"
				style="margin-top: auto;">
				<div class="row form-check" id="checkRadios">
					<form id="category">
						<label class="fable-product-color"> 한식 <input
							type="checkbox" checked="checked" id="categoryID" name="menu"
							value=1> <span class="checkmark"></span>
						</label> <label class="fable-product-color"> 중식 <input
							type="checkbox" checked="checked" id="categoryID" name="menu"
							value=2> <span class="checkmark"></span>
						</label> <label class="fable-product-color"> 일식 <input
							type="checkbox" checked="checked" id="categoryID" name="menu"
							value=3> <span class="checkmark"></span>
						</label> <label class="fable-product-color"> 분식 <input
							type="checkbox" checked="checked" id="categoryID" name="menu"
							value=4> <span class="checkmark"></span>
						</label> <label class="fable-product-color"> 카페 <input
							type="checkbox" checked="checked" id="categoryID" name="menu"
							value=5> <span class="checkmark"></span>
						</label> <label class="fable-product-color"> 레스토랑 <input
							type="checkbox" checked="checked" id="categoryID" name="menu"
							value=6> <span class="checkmark"></span>
						</label>
						<button type="button"
							class="btn btn-block rounded-0 white-color fables-main-hover-background-color fables-second-background-color font-16 semi-font py-3"
							id="selectmenu" onclick="checkbox();">SELECT</button>
					</form>
				</div>
			</div>
		</div>
	</div>


	<div id="store_detail"
		style="display: none; z-index: 5; position: absolute; left: 0; right: 0; top: 0; bottom: 0; background-color: rgba(0, 0, 0, .70);">
		<div class="row my-4 my-lg-5 col-sm-8"
			style="background: white; z-index: 10; position: absolute; padding: 1rem 3rem; left: 50%; transform: translate(-50%, 0%);">

			<div class="close" id="closeInfo" style="margin-left: auto;">
				<i class="far fa-times-circle"></i>
			</div>
			<div class="col-sm-12 ">
				<div class="position-relative mb-3 gallery-filter">
					<div class="row" id="imgcontent">
						<div class="col-12 col-lg-7" style="TEXT-ALIGN: -WEBKIT-CENTER;">
							<img src="resources/img/novideo.png" alt="" id="main_thum"
								class="mainVidimgheight" class="w-100">
							<div class="demo-gallery-poster fables-main-gradient">
								<a data-fancybox href="" id="store_main_video"> </a>
							</div>
						</div>
						<div class="col-12 col-lg-5 row" style="margin-left: 0.5em;"
							id="img_container">
							<div class="col-md-6" style="padding: 0 5px 5px 0;">
								<div
									class="filter-img-block position-relative image-container translate-effect-right">
									<img src="resources/img/noimage.png" id="main_img_1"
										class="mainImgheight" alt="image">

									<div
										class="img-filter-overlay fables-main-color-transparent row m-0">
										<a data-fancybox="gallery" id="main_img_1_2"
											href="resources/img/noimage.png"
											class="gallery-filter-icon  white-color fables-second-hover-color"><span
											class="fables-iconsearch-icon"></span></a>
									</div>
								</div>
							</div>


							<div class="col-md-6" style="padding: 0 5px 5px 0;">
								<div
									class="filter-img-block position-relative image-container translate-effect-right">
									<img src="resources/img/noimage.png" id="main_img_2"
										class="mainImgheight" alt="image">
									<div
										class="img-filter-overlay fables-main-color-transparent row m-0">
										<a data-fancybox="gallery" href="resources/img/noimage.png"
											id="main_img_2_2"
											class="gallery-filter-icon white-color fables-second-hover-color">.
											. .</a>
									</div>
								</div>
							</div>
							<div class="col-md-6 originalHide" style="padding: 0 5px 5px 0;"
								id="hiddendiv">
								<div
									class="filter-img-block position-relative image-container translate-effect-right">
									<div
										class="img-filter-overlay fables-main-color-transparent row m-0 originalHide">
										<a data-fancybox="gallery" href="resources/img/noimage.png"
											id="extra_2"></a>
									</div>
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>
			<div class="col-sm-12">
				<h2 class="font-25 semi-font my-3" style="text-align: center;">
					<a class="fables-main-text-color fables-second-hover-color"
						id="store_name">상점이름</a>
				</h2>

				<p class="fables-forth-text-color fables-single-blog font-14 my-3"
					id="StoreDescription">
					상점상세 <br>

				</p>
			</div>

			<div class="mt-4 col-sm-5">
				<h2
					class="position-relative font-23 semi-font fables-blog-category-head fables-main-text-color fables-second-before pl-3 mb-4">상점
					전화번호</h2>
				<p id="StorePhone" style="margin-bottom: 1rem;">
					폰번호 <br>

				</p>
				<h2
					class="position-relative font-23 semi-font fables-blog-category-head fables-main-text-color fables-second-before pl-3 mb-4">영업시간</h2>
				<p id="StoreTime">
					오픈시간 <br>

				</p>

			</div>
			<div class="mt-4 col-sm-7" id="menus">
				<h2
					class="position-relative font-23 semi-font fables-blog-category-head fables-main-text-color fables-second-before pl-3 mb-4">Menus</h2>
				<div class="row">
					<div class="col-sm-5" id="MenuList"></div>
					<div class="col-sm-2" id="line"></div>
					<div class="col-sm-4" id="PriceList"></div>
				</div>
			</div>
			<div class="fabales-single-share col-sm-10">
				<div class="row mt-3 mb-4">
					<div class="col-9">
						<h2
							class="position-relative font-23 semi-font fables-blog-category-head fables-main-text-color fables-second-before pl-3 mb-4">바로가기</h2>
					</div>
					<div class="col-9">
						<div class="input-icon">
							<img src="resources/img/logo/face.png"
								style="width: 30px; height: 30px;" /><span
								class="font-15 semi-font fables-main-text-color mt-4 mb-2"></span>
							<a class="fables-forth-text-color font-14 mb-3"
								id="store_face_id" target="_blank" href=""></a>
						</div>
						<div class="input-icon">
							<img src="resources/img/logo/naver.png"
								style="width: 30px; height: 30px;" /><span
								class="font-15 semi-font fables-main-text-color mt-4 mb-2"></span>
							<a class="fables-forth-text-color font-14 mb-3"
								id="store_face_pwd" target="_blank" href=""></a>
						</div>
<!-- 						<div class="input-icon">
							<img src="resources/img/logo/face.png"
								style="width: 30px; height: 30px;" /><span
								class="font-15 semi-font fables-main-text-color mt-4 mb-2"></span>
							<a class="fables-forth-text-color font-14 mb-3"
								id="store_naver_id" target="_blank" href=""></a>
						</div>
						<div class="input-icon">
							<img src="resources/img/logo/naver.png"
								style="width: 30px; height: 30px;" /><span
								class="font-15 semi-font fables-main-text-color mt-4 mb-2"></span>
							<a class="fables-forth-text-color font-14 mb-3"
								id="store_naver_pwd" target="_blank" href=""></a> -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- /End page content -->
	<%@ include file="footer.jsp"%>
	<%@ include file="scriptall.jsp"%>
</body>
</html>