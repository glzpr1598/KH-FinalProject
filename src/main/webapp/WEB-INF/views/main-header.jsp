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
	.container {
		width: 1000px;
		height: 120px;
		margin: auto;
	}
	#top {
		position: relative;
	}

	.link {
		position: absolute;
		top: 5px;
		right: 0px;
	}
	.link a {
		font-size: 12px;
		color: black;
		text-decoration: none;
		font-weight: bold;
	}
	.link a:hover {
		text-decoration: underline;
	}
	
	.search {
		position: absolute;
		top: 50px;
		left: 20px;
	}
	
	#logo {
		height: 60px;
		cursor: pointer;
	}
	
	#divSearch {
		border: 3px solid #ffbf00;
		float: right;
		margin-top: 6px;
		margin-left: 20px;
	}
	#inputSearch {
		height: 40px;
		width: 400px;
        padding-left: 10px;
        border: none;
	}
	
	#btnSearch {
		height: 40px;
		width: 40px;
		cursor: pointer;
		background-color: transparent;
		border: none;
	}
	#btnSearch:before {
		content: "\f002";
		font-family: FontAwesome;
		font-size: 16px;
		color: #ffbf00;
	}
	
</style>
</head>
<body>
	<div id="top" class="container">
		<div class="link">
			<a href="">로그인</a>
			|
			<a href="">회원정보 수정</a>
		</div>
		<div class="search">
			<img id="logo" src="./resources/image/logo.png" />
			<div id="divSearch">
				<form>
					<input id="inputSearch" type="text" placeholder="검색어 입력">
					<button id="btnSearch" type="submit"></button>
				</form>
			</div>
		</div>
	</div>
     
</form>
</div>
</body>
<script></script>
</html>