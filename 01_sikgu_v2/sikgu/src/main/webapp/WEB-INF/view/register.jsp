<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<%@ include file="include.jsp"%>
<script type="text/javascript">
   function submitForm() {
      registerForm.action = "./add.do";
      registerForm.method="post";
      registerForm.submit();
   }
</script>
</head>

<body>
	<%@ include file="header.jsp"%>

	<!-- Start page content -->
	<div class="container">
		<div class="row mt-3 mt-lg-5 mb-2">
			<div class="col-12 col-md-10 offset-md-1 col-lg-8 offset-lg-2">
				<div class="text-center">
					<h2 class="fables-main-text-color font-35 bold-font my-3">회원가입</h2>
				</div>
			</div>
		</div>
		<div class="row my-8 my-lg-6">
			<div
				class="col-12 col-md-10 offset-md-1 col-lg-6 offset-lg-3 text-center">
				<form style="padding: 0 3em;" id="registerForm">
					<div class="row">
						<div class="form-group col-md-9">
							<div class="input-icon">
								<span class="fables-iconuser fables-input-icon mt-2 font-13"></span>
								<input id="sikgu_id" name="sikgu_id"
									class="form-control rounded-0 py-3 pl-5 font-13 sign-register-input"
									placeholder="ID">
							</div>
						</div>
						<div class="form-group col-md-3">
							<input type='button' style="height: 90%;"
								class="idcheck btn btn-block rounded-0 white-color fables-main-hover-background-color fables-second-background-color font-16 semi-font py-3"
								value='중복확인' />
						</div>
					</div>
					<div class="form-group">
						<div class="input-icon">
							<span class="fables-iconpassword fables-input-icon mt-2 font-13"></span>
							<input id="sikgu_pwd" name="sikgu_pwd" type="password"
								class="form-control rounded-0 py-3 pl-5 font-13 sign-register-input"
								placeholder="PASSWORD">
						</div>
					</div>
					<div class="form-group">
						<div class="input-icon">
							<span class="fables-iconpassword fables-input-icon mt-2 font-13"></span>
							<input id="sikgu_pwd2" name="sikgu_pwd2" type="password"
								class="form-control rounded-0 py-3 pl-5 font-13 sign-register-input"
								placeholder="PASSWORD_CHECK">
						</div>
					</div>
					<div class="form-group">
						<div class="input-icon">
							<span class="fables-icon fables-input-icon mt-2 font-13"><i
								class="fas fa-id-card"></i></span> <input id="sikgu_name" name="sikgu_name" type="text"
								class="form-control rounded-0 py-3 pl-5 font-13 sign-register-input"
								placeholder="NAME">
						</div>

					</div>
					<div class="form-group">
						<div class="input-icon">
							<span class="fables-iconphone fables-input-icon font-19 mt-1"></span>
							<input id="sikgu_phone" name="sikgu_phone" type="text"
								class="form-control rounded-0 py-3 pl-5 font-13 sign-register-input"
								placeholder="Mobile_PHONE">
						</div>

					</div>

					<div class="form-group">
						<div class="input-icon">
							<span class="fables-iconemail fables-input-icon font-19 mt-1"></span>
							<input id="sikgu_email" name="sikgu_email" type="email"
								class="form-control rounded-0 py-3 pl-5 font-13 sign-register-input"
								placeholder="EMAIL">
						</div>
					</div>
					<div class="form-group">
						<div class="input-icon">
							<span class="fables-iconbussiness fables-input-icon font-19 mt-1"></span>
							<input id="sikgu_biznumber" name="sikgu_biznumber" type="text"
								class="form-control rounded-0 py-3 pl-5 font-13 sign-register-input"
								placeholder="BIZNUMBER">
						</div>


					</div>
					<input type='button'
						class="btn btn-block rounded-0 white-color fables-main-hover-background-color fables-second-background-color font-16 semi-font py-3"
						name=register value='회원가입' id="submit1" disabled="disabled" /> <a
						href="./userSearch.do"
						class="fables-forth-text-color font-16 fables-second-hover-color underline mt-3 mb-4 mb-lg-5 d-block">아이디
						/ 비밀번호 찾기</a>
					<p class="fables-forth-text-color">
						계정이 있으신가요 ? <a href="./login.do"
							class="font-16 semi-font fables-second-text-color underline fables-main-hover-color ml-2">로그인</a>
					</p>
				</form>
			</div>
		</div>

	</div>
	<!-- /End page content -->

	<%@ include file="footer.jsp"%>
	<script> 
$(document).ready(function() {
   
   
$("#submit1").click(function(){
   if($("#submit1").attr("disabled") != "") {
      if(FormValidationCheck()) {
            submitForm();
      } else {
    	  
      }
    }else{
      alert("아이디 중복 체크를 해주세요.");
    }
});
   
   
$(".idcheck").click(function(){
   var query = {sikgu_id : $("#sikgu_id").val()};
   if(query.sikgu_id.length !== 0){
      $.ajax({
           url : "${pageContext.request.contextPath}/idCheck.do",
           type : "post",
           data : query,
           success : function(data) {
              if(data == 1) {
                alert("사용불가한 아이디 입니다.") ;
                $("#submit1").attr("disabled", "disabled");
               } else {
                alert("사용가능한 아이디 입니다.");
                $("#submit1").removeAttr("disabled");
               }
           }
      });  // ajax 끝
   } else {
      alert("아이디를 입력해주세요");
      $("#submit1").attr("disabled", "disabled");
   }
})

});

function FormValidationCheck() {
    var pw = $("#sikgu_pwd").val();
    var pw2 = $("#sikgu_pwd2").val();
    var name = $("#sikgu_name").val();
    var phoneNum = $("#sikgu_phone").val();
    var email = $("#sikgu_email").val();
    var biznNmber = $("#sikgu_biznumber").val();
    var pwReg = /^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
    var emailReg = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
    var NameReg= /[a-z0-9]|[ \[\]{}()<>?|`~!@#$%^&*-_+=,.;:\"'\\]/g;
    
    // 비밀번호란과 비밀번호 확인란 동일 여부 체크
    if( pw !== pw2) {
        alert("비밀번호가 일치하지 않습니다.");
        return false;
     } 
    
    // 비밀번호 형식 체크
     if(false === pwReg.test(pw)) {
         alert('비밀번호는 8자 이상이어야 하며, 숫자/소문자/특수문자를 모두 포함해야 합니다.');
         return false;
     }

    //이름 유효성 체크
     if(true === checkSpecial(name)) {
         alert('이름은 특수문자 입력이 불가능합니다.');
         return false;
     }
     // 이름 공백 체크
     if(name === "" || name === null) {
         alert('이름은 필수 입력사항입니다.');
         return false;
     }
    
    // 특수문자 포함 여부 체크
    function checkSpecial(str) {
       	var special_pattern = /[`~!@#$%^&*|\\\'\";:\/?]/gi; 
       	if (special_pattern.test(str) == true) {
    	    return true; 
		} else {
			return false; 
		}
    }
    
    /** * 전화번호 포맷으로 변환 * * @param 데이터 */ 
   	if(isPhone(phoneNum)) {
   		var rtnNum; var regExp =/(02)([0-9]{3,4})([0-9]{4})$/;
   		var myArray;
   		if(regExp.test(phoneNum)){
   			myArray = regExp.exec(phoneNum);
   			rtnNum = myArray[1]+'-' + myArray[2]+'-'+myArray[3];
   		} else { 
   			regExp =/(0[3-9]{1}[0-9]{1})([0-9]{3,4})([0-9]{4})$/;
   			if(regExp.test(phoneNum)){
   				 myArray = regExp.exec(phoneNum);
   				 rtnNum = myArray[1]+'-'+myArray[2]+'-'+myArray[3];
   			}
   		}
   	} else {
   		alert("전화번호 형식이 맞지 않습니다.")
   		return false;
   	}
    


	 /*전화번호 형식 체크 */
	 function isPhone(phn) {
		 
		 var regExp =/(02)([0-9]{3,4})([0-9]{4})$/;
		 var myArray;
		 if(regExp.test(phn)){
			 myArray = regExp.exec(phn);
			 return true;
		 } else {
			 regExp =/(0[3-9]{1}[0-9]{1})([0-9]{3,4})([0-9]{4})$/;
			 if(regExp.test(phn)){
				 myArray = regExp.exec(phn);
				 return true;
			 } else {
				 return false;
		   	 }
		}
	 }
    
    // 메일 형식 유효성 체크
    if(false === emailReg.test(email)) {
        alert('이메일 형식이 올바르지 않습니다.');
        return false;
    }
    
	// 사업자 번호 형식 체크 함수
    function checkCorporateRegistrationNumber(value) {
        var valueMap = value.replace(/-/gi, '').split('').map(function(item) {
            return parseInt(item, 10);
        });

        if (valueMap.length === 10) {
            var multiply = new Array(1, 3, 7, 1, 3, 7, 1, 3, 5);
            var checkSum = 0;

            for (var i = 0; i < multiply.length; ++i) {
                checkSum += multiply[i] * valueMap[i];
            }

            checkSum += parseInt((multiply[8] * valueMap[8]) / 10, 10);
            return Math.floor(valueMap[9]) === (10 - (checkSum % 10));
        }

        return false;
    }

	// 사업자 번호 유효성 체크
    if( false === checkCorporateRegistrationNumber(biznNmber)) {
    	alert('사업자 번호가 올바르지 않습니다.');
        return false;
    }
    
	 return true;
}
</script>
</body>
<%@ include file="scriptall.jsp"%>
</html>