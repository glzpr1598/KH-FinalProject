<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="//code.jquery.com/jquery-3.1.0.min.js"></script>
<title>HAMO</title>
<style>
	#menu4 {
		font-weight: bold;
		color: black;
	}
	#title{
		font-weight: bold;
		font-size: large;
	}
	#s{
		margin-top: 20px;
		padding: 10px;
		font-size: 14px;
		font-weight: bold;
		border-top: thin solid #ffbf00;
		border-bottom: thin dashed #ffbf00;
	}
	#c{
		padding: 10px; 
		font-size: 12px;
	}
	#content{
		padding: 10px 10px 50px 10px;
		font-size: 13px;
	}
	#text img{
		max-width: 780px;
	}
	
	#reply_count {
		padding: 10px;
		font-size: 13px;
	}
	
	#reply{
		background-color: #FDF5DC;
		padding: 5px 15px;
		font-size: 12px;
		border-bottom: thin solid #ffbf00;
	}
	
	#replyArea{
		background-color: #FDF5DC;
		width: 100%;
	}
	.reply {
		padding: 10px 0px;
		border-bottom: thin dashed #ffbf00;
	}
	.reply .date {
		font-size: 11px;
		color: #848484;
	}
	.reply .replyDel {
		float: right;
		color: black;
		text-decoration: none;
	}
	.reply .replyDel:hover {
		text-decoration: underline;
		cursor: pointer;
	}
	.reply .replyContent {
		margin-top: 5px;
	}
	
	#replyfrm {
		padding: 15px 0px;
	}
	#replyfrm #replyContent {
		width: 690px;
	    height: 50px;
	    resize: none;
	    border: thin solid #BDBDBD;
	}
	#replyfrm #save {
		float: right;
		width: 70px;
	    height: 50px;
	    background: white;
	    border: thin solid #BDBDBD;
	    cursor: pointer;
	}
	
	#btn {
		margin: 10px 0px;
		float: right;
	}
	#btn button {
		padding: 5px 10px;
		background: #ffbf00;
	    border: none;
		border-radius: 5px;
		color: white;
		font-weight: bold;
		cursor: pointer;
	}
	#btn #del, #btn #update {
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
			<div id="title">| 사진첩 |</div>
			<div id="s">${info.clubBbs_subject}</div>
			<div id="c"><b>${info.clubJoin_nickname}</b> | 조회수 ${info.clubBbs_hit} | ${info.clubBbs_date}</div>
			<div id="content">
				<div id="text">${info.clubBbs_content}</div>
			</div>
			<div id="reply_count">댓글 <span id="replyCount"></span></div>
			<div id="reply">
				<div id="replyArea">
				</div>
				<div id="replyfrm">
					<textarea rows="3" cols="88" id="replyContent" name="replyContent"></textarea><input id="save" type="button" value="등록"/>
				</div>
			</div>
			<div id="btn">
				<button id="del">삭제</button>
				<button id="update">수정</button>
				<button id="back">목록</button>
			</div>
			<div id="space"></div>
		</div>
	</div>
</body>
<script>
	var options = {year: "numeric", month: "numeric",
        day: "numeric", hour: "2-digit", minute: "numeric", second: "numeric"}; //날짜 옵션설정

	var clubBbs_id = "${info.clubBbs_id}";
	var nickName = "${sessionScope.userId}";
	
	// 글쓴이만 수정, 삭제 보이도록
	$(document).ready(function() {
		if(nickName == "${info.member_id}") {
			$("#del").css("display", "inline");
			$("#update").css("display", "inline");
		}
	});
	
	$("#del").click(function(){
		if(confirm("글을 삭제 하시겠습니까?")){
			location.href="./clubPhotoBbsDelete?club_id="+${info.club_id}+"&clubBbs_id="+clubBbs_id;
		}
	});
	
	$("#update").click(function(){
		location.href="./clubPhotoBbsUpdateForm?club_id="+${info.club_id}+"&clubBbs_id="+clubBbs_id;
	});
	
	$("#back").click(function(){
		location.href="./clubPhotoBbsList?club_id="+${info.club_id}+"&sort=photo";
	});
	
	$(document).ready(function(){
		$.ajax({
			type : "get",
			url: "./clubReplyList",
			dataType:"json",
			data:{
				"clubBbs_id":clubBbs_id,
				"club_id":"<%=request.getParameter("club_id")%>"
			},
			success:function(data){
				if(data){
					listPrint(data.list);
					replyCount(data.replyCount);
				}
			},
			error:function(e){
				console.log(e);
			}
		});
	});
	
	$("#save").click(function(){
		if($("#replyContent").val() == ""){
			alert("댓글을 작성하세요.");
		}else{
			if($("#replyContent").val().length > 100){
				alert("최대 100자까지 입력 가능합니다.");
			}else{
				$.ajax({
					type : "get",
					url: "./clubReply",
					dataType:"json",
					data:{
						"replyContent":$("#replyContent").val(),
						"clubBbs_id":clubBbs_id,
						"club_id":"<%=request.getParameter("club_id")%>"
					},
					success:function(data){
						$("#replyContent").val("");
						listPrint(data.list);
						replyCount(data.replyCount);
					},
					error:function(e){
						console.log(e);
					}
				});		
			}
		}
	});
	
 	$(document).on("click",".replyDel",function(){
 		var index = $(this).attr('id');
 		if(confirm("댓글을 삭제하시겠습니까?")){
			$.ajax({
				type : "get",
				url: "./clubReplyDelete",
				dataType:"json",
				data:{
					"clubBbs_id":clubBbs_id,
					"clubBbsReply_id":$("#reply_id"+index).val(),
					"club_id":"<%=request.getParameter("club_id")%>"
				},
				success:function(data){
					listPrint(data.list);
					replyCount(data.replyCount);
				},
				error:function(e){
					console.log(e);
				}
			});
 		}
 	});
 	
	function listPrint(list){
		var content = "";
		$("#replyArea").empty();
		list.forEach(function(item,index){ 
			var date = new Date(item.clubBbsReply_date); 
			content += "<div class='reply'>";
			content += "<span><b>"+item.clubJoin_nickname+"</b></span> ";
			content += "<span class='date'>"+date.toLocaleDateString("ko-KR",options)+"</span>";
			if(nickName != item.member_id){
				content += "<a class='replyDel' id='"+index+"' value='"+item.member_id+"' style='display:none'>삭제</a>";
			}else{
				content += "<a class='replyDel' id='"+index+"' value='"+item.member_id+"'>삭제</a>";
			}
			content += "<input id='reply_id"+index+"' type='hidden' value='"+item.clubBbsReply_id+"'/>";
			content += "<div class='replyContent'>"+item.clubBbsReply_content+"</div>";
			content += "</div>"
		});
		$("#replyArea").append(content);
	}
	
	function replyCount(replyCount){
		$("#replyCount").html(replyCount.clubBbs_replyCount);
	}
	
</script>
</html>