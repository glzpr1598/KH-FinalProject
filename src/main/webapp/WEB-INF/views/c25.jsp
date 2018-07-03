<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<style>
	table, th, td {
		border-style: solid;
		border-color: #FFBF00;
		border-width: thin 0px;
		border-collapse: collapse;
		padding: 10px;
		font-size: 14px;
	}
	th {
		background-color: #FDF5DC;
	}
</style>
</head>
<body>
	<table>
		<tr>
			<th>글번호</th>
			<th>닉네임</th>
			<th>이메일</th>
			<th>전화번호</th>
			<th>강퇴</th>
		</tr>
		<c:forEach var="item" items="${ list }">
		<tr>
			<td>${ item.MEMBER_ID }</td>
			<td>${ item.CLUBJOIN_NICKNAME }</td>
			<td>${ item.MAMBER_EMAIL }</td>
			<td>${ item.MEMBER_PHONE }</td>
			<td><button>강퇴</button></td>
		</tr>
		</c:forEach>
	</table>
	${ list }
</body>
<script>
	
</script>
</html>