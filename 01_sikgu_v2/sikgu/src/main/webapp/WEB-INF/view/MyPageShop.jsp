<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<%@ include file="include.jsp"%>

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
						<li><a href="./mypage.do">작성 글 관리</a></li>
						<li class="on"><a href="./shop.do">내 가게 관리</a></li>
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





			<div class="col-12 col-lg-8 my-lg-4">
				<div class="row">
					<div class="col-12 wow fadeInLeft">
						<form class="fables-contact-form" style="padding: 0 2em;"
							id="registerForm">

							<p class="font-20 semi-font fables-main-text-color mt-4 mb-2">상점
								정보</p>
							<div class="form-row">
								<div class="col-md-6">
									<span class="pl-2">상점명</span>
								</div>
								<div class="col-md-6">
									<span class="pl-2">상점 전화번호</span>
								</div>
								<div class="form-group col-md-6">
									<div class="input-icon">
										<span class="fables-icon fables-input-icon mt-2 font-13"><i
											class="fas fa-utensils"></i></span> <input type="hidden"
											name="sikgu_id" id="sikgu_id" value="${user.sikgu_id}">
										<input id="store_name" name="store_name" type="text"
											value="${store.store_name}"
											class="form-control rounded-0 py-3 pl-5 font-13 sign-register-input"
											placeholder="상점 이름">
									</div>
								</div>
								<div class="form-group col-md-6">
									<div class="input-icon">
										<span class="fables-iconphone fables-input-icon mt-2 font-13"></span>
										<input id="store_phone" name="store_phone" type="text"
											value="${store.store_phone}"
											class="form-control rounded-0 py-3 pl-5 font-13 sign-register-input"
											placeholder="상점 전화번호">
									</div>
								</div>
							</div>
							<span class="pl-2">업종</span>
							<div class="form-row">
								<div class="form-group col-md-12">
									<select class="form-control rounded-0" id="category_id"
										name="category_id">
										<option value="" selected>상점 카테고리를 선택해 주세요</option>
										<option value="1"
											<c:if test="${store.category_id == 1}">selected</c:if>>한식</option>
										<option value="2"
											<c:if test="${store.category_id == 2}">selected</c:if>>카페</option>
										<option value="3"
											<c:if test="${store.category_id == 3}">selected</c:if>>중식</option>
										<option value="4"
											<c:if test="${store.category_id == 4}">selected</c:if>>치킨</option>
										<option value="5"
											<c:if test="${store.category_id == 5}">selected</c:if>>분식</option>
										<option value="6"
											<c:if test="${store.category_id == 6}">selected</c:if>>양식</option>
										<option value="7"
											<c:if test="${store.category_id == 7}">selected</c:if>>퓨전</option>
										<option value="8"
											<c:if test="${store.category_id == 8}">selected</c:if>>일식</option>
										<option value="9"
											<c:if test="${store.category_id == 9}">selected</c:if>>제빵</option>
									</select>
								</div>
							</div>
							<span class="pl-2">주소</span>
							<div class="form-row" style="margin-bottom: -1em;">
								<div class="form-group col-md-6">
									<div class="input-icon">
										<span
											class="fables-iconmap-icon fables-input-icon mt-2 font-13"></span>
										<input id="store_address" name="store_address" type="text"
											class="form-control rounded-0 py-3 pl-5 font-13 sign-register-input"
											value="${store.store_address}" placeholder="주소"
											readonly="readonly">
									</div>
								</div>

							</div>
							<div class="form-row">
								<div class="form-group col-md-12 input-icon">
									<span
										class="fables-iconmap-icon fables-input-icon mt-2 font-13"></span>
									<input id="detailAddress" name="detailAddress" type="text"
										value="${store.store_detailaddress}"
										class="form-control rounded-0 py-3 pl-5 font-13 sign-register-input"
										placeholder="상세주소를 입력해주세요." onsubmit="return false">
								</div>

							</div>
							<span class="pl-2">영업시간</span>
							<div class="form-row">
								<div class="form-group col-md-12 input-icon">
									<span
										class="fables-iconmap-icon fables-input-icon mt-2 font-13"></span>
									<input id="store_op_time" name="store_op_time" type="text"
										value="${store.store_op_time}"
										class="form-control rounded-0 py-3 pl-5 font-13 sign-register-input"
										placeholder="영업시간을 기입해주세요.">
								</div>
							</div>
							<span class="pl-2">소개글</span>
							<div class="form-row">
								<div class="form-group col-md-12 input-icon">
									<span
										class="fables-iconmap-icon fables-input-icon mt-2 font-13"></span>
									<textarea class="form-control p-3 pl-5" id="store_profile"
										name="store_profile" style="height: 10rem;"
										placeholder="상점을 소개해주세요.">${store.store_profile}</textarea>
								</div>
							</div>

							<input id="store_x" name="store_x" type="hidden"
								class="form-control rounded-0 py-3 pl-5 font-13 sign-register-input"
								placeholder="x좌표"> <input id="store_y" name="store_y"
								type="hidden"
								class="form-control rounded-0 py-3 pl-5 font-13 sign-register-input"
								placeholder="y좌표">


							<button
								class="btn btn-link fables-forth-border-color fables-forth-hover-backround-color fables-forth-text-color text-center font-14 float-none float-sm-right py-2 px-4">
								<i class="fas fa-edit"></i>수정하기
							</button>
						</form>
					</div>
				</div>


				<div class="row">
					<div class="col-12 wow fadeInLeft">
						<form class="fables-contact-form" style="padding: 0 2em;"
							id="menuform">
							<input type="hidden" name="sikgu_id" id="sikgu_id_s"
								value="${user.sikgu_id}">
							<p class="font-20 semi-font fables-main-text-color mt-4 mb-2">메뉴
								정보</p>

							<div class="form-row" id="menuinput">
							
								<div class="form-group col-md-6 originalHide" id="menu_name_div">
									<div class="input-icon">
										<span class="fables-input-icon mt-2 font-13"> <i
											class="fas fa-utensils"></i></span> <input id="menu_name"
											name="menu_name" type="text"
											class="form-control rounded-0 py-3 pl-5 font-13 sign-register-input"
											placeholder="메뉴 이름">
									</div>
								</div>
								<div class="form-group col-md-6 originalHide"  id="menu_price_div">
									<div class="input-icon">
										<span class="fables-iconphone fables-input-icon mt-2 font-13"></span>
										<input id="menu_price" name="menu_price" type="number"
											class="form-control rounded-0 py-3 pl-5 font-13 sign-register-input"
											placeholder="가격">
									</div>
								</div>
								
							</div>
						

							<button
								class="btn btn-link fables-forth-border-color fables-forth-hover-backround-color fables-forth-text-color text-center font-14 float-none float-sm-right py-2 px-4">
								<i class="fas fa-edit"></i>수정하기
							</button>
						</form>
					</div>
				</div>

			</div>
		</div>
	</div>



	<!-- /End page content -->

	<%@ include file="footer.jsp"%>
</body>
<script src="resources/js/mypageShop.js"></script>
<%@ include file="scriptall.jsp"%>
</html>