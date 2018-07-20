<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="//code.jquery.com/jquery-3.1.0.min.js"></script>
<title>HAMO</title>
<style>
	#head{
		border-bottom: 3px solid #ffbf00;
		border-top: 3px solid #ffbf00;
		background-color: #FDF5DC;
	}
	table{
		width: 100%;
		margin-top: 2%;
	}
	table,th,td{
		border-collapse: collapse;
		padding: 2% 0.5%;
		text-align: center;
	}
	#title{
		margin-left:0.5%;
		font-weight: 600;
		font-size: large;
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
	<div id="container">
		<jsp:include page="club-menu.jsp"/>
		<div id="right">
			<div id="title">| 전체글보기 |</div>
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
		</div>
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