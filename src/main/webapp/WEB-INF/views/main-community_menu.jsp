<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
<style>
	body {
		margin: 0px;
	}
	.list{
		width: 20px;
		height: 20px;
	}
	#menu{
		width : 200px;
		height: 170px;
		border: 3px solid #ffbf00;
		background-color: #FDF5DC;
		border-radius:20px;
		position: absolute;
		left: 480px;
		top: 245px;
	}
	#menu #menu1{
		text-decoration: none;
		color: #5a5a5a;
		font-weight: 600;
		position: absolute;
		top: 10px;
		left: 10px;
	}
	#menu #menu2{
	text-decoration: none;
	color: #5a5a5a;
	font-weight: 600;
	position: absolute;
	top: 60px;
	left: 10px;
}
</style>
</head>
<body>
		<div id="menu">
			<a id="menu1" href="freeBbsList"><img class="list" src="./resources/image/list.png" />&nbsp;&nbsp;자유게시판</a>
			<a id="menu2" href="#"><img class="list" src="./resources/image/list.png" />&nbsp;&nbsp;동호회 친목</a>
		</div>
</body>
<script>

</script>
</html>