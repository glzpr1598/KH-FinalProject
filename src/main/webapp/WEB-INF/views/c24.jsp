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
	/* 내용 */
	#content {
		margin-top: 45px;
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
	<div id="content">정말로 동호회를 탈퇴하시겠습니까?</div>
	<div id="btn">
		<button id="btn1">탈퇴하기</button>
	</div>
</body>
<script>
$(document).ready(function(){
	
 	var club_id = "${club_id}";
 	
 	
 	
	$("#btn1").click(function(){
			var url = "./clubMemberOut?club_id="+club_id;
			location.href=url;
	});
	
});

	
</script>
</html>