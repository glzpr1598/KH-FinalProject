<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--****자유게시판 글 리스트 jsp  ****-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<style>
	table{
		width:800px;
	}
	#right{
	float:left;
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
	#writeBtn{
		border:none;
		background-color: #FFBF00;
		color:white;
		padding:5px;
		cursor: pointer;
	}
	td a{
		text-decoration: none;
		color: black;
	}
	td a:hover{
		color:red;
	}
	#menu #freeBbs{
		font-weight: 900;
		color:black;
	}
</style>
<body>
	<%@ include file="./main-header.jsp" %>
	<div id="container">
		<%@ include file="./main-community_menu.jsp" %>
		<div id="right">
			<div id="title">| 자유게시판 |</div>
				<table>
					<tr>
						<th>글번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>
					<c:forEach items="${freeList}" var="bbs">
						<tr>
							<td>${bbs.mainBbs_idx }</td>
							<td><a href="freeBbsdetail?idx=${bbs.mainBbs_id}&updateAfter=0">${bbs.mainBbs_subject }</a></td>
							<td><a href="freeBbsdetail?idx=${bbs.mainBbs_id}&updateAfter=0">${bbs.member_id}</a></td>
							<td>${bbs.mainBbs_date }</td>
							<td>${bbs.mainBbs_hit }</td>
						</tr>
					</c:forEach>
				</table>
				<input id="writeBtn" type="button" value="글쓰기">
			</div>
	</div>
</body>
<script>
	$("#writeBtn").click(function(){
		//세션 검사 추후에 개발
		location.href="freeBbsWriteForm";
	});
</script>
</html>