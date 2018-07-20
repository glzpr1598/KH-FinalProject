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
	#write{
		border: none;
		background-color: #ffbf00;
		width: 70px;
		height: 30px;
		margin-left:89%;
		margin-top: 2%;
		font-weight: 600;
		color: white;
		text-align: center;
		display: none;
		cursor: pointer;
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
	<div id="container">
		<jsp:include page="club-menu.jsp"/>
		<div id="right">
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
		</div>
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
					"member_id": "${sessionScope.userId}"
				},
				success:function(data){
					if(data.masternick != null){
						console.log("동호회 회장 : "+data.masternick);
						document.getElementById("write").style.display='inline';
					}else{
						console.log("동호회 회장 : "+data.masternick);
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