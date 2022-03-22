<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<%@ include file="include.jsp"%>
<style>

/* modal창 감싸고 있는 배경 Div */
.background_modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	padding-top: 100px; /* Location of the box */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}

/* 아이디 출력창(실제 내용) */
.modal_contents {
	background-color: #fefefe;
	margin: auto;
	margin-top: 10%;
	padding: 15px;
	border: 1px solid #888;
	border-radius: 20px;
	width: 30%;
	text-align: center;
}
</style>
</head>
<body>

	<%@ include file="header.jsp"%>
	<div class="container">
		<div class="row mt-3 mt-lg-5 mb-2">
			<div class="col-12 col-md-10 offset-md-1 col-lg-8 offset-lg-2">
				<div class="text-center">
					<h2 class="fables-main-text-color font-35 bold-font my-3">아이디 / 비밀번호 찾기</h2>
					<p class="fables-forth-text-color my-4">인증된 이메일만 정보 찾기가 가능합니다 .</p>
				</div>
			</div>
		</div>

		<div class="col-12 col-md-5 offset-md-2 col-lg-6 offset-lg-3 text-center">
			<nav class="fables-single-nav" style="display: inline-flex;">
				<div class="nav nav-tabs" id="nav-tab" role="tablist">
					<a class="fables-single-item nav-link fables-forth-text-color fables-second-active fables-second-hover-color fables-second-after px-3 px-md-5 font-15 semi-font border-0 active rounded-0 py-3"
						id="nav-id-tab" data-toggle="tab" href="#nav-id" role="tab" aria-controls="nav-id" aria-selected="true">아이디 찾기</a> 
					<a class="fables-single-item nav-link fables-forth-text-color fables-second-active fables-second-hover-color fables-second-after border-0 px-3 px-md-5 font-15 semi-font rounded-0 py-3"
						id="nav-pwd-tab" data-toggle="tab" href="#nav-pwd" role="tab" aria-controls="nav-pwd" aria-selected="false">비밀번호 찾기</a>
				</div>
			</nav>

			<div class="tab-content" id="nav-tabContent"
				style="padding: 1em 3em 0;">
				<div class="tab-pane fade show active" id="nav-id" role="tabpanel"
					aria-labelledby="nav-id-tab">
					<div class="text-center" id="searchI">
						<div class="form-group">
							<div class="input-icon">
								<span class="fables-iconuser fables-input-icon mt-2 font-13"></span>
								<input type="text"
									class="form-control rounded-0 py-3 pl-5 font-13 sign-register-input"
									id="inputName_1" name="inputName_1" placeholder="NAME">
							</div>
						</div>
						<div class="form-group">
							<div class="input-icon">
								<span class="fables-iconphone fables-input-icon font-19 mt-1"></span>
								<input type="text"
									class="form-control rounded-0 py-3 pl-5 font-13 sign-register-input"
									id="inputPhone_1" name="inputPhone_1" placeholder="PHONE">
							</div>
						</div>
						<div class="form-group">
							<button id="searchBtn" type="button" onclick="idSearch_click()"
								class="btn btn-block rounded-0 white-color fables-main-hover-background-color fables-second-background-color font-16 semi-font py-3">확인</button>

						</div>

					</div>
				</div>
				<div class="tab-pane fade" id="nav-pwd" role="tabpanel"
					aria-labelledby="nav-pwd-tab">
					<div class="text-center" id="searchP">
						<div class="form-group">
							<div class="input-icon">
								<span class="fables-iconuser fables-input-icon mt-2 font-13"></span>
								<input type="text"
									class="form-control rounded-0 py-3 pl-5 font-13
								sign-register-input"
									id="inputId" name="inputId_2" placeholder="ID">
							</div>
						</div>
						<div class="form-group">
							<div class="input-icon">
								<span class="fables-iconemail fables-input-icon font-19 mt-1"></span>
								<input type="email"
									class="form-control rounded-0 py-3 pl-5 font-13 sign-register-input"
									id="inputEmail_2" name="inputEmail_2" placeholder="EMAIL">
							</div>
						</div>
						<div class="form-group">
							<button id="searchBtn2" type="button" onclick="idSearch_click2()"
								class="btn btn-block rounded-0 white-color fables-main-hover-background-color fables-second-background-color font-16 semi-font py-3">확인</button>

						</div>
					</div>
				</div>
				<a href="./login.do"
					class="fables-forth-text-color font-16 fables-second-hover-color underline mt-3 mb-4 m-lg-5 d-block">로그인하기</a>
			</div>
		</div>
	</div>
	
	<%@ include file="footer.jsp"%>
	
	
<div id="background_modal" class="background_modal" style="display:none; position: absolute;top: 50%;left: 50%;transform: translate(-50%, -50%);" >
	<div class="modal_contents">
		<h4>
			<b>회원님의 아이디는?</b><span class="close">&times;</span>
		</h4><br>
			<h2 id="id_value"></h2>
		<br>
		<button type="button" id="pwSearch_btn" class="btn peach-gradient btn-rounded waves-effect">
		비밀번호 찾기</button>
	</div>
</div>

<div id="background_modal2" class="background_modal" style="display:none; position: absolute;top: 50%;left: 50%;transform: translate(-50%, -50%);">
	<div class="modal_contents">
		<h4>
			<b>회원님의 비밀번호는?</b><span class="close">&times;</span>
		</h4><br>
			<h2 id="pw_value"></h2>
		<br>
		<button type="button" id="login_btn" class="btn peach-gradient btn-rounded waves-effect">
		로그인 </button>
	</div>
</div>


</body>
<script>

	$(document).ready(function() {
		/////////모///달///기///능///////////
		// 1. 모달창 히든 불러오기
		$('#searchBtn').click(function() {
			console.log("modal1");
			$('#background_modal').show();
		});
		// 2. 모달창 닫기 버튼
		$('.close').on('click', function() {
			console.log("modal2");
			$('#background_modal').hide();
		});
	

		// 1. 모달창 히든 불러오기
		$('#searchBtn2').click(function() {
			console.log("modal1");
			$('#background_modal2').show();
		});
		// 2. 모달창 닫기 버튼
		$('.close').on('click', function() {
			console.log("modal2");
			$('#background_modal2').hide();
		});


	});

	// 아이디 값 저장하기 위한 변수
	var idV = "";

	// 아이디 값 받고 출력하는 ajax
	var idSearch_click = function() {
		console.log($('#inputName_1').val());

		$
				.ajax({
					type : "POST",
					url : "${pageContext.request.contextPath}/userSearch.do?inputName_1="
							+ $('#inputName_1').val()
							+ "&inputPhone_1="
							+ $('#inputPhone_1').val(),
					success : function(data) {
						console.log(data);

						if (data == 0) {
							$('#id_value').text("회원 정보를 확인해주세요!");

						} else {
							$('#id_value').text(data);
							// 아이디값 별도로 저장
							idV = data;

						}
					}
				});
	}

	// 비밀번호 값 저장하기 위한 변수
	var pwV = "";

	// 비밀번호 값 받고 출력하는 ajax
	var idSearch_click2 = function() {
		console.log($('#inputId').val());

		$.ajax({
			type : "POST",
			url : "${pageContext.request.contextPath}/userSearch1.do?inputId="
					+ $('#inputId').val() + "&inputEmail_2="
					+ $('#inputEmail_2').val(),
			success : function(data) {
				console.log(data);

				if (data == 0) {
					$('#pw_value').text("회원 정보를 확인해주세요!");

				} else {
					$('#pw_value').text(data);
					// 아이디값 별도로 저장
					pwV = data;

				}

			}
		});
	}

	// 비밀번호 찾기 이메일로 보내기
	/* 	$('#searchBtn2').click(function(){
			console.log("패스워드 찾기 : ajax 들어가기 전");
			console.log($('#inputId').val());
			console.log($('#inputEmail_2').val());
			$.ajax({
				type : "get",
				url : "${pageContext.request.contextPath}/user/searchPassword?userId="
						+ $('#inputId').val() + "&userEmail=" + $('#inputEmail_2').val(),
				success : function(data){
						
							alert("해당 이메일로 임시 비밀번호를 발송하였습니다.");

				}
				
			});
			
		}); */

	// 비밀번호 찾기 눌렀을 때
	// 1 패스워드 찾기 창으로 이어진 후 2 패스워드 창에 아이디가 적힘
	// 3 모달창 종료
	$('#pwSearch_btn').click(function() {

		/* var idV = $('#id_value').val(); // 오류 뜸 */
		console.log(idV);

		// 1. 패스워드 찾기 창으로 이어지고
		$('#nav-id-tab').toggleClass('active');
		$('#nav-pwd-tab').toggleClass('active');
		$('#nav-id').toggleClass('show active');
		$('#nav-pwd').toggleClass('show active');

		

		// 2.아이디 자동 저장
		$('#inputId').attr("value", idV);

		// 마지막으로 모달창 종료
		$('#background_modal').hide();
	});

	$('#login_btn').click(function() {
		window.location.href = "http://localhost:8080/sikgu/login.do"
	});
</script>

<%@ include file="scriptall.jsp"%>
</html>