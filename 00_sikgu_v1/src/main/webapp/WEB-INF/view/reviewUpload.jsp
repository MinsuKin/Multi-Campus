<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
</head>
<body>
	<form id="frm" name="frm" enctype="multipart/form-data">
		<input type="hidden" id = "store_id" value = ${store.sikgu_id}/>
		<input type="hidden" id = "writer_id" value = ${writer.sikgu_id}/>
		<table class="board_view">
			<colgroup>
				<col width="15%">
				<col width="*" />
			</colgroup>
			<caption>게시글 작성</caption>
			<tbody>
				<tr>
					<th scope="row">제목</th>
					<td><input type="text" id="TITLE" name="TITLE" class="wdp_90"></input></td>
				</tr>
				<tr>
					<td colspan="2" class="view_text">
						<textarea rows="20" cols="100" title="내용" id="CONTENTS" name="CONTENTS"></textarea>
					</td>
				</tr>
			</tbody>
		</table>
		<input type="file" name="file"> 
		<br/>
		<br/>
		<a href="#this" class="btn" id="write">작성하기</a>
		<a href="#this" class="btn" id="list">목록으로</a>
	</form>
	
	<script type="text/javascript"> 
	
	$(document).ready(function(){
		$("#list").on("click", function(e){ //목록으로 버튼 
			e.preventDefault();
			fn_openBoardList(); 
		});
		
		$("#write").on("click", function(e){ //작성하기 버튼 
			e.preventDefault();
			fn_insertBoard();
		}); 
	});
	
	function fn_openBoardList(){ var comSubmit = new Co
		mSubmit();
			comSubmit.setUrl("<c:url value='/' />");
			comSubmit.submit();
		}
		function fn_insertBoard() {
			var comSubmit = new ComSubmit("frm");
			comSubmit.setUrl("<c:url value='/imageUpload.do' />");
			comSubmit.submit();
		}
	</script>
</body>
</html>

