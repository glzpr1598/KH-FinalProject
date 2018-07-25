<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--****자유게시판 글 상세보기 jsp  ****-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="icon" href="./resources/image/icon-32.png" />
<title>HAMO</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

</head>
<style>
#menu #freeBbs {
	color: black;
	font-weight: bold;
}

#subject {
	margin-top: 20px;
	padding: 10px;
	font-size: 14px;
	font-weight: bold;
	border-top: thin solid #ffbf00;
	border-bottom: thin dashed #ffbf00;
}

#member {
	padding: 10px; 
	font-size: 12px;
}

#content {
	padding: 10px 10px 50px 10px;
	font-size: 13px;
}

#content img {
	max-width: 780px;
	cursor: pointer;
}

#reply_count {
	padding: 10px;
	font-size: 13px;
}

#reply_div {
	background-color: #FDF5DC;
	padding: 5px 15px;
	font-size: 12px;
	border-bottom: thin solid #ffbf00;
}

#reply_div1 #remove {
	padding: 10px 0px;
	border-bottom: thin dashed #ffbf00;
}
#reply_div1 .date {
	font-size: 11px;
	color: #848484;
}
#reply_div1 .reply_del {
	float: right;
	color: black;
	text-decoration: none;
}
#reply_div1 .reply_del:hover {
	text-decoration: underline;
	cursor: pointer;
}
#reply_div1 .replyContent {
	margin-top: 5px;
}

#reply_div2 {
	padding: 15px 0px;
}
#reply_div2 #reply_input {
    width: 690px;
    height: 50px;
    resize: none;
    border: thin solid #BDBDBD;
}
#reply_div2 #reply_regist {
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
#btn input {
	padding: 5px 10px;
	background: #ffbf00;
    border: none;
	border-radius: 5px;
	color: white;
	font-weight: bold;
	cursor: pointer;
}

#space {
	height: 200px;
}
</style>
<body>
	<%@ include file="./main-header.jsp"%>
	<div id="container">
		<%@ include file="./main-community_menu.jsp"%>
		<div id="right">
			<div id="title">| 자유게시판 |</div>
			<div id="subject">${detail.mainBbs_subject }</div>
			<div id="member">
				<b>${detail.member_id }</b>
				| 조회 ${detail.mainBbs_hit } 
				| <span id="date"></span>
			</div>
			<div id="content">${detail.mainBbs_content }</div>
			<div id="reply_count">댓글 ${detail.mainBbs_replyCount}</div>
			<div id="reply_div">
				<div id="reply_div1"></div>
				<div id="reply_div2">
					<textarea id="reply_input"></textarea>
					<input id="reply_regist" type="button" value="등록">
				</div>
			</div>
			<div id="btn">
				<input id="freeBbsDelete" type="hidden" value="삭제"> 
				<input id="freeBbsUpdateForm" type="hidden" value="수정"> 
				<input id="freeBbsListPage" type="button" value="목록">
			</div>
			<div id="space"></div>
		</div>
	</div>
</body>
<script>

	var reply_append = "";
	$(document).ready(function(){
		
		var date = new Date("${detail.mainBbs_date }");
		var reply_date=date.toJSON().substring(0,10);
		$("#date").html(reply_date);
		
		//로그인 회원 id 와 글작성 회원 id 를 비교 해서 버튼 활성화 여부 
		if("${sessionScope.userId}" == "${detail.member_id }"){
			$("#freeBbsDelete").attr("type","button");
			$("#freeBbsUpdateForm").attr("type","button");
			
		}
		//상세보기 페이지가 리드되자마자 DB에 접속해 해당 게시글에 달린 댓글 리스트 조회해오기
		//어떻게? 해당 게시글의 아이디를 기준으로 
		$.ajax({
			url:"./hamoBbsReplyList",
			type:"GET",
			data:{
			"mainBbs_id":"${detail.mainBbs_id}",
			},
			dataType:"JSON",
			success:function(data){
				//console.log(data);
				//댓글 리스트 조회해오는 함수 호출
				freeBbsReplyList(data);
			},
			error:function(error){
			}
		});
	});
	//동적HTML 태그로 리스트 형태로 출력해주는 함수
	function freeBbsReplyList(data){
		//console.log("길이 : "+data.reply_list.length);
		for(var i=0; i<data.reply_list.length; i++){
			reply_append+="<div id='remove'>"
			reply_append+="<span><b>"+data.reply_list[i].member_id+"</b></span> "
			reply_append+="<span class='date'>"+data.reply_list[i].mainBbsReply_date+"</span>"
			reply_append+="<a id='"+data.reply_list[i].mainBbsReply_id+"' class='reply_del' href='#'>삭제</a>"
			reply_append+="<div class='replyContent'>"+data.reply_list[i].mainBbsReply_content+"</div>"
			reply_append+="</div>"
		}
		$("#reply_div1").append(reply_append);
		$(".reply_del").hide();	
 		for(var i =0;  i<data.reply_list.length; i++){
			//console.log("${sessionScope.userId}" == data.reply_list[i].member_id);
			if("${sessionScope.userId}" == data.reply_list[i].member_id){
				//console.log("ID : "+data.reply_list[i].member_id);
				$('#'+data.reply_list[i].mainBbsReply_id).show();	
			}
		} 
	}
	//댓글 등록 버튼 클릭 시 아작스 실행
	$("#reply_regist").click(function(){
		
		var reply = $("#reply_input").val();
		
		if("${sessionScope.userId}" != ""){	
			if(reply!=""){
				if(reply.length <= 100){
					$.ajax({
						url:"./hamoBbsReply",
						type:"GET",
						data:{
						"mainBbs_id":"${detail.mainBbs_id }",
						"member_id":"<%= session.getAttribute("userId")%>",  // 세션에서 가져온 id
						"mainBbsReply_content":reply,
						},
						dataType:"JSON",					
						success:function(data){

							//댓글 입력창 초기화
							$("#reply_input").val("");
							//댓글 개수 update
							$("#reply_count").html("댓글 "+data.reply.mainBbs_replyCount);
							var reply_add = "";
							reply_add+="<div id='remove'>"
							reply_add+="<span><b>"+data.reply.member_id+"</b></span> "
							reply_add+="<span class='date'>"+data.reply.mainBbsReply_date+"</span>"
							reply_add+="<a id='"+data.reply.mainBbsReply_id+"' class='reply_del' href='#'>삭제</a><br/>"
							reply_add+="<div class='replyContent'>"+data.reply.mainBbsReply_content+"</div>"
							reply_add+="</div>"
							$("#reply_div1").append(reply_add);
						},
						error:function(error){}
					});
				}else{
					alert("최대 100자까지만 입력 가능합니다");
				}
			}else{
				alert("댓글을 입력해주세요.");
			}
		}else{ //session
			alert("로그인이 필요합니다.");
		}
	});

	//댓글 삭제 버튼 클릭 시 (동적 HTML 태그는 on 이벤트로  발생시켜야함!)
	$(document).on("click",".reply_del",function(){
		//console.log("댓글 삭제!!");
		//console.log($(this).attr("id"));
		var div = $(this).closest("div"); //a태그에서 가장 가까운 div찾기
		var reply_id = $(this).attr("id");
		if(confirm("댓글을 삭제하시겠습니까?")){
			$.ajax({
				url:"./hamoBbsReplyDel",
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
        if(confirm("글을 삭제 하시겠습니까?")){
    		location.href="./freeBbsDelete?idx=${detail.mainBbs_id}";
        }
	});
	
	//수정 버튼 클릭 시 수정 폼 으로 
	$("#freeBbsUpdateForm").click(function(){
		location.href="./freeBbsUpdateForm?idx=${detail.mainBbs_id}";
	});
	
	//목록 버튼 클릭 시 리스트로 
	$("#freeBbsListPage").click(function(){
		location.href="./freeBbsListPage";
	});
	
	// 이미지 클릭
	$("#content img").click(function() {
		var url = $(this).attr("src");
		window.open(url, "_blank");
	});

</script>
</html>