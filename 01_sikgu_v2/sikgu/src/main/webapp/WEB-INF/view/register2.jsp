<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<%@ include file="include.jsp"%>
<script type="text/javascript">
   function submitForm() {
      registerForm = document.getElementById("registerForm");
      registerForm.action = "./addS.do";
      registerForm.method = "post";
      registerForm.submit();
   }
   function insertinfo() {
      getXYAndSubmitForm();
      menuform = document.getElementById("menuform");
      menuform.action = "./insertMenu.do";
      menuform.method = "post";
      menuform.submit();

   }
</script>
<script src="resources/js/register.js"></script>
<script
   src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript"
   src="//dapi.kakao.com/v2/maps/sdk.js?appkey=11385b89f73bcc9d4dc2406ea538f4b9&libraries=services"></script>
</head>

<body>

   <%@ include file="header.jsp"%>

   <!-- Start page content -->
   <div class="container">
      <div class="row mt-3 mt-lg-5 mb-2">
         <div class="col-12 col-md-10 offset-md-1 col-lg-8 offset-lg-2">
            <div class="text-center">
               <h2 class="fables-main-text-color font-35 bold-font my-3">회원정보입력</h2>
            </div>
         </div>
      </div>
      <div
         class="col-12 col-md-5 offset-md-2 col-lg-6 offset-lg-3 text-center">
         <nav class="fables-single-nav" style="display: inline-flex;">
            <div class="nav" id="nav-tab" role="tablist">
               <a
                  class="fables-single-item nav-link fables-forth-text-color fables-second-active fables-second-hover-color fables-second-after px-3 px-md-5 font-15 semi-font border-0 active rounded-0 py-3"
                  id="nav-shop-tab" data-toggle="tab" role="tab"
                  aria-controls="nav-shop" aria-selected="true" href="nav-shop">상점
                  정보</a> <a
                  class="fables-single-item nav-link fables-forth-text-color fables-second-active fables-second-hover-color fables-second-after border-0 px-3 px-md-5 font-15 semi-font rounded-0 py-3"
                  id="nav-detail-tab" data-toggle="tab" role="tab"
                  aria-controls="nav-detail" aria-selected="false" href="nav-detail">상세
                  정보</a>
            </div>
         </nav>
      </div>

      <div class="tab-content mb-6" id="nav-tabContent"
         style="padding: 1em 3em 0;">
         <div class="tab-pane fade show active" id="nav-shop" role="tabpanel"
            aria-labelledby="nav-shop-tab">
            <div class="text-center" id="shopinfo">
               <div class="row">
                  <div class="col-12 wow fadeInLeft">
                     <form class="fables-contact-form" style="padding: 0 5em;"
                        id="registerForm">

                        <p class="font-20 semi-font fables-main-text-color mt-4 mb-2">상점
                           정보</p>
                        <div class="form-row">
                           <div class="form-group col-md-6">
                              <div class="input-icon">
                                 <span class="fables-icon fables-input-icon mt-2 font-13"><i
                                    class="fas fa-utensils"></i></span> <input type="hidden"
                                    name="sikgu_id" id="sikgu_id" value="${user.getSikgu_id()}">
                                 <input id="store_name" name="store_name" type="text"
                                    class="form-control rounded-0 py-3 pl-5 font-13 sign-register-input"
                                    placeholder="상점 이름">
                              </div>
                           </div>
                           <div class="form-group col-md-6">
                              <div class="input-icon">
                                 <span class="fables-iconphone fables-input-icon mt-2 font-13"></span>
                                 <input id="store_phone" name="store_phone" type="text"
                                    class="form-control rounded-0 py-3 pl-5 font-13 sign-register-input"
                                    placeholder="상점 전화번호">
                              </div>
                           </div>
                        </div>
                        <div class="form-row">
                           <div class="form-group col-md-12">
                              <select class="form-control rounded-0" id="category_id"
                                 name="category_id">
                                 <option value="" selected>상점 카테고리를 선택해 주세요</option>
                                 <option value="1">한식</option>
                                 <option value="5">카페</option>
                                 <option value="2">중식</option>
                                 <option value="8">치킨</option>
                                 <option value="4">분식</option>
                                 <option value="6">양식</option>
                                 <option value="7">퓨전</option>
                                 <option value="3">일식</option>
                                 <option value="9">제빵</option>
                              </select>
                           </div>
                        </div>

                        <div class="form-row" style="margin-bottom: -1em;">
                           <div class="form-group col-md-6">
                              <div class="input-icon">
                                 <span
                                    class="fables-iconmap-icon fables-input-icon mt-2 font-13"></span>
                                 <input id="store_address" name="store_address" type="text"
                                    class="form-control rounded-0 py-3 pl-5 font-13 sign-register-input"
                                    placeholder="주소" readonly="readonly">
                              </div>
                           </div>
                           <div class="form-group col-md-6">
                              <input type='button' style="height: 90%; width: 30%;"
                                 class="btn btn-block rounded-0 white-color fables-main-hover-background-color fables-second-background-color font-16 semi-font py-3"
                                 value='주소 찾기' onclick="execDaumPostcode()" />
                           </div>
                        </div>
                        <div class="form-row">
                           <div class="form-group col-md-12 input-icon">
                              <span
                                 class="fables-iconmap-icon fables-input-icon mt-2 font-13"></span>
                              <input id="store_detailaddress" name="store_detailaddress" type="text"
                                 class="form-control rounded-0 py-3 pl-5 font-13 sign-register-input"
                                 placeholder="상세주소를 입력해주세요.">
                           </div>

                        </div>
                        <div class="form-row">
                           <div class="form-group col-md-12 input-icon">
                              <span
                                 class="fables-iconmap-icon fables-input-icon mt-2 font-13"></span>
                              <input id="store_op_time" name="store_op_time" type="text"
                                 class="form-control rounded-0 py-3 pl-5 font-13 sign-register-input"
                                 placeholder="영업시간을 기입해주세요.">
                           </div>
                        </div>
                        <div class="form-row">
                           <div class="form-group col-md-12 input-icon">
                              <span
                                 class="fables-iconmap-icon fables-input-icon mt-2 font-13"></span>
                              <textarea class="form-control p-3 pl-5" id="store_profile"
                                 name="store_profile" style="height: 10rem;"
                                 placeholder="상점을 소개해주세요."></textarea>
                           </div>
                        </div>
                        <div class="form-row">
                           <div class="form-group col-md-6">
                              <div class="input-icon">
                                 <span class="fables-icon fables-input-icon mt-2 font-13"><i
                                    class="fab fa-line"></i></span> 
                                 <input id="store_face_id" name="store_face_id" type="text"
                                    class="form-control rounded-0 py-3 pl-5 font-13 sign-register-input"
                                    placeholder="네이버 블로그 주소  blog.naver.com/?">
                              </div>
                           </div>
                           <div class="form-group col-md-6">
                              <div class="input-icon">
                                 <span class="fables-icon fables-input-icon mt-2 font-13"><i
                                    class="fab fa-facebook-square"></i></span> 
                                 <input id="store_face_pwd" name="store_face_pwd" type="text"
                                    class="form-control rounded-0 py-3 pl-5 font-13 sign-register-input"
                                    placeholder="페이스북 주소  facebook.com/?">
                              </div>
                           </div>
                           <div class="form-group col-md-6">
                              <div class="input-icon">
                                 <span class="fables-icon fables-input-icon mt-2 font-13"><i
                                    class="fab fa-youtube"></i></span> 
                                 <input id="store_naver_id" name="store_naver_id" type="text"
                                    class="form-control rounded-0 py-3 pl-5 font-13 sign-register-input"
                                    placeholder="유튜브 주소  youtube.com/channel/?">
                              </div>
                           </div>
                           <div class="form-group col-md-6">
                              <div class="input-icon">
                                 <span class="fables-icon fables-input-icon mt-2 font-13"><i
                                    class="fab fa-instagram"></i></span> 
                                 <input id="store_naver_pwd" name="store_naver_pwd" type="text"
                                    class="form-control rounded-0 py-3 pl-5 font-13 sign-register-input"
                                    placeholder="인스타그램  주소  instagram.com/?">
                              </div>
                           </div>
                        </div>

                        <input id="store_x" name="store_x" type="hidden"
                           class="form-control rounded-0 py-3 pl-5 font-13 sign-register-input"
                           placeholder="x좌표"> <input id="store_y" name="store_y"
                           type="hidden"
                           class="form-control rounded-0 py-3 pl-5 font-13 sign-register-input"
                           placeholder="y좌표">


                        <div class="col-md-2 text-center" style="float: right;">
                           <input type='button' id="shopbutton"
                              class="btn btn-block rounded-0 white-color fables-main-hover-background-color fables-second-background-color font-16 semi-font py-3"
                              name=Register2 value='다음' onsubmit="return false" />

                        </div>
                     </form>
                  </div>
               </div>
            </div>
         </div>
      </div>

      <div class="tab-content" id="nav-tabContent"
         style="padding: 1em 3em 0;">
         <div class="tab-pane fade" id="nav-detail" role="tabpanel"
            aria-labelledby="nav-detail-tab">
            <div class="text-center" id="shopdetail">
               <div class="row">
                  <div class="col-12 wow fadeInLeft">
                     <form class="fables-contact-form" style="padding: 0 5em;"
                        id="menuform">
                        <input type="hidden" name="sikgu_id" id="sikgu_id"
                           value="${user.sikgu_id}">
                        <p class="font-20 semi-font fables-main-text-color mt-4 mb-2">메뉴
                           정보</p>

                        <div class="form-row">
                           <div class="form-group col-md-6">
                              <div class="input-icon">
                                 <span class="fables-input-icon mt-2 font-13"> <i
                                    class="fas fa-utensils"></i></span> <input id="menu_name"
                                    name="menu_name" type="text"
                                    class="form-control rounded-0 py-3 pl-5 font-13 sign-register-input"
                                    placeholder="메뉴 이름">
                              </div>
                           </div>
                           <div class="form-group col-md-6">
                              <div class="input-icon">
                                 <span class="fables-iconphone fables-input-icon mt-2 font-13"></span>
                                 <input id="menu_price" name="menu_price" type="number"
                                    class="form-control rounded-0 py-3 pl-5 font-13 sign-register-input"
                                    placeholder="가격">
                              </div>
                           </div>
                        </div>
                        <div class="form-row" id="menuinput"></div>

                        <div class="form-row" style="float: right;">
                           <div class="text-center">
                              <input type='button'
                                 class="btn btn-block rounded-0 white-color fables-main-hover-background-color fables-second-background-color font-16 semi-font"
                                 value='메뉴 추가' onclick="addInput();" onsubmit="return false" />
                           </div>
                           <div class="text-center">
                              <input type='button'
                                 class="btn btn-block rounded-0 white-color fables-main-hover-background-color fables-second-background-color font-16 semi-font"
                                 value='메뉴 삭제' onclick="deleteInput();"
                                 onsubmit="return false" />
                           </div>
                        </div>
                     </form>
                  </div>
               </div>
               <div class="row">
                  <div class="col-12 wow fadeInLeft">
                     <div class="fables-contact-form">

                        <div class="col-md-2 text-center">
                           <input type='button' id="menubutton"
                              class="btn btn-block rounded-0 white-color fables-main-hover-background-color fables-second-background-color font-16 semi-font py-3"
                              value='이전' onsubmit="return false" />
                        </div>
                        <div class="col-md-8 text-center"></div>
                        <div class="col-md-2 text-center">
                           <input type='button'
                              class="btn btn-block rounded-0 white-color fables-main-hover-background-color fables-second-background-color font-16 semi-font py-3"
                              value='완료' onclick="insertinfo();" />
                        </div>
                     </div>

                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>

   <!-- /End page content -->

   <%@ include file="footer.jsp"%>
</body>
<script>
   $('#shopbutton').click(function() {

      $('#nav-shop-tab').toggleClass('active');
      $('#nav-detail-tab').toggleClass('active');
      $('#nav-shop').toggleClass('show active');
      $('#nav-detail').toggleClass('show active');

   });

   $('#menubutton').click(function() {

      $('#nav-shop-tab').toggleClass('active');
      $('#nav-detail-tab').toggleClass('active');
      $('#nav-shop').toggleClass('show active');
      $('#nav-detail').toggleClass('show active');

   });
</script>
<%@ include file="scriptall.jsp"%>
</html>