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
	/*가운데 정렬*/
	#container {
		width: 1000px;
		margin: auto;
	}
	.list{
		height: 13px;
	}
	#left {
		width : 180px;
		float: left;
	}
	#right{
		margin-left: 20px;
		width: 800px;
		float:left;
	}
	#menu{
		height: 83px;
		border: medium solid #ffbf00;
		background-color: #FDF5DC;
		border-radius: 5px;
	}
	#menu .menu1{
		text-decoration: none;
		color: #5a5a5a;
		font-size: 13px;
	}
	#menu .menu1:hover {
		text-decoration: underline;
	}
	.margin{
		margin:10px;
		padding:2px;
	}
	/* 제목 */
	#title {
		font-size: 18px;
		font-weight: bold;
	}
</style>
</head>
<body>
	<div id="left">
		<div id="menu">
			<div class="margin">
				<img class="list" src="./resources/image/list.png" />
				<a class="menu1" id="freeBbs" href="./freeBbsListPage">자유게시판</a>
			</div>
			<div class="margin">
				<img class="list" src="./resources/image/list.png" />
				<a class="menu1" id="friendBbs"  href="./friendShipBbsListPage">동호회 친목</a>
			</div>
			
		</div>
	</div>
</body>
<script>

</script>
</html>