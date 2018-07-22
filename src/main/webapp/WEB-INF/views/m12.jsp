<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--****자유게시판 글 리스트 jsp  ****-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="./resources/paging/paging.js" type="text/javascript"></script>
<link href="./resources/paging/paging.css" type="text/css" rel="stylesheet">
<link href="https://use.fontawesome.com/releases/v5.1.1/css/all.css" rel="stylesheet" integrity="sha384-O8whS3fhG2OnA5Kas0Y9l3cfpmYjapjI0E4theH4iuMD+pLhbf6JI0jIMfYcK3yZ" crossorigin="anonymous">
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
	wrtieBtnArea {
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
	#menu #freeBbs{
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
			<div id="title">| 자유게시판 |</div>
				<table>
					<tr id="append">
						<th>글번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>
				</table>
				<div id="wrtieBtnArea">
					<input id="writeBtn" type="button" value="글쓰기">
				</div>
				<div id="space"></div>
		</div>
	</div>
</body>
<script>
/* 리스트 조회 */
$(document).ready(function(){
	
	$.ajax({
		url:"freeBbsList",
		type:"GET",
		dataType:"JSON",
		success:function(data){
			console.log(data);
			console.log(data.freeBbsList.length);
			console.log(data.freeBbsList[0].mainBbs_id);
			console.log(data.freeBbsList[0].member_id);
			//글쓰기 리스트 생성하는 함수 호출
			freeBbsList(data);
		},error:function(error){console.log(error);}
		
	});
});
	function freeBbsList(data){
		console.log("freeBbsList 함수 호출");
		//초기화
		$("#append").after("");
		
		var content ="";
 		for(var i=0; i<data.freeBbsList.length; i++){
			content+="<tr>";
			content+="<td>"+data.freeBbsList[i].mainBbs_id+"</td>"
			content+="<td><a href=freeBbsdetail?idx="+data.freeBbsList[i].mainBbs_id+"&updateAfter=1>"+data.freeBbsList[i].mainBbs_subject+"</a></td>"
			content+="<td><a href=freeBbsdetail?idx="+data.freeBbsList[i].mainBbs_id+"&updateAfter=1>"+data.freeBbsList[i].member_id+"</a></td>"
			content+="<td>"+data.freeBbsList[i].mainBbs_date+"</td>"
			content+="<td>"+data.freeBbsList[i].mainBbs_hit+"</td>"
			content+="</tr>";
		} 
		$("#append").after(content);
	}













	$("#writeBtn").click(function(){
		if("${sessionScope.userId}" == "" ){
			alert("로그인 후에 서비스 이용 가능합니다.");
		}else{
			location.href="freeBbsWriteForm";
		}
	
	});
</script>
</html>