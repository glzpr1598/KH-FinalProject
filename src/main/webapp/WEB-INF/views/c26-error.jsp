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
	/* 내용 */
	#content {
		margin-top: 70px;
		text-align: center;
		font-size: 15px;
		font-weight: bold;
	}
	
	/* 버튼 */
	#btn {
		margin-top: 50px;
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
	<div id="content">이미 폐쇄 신청되어있습니다.</div>
	<div id="btn">
		<button id="btn1">닫기</button>
	</div>
</body>
<script>
	/* 닫기 클릭 */
	$("#btn1").click(function() {
		window.close();
	});
</script>
</html>