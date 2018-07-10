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
	position: absolute;
	left: 565px;
	top: 345px;
	font-weight: 600;
	font-size: large;
	}
	#subject{
		position: absolute;
		left: 565px;
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
		position: absolute;
		left: 565px;
		top: 460px;
	}
	#text{
		/* border: none; */
		resize: none;
		height: 300px;
	}
	#file span{
		font-size:medium;
		font-weight: 600;
		position: absolute;
		left: 565px;
		top: 780px;
	}
	#download{
		position: absolute;
		left: 565px;
		top: 820px;
		resize: none;
	}
	#reply{
		position: absolute;
		left: 565px;
		top:1000px;
		width: 1000px;
		font-size:small;
		font-weight: 600;
	}
	#replyTable{
		background-color: #FDF5DC;
		width: 730px;
	}
	#replyContent{
		border: 3px solid #ffbf00;
		resize: none;
	}
	#save{
		border: 3px solid #ffbf00;
		background-color: white;
		width: 70px;
		height: 52px;
		text-align: center;
		position: absolute;
		top: 1px;
		left: 660px;
		font-weight: 600;
	}
	#del{
		border: none;
		background-color: #ffbf00;
		width: 70px;
		height: 30px;
		position: relative;
		left: 1225px;
		top: 520px;
		font-weight: 600;
		color: white;
		text-align: center;
	}
	#update{
		border: none;
		background-color: #ffbf00;
		width: 70px;
		height: 30px;
		position: relative;
		left: 1068px;
		top: 520px;
		font-weight: 600;
		color: white;
		text-align: center;
		display: inline;
	}
	#back{
		border: none;
		background-color: #ffbf00;
		width: 70px;
		height: 30px;
		position: relative;
		left: 910px;
		top: 520px;
		font-weight: 600;
		color: white;
		text-align: center;
		display: inline;
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
	#replyfrm{
		position: relative;
		left: 565px;
		top: 530px;
	}
	.last{
		border-bottom: 1px solid #d2d2d2;
	}
</style>	
</head>
<body>
	<jsp:include page="club-header.jsp"/>
	<div id="container">
		<jsp:include page="club-menu.jsp"/>
		<div id="right">
			<div id="title">| 공지사항 |</div>
			<div id="subject">
				<span id="s">${info.clubBbs_subject}</span><br>
				<span id="c">${info.club_masterNickname}</span> | 조회수 ${info.clubBbs_hit} | ${info.clubBbs_date}
			</div>
		<div id="content">
			<div id="text">${info.clubBbs_content}</div>
		</div>
		<div id="file">
			<span>첨부파일</span>
			<textarea id="download" rows="5" cols="100" readonly="readonly"></textarea>
		</div>
		<form id="replyfrm">
			<textarea rows="3" cols="88" id="replyContent" name="replyContent"></textarea>
			<input id="save" type="button" value="등록"/>
		</form>
		<div id="reply">
			댓글 <span id="replyCount"></span>
			<table id="replyTable">
			</table>
		</div>
		<div id="btn">
			<button id="del">삭제</button>
			<button id="update">수정</button>
			<button id="back">목록</button>
		</div>
	</div>
	</div>
</body>
<script>
	var clubBbs_id = "${info.clubBbs_id}";
	
	$("#del").click(function(){
		var nickName = "${sessionScope.nickName}";
		if(nickName != "${info.club_masterNickname}"){
			alert("삭제 권한이 없습니다.");
			return;
		}else{
			console.log(clubBbs_id);
			location.href="./clubNoticeDelete?club_id="+${info.club_id}+"&clubBbs_id="+clubBbs_id;
		}
	});
	$("#update").click(function(){
		var nickName = "${sessionScope.nickName}";
		if(nickName != "${info.club_masterNickname}"){
			alert("수정 권한이 없습니다.");
			return;
		}else{
			location.href="./clubNoticeUpdateForm?club_id="+${info.club_id}+"&clubBbs_id="+clubBbs_id;
		}
	});
	$("#back").click(function(){
		location.href="./clubNoticeList?club_id="+${info.club_id}+"&sort=notice";
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
	});
	
 	$(document).on("click",".replyDel",function(){
 		var nick = "${sessionScope.nickName}";
 		if(nick != "${info.club_masterNickname}"){
 			alert("댓글을 삭제할 수 없습니다.");
 		}else{
			$.ajax({
				type : "get",
				url: "./clubReplyDelete",
				dataType:"json",
				data:{
					"clubBbs_id":clubBbs_id,
					"clubBbsReply_id":$("#reply_id").val()
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
		list.forEach(function(item){ 
			//console.log(item);
			content += "<tr>";
			content += "<td id='nick'>"+item.clubJoin_nickname+"</td>";
			var date = new Date(item.clubBbsReply_date); 
			content += "<td>"+date.toLocaleDateString("ko-KR")+"</td>";
			content += "<td><div class='replyDel'>삭제</div></td>";
			content += "</tr>";
			content += "<tr>";
			content += "<td class='last' colspan=3><input id='reply_id' type='hidden' value='"+item.clubBbsReply_id+"'/>"+item.clubBbsReply_content+"</td>";
			content += "</tr>";
		});
		$("#replyTable").append(content);
	}
	
	function replyCount(replyCount){
		$("#replyCount").html(replyCount.clubBbs_replyCount);
	}
	
</script>
</html>