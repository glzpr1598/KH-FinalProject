<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--****동호회 친목 게시판 글 리스트 jsp  ****-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="./resources/paging/paging.js" type="text/javascript"></script>
<link href="./resources/paging/paging.css" type="text/css" rel="stylesheet">
<link href="https://use.fontawesome.com/releases/v5.1.1/css/all.css" rel="stylesheet" integrity="sha384-O8whS3fhG2OnA5Kas0Y9l3cfpmYjapjI0E4theH4iuMD+pLhbf6JI0jIMfYcK3yZ" crossorigin="anonymous">
<link rel="icon" href="./resources/image/icon-32.png" />
<title>HAMO</title>
</head>
<style>
	#comunity {
		background: #FDF5DC;
		color: black;
	}
	table{
		margin-top: 20px;
		width:800px;
	}
	table,th,td{
		text-align: center;
		border-collapse: collapse;
		border-width:1px 0px;
		border-style:solid;
		border-color:#ffbf00;
		padding: 8px 10px;
		font-size: 13px;
	}
	th{
		background-color: #FDF5DC;
	}
	.adminList{
		background-color: #F2F2F2;
	}
	.adminList .detail{
		font-weight: bold;
		color: red;
	}
	#writeBtnArea {
		text-align: right;
	}
	#writeBtn{
		margin-top: 10px;
		border:none;
		border-radius: 5px;
		background-color: #FFBF00;
		color:white;
		padding:5px 10px;
		cursor: pointer;
		font-weight: bold;
	}
	td a{
		text-decoration: none;
		color: black;
	}
	td a:hover{
		text-decoration: underline;
	}
	#menu #friendBbs{
		color: black;
		font-weight: bold;
	}
	
	#space {
		height: 200px;
	}
</style>
<body>
	<%@ include file="./main-header.jsp" %>
	<div id="container">
		<%@ include file="./main-community_menu.jsp" %>
		<div id="right">
			<div id="title">| 동호회 친목 |</div>
				<table id="append">
					<thead>
						<tr>
							<th>글번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>조회수</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
				<div id="writeBtnArea">
					<input id="writeBtn" type="button" value="글쓰기">
				</div>
				<div id="pagingArea"></div>
				<div id="space"></div>
		</div>
	</div>
</body>
<script src="./resources/paging/paging.js" type="text/javascript"></script>
<link href="./resources/paging/paging.css" type="text/css" rel="stylesheet">
<link href="https://use.fontawesome.com/releases/v5.1.1/css/all.css" rel="stylesheet" integrity="sha384-O8whS3fhG2OnA5Kas0Y9l3cfpmYjapjI0E4theH4iuMD+pLhbf6JI0jIMfYcK3yZ" crossorigin="anonymous">
<script>
/* 리스트 조회 */
$(document).ready(function(){
	
	$.ajax({
		url:"./friendShipBbsList",
		type:"GET",
		dataType:"JSON",
		success:function(data){
			//console.log(data);
			//console.log(data.friendShipBbsList.length);
			//console.log(data.friendShipAdmin.length);
			// 공지사항 출력
			noticeList(data);
			// 글 출력
			$.pagingHash(data.friendShipBbsList, 10, 5, friendShipBbsList);
		},error:function(error){console.log(error);}
		
	});
});
	// 공지사항 출력
	function noticeList(data) {
		//초기화
		var adminList ="";
		for(var i=0; i< data.friendShipAdmin.length; i++){
			var date = new Date(data.friendShipAdmin[i].mainBbs_date);
			var reply_date=date.toJSON().substring(0,10);
			adminList+="<tr class='adminList'>"
			adminList+="<td>"+data.friendShipAdmin[i].mainBbs_idx+"</td>"
			adminList+="<td><a class='detail' href=friendShipBbsdetail?idx="+data.friendShipAdmin[i].mainBbs_id+"&updateAfter=1>"+data.friendShipAdmin[i].mainBbs_subject+"</a></td>"
			adminList+="<td><a href=friendShipBbsdetail?idx="+data.friendShipAdmin[i].mainBbs_id+"&updateAfter=1>"+data.friendShipAdmin[i].member_id+"</a></td>"
			adminList+="<td>"+reply_date+"</td>"
			adminList+="<td>"+data.friendShipAdmin[i].mainBbs_hit+"</td>"
			adminList+="</tr>"
		}
		$("thead").append(adminList);
	};
	
	// 글 출력
	function friendShipBbsList(data){
		//console.log("friendShipBbsList 함수 호출");
		
		var memberList ="";
 		for(var i=0; i<data.length; i++){
			var date = new Date(data[i].mainBbs_date);
			var reply_date=date.toJSON().substring(0,10);
			
			memberList+="<tr>"
			memberList+="<td>"+data[i].mainBbs_idx+"</td>"
			memberList+="<td><a href=friendShipBbsdetail?idx="+data[i].mainBbs_id+"&updateAfter=1>"+data[i].mainBbs_subject+"</a></td>"
			memberList+="<td><a href=friendShipBbsdetail?idx="+data[i].mainBbs_id+"&updateAfter=1>"+data[i].member_id+"</a></td>"
			memberList+="<td>"+reply_date+"</td>"
			memberList+="<td>"+data[i].mainBbs_hit+"</td>"
			memberList+="</tr>"
		} 
 		$("tbody").html(memberList);
	}

	$("#writeBtn").click(function(){
		if("${sessionScope.userId}" == "" ){
			alert("로그인 후에 서비스 이용 가능합니다.");
		}else{
			location.href="./friendShipBbsWriteForm";
		}
	
	});
</script>
</html>