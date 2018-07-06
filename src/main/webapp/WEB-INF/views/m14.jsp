<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--****자유게시판 글 상세보기 jsp  ****-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<style>
	#right {
		width: 800px;
		float: left;
		margin-left: 20px;
	}
	#member{
		font-weight: 800;
	}
	input[type='button']{
		border:none;
	 	background-color:#FFBF00 ;
	 	color: white;
		margin:4px;
		padding:10px;
		cursor: pointer;
	}
	#content{
		width:700px;
		height:300px;
		background-color: transparent;
		resize: none;
		border-color: #FFBF00;
		border-width: 1px;
		border-style: solid;
	}
	#file{
		width:500px;
		height:40px;
		border-color: #FFBF00;
		border-width: 1px;
		border-style: solid;
		margin-top:-12px;
	}
	h4{
		margin-top:7px;
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
		    <h2>${detail.mainBbs_subject }</h2>
		   	<div> <span id="member">${detail.member_id }</span> | 조회수 : ${detail.mainBbs_hit } | ${detail.mainBbs_date }</div>
		    <div id="content">
		    	${detail.mainBbs_content }
		    </div>
		    <h4>첨부파일</h4>
		    <div id="file">
		    	dd
		    </div>
		   <h4> 댓글 ${detail.mainBbs_replyCount }</h4>
		   	<input id="freeBbsDelete" type="button" value="삭제">
			<input id="freeBbsUpdateForm" type="button" value="수정">
			<input id="freeBbsList" type="button" value="목록">
		</div>
	
	</div>
</body>
<script>
	// console.log($("#file").html());
	
	//삭제 버튼 클릭 시 삭제 후 리스트로 ( 게시글 삭제, 파일 삭제,댓글 삭제)
	
	//삭제 버튼 클릭 시 수정 폼 으로 
	$("#freeBbsDelete").click(function(){
        if(confirm("삭제 하시겠습니까?")){
    		location.href="./freeBbsDelete?idx=${detail.mainBbs_id}"
     }

	});
	
	//수정 버튼 클릭 시 수정 폼 으로 
	$("#freeBbsUpdateForm").click(function(){
		location.href="./freeBbsUpdateForm?idx=${detail.mainBbs_id}"
	});
	//목록 버튼 클릭 시 리스트로 
	$("#freeBbsList").click(function(){
		location.href="./freeBbsList";
	});
	
</script>
</html>