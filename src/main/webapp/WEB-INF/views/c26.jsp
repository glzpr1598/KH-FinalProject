<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="icon" href="./resources/image/icon-32.png" />
<title>HAMO</title>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<style>
	/* 제목 */
	#title {
		margin: 15px 10px;
		font-size: 20px;
		font-weight: bold;
	}
	
	/* 내용 */
	#content1 {
		margin-top: 40px;
	}
	.content {
		margin: 5px 0px;
		text-align: center;
		font-size: 14px;
		font-weight: bold;
	}
	
	/* 버튼 */
	#btn {
		margin-top: 30px;
		text-align: center;
	}
	#btn1 {
		width: 100px;
		padding: 7px 0px;
		background-color: #ffbf00;
		border: none;
		border-radius: 5px;
		color: white;
		font-weight: bold;
		font-size: 15px;
		cursor: pointer;
	}
</style>
</head>
<body>
	<div id="title">동호회 폐쇄</div>
	<div class="content" id="content1">동호회를 폐쇄하시면 7일간의 보류 기간을 거치며</div>
	<div class="content" id="content2">그 이후에는 동호회의 모든 정보가 삭제됩니다.</div>
	<div class="content" id="content3">보류 기간 중에는 동호회 폐쇄를 취소하실 수 있습니다.</div>
	<div id="btn">
		<button id="btn1">폐쇄하기</button>
	</div>
</body>
<script>
	/* 폐쇄하기 클릭 */
	$("#btn1").click(function() {
		var club_id = "<%= request.getParameter("club_id") %>";
		location.href="clubClose?club_id=" + club_id;
	});
</script>
</html>