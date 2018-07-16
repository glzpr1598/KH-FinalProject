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
	td a{
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
		| 전체글보기 |
	</div>
	<div id="table">
	<table id="listTable">
		<thead>
			<tr id="head">
				<th>글번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
		</thead>
		<tbody id="body">
		</tbody>
	</table>
	</div>
</body>
<script>
	$(document).ready(function(){
		$.ajax({
			type : "get",
			url: "./clubAllListForm",
			dataType:"json",
			data:{
				"club_id":"<%=request.getParameter("club_id")%>"
			},
			success:function(data){
				if(data){
					console.log(data.list);
					listPrint(data.list);
				}
			},
			error:function(e){
				console.log(e);
			}
		});
	});
	
	function listPrint(list){
		var content = "";
		console.log(list);
		$("#body").empty();
		list.forEach(function(item){
			content += "<tr>";
			content += "<td>"+item.clubBbs_idx+"</td>";
			content += "<td><a href='./clubAllDetail?club_id="+<%=request.getParameter("club_id")%>+"&clubBbs_id="+item.clubBbs_id+"'>"+item.clubBbs_subject+"</a></td>";
			content += "<td>"+item.clubJoin_nickname+"</td>";
			var date = new Date(item.clubBbs_date);
			content += "<td>"+date.toLocaleDateString("ko-KR")+"</td>";
			content += "<td>"+item.clubBbs_hit+"</td>";
			content += "</tr>";
		});
		$("#body").append(content);
	}
	
	
</script>
</html>