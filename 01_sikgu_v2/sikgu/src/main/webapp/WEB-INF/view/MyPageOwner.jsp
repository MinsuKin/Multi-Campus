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
						<li><a href="./shop.do">내 가게 관리</a></li>
						<li class="on"><a href="./owner.do">개인정보 수정</a></li>
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
				<div class="col-12 col-md-10 offset-md-1">
					<form style="padding: 0 3em;" id="updateForm">
						<p class="font-20 semi-font fables-main-text-color mt-4 mb-2">개인
							정보</p>
						<span class="pl-2">아이디</span>
						<div class="form-group">
							<div class="input-icon">
								<span class="fables-iconuser fables-input-icon mt-2 font-13"></span>
								<input id="sikgu_id" name="sikgu_id" value="${user.sikgu_id}"
									class="form-control rounded-0 py-3 pl-5 font-13 sign-register-input"
									placeholder="ID">
							</div>
						</div>
						<span class="pl-2">비밀번호</span>
						<div class="form-group">
							<div class="input-icon">
								<span class="fables-iconpassword fables-input-icon mt-2 font-13"></span>
								<input id="sikgu_pwd" name="sikgu_pwd" type="password" value="${user.sikgu_pwd}"
									class="form-control rounded-0 py-3 pl-5 font-13 sign-register-input"
									placeholder="PASSWORD">
							</div>
						</div>

						<span class="pl-2">이름</span>
						<div class="form-group">
							<div class="input-icon">
								<span class="fables-icon fables-input-icon mt-2 font-13"><i
									class="fas fa-id-card"></i></span> <input name="sikgu_name"
									value="${user.sikgu_name}" type="text"
									class="form-control rounded-0 py-3 pl-5 font-13 sign-register-input"
									placeholder="NAME">
							</div>
						</div>
						<span class="pl-2">전화번호</span>
						<div class="form-group">
							<div class="input-icon">
								<span class="fables-iconphone fables-input-icon font-19 mt-1"></span>
								<input name="sikgu_phone" type="text"
									value="${user.sikgu_phone}"
									class="form-control rounded-0 py-3 pl-5 font-13 sign-register-input"
									placeholder="PHONE">
							</div>
						</div>
						<span class="pl-2">이메일</span>
						<div class="form-group">
							<div class="input-icon">
								<span class="fables-iconemail fables-input-icon font-19 mt-1"></span>
								<input name="sikgu_email" type="email"
									value="${user.sikgu_email}"
									class="form-control rounded-0 py-3 pl-5 font-13 sign-register-input"
									placeholder="EMAIL">
							</div>
						</div>
						<span class="pl-2">사업자 번호</span>
						<div class="form-group">
							<div class="input-icon">
								<span
									class="fables-iconbussiness fables-input-icon font-19 mt-1"></span>
								<input name="sikgu_biznumber" type="text"
									value="${user.sikgu_biznumber}"
									class="form-control rounded-0 py-3 pl-5 font-13 sign-register-input"
									placeholder="BIZNUMBER">
							</div>


						</div>
						<button onclick="ownerupdate();" style="display: block;" id="edit"
							class="btn btn-link fables-forth-border-color fables-forth-hover-backround-color fables-forth-text-color text-center font-14 float-none float-sm-right py-2 px-4">
							<i class="fas fa-edit"></i>수정하기
						</button>
						<button onclick="ownerupdatesave();" style="display: none;"
							id="save"
							class="btn btn-link fables-forth-border-color fables-forth-hover-backround-color fables-forth-text-color text-center font-14 float-none float-sm-right py-2 px-4">
							<i class="fas fa-edit"></i>저장
						</button>
					</form>
				</div>

			</div>
		</div>
	</div>



	<!-- /End page content -->

	<%@ include file="footer.jsp"%>
</body>
<script src="resources/js/mypageOwner.js"></script>
<%@ include file="scriptall.jsp"%>
</html>