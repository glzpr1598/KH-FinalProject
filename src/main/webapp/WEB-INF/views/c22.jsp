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
		margin: 15px 10px 0px 10px;
		font-size: 20px;
		font-weight: bold;
	}
	
	/* 글자수 */
	#textLengthArea {
		margin: 0px 10px;
    	text-align: right;
    	font-size: 14px;
    	color: gray;
	}
	
	/* 텍스트 입력창 */
	#introduce {
		margin: 0px 10px;
		resize: none;
		border: medium solid #ffbf00;
   		border-radius: 5px;
	}
	
	/* 버튼 */
	#btnArea {
		margin-top: 15px;
		margin-right: 10px;
		text-align: right;
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
	<div id="title">소개글 수정</div>
	<form id="form" action="./clubIntroduceUpdate" method="post">
		<input type="hidden" name="club_id" value="<%= request.getParameter("club_id") %>" />
		<div id="textLengthArea">
			<span id="textLength">0</span> / 100 자
		</div>
		<textarea id="introduce" name="introduce" rows="5" cols="48"></textarea>
		<div id="btnArea">
			<input type="submit" class="btn" id="btnEdit" value="수정" />
		</div>
	</form>
</body>
<script>
	/* 동호회 아이디 */
	var club_id = "<%= request.getParameter("club_id") %>";
	
	/* textarea 글자수 제한 */
	$("#introduce").keyup(function() {
		// 제한 글자수
		var limit = 100;
		
        // 텍스트 길이
        var textLength = $(this).val().length;
        
        // 텍스트 길이 표시
        $("#textLength").html(textLength);
 
        // 제한된 길이보다 입력된 길이가 큰 경우 제한 길이만큼만 자르고 텍스트영역에 넣음
        if (textLength > limit) {
            $(this).val($(this).val().substr(0, limit));
        }
    });
</script>
</html>