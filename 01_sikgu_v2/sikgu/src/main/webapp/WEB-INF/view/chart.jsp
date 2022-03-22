<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<script src="https://www.amcharts.com/lib/4/core.js"></script>
<script src="https://www.amcharts.com/lib/4/charts.js"></script>
<script src="https://www.amcharts.com/lib/4/plugins/timeline.js"></script>
<script src="https://www.amcharts.com/lib/4/plugins/bullets.js"></script>
<script src="https://www.amcharts.com/lib/4/themes/animated.js"></script>

<%@ include file="include.jsp"%>

<script>
	//상위 셀렉트로 하위 셀렉트 제어하기

	function selectValue() {

		console.log("ch")
		console.log($('#select_data option:selected').val())
		console.log(jQuery('#B_NAME').css("display"))
		console.log(jQuery('#S_NAME').css("display"))
		console.log($('#B_NAME').val())
		console.log($('#S_NAME').val())
		var state = $('#select_data option:selected').val();
		if (state == 'pre_income') {
			$('#B_NAME').css("display", "block");
			$('#S_NAME').css("display", "block");
		} else if (state == "needs_select") {
			$('#B_NAME').css("display", "none");
			$('#S_NAME').css("display", "none");
		} else if (state == "total_age") {
			$('#B_NAME').css("display", "block");
			$('#S_NAME').css("display", "block");
		} else if (state == "mov_pop") {
			$('#B_NAME').css("display", "block");
			$('#S_NAME').css("display", "block");
		} else {
			$('#B_NAME').css("display", "block");
			$('#S_NAME').css("display", "none");
		}
	};
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
				<div id="chartdiv"></div>

				<div class="form-group">
					<form name="" class="row">

						<!-- 상위 셀렉트박스 -->
						<select id="select_data" name="select_data" style="width: 25%;margin-right: 2%;"	onchange="selectValue()" class="form-control rounded-0">
							<option value="needs_select">전체</option>
							<option value="max_income">시간별 최고매출업종</option>
							<option value="pre_income">추정 매출</option>
							<option value="mov_pop">유동 인구</option>
							<option value="total_age">매출-유동-직장</option>
						</select> <br>
						<br>

						<!-- 하위 셀렉트박스.1 -->
						<select id="B_NAME" name="B_NAME" style="display: none; width: 30%; margin-right: 2%;"
							class="form-control rounded-0">
							<optgroup label="- 역세권">
								<option value="1001085">서울 서초구 강남역</option>
								<option value="1001071">서울 강남구 한티역</option>
								<option value="1001112">서울 강남구 학동역_3</option>
								<option value="1001106">서울 강남구 학동역_2</option>
								<option value="1001102">서울 강남구 학동역_1</option>
								<option value="1001081">서울 강남구 역삼역_2</option>
								<option value="1001073">서울 강남구 역삼역_1</option>
								<option value="1001140">서울 강남구 압구정역</option>
								<option value="1001041">서울 강남구 수서역</option>
								<option value="1001087">서울 강남구 선릉역_2</option>
								<option value="1001084">서울 강남구 선릉역_1</option>
								<option value="1001054">서울 강남구 대치역_2</option>
								<option value="1001053">서울 강남구 대치역_1</option>
								<option value="1001078">서울 강남구 강남역_2</option>
								<option value="1001062">서울 강남구 강남역_1</option>
								<option value="1001066">서울 강남구 강남역</option>
								<option value="1001115">서울 강남구 강남구청역_2</option>
								<option value="1001111">서울 강남구 강남구청역_1</option>
								<option value="1001117">강남구 신사역_2</option>
								<option value="1001114">강남구 신사역_1</option>
								<option value="1001109">강남구 논현역_4</option>
								<option value="1001100">강남구 논현역_3</option>
								<option value="1001095">강남구 논현역_2</option>
								<option value="1001092">강남구 논현역_1</option>
							</optgroup>
							<optgroup label="- 대로">
								<option value="1000846">강남대로8길</option>
								<option value="1000845">강남대로34길</option>
								<option value="1000844">강남대로23길</option>
								<option value="1000888">강남대로140길</option>
								<option value="1000887">강남대로136길</option>
								<option value="1000886">강남대로118길</option>
							</optgroup>
							<optgroup label="- 시장">
								<option value="1001462">강남골목시장</option>
								<option value="1001475">강남개포시장</option>
								<option value="1001443">강남시장_동작</option>
								<option value="1001470">강남시장_강남</option>
							</optgroup>
							<optgroup label="- 특구">
								<option value="1001496">강남 마이스 관광특구</option>
							</optgroup>
						</select>

						<!-- 하위 셀렉트박스.2 -->
						<select id="S_NAME" name="S_NAME" style="display: none; width: 25%;margin-right: 2%;"
							class="form-control rounded-0">
							<option value="total">전체</option>
							<option value="CS100001">한식음식점</option>
							<option value="CS100002">중식음식점</option>
							<option value="CS100003">일식음식점</option>
							<option value="CS100004">양식음식점</option>
							<option value="CS100005">분식전문점</option>
							<option value="CS100006">패스트푸드점</option>
							<option value="CS100007">치킨전문점</option>
							<option value="CS100008">제과점</option>
							<option value="CS100009">커피·음료</option>
							<option value="CS100010">호프·간이주점</option>
						</select>

		
					<input type='button' class="btn btn-block rounded-0 white-color fables-main-hover-background-color fables-second-background-color font-16 semi-font py-2"
                            style="width: 10%;"  value='확인' id="btn"  onclick="changeGraph()"/> 
					</form>
					
					
						</div>

				
			</div>
		</div>
	</div>




	<!-- /End page content -->

	<%@ include file="footer.jsp"%>
</body>
<script src="resources/js/chart.js"></script>
<%@ include file="scriptall.jsp"%>
</html>