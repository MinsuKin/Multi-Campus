<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div id="ju-loading-screen">
	<div class="sk-wandering-cubes">
		<div class="sk-cube sk-cube1"></div>
		<div class="sk-cube sk-cube2"></div>
	</div>
</div>

<div class="fables-navigation fables-main-background-color py-3 py-lg-0">
	<div class="container">
		<div class="row">
			<div class="col-12 col-md-8 col-lg-8 pr-md-0">
				<nav class="navbar navbar-expand-md btco-hover-menu py-lg-2">
					<a class="navbar-brand pl-0" href="./main.do"> <img
						src="resources/img/logo/logoWfont.png" alt="Fables Template"
						class="fables-logo">
					</a>
					<button class="navbar-toggler" type="button" data-toggle="collapse"
						data-target="#fablesNavDropdown" aria-controls="fablesNavDropdown"
						aria-expanded="false" aria-label="Toggle navigation">
						<span class="fables-iconmenu-icon text-white font-16"></span>
					</button>
				</nav>
			</div>
			<div class="col-12 col-md-4 col-lg-4 pr-md-0 icons-header-mobile">
				<div class="fables-header-icons">
					<div class="dropdown">
						<c:choose>
							<c:when test="${empty user.sikgu_id}">
								<a href="./sikgu.do" class="fables-third-text-color right top-header-link px-3 px-md-2 px-lg-4 fables-second-hover-color border-0 max-line-height">
								 <img src="resources/img/logo/logoWnofont.png" alt="Fables Template"
						class="fables-logo">
								</a>
								<a
									class="fables-third-text-color dropdown-toggle right px-3 px-md-2 px-lg-4 fables-second-hover-color top-header-link max-line-height position-relative"
									id="dropdownMenuButton" data-toggle="dropdown"
									aria-haspopup="true" aria-expanded="false"><span
									class="fables-iconuser"></span></a>

								<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
									<div class="p-3 cart-block">
										<div class="row mx-0 mb-3">
											<h2>
												<a href="./login.do"
													class="fables-main-text-color font-15 d-block fables-main-hover-color">로그인</a>
											</h2>
										</div>
										<div class="row mx-0">
											<h2>
												<a href="./add.do"
													class="fables-main-text-color font-15 d-block fables-main-hover-color">회원가입</a>
											</h2>
										</div>

									</div>
								</div>

							</c:when>
							<c:otherwise>
								<a href="./upup.do"
									class="fables-third-text-color right  top-header-link px-3 px-md-2 px-lg-4 fables-second-hover-color border-0 max-line-height">
									<i class="fas fa-edit"></i>
								</a>

								<a
									class="fables-third-text-color dropdown-toggle right px-3 px-md-2 px-lg-4 fables-second-hover-color top-header-link max-line-height position-relative"
									id="dropdownMenuButton" data-toggle="dropdown"
									aria-haspopup="true" aria-expanded="false"> <span id="sikgu_id">&nbsp;${user.sikgu_id}님
										환영합니다.</span>
								</a>
								<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
									<div class="p-3 cart-block">
										<div class="row mx-0 mb-3">


											<h2>
												<a href="./mypage.do"
													class="fables-main-text-color font-15 d-block fables-main-hover-color">마이페이지</a>
											</h2>


										</div>
										<div class="row mx-0">
											<h2>
												<a href="./logout.do"
													class="fables-main-text-color font-15 d-block fables-main-hover-color">로그아웃</a>
											</h2>
										</div>
									</div>
								</div>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>