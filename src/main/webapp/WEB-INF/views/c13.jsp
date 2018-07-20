<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="//code.jquery.com/jquery-3.1.0.min.js"></script>
<title>HAMO</title>
<style>
	#title{
		font-weight: 600;
		font-size: large;
		margin-left: 0.5%;
	}
	#border{
		border-bottom: 1px solid #ffbf00;
		width: 800px;
		margin-left: 0.7%;
		margin-top: 2%;
	}
	#write{
		border: none;
		background-color: #ffbf00;
		width: 70px;
		height: 30px;
		font-weight: 600;
		color: white;
		text-align: center;
		margin-left:91.5%;
		margin-top: 2%;
		display: none;
		cursor: pointer;
	}
	#table{
		margin-top: 3%;
		width: 800px;
	}
	.move img{
		border: 2px solid #ffbf00;
		margin-bottom: 1%;
	}
	.move{
		font-weight: 600;
	}
	#listTable{
		border-spacing: 9px;
	}
</style>
</head>
<body>
<jsp:include page="./club-header.jsp"/>
<div id="container">
	<jsp:include page="./club-menu.jsp"/>
	<div id="right">
		<div id="title">| 사진첩 |</div>
		<div id="border"></div>
		<div id="table">
			<table id="listTable">
			</table>
		</div>
		<input id="write" type="button" value="글쓰기"/>
	</div>
</div>
</body>
<script>
	$(document).ready(function(){
		$.ajax({
			type : "get",
			url: "./clubPhotoBbsListForm",
			dataType:"json",
			data:{
				"club_id":"<%=request.getParameter("club_id")%>",
				"sort": "<%=request.getParameter("sort")%>"
			},
			success:function(data){
				if(data){
					console.log(data.list);
					console.log(data.photolist);
					listPrint(data.list, data.photolist);
					if(data.nick != null){
						document.getElementById("write").style.display='inline';
					}else{
						document.getElementById("write").style.display='none';
					}
				}
			},
			error:function(e){
				console.log(e);
			}
		});
	});
	
	function listPrint(list, photolist){
		var content = "";
		var cnt = 0;
		console.log(list);
		$("#listTable").empty();
		content += "<tr>";
		list.forEach(function(item, index){
			cnt++;
			content += "<td class='move'><a href='./clubPhotoBbsDetail?club_id="+<%=request.getParameter("club_id")%>+"&clubBbs_id="+item.clubBbs_id+"'><img src='/hamo/resources/multiuploader/"+photolist[index]+"' width='250' height='280'></a><br/>"+item.clubBbs_subject+"</td><br/>";
			if(cnt % 3 == 0){
				content += "</tr>";
				content += "<tr>";
			}
		});
		$("#listTable").append(content);
	}
	
	$("#write").click(function(){
		location.href="./clubPhotoBbsWriteForm?club_id="+<%=request.getParameter("club_id")%>;
	});
</script>
</html>