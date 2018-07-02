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
		height: 120px;
		margin: auto;
		position: relative;
	}

	#header form {
		margin: 0px;
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
	
	/* 로고, 검색창 div */
	#header #areaSearch {
		position: absolute;
		top: 50px;
		left: 20px;
	}
	/* 로고 */
	#header #logo {
		height: 60px;
		cursor: pointer;
	}
	/* 검색창, 버튼 div */
	#header #divSearch {
		border: medium solid #ffbf00;
		float: right;
		margin-top: 6px;
		margin-left: 100px;
	}
	/* 검색창 */
	#header #inputSearch {
		height: 40px;
		width: 400px;
        padding-left: 10px;
        border: none;
	}
	/* 검색버튼 */
	#header #btnSearch {
		height: 40px;
		width: 40px;
		cursor: pointer;
		background-color: transparent;
		border: none;
	}
	#header #btnSearch:before {
		content: "\f002";
		font-family: FontAwesome;
		font-size: 16px;
		color: #ffbf00;
	}
	
	/* 메뉴 div */
	#menuBar {
		margin: 20px 0px;
		background: #ffbf00;
	}
	/* 메뉴 container */
	#menuBar #container {
		width: 1000px;
		margin: auto;
	}
	/* 메뉴 */
	#menuBar .menu {
		display: inline-block;
		padding: 12px 15px;
		margin: 0px 15px;
		text-align: center;
		text-decoration: none;
		font-weight: bold;
		font-size: 14px;
		color: #ffffff;
	}
	#menuBar .menu:hover {
		background: #F3E2A9;
		color: #848484;
	}
</style>
</head>
<body>
	<div id="header">
		<div id="link">
			<a id="login"></a>
			|
			<a href="">회원정보수정</a>
		</div>
		<div id="areaSearch">
			<img id="logo" src="./resources/image/logo.png" />
			<div id="divSearch">
				<form action="m08move">
					<input name="search" id="inputSearch" type="text" placeholder="검색어 입력">
					<button id="btnSearch" type="submit"></button>
				</form>
			</div>
		</div>
	</div>
	<div id="menuBar">
		<div id="container">
			<a class="menu" id="myClub" href="">내 동호회</a>
			<a class="menu" id="findClub" href="">동호회 찾기</a>
			<a class="menu" id="makeClub" href="">동호회 만들기</a>
			<a class="menu" id="comunity" href="">커뮤니티</a>
		</div>
	</div>
</body>
<script>
	// 로고 클릭
	$("#logo").click(function() {
		location.href="./"
	});
	
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

</script>
</html>