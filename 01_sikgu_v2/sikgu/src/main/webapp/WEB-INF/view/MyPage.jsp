<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<%@ include file="include.jsp"%>
<script>
	$(document).ready(
			function() {
				$('.owl-carousel').owlCarousel(
						{
							items : 1,
							slideSpeed : 2000,
							nav : true,
							autoplay : true,
							center : true,
							dots : true,
							loop : true,
							responsiveRefreshRate : 200,
							navText : [ '<i class="fas fa-chevron-left"></i>',
									'<i class="fas fa-chevron-right"></i>' ]
						});

			})
</script>
</head>
<body>
	<%@ include file="header.jsp"%>
	<!-- Start page content -->
	<div class="container">
		<div class="row my-4 my-lg-5">
			<div class="col-12 col-lg-3">
				<div class="mt-4">
					<h2
						class="position-relative font-23 semi-font fables-blog-category-head fables-main-text-color fables-second-before pl-3 mb-4">내
						정보 관리</h2>
					<ul
						class="nav fables-blog-cat-list fables-forth-text-color fables-second-after fables-second-hover-color-link">
						<li class="on"><a href="./mypage.do">작성 글 관리</a></li>
						<li><a href="./shop.do">내 가게 관리</a></li>
						<li><a href="./owner.do">개인정보 수정</a></li>
					</ul>
					<hr>
				</div>
				<div class="mt-4">
					<h2
						class="position-relative font-23 semi-font fables-blog-category-head fables-main-text-color fables-second-before pl-3 mb-4">빅데이터
						분석</h2>
					<ul
						class="nav fables-blog-cat-list fables-forth-text-color fables-second-hover-color-link">
						<li><a href="./chart.do">상권 분석</a></li>
						<li><a href="">연령별 분석</a></li>
					</ul>
					<hr>
				</div>
			</div>


			<form>
				<input type="hidden" id="sikgu_id_q" value="${user.sikgu_id}">
			</form>




			<div class="col-12 col-lg-8 my-lg-5" id="page">
				<div class="mb-4 mb-lg-5 originalHide" id="commit">
					<div class="row">
						<div class="col-12 col-sm-5">
							<div class="fables-single-slider store-single-slider">
								<div id="sync1" class="owl-carousel owl-theme" style="display:block;">
									<div class="item" id="item">
										<img src="" alt="" id="image" class="w-100">
									</div>
								</div>
								<div id="myvid" style="TEXT-ALIGN: -WEBKIT-CENTER; display: none;">
									<img src="resources/img/novideo.png" alt="" id="my_thumb"
										class="mainVidimgheight" class="w-100" style="max-width: 100%;">
									<div class="demo-gallery-poster">
										<a data-fancybox href="" id="my_main_video"> <img
											src="resources/assets/custom/images/play-button.png"
											alt="play button" class="img-fluid">
										</a>
									</div>
								</div>
							</div>
						</div>
						<div class="col-12 col-sm-7">
							<h2 class="font-18 semi-font mt-3 mt-sm-0 mb-2">
								<a class="fables-main-text-color fables-second-hover-color"
									id="title">글 제목</a>
							</h2>
							<div class="fables-forth-text-color font-14 my-2">
								<span class="fables-icondata fables-second-text-color mr-1"></span>
								<span class="mr-3" id="date"> 09 November, 2019 </span>
							</div>
							<p class="fables-forth-text-color font-14 mb-3" id="desc">글
								내용</p>
							<a class="fables-forth-text-color font-14 mb-3" id="face_url"
								target="_blank" href=""></a> <a
								class="fables-forth-text-color font-14 mb-3" id="naver_url"
								target="_blank" href=""></a> <a
								class="fables-forth-text-color font-14 mb-3" id="youtube_url"
								target="_blank" href=""></a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>




	<!-- /End page content -->

	<%@ include file="footer.jsp"%>
</body>
<script src="resources/js/mypage.js"></script>
<%@ include file="scriptall.jsp"%>

</html>