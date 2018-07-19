<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

#member {
	font-weight: 800;
}

input[type='button'] {
	border: none;
	background-color: #FFBF00;
	color: white;
	margin: 4px;
	padding: 12px;
	cursor: pointer;
}

#content {
	width: 600px;
	background-color: transparent;
	resize: none;
	border-color: #FFBF00;
	border-width: 1px;
	border-style: solid;
}

#reply_div1 {
	width: 600px;
	background-color: #FDCD8C;
	margin-top: -12px;
	border-bottom: 1px solid #646464;
	position: relative;
}

.reply_del {
	position: absolute;
	right: 0px;
}

#reply_div2 {
	width: 600px;
	height: 47px;
	margin-top: 5px;
}

#reply_input {
	width: 500px;
	height: 47px;
	border: 1px solid #FFBF00;
}

h4 {
	margin-top: 7px;
}

#menu #freeBbs {
	font-weight: 900;
	color: black;
}

#btn {
	margin-left: 430px;
	margin-top: 25px;
}

#reply_rigist {
	border: 1px solid #FFBF00;
	color: black;
	background-color: white;
}

span {
	padding: 5px;
}

a {
	cursor: pointer;
}
</style>
<body>
	<%@ include file="./main-header.jsp"%>
	<div id="container">
		<%@ include file="./main-community_menu.jsp"%>
		<div id="right">
			<div id="title">| 자유게시판 |</div>
			<h2>${detail.mainBbs_subject }</h2>
			<div>
				<span id="member">${detail.member_id }</span> | 조회수 :
				${detail.mainBbs_hit } | ${detail.mainBbs_date }
			</div>
			<div id="content">${detail.mainBbs_content }</div>
			<h4 id="reply_count">댓글 ${detail.mainBbs_replyCount}</h4>
			<div id="reply_div1"></div>
			<div id="reply_div2">
				<input id="reply_input" type="text" value=""> <input
					id="reply_rigist" type="button" value="등록"
					style="width: 75px; height: 47px;">
			</div>
			<div id="btn">
				<input id="freeBbsDelete" type="hidden" value="삭제"> 
				<input id="freeBbsUpdateForm" type="hidden" value="수정"> 
				<input id="freeBbsList" type="button" value="목록">
			</div>
		</div>
	</div>
</body>
<script>

	var reply_append = "";
	$(document).ready(function(){
		//로그인 회원 id 와 글작성 회원 id 를 비교 해서 버튼 활성화 여부 
		if("${sessionScope.userId}" == "${detail.member_id }"){
			$("#freeBbsDelete").attr("type","button");
			$("#freeBbsUpdateForm").attr("type","button");
			
		}
		//상세보기 페이지가 리드되자마자 DB에 접속해 해당 게시글에 달린 댓글 리스트 조회해오기
		//어떻게? 해당 게시글의 아이디를 기준으로 
		$.ajax({
			url:"./freeBbsReplyList",
			type:"GET",
			data:{
			"mainBbs_id":"${detail.mainBbs_id}",
			},
			dataType:"JSON",
			success:function(data){
				console.log(data);
				//댓글 리스트 조회해오는 함수 호출
				freeBbsReplyList(data);
			},
			error:function(error){
			}
		});
	});
	//동적HTML 태그로 리스트 형태로 출력해주는 함수
	function freeBbsReplyList(data){
		console.log("길이 : "+data.reply_list.length);
		for(var i=0; i<data.reply_list.length; i++){
			reply_append+="<div id='remove'>"
			reply_append+="<span>"+data.reply_list[i].member_id+"</span>"
			reply_append+="<span>"+data.reply_list[i].mainBbsReply_date+"</span>"
			reply_append+="<span><a id='"+data.reply_list[i].mainBbsReply_id+"' class='reply_del' href='#'>삭제</a></span><br/>"
			reply_append+="<span>"+data.reply_list[i].mainBbsReply_content+"</span>"
			reply_append+="</div>"
		}
		$("#reply_div1").append(reply_append);
		$(".reply_del").hide();	
 		for(var i =0;  i<data.reply_list.length; i++){
			console.log("${sessionScope.userId}" == data.reply_list[i].member_id);
			if("${sessionScope.userId}" == data.reply_list[i].member_id){
				console.log("ID : "+data.reply_list[i].member_id);
				$('#'+data.reply_list[i].mainBbsReply_id).show();	
			}
		} 
	}
	//댓글 등록 버튼 클릭 시 아작스 실행
	$("#reply_rigist").click(function(){
		console.log("댓글 등록 버튼 클릭!!");
		var reply = $("#reply_input").val()
		if("${sessionScope.userId}" != "" ){	
			if(confirm("댓글을 등록하시겠습니까?")){	
					if(reply!=""){
						$.ajax({
							url:"./freeBbsReply",
							type:"GET",
							data:{
							"mainBbs_id":"${detail.mainBbs_id }",
							"member_id":"<%= session.getAttribute("userId")%>",  // 세션에서 가져온 id
							"mainBbsReply_content":reply,
							},
							dataType:"JSON",
							
							success:function(data){
								var date = new Date(data.reply.mainBbsReply_date);
								var reply_date=date.toJSON().substring(0,10);
								//댓글 입력창 초기화
								$("#reply_input").val("");
								//댓글 개수 update
								$("#reply_count").html("댓글 "+data.reply.mainBbs_replyCount);
								var reply_add = "";
								reply_add+="<div>"
								reply_add+="<span>"+data.reply.member_id+"</span>"
								reply_add+="<span>"+data.reply.mainBbsReply_date+"</span>"
								reply_add+="<span><a id='"+data.reply.mainBbsReply_id+"' class='reply_del' href='#'>삭제</a></span><br/>"
								reply_add+="<span>"+data.reply.mainBbsReply_content+"</span>"
								reply_add+="</div>"
								$("#reply_div1").append(reply_add);
							},
							error:function(error){}
						});
					}else{
						alert("댓글을 입력해주세요");
					}
				}
			}else{ //session
				alert("로그인 후에 댓글 등록이 가능합니다.");
			}
	});
	//댓글 삭제 버튼 클릭 시 (동적 HTML 태그는 on 이벤트로  발생시켜야함!)
	$(document).on("click",".reply_del",function(){
		console.log("댓글 삭제!!");
		console.log($(this).attr("id"));
		var div = $(this).closest("div"); //a태그에서 가장 가까운 div찾기
		var reply_id = $(this).attr("id");
		if(confirm("댓글을 삭제하시겠습니까?")){
				$.ajax({
					url:"./freBbsReplyDel",
					type:"GET",
					data:{
					"mainBbs_id":"${detail.mainBbs_id }",
					"member_id":"<%= session.getAttribute("userId")%>",
					"reply_id":reply_id
					},
					dataType:"JSON",
					success:function(data){
						console.log(data);
						//하나의 댓글을 감싸고 있는 div 태그 제거
						div.remove();
						//댓글 개수 update
						$("#reply_count").html("댓글 "+data.reply);
					},
					error:function(error){
						console.log(error);
					}
				});
		}
	});
	
	//삭제 버튼 클릭 시 리스트로
	$("#freeBbsDelete").click(function(){
        if(confirm("삭제 하시겠습니까?")){
    		location.href="./freeBbsDelete?idx=${detail.mainBbs_id}";
        }
	});
	
	//수정 버튼 클릭 시 수정 폼 으로 
	$("#freeBbsUpdateForm").click(function(){
		location.href="./freeBbsUpdateForm?idx=${detail.mainBbs_id}";
	});
	//목록 버튼 클릭 시 리스트로 
	$("#freeBbsList").click(function(){
		location.href="./freeBbsList";
	});
	

</script>
</html>