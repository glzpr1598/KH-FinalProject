<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
	<link rel="icon" href="./resources/image/icon-32.png" />
	<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>HAMO</title>
	<style>
		.meeting{
			height: 50px;
			margin-top: 10px; 
			font-size: 20px;
			border: 0px;
		}
	</style>
		
	</head>
	<body>
		<!------------------- 양식 ------------------->
		<%@ include file="./club-header.jsp" %>
		<div id="container">
			<%@ include file="./club-menu.jsp" %>
			<div id="right"> <!-- width: 800px -->
			<!------------------- 양식 ------------------->
			<h1> | 모임일정 | </h1>
			<form action="">
				<input type="text" class="meeting" placeholder="제목"/></br>
				<input type="text" class="meeting" placeholder="일시"/></br>
				<input type="text" class="meeting" placeholder="회비"/>
				<P>내용</P>
				<textarea rows="5" cols="50"></textarea>
			</form>
		
		
			<!------------------- 양식 ------------------->
			</div>
		</div>
	</body>
	<script>
	</script>
</html>