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
					<h2 class="fables-main-text-color font-35 bold-font my-3">상점을
						자랑해주세요.</h2>
				</div>
			</div>
		</div>
		<div class="col-12 col-md-5 col-lg-12  text-center">
			<nav class="fables-single-nav" style="display: inline-flex;">
				<div class="nav nav-tabs" id="nav-tab" role="tablist">
					<a
						class="fables-single-item nav-link fables-forth-text-color fables-second-active fables-second-hover-color fables-second-after px-3 px-md-5 font-15 semi-font border-0 active rounded-0 py-3"
						id="nav-img-tab" data-toggle="tab" href="#nav-img" role="tab"
						aria-controls="nav-img" aria-selected="true"> <img
						src="resources/img/button/picture.svg"
						style="width: 30px; height: 30px;" /></a> <a
						class="fables-single-item nav-link fables-forth-text-color fables-second-active fables-second-hover-color fables-second-after border-0 px-3 px-md-5 font-15 semi-font rounded-0 py-3"
						id="nav-vid-tab" data-toggle="tab" href="#nav-vid" role="tab"
						aria-controls="nav-vid" aria-selected="false"> <img
						src="resources/img/button/video.svg"
						style="width: 30px; height: 30px;" /></a>
				</div>
			</nav>
			<form name="uploadForm" id="uploadForm" enctype="multipart/form-data"
				method="POST">
				<input type="hidden" id="store_id" name="store_id"
					value="${user.sikgu_id}">
				<div class="tab-content" id="nav-tabContent"
					style="padding: 1em 3em 0;">

					<div class="tab-pane fade show active" id="nav-img" role="tabpanel"
						aria-labelledby="nav-img-tab">

						<div class="text-center">
							<p class="font-18 semi-font fables-main-text-color mt-4 mb-2">이미지를
								업로드해주세요.</p>
							<div class="form-group">
								<div class="imgs_wrap form-control p-3 pl-5">
									<i class="fas fa-plus-circle fa-1x"
										onclick="document.getElementById('input_imgs').click()"></i> <input
										type="file" id="input_imgs" name="input_imgs" multiple
										style="display: none" />
								</div>
							</div>
						</div>


					</div>
					<div class="tab-pane fade" id="nav-vid" role="tabpanel"
						aria-labelledby="nav-vid-tab">
						<div class="text-center">
							<p class="font-18 semi-font fables-main-text-color mt-4 mb-2">비디오를
								업로드해주세요.</p>
							<div class="form-group">
								<div class="vid_wrap form-control p-3 pl-5">
									<i class="fas fa-plus-circle fa-1x"
										onclick="document.getElementById('input_video').click()"
										id="image_input_button"></i> <input type="file"
										id="input_video" name="input_video" style="display: none" />
								</div>
							</div>
							<div class="form-group">
								<p class="font-18 semi-font fables-main-text-color mt-4 mb-2">미리보기(thumbnail)를
									업로드해주세요.</p>
								<div class="thumbnail_wrap form-control p-3 pl-5">
									<i class="fas fa-plus-circle fa-1x"
										onclick="document.getElementById('input_thumbnail').click()"></i>
									<input class="form-control p-3 pl-5" type="file"
										id="input_thumbnail" name="input_thumbnail" multiple
										style="display: none; margin-top: 10px" />
								</div>
							</div>
						</div>
					</div>
					<div class="form-row">
						<div class="form-group col-md-12 input-icon">
							<span class="fables-iconcomment fables-input-icon mt-2 font-13"></span>
							<textarea class="form-control p-3 pl-5" id="content_description"
								name="content_description" style="height: 10rem;"
								placeholder="내용을 입력해주세요."></textarea>
						</div>
					</div>

					<div class="form-row" style="display: flex;" id="pic">
						<div class="form-group col-md-6">
							<div class="input-icon">
								<img src="resources/img/logo/face.png"
									style="width: 30px; height: 30px;" /><span
									class="font-15 semi-font fables-main-text-color mt-4 mb-2">페이스북에 사진 게시하기.</span> <input type="checkbox" id="faceCheck" name="faceCheck"
									value="face" /> <label for="face_check"><span></span></label>
								<p>
							</div>
						</div>
						
						
					<div class="form-group col-md-6">
							<div class="input-icon">
								<img src="resources/img/logo/naver.png"
									style="width: 30px; height: 30px;" /><span
									class="font-15 semi-font fables-main-text-color mt-4 mb-2">네이버블로그에 사진 게시하기.</span> <input type="checkbox" id="naver_check" name="naver_check"
									value="naver" /> <label for="naver_check"><span></span></label>
								<p>
							</div>
						</div>
					</div>
					<div class="form-row" style="display: none;" id="mov">
						<div class="form-group col-md-6">
							<div class="input-icon">
								<img src="resources/img/logo/face.png"
									style="width: 30px; height: 30px;" /><span
									class="font-15 semi-font fables-main-text-color mt-4 mb-2">페이스북에 영상 게시하기.</span> <input type="checkbox" id="faceCheck2" name="faceCheck2"
									value="face" /> <label for="face_check2"><span></span></label>
								<p>
							</div>
						</div>
						<div class="form-group col-md-6">
							<div class="input-icon">
								<img src="resources/img/logo/youtube.jpg"
									style="width: 30px; height: 30px;" /><span
									class="font-15 semi-font fables-main-text-color mt-4 mb-2">유튜브에 영상 게시하기.</span> <input type="checkbox" id="you_check" name="you_check"
									value="youtube" /> <label for="you_check"><span></span></label>
								<p>
							</div>
						</div>
					</div>
					<input type="hidden" class="accesstoken" id="accesstoken" name="accesstoken">
              		<input type="hidden" class="face_link" id="face_link" name="face_link" value="">
               		<input type="hidden" class="naver_link" id="naver_link" name="naver_link" value="">
               		<input type="hidden" class="youtube_link" id="youtube_link" name="youtube_link" value="">
					<input type='button'
						class="mb-5 btn btn-block rounded-0 white-color fables-main-hover-background-color fables-second-background-color font-16 semi-font py-3"
						value="제출" id="btnSubmit" />
				</div>
			</form>
		</div>
	</div>
	<!--    <김민수 수정 10-23 여기부터> -->
   <script> 
   
   var key ;
   var win ;
   
      $(document).ready(function() {
         $('#naver_check').on('click', function() {
            if ( $(this).prop('checked') ) {
               win=window.open("https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=d2P0eCEHcyvS2ui1JQHk&redirect_uri=http%3A%2F%2Flocalhost%3A8080%2Fsikgu%2Fcallback.jsp&state=189486657665142352444166630096686241194", "네이버로그인", "width=500, height=500, toolbar=no, menubar=no, scrollbars=no, resizable=yes" );
               window.open("https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=d2P0eCEHcyvS2ui1JQHk&redirect_uri=http%3A%2F%2Flocalhost%3A8080%2Fsikgu%2Fcallback.jsp&state=189486657665142352444166630096686241194", "네이버로그인", "width=500, height=500, toolbar=no, menubar=no, scrollbars=no, resizable=yes" );  
               key = document.getdocument.getElementById("accesstoken").value
                if(key != null){
                   win.close();
                }
            } else {
               win.close();
                } 
         }); 
      }); 
   </script>
<!--    <김민수 수정 10-23 여기까지> -->   

	<script type="text/javascript">
		// 이미지 배열
		var sel_files = [];
		var ListOfFiles = [];
		var index = 0;

		// 로드부
		$(document).ready(function() {
			$("#input_imgs").on("change", handlerImgFileSelect);
			$("#input_thumbnail").on("change", handlerthumbnailFileSelect);
			$("#input_video").on("change", handlerVidFileSelect);
			$('#nav-vid-tab').on("click", video_input_box_view);
			$('#nav-img-tab').on("click", image_input_box_view);
			$("#btnSubmit").on("click", uploadFile);
		});

		/*------------------------------------------------------------------------------------------- */
		// 이미지,비디오 업로드 선택 => (이미지 업로드 시, 비디오 입력란 초기화  / 비디오 업로드 시, 이미지 입력란 초기화)
		/*------------------------------------------------------------------------------------------- */

		// 이미지 탭 클릭 => 비디오, 썸네일 입력란 초기화
		function image_input_box_view() {
			$(".imgs_wrap").css('display', "block");
			$(".vid_wrap").children().remove('a');
			$(".vid_wrap").css('display', "none");
			$("#mov").css('display', "none");
			$("#pic").css('display', "flex");
			$(".thumbnail_wrap").children().remove('a');
			reset_file_input("#input_video");
			reset_file_input("#input_thumbnail");
		}

		//비디오 탭 클릭 => 이미지 입력란 초기화
		function video_input_box_view() {
			$(".vid_wrap").css('display', "block");
			$(".imgs_wrap").children().remove('a')
			$(".imgs_wrap").css('display', "none");
			$("#mov").css('display', "flex");
			$("#pic").css('display', "none");
			reset_file_input("#input_imgs");
			ListOfFiles = [];
		}

		// 브라우저별 input[type=file]의 초기화
		function reset_file_input(name) {

			// 브라우저 IE여부 확인
			jQuery.browser = {};
			(function() {
				jQuery.browser.msie = false;
				jQuery.browser.version = 0;
				if (navigator.userAgent.match(/MSIE ([0-9]+)\./)) {
					jQuery.browser.msie = true;
					jQuery.browser.version = RegExp.$1;
				}
			})();

			if ($.browser.msie) {
				// ie
				$(name).replaceWith($(name).clone(true));
			} else {
				// other browser
				$(name).val("");
			}
		}
		/*------------------------------------------------------------------------------------------- */
		/*------------------------------------------------------------------------------------------- */

		/*------------------------------------------------------------------------------------------- */
		// 파일 목록을 받아서 미리보기 생성 함수
		/*------------------------------------------------------------------------------------------- */

		//이미지 미리보기
		function handlerImgFileSelect(e) {
			imgArrayPush()
			sel_files = []; //초기화

			var files = e.target.files;
			var filesArr = Array.prototype.slice.call(files);

			filesArr
					.forEach(function(f) {
						if (!f.type.match("image.*")) {
							alert("이미지 파일만 가능합니다.")
							return;
						}

						sel_files.push(f);

						var reader = new FileReader();
						reader.onload = function(e) {
							var html = "<a href='javascript:void(0);' onclick='deleteImageAction("
									+ index
									+ ")' id='img_id_"
									+ index
									+ "'><img src='"
									+ e.target.result
									+ "' data-file='"
									+ f.name
									+ "' class = 'selProductFile' title='Click to remove' style='max-width: 20%; height: auto;'></a>";
							$(".imgs_wrap").append(html);
							index++;
						}
						reader.readAsDataURL(f);
					});
		}

		// 썸네일 미리보기
		function handlerthumbnailFileSelect(e) {
			sel_files = []; //초기화
			$(".thumbnail_wrap").children(":not('i,input')").empty();

			var files = e.target.files;
			var filesArr = Array.prototype.slice.call(files);

			filesArr.forEach(function(f) {
						if (!f.type.match("image.*")) {
							alert("이미지 파일만 가능합니다.")
							return;
						}

						sel_files.push(f);

						var reader = new FileReader();
						reader.onload = function(e) {
							var html = "<a href='javascript:void(0);' onclick='deletethumbnailAction("
									+ index
									+ ")' id='thumbnail_id_"
									+ index
									+ "'><img src='"
									+ e.target.result
									+ "' data-file='"
									+ f.name
									+ "' class = 'selProductFile' title='Click to remove' style='max-width: 20%; height: auto;'></a>";
							$(".thumbnail_wrap").append(html);
							index++;
						}
						reader.readAsDataURL(f);
					});
		}
		// 동영상 미리보기
		function handlerVidFileSelect(e) {
			sel_files = []; //초기화
			$(".vid_wrap").children(":not('i,input')").empty();

			var files = e.target.files;
			var filesArr = Array.prototype.slice.call(files);

			filesArr
					.forEach(function(f) {
						if (!f.type.match("video.*")) {
							alert("영상 파일만 가능합니다.")
							return;
						}

						sel_files.push(f);

						var reader = new FileReader();
						reader.onload = function(e) {
							var html = "<a href='javascript:void(0);'><video src='"
									+ e.target.result
									+ "' data-file='"
									+ f.name
									+ "' class = 'selProductFile' style='max-width: 70%; height: auto;' id='vid_id_"
									+ index
									+ " '/><img src='resources/img/button/x.svg' onclick='deleteVideoAction("
									+ index
									+ ")' style='margin-left:20px; width:20px; height:20px;'/></a>";
							$(".vid_wrap").append(html);
							index++;
						}
						reader.readAsDataURL(f);
					});
		}
		/*------------------------------------------------------------------------------------------- */
		/*------------------------------------------------------------------------------------------- */

		/*------------------------------------------------------------------------------------------- */
		// content 추가 및 삭제
		/*------------------------------------------------------------------------------------------- */

		function imgArrayPush() {

			var fileList = $('#input_imgs');

			for (var i = 0; i < fileList.get(0).files.length; i++) {
				ListOfFiles.push(fileList.get(0).files[i]);
			}
		}

		function deleteImageAction(index) {

			sel_files.splice(index, 1);

			var img_id = "#img_id_" + index;
			$(img_id).remove();

			ListOfFiles[index] = ""
			console.log(ListOfFiles)
			reset_file_input("#input_imgs");
		}

		function deletethumbnailAction(index) {
			sel_files.splice(index, 1);

			$(".thumbnail_wrap").children(":not('i,input')").empty();
			reset_file_input("#input_thumbnail");
		}

		function deleteVideoAction(index) {
			sel_files.splice(index, 1);

			$(".vid_wrap").children(":not('i,input')").empty();
			reset_file_input("#input_video");
		}
		/*------------------------------------------------------------------------------------------- */
		/*------------------------------------------------------------------------------------------- */

		/*------------------------------------------------------------------------------------------- */
		// 전송 (서버)
		/*------------------------------------------------------------------------------------------- */

		function uploadFile() {

			// 등록할 파일 리스트
			function checked(checkbox_id) {
				if ($('input:checkbox[id="' + checkbox_id + '"]')
						.is(":checked") == true) {
					console.log("fucntion play")
					formData.set(checkbox_id, "T")
				} else {
					console.log("fucntion play2")
					formData.set(checkbox_id, "F")
				}
			}

			var form = $("#uploadForm")[0];
			var formData = new FormData(form);
			checked("face_check");
			checked("naver_check");
			checked("you_check");

			if ($('.imgs_wrap').is(":visible")) {
				alert("img upload")

				console.log("when click the vid - imgbox active : "
						+ $('.imgs_wrap').is(":visible"))
				console.log("when click the vid - vidbox active : "
						+ $('.vid_wrap').is(":visible"))

				/* $("#btnSubmit").prop("disabled", true); */

				var submmitFileList = [];
				for (var i = 0; i < ListOfFiles.length; i++) {
					if (ListOfFiles[i] != "") {
						submmitFileList.push(ListOfFiles[i]);
					}                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
				}console.log(submmitFileList);

				// 파일이 있는지 체크
				if (submmitFileList.length == 0) {
					// 파일등록 경고창
					alert("파일이 없습니다.");
					return;
				}

				if (confirm("등록 하시겠습니까?")) {
					// 등록할 파일 리스트를 formData로 데이터 입력
					for (var i = 0; i < submmitFileList.length; i++) {
						formData.append('files', submmitFileList[i]);
					}
					
					$.ajax({
						url : "./imageUpload.do",
						data : formData,
						type : "post",
						enctype : 'multipart/form-data',
						processData : false,
						contentType : false,
						cache : false,
						success : function(result) {
							alert(result);
							$('#naver_link').val(result);
							location.reload();
						
						}
					});
				}
			} else if ($('.vid_wrap').is(":visible")) {
				console.log("video upload")

				if ($("#input_video").val() == null) {
					// 파일등록 경고창
					alert("파일이 없습니다.");
					return;
				}

				if (confirm("등록 하시겠습니까?")) {
					// 등록할 파일 리스트를 formData로 데이터 입력

					$.ajax({
						url : "./videoUpload.do",
						data : formData,
						type : "post",
						enctype : 'multipart/form-data',
						processData : false,
						contentType : false,
						cache : false,
						success : function(result) {
							alert(result);
							$('#youtube_link').val(result);
							location.reload();
						}
					});
				}

			}
		}
	</script>

	<!-- /End page content -->

	<%@ include file="footer.jsp"%>

</body>
<script src="resources/js/uploadFacebook.js"></script>
<%@ include file="scriptall.jsp"%>
</html>