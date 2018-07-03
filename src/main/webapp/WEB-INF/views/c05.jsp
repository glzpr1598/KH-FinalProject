<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="//code.jquery.com/jquery-3.1.0.min.js"></script>
<title>Insert title here</title>
<style>
	#head{
		border-bottom: 3px solid #ffbf00;
		border-top: 3px solid #ffbf00;
		background-color: #FDF5DC;
	}
	#table{
		position: absolute;
		left: 560px;
		width: 500px;
	}
	table,tr,td,tr {
		border-collapse: collapse;
		width: 780px;
		height: 50px;
	}
	#name{
	position: absolute;
	left: 560px;
	top: 345px;
	font-weight: 600;
	font-size: large;
	}
	#write{
		border: none;
		background-color: #ffbf00;
		width: 70px;
		height: 30px;
		position: relative;
		left: 708px;
		top: 30px;
		font-weight: 600;
		color: white;
		text-align: center;
		display: none;
	}
	.board{
		text-decoration: none;
		color: black;
	}
	#listTable{
		text-align: center;
	}
	td{
		border-bottom: 1px solid #ffbf00;
	}
</style>
</head>
<body>
	<jsp:include page="club-header.jsp"/>
	<jsp:include page="club-menu.jsp"/>
	<div id="name">
		| 공지사항 |
	</div>
	<div id="table">
	<table id="listTable">
		<tr id="head">
			<th>글번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>
		<c:forEach items="${list}" var="notice">
			<tr>
				<td>${notice.clubBbs_idx}</td>
				<td><a href="#" class="board">${notice.clubBbs_subject}</a></td>
				<td>${notice.club_masterNickname}</td>
				<td>${notice.clubBbs_date}</td>
				<td>${notice.clubBbs_hit}</td>
			</tr>
		</c:forEach>
	</table>
	<input id="write" type="button" value="글쓰기"/>
	</div>
</body>
<script>
	var nick = "${nick.club_masterNickname}"; 
	console.log("현재 회장 닉네임은 : "+nick);
	 if(nick != ""){
		document.getElementById("write").style.display='inline';
	}
	$("#write").click(function(){
		location.href="./clubNoticeForm";
	});
</script>
</html>