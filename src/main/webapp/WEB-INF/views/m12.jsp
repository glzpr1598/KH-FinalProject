<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<style>
	table{
		width:700px;
		position:absolute;
		left: 730px;
		top: 245px;
	}
	table,th,td{
		text-align: center;
		border-collapse: collapse;
		border-width:1px 0px;
		border-style:solid;
		border-color:#ffbf00;
		padding:10px;
		font-size: 14px;
	}
	th{
		background-color: #FDF5DC;
	}
</style>
<body>
	<%@ include file="./main-header.jsp" %>
	<%@ include file="./main-community_menu.jsp" %>
	<table>
		<tr>
			<th>글번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>
		<tr>
			<td>글번호</td>
			<td>제목</td>
			<td>작성자</td>
			<td>작성일</td>
			<td>조회수</td>
		</tr>
	</table>
	<input id="write" type="button" value="글쓰기">
</body>
<script>
	$("#write").click(function(){
		location.href="freeBbsWriteForm";
	});
</script>
</html>