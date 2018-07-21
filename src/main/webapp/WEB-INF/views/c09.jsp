<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="//code.jquery.com/jquery-3.1.0.min.js"></script>
<title>HAMO</title>
<style>
	#menu3 {
		color: black;
		font-weight: bold;
	}
	
	#title{
		font-weight: bold;
		font-size: large;
	}
	table{
		width: 100%;
		margin-top: 20px;;
	}
	table,th,td{
		border-collapse: collapse;
		padding: 8px 10px;
		text-align: center;
		font-size: 13px;
	}
	#head{
		border-bottom: 3px solid #ffbf00;
		border-top: 3px solid #ffbf00;
		background-color: #FDF5DC;
	}
	td a{
		text-decoration: none;
		color: black;
	}
	td a:hover {
		text-decoration: underline;
	}
	td{
		border-bottom: 1px solid #ffbf00;
	}
	#writeArea {
		text-align: right;
	}
	#write{
		margin-top: 10px;
		border:none;
		border-radius: 5px;
		background-color: #FFBF00;
		color:white;
		padding:5px 10px;
		cursor: pointer;
		font-weight: bold;
		display: none;
	}
	#space {
		height: 100px;
	}
</style>
</head>
<body>
	<jsp:include page="club-header.jsp"/>
	<div id="container">
		<jsp:include page="club-menu.jsp"/>
		<div id="right">
			<div id="title">| 자유게시판 |</div>
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
			<div id="writeArea">
				<input id="write" type="button" value="글쓰기"/>
			</div>
			<div id="pagingArea"></div>
			</div>
		</div>
	</div>
</body>
<script src="./resources/paging/paging.js" type="text/javascript"></script>
<link href="./resources/paging/paging.css" type="text/css" rel="stylesheet">
<link href="https://use.fontawesome.com/releases/v5.1.1/css/all.css" rel="stylesheet" integrity="sha384-O8whS3fhG2OnA5Kas0Y9l3cfpmYjapjI0E4theH4iuMD+pLhbf6JI0jIMfYcK3yZ" crossorigin="anonymous">
<script>
	$(document).ready(function(){
		$.ajax({
			type : "get",
			url: "./clubFreeBbsListForm",
			dataType:"json",
			data:{
				"club_id": "<%=request.getParameter("club_id")%>",
				"sort": "<%=request.getParameter("sort")%>"
			},
			success:function(data){
				$.pagingHash(data.list, 10, 10, listPrint);
				if(data.nick != null){
					document.getElementById("write").style.display='inline';
				}else{
					document.getElementById("write").style.display='none';
				}
			},
			error:function(e){
				console.log(e);
			}
		});
		
		function listPrint(list){
			var content = "";
			console.log(list);
			$("#body").empty();
			list.forEach(function(item){
				content += "<tr>";
				content += "<td>"+item.clubBbs_idx+"</td>";
				content += "<td><a class='move' href='./clubFreeBbsDetail?club_id="+<%=request.getParameter("club_id")%>+"&clubBbs_id="+item.clubBbs_id+"'>"+item.clubBbs_subject+"</a></td>";
				content += "<td>"+item.clubJoin_nickname+"</td>";
				var date = new Date(item.clubBbs_date);
				content += "<td>"+date.toLocaleDateString("ko-KR")+"</td>";
				content += "<td>"+item.clubBbs_hit+"</td>";
				content += "</tr>";
			});
			$("#body").append(content);
		}
		
	});
	
	$("#write").click(function(){
			location.href="./clubFreeBbsWriteForm?club_id="+<%=request.getParameter("club_id")%>;
	});
</script>
</html>