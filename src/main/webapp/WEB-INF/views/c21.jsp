<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="icon" href="./resources/image/icon-32.png" />
<title>HAMO - 동호회 폐쇄</title>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<style>
	/* 제목 */
	#title {
		margin: 15px 10px;
		font-size: 20px;
		font-weight: bold;
	}
	
	/* 첨부파일 */
	#btnFile {
		margin: 5px 10px;
	}
	
	/* 메시지 */
	#msg {
		margin: 0px 10px;
		font-size: 12px;
		color: red;
	}
	
	/* 버튼 */
	#btnArea {
		margin-top: 15px;
		text-align: center;
	}
	.btn {
		width: 80px;
		padding: 5px;
		background-color: #ffbf00;
		border: none;
		border-radius: 5px;
		color: white;
		font-weight: bold;
		font-size: 14px;
		cursor: pointer;
	}
</style>
</head>
<body>
	<div id="title">사진 수정</div>
	<form id="form" action="./clubPictureUpload" method="post" enctype="multipart/form-data">
		<input type="file" name="file" id="inputFile" accept="image/*" />
		<div id="msg"></div>
		<div id="btnArea">
			<input type="button" class="btn" id="btnEdit" value="수정" />
			<input type="button" class="btn" id="btnCancel" value="취소" />
		</div>
	</form>
</body>
<script>
	/* 동호회 아이디 */
	var club_id = "<%= request.getParameter("club_id") %>";
	
	/* 파일 선택 */
	var fileCheck = false;
	$("#inputFile").change(function() {
		var ext = $(this).val().split('.').pop().toLowerCase();
		// 이미지가 아닌 경우
		if($.inArray(ext, ['jpg','png','gif','bmp']) == -1) {
			fileCheck = false;
			$("#msg").html('이미지 파일(jpg, png, gif, bmp)만 선택 가능합니다.');
		}
		// 이미지인 경우
		else {
			fileCheck = true;
			$("#msg").html('');
		}
	});
	
	/* 수정 클릭 */
	$("#btnEdit").click(function() {
		// 이미지 파일이면
		if(fileCheck == true) {
			opener.parent.location.reload();
			$("#form").submit();
		}
	});
	
	/* 취소 클릭 */
	$("#btnCancel").click(function() {
		self.close();
	});
</script>
</html>