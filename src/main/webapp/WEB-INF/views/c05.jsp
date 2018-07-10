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
	#title{
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
	#listTable{
		text-align: center;
	}
	td{
		border-bottom: 1px solid #ffbf00;
	}
	td a{
		text-decoration: none;
		color: black;
	}
</style>
</head>
<body>
	<jsp:include page="club-header.jsp"/>
	<jsp:include page="club-menu.jsp"/>
	<div id="title">| 공지사항 |</div>
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
	<input id="write" type="button" value="글쓰기"/>
	</div>
</body>
<script>
	var club_id=<%=request.getParameter("club_id")%>
	console.log("동호회 아이디 :"+club_id);
	 
	 $(document).ready(function(){
			$.ajax({
				type : "get",
				url: "./findMater",
				dataType:"json",
				data:{
					"club_id":"<%=request.getParameter("club_id")%>",
					"member_id": "${sessionScope.member_id}"
				},
				success:function(data){
					if(data.nick != null){
						console.log("동호회 회장 : "+data.nick);
						document.getElementById("write").style.display='inline';
					}else{
						console.log("동호회 회장 : "+data.nick);
						document.getElementById("write").style.display='none';
					}
				},
				error:function(e){
					console.log(e);
				}
			});
		});
	 
	 $(document).ready(function(){
			$.ajax({
				type : "get",
				url: "./clubNoticeListForm",
				dataType:"json",
				data:{
					"club_id":"<%=request.getParameter("club_id")%>",
					"sort": "<%=request.getParameter("sort")%>"
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
				content += "<td><a href='./clubNoticeDetail?club_id="+<%=request.getParameter("club_id")%>+"&clubBbs_id="+item.clubBbs_id+"'>"+item.clubBbs_subject+"</a></td>";
				content += "<td>"+item.club_masterNickname+"</td>";
				var date = new Date(item.clubBbs_date);
				content += "<td>"+date.toLocaleDateString("ko-KR")+"</td>";
				content += "<td>"+item.clubBbs_hit+"</td>";
				content += "</tr>";
			});
			$("#body").append(content);
		} 
	 
	$("#write").click(function(){
		location.href="./clubNoticeWriteForm?club_id="+club_id;
	});
</script>
</html>