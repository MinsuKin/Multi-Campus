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
<div class="row mt-3 mt-lg-5 mb-2">
			<div class="col-12 col-md-10 offset-md-1 col-lg-8 offset-lg-2">
				<div class="text-center">
					<h2 class="fables-main-text-color font-35 bold-font my-3">SIKGU</h2>
				</div>
			</div>
		</div>
     <div class="row my-4 my-lg-5">
          <div class="col-12 col-md-5 offset-md-2 col-lg-6 offset-lg-3 text-center">
               <form method='post' class="form" action='./login.do' style="padding: 0 3em;">
                  <div class="form-group"> 
                      <div class="input-icon">
                          <span class="fables-iconemail fables-input-icon mt-2 font-13"></span>
                          <c:if test="${IDErr eq null}" >
							<input type="text" class="form-control rounded-0 py-3 pl-5 font-13 sign-register-input" id="sikgu_id" name="sikgu_id" size="20" maxlength="15" placeholder="ID" />
						</c:if>
						<c:if test="${IDErr ne null}" >
							<input type="text" class="form-control rounded-0 py-3 pl-5 font-13 sign-register-input" id="test" name="sikgu_id" size="20" maxlength="15" placeholder="${IDErr}" />
						</c:if> 
                      </div>
                    
                  </div>
                  <div class="form-group"> 
                      <div class="input-icon">
                         <span class="fables-iconpassword fables-input-icon font-19 mt-1"></span>
                         <c:if test="${PWDErr eq null}" >
							<input type="password" class="form-control rounded-0 py-3 pl-5 font-13 sign-register-input" id="sikgu_pwd" name="sikgu_pwd" placeholder="Password" /> 
					  </c:if>
					  <c:if test="${PWDErr ne null}" >
							<input type="password" class="form-control rounded-0 py-3 pl-5 font-13 sign-register-input" id="sikgu_pwd" name="sikgu_pwd" placeholder="${PWDErr}" /> 
					  </c:if>
                      </div>
                    
                  </div> 
                  <input type="submit" class="btn btn-block rounded-0 white-color fables-main-hover-background-color fables-second-background-color font-16 semi-font py-3" id="login" value="LOGIN" />
                  <a href="./userSearch.do" class="fables-forth-text-color font-16 fables-second-hover-color underline mt-3 mb-4 m-lg-5 d-block">아이디 / 비밀번호 찾기</a>
                  <p class="fables-forth-text-color">계정이 없으신가요 ? <a href="add.do" class="font-16 semi-font fables-second-text-color underline fables-main-hover-color ml-2">회원가입</a></p>
                </form>
          </div>
     </div>
</div>
	<!-- /End page content -->

	<%@ include file="footer.jsp"%>
</body>
<%@ include file="scriptall.jsp"%>
</html>