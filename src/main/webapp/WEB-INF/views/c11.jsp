<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="//code.jquery.com/jquery-3.1.0.min.js"></script>
<title>Insert title here</title>
<style>
	#title{
		margin-left: 0.5%;
		font-weight: 600;
		font-size: large;
	}
	#subject{
		margin-left: 0.5%;
			margin-top: 1%;
	}
	#s{
		font-size: x-large;
		font-weight: 600;
	}
	#c{
		font-size:medium;
		font-weight: 600;
	}
	#content{
		margin-left: 0.5%;
		margin-top: 2%;
	}
	#text{
		resize: none;
		height: 70%;
	}
	#reply{
		margin-left:0.5%;
		margin-top:2%;
		font-size:small;
		font-weight: 600;
		width: 800px;
	}
	#replyTable{
		background-color: #FDF5DC;
		width: 770px;
	}
	#replyContent{
		border: 3px solid #ffbf00;
		resize: none;
		margin-left: 0.5%;
		margin-top: 2%;
		width: 690px;
		height: 52px;
		margin-top: 0px;
	}
	#save{
		border: 3px solid #ffbf00;
		background-color: white;
		width: 70px;
		height: 52px;
		text-align: center;
		font-weight: 600;
		margin-left: 1%;
	}
	#del{
		border: none;
		background-color: #ffbf00;
		width: 70px;
		height: 30px;
		font-weight: 600;
		color: white;
		text-align: center;
	}
	#update{
		border: none;
		background-color: #ffbf00;
		width: 70px;
		height: 30px;
		font-weight: 600;
		color: white;
		text-align: center;
	}
	#back{
		border: none;	
		background-color: #ffbf00;
		width: 70px;
		height: 30px;
		font-weight: 600;
		color: white;
		text-align: center;
	}
	.replyDel{
		color: #5a5a5a;
		font-weight: 600;
		font-size: small;
		border: none;
		background-color: #FDF5DC;
		cursor: pointer;
	}
	#nick{
		font-weight: 600;
	}
	.last{
		border-bottom: 1px solid #d2d2d2;
	}
	#btn{
		margin-left: 69%;
		margin-top: 2%;
		width: 800px;
	}
	#replyfrm{
		width: 800px;
	}
	.date{
		font-weight: 600;
		font-size: small;
	}
</style>	
</head>
<body>
	<jsp:include page="club-header.jsp"/>
	<div id="container">
		<jsp:include page="club-menu.jsp"/>
		<div id="right">
			<div id="title">| 자유게시판 |</div>
			<div id="subject">
				<span id="s">${info.clubBbs_subject}</span><br>
				<span id="c">${info.clubJoin_nickname}</span> | 조회수 ${info.clubBbs_hit} | ${info.clubBbs_date}
			</div>
			<div id="content">
				<div id="text">${info.clubBbs_content}</div>
			</div>
			<div id="replyfrm">
				<input type="text" maxlength="150" id="replyContent" name="replyContent"/><input id="save" type="button" value="등록"/>
			</div>
			<div id="btn">
				<button id="back">목록</button>
				<button id="update">수정</button>
				<button id="del">삭제</button>
			</div>
			<div id="reply">
				댓글 <span id="replyCount"></span>
				<table id="replyTable">
				</table>
			</div>
		</div>
	</div>
</body>
<script>
	var options = {year: "numeric", month: "numeric",
        day: "numeric", hour: "2-digit", minute: "numeric", second: "numeric"}; //날짜 옵션설정

	var clubBbs_id = "${info.clubBbs_id}";
	var nickName = "${sessionScope.userId}"
	
	$("#del").click(function(){
		if(nickName != "${info.member_id}"){
			alert("삭제 권한이 없습니다.");
			return;
		}else{
			console.log(clubBbs_id);
			location.href="./clubFreeBbsDelete?club_id="+${info.club_id}+"&clubBbs_id="+clubBbs_id;
		}
	});
	$("#update").click(function(){
		if(nickName != "${info.member_id}"){
			alert("수정 권한이 없습니다.");
			return;
		}else{
			location.href="./clubFreeUpdateForm?club_id="+${info.club_id}+"&clubBbs_id="+clubBbs_id;
		}
	});
	
	$("#back").click(function(){
		location.href="./clubFreeBbsList?club_id="+${info.club_id}+"&sort=free";
	});
	
	$(document).ready(function(){
		$.ajax({
			type : "get",
			url: "./clubReplyList",
			dataType:"json",
			data:{
				"clubBbs_id":clubBbs_id
			},
			success:function(data){
				if(data){
					//console.log(data);
					//console.log(data.replyCount);
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
			$.ajax({
				type : "get",
				url: "./clubReply",
				dataType:"json",
				data:{
					"replyContent":$("#replyContent").val(),
					"clubBbs_id":clubBbs_id
				},
				success:function(data){
					//console.log(data);
					$("#replyContent").val("");
					listPrint(data.list);
					replyCount(data.replyCount);
				},
				error:function(e){
					console.log(e);
				}
			});	
		}
	});
	
	$(document).on("click",".replyDel",function(){
 		var index = $(this).attr('id');
 		if(nickName != $(this).val()){
 			console.log($(this).val());
 			alert("댓글을 삭제할 수 없습니다.");
 		}else{
			$.ajax({
				type : "get",
				url: "./clubReplyDelete",
				dataType:"json",
				data:{
					"clubBbs_id":clubBbs_id,
					"clubBbsReply_id":$("#reply_id"+index).val()
				},
				success:function(data){
					console.log(data);
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
		//console.log(list);
		$("#replyTable").empty();
		list.forEach(function(item,index){ 
			//console.log(item);
			content += "<tr>";
			content += "<td id='nick' width='540px'>"+item.clubJoin_nickname+"</td>";
			var date = new Date(item.clubBbsReply_date); 
			content += "<td class='date'>"+date.toLocaleDateString("ko-KR",options)+"&nbsp;&nbsp;&nbsp;|</td>";
			content += "<td><button class='replyDel' id='"+index+"' value='"+item.member_id+"'>삭제</button></td>";
			content += "</tr>";
			content += "<tr><td height='10px;'></td></tr>";
			content += "<tr>";
			content += "<td class='last' colspan=3><input id='reply_id"+index+"' type='hidden' value='"+item.clubBbsReply_id+"'/>"+item.clubBbsReply_content+"</td>";
			content += "</tr>";
		});
		$("#replyTable").append(content);
	}
	
	function replyCount(replyCount){
		$("#replyCount").html(replyCount.clubBbs_replyCount);
	}
	
</script>
</html>