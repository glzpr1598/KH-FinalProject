<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
<style>
	body {
		margin: 0px;
	}

	#header {
		width: 1000px;
		height: 100px;
		margin: auto;
		position: relative;
	}

	/* 로그인, 회원정보수정 */
	#header #link {
		position: absolute;
		top: 10px;
		right: 0px;
	}
	#header #link a {
		font-size: 12px;
		color: black;
		text-decoration: none;
		font-weight: bold;
		cursor: pointer;
	}
	#header #link a:hover {
		text-decoration: underline;
	}
	#first{
		width: 1000px;
		height: 120px;
		margin: auto;
		position: relative;
		text-align: center;
	}
	#first span{
		font-size: 35px;
		font-weight: bold;
	}
</style>
</head>
<body>
	<div id="header">
		<div id="link">
			<a href="./">HAMO</a>
			|
			<a id="login"></a>
			|
			<a href="">회원정보수정</a>
		</div>
	</div>
	<div id="first">
		<span id="clubName"></span>
	</div>
</body>
<script>
	// 로그인 상태 변수
	var loginState = "logout";  
	
	// 로그인 체크
	if('<%= session.getAttribute("userId") %>' == 'null') {  // 로그아웃 상태
		loginState = "logout";
		$("#login").html("로그인");
	} else {  // 로그인 상태
		loginState = "login";
		$("#login").html("로그아웃");
	}
	
	// 로그인/로그아웃 클릭
	$("#login").click(function() {
		if(loginState == "login") {  // 로그인 상태
			// 로그아웃
			location.href="./logout";
		} else {  // 로그아웃 상태
			// 로그인 페이지로 이동
			location.href="./loginForm";
		}
	});
	
	// 동호회 정보 가져오기
	// 동호회명, 회장, 회원수, 설립일, 주제, 지역
	$(document).ready(function() {
		var club_id = "<%= request.getParameter("club_id") %>";
		
		$.ajax({
	        url: "./clubInfo",
	        type: "post",
	        data: {
	            "club_id": club_id,
	        },
	        dataType: "json",
	        success: function(data) {
	            console.log(data);
	        },
	        error: function(err) {console.log(err);}
	    });
	});

</script>
</html>