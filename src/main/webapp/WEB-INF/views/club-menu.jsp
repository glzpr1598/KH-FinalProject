<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="//code.jquery.com/jquery-3.1.0.min.js"></script>
<style>
	#container {
		width: 1000px;
		margin: auto;
	}
	#left {
		width: 180px;
		float: left;
		font-size: 13px;
	}
	#right {
		float: left;
		margin-left: 20px;
	}

	/* 동호회 정보 */
	#left #info{
		border: medium solid #ffbf00;
		border-radius: 5px;
		padding: 5px 0px;
		margin-bottom: 5px;
		font-size: 12px;
	}
	#left #info div {
		padding: 5px 10px;
	}
	#left #info .infoText1 {
		display: inline-block;
		width: 45px;
		font-weight: bold;
	}
	
	/* 메뉴 */
	#left .menu{
		margin-bottom: 5px;
		padding: 5px 0px;
		border: medium solid #ffbf00;
		border-radius: 5px;
		background-color: #FDF5DC;
	}
	/* 메뉴의 div */
	#left .menu div {
		padding: 5px 10px;
	}
	/* 메뉴의 이미지 */
	#left .menu img {
		height: 13px;
	}
	/* 메뉴의 텍스트 */
	#left .menu a {
		color: #5a5a5a;
		text-decoration: none;
		margin-left: 5px;
	}
	/* 메뉴의 텍스트 hover */
	#left .menu a:hover {
		text-decoration: underline;
	}
	
	/* 버튼 */
	#left .btn{
		width: 100%;
		padding: 7px 0px;
		margin-bottom: 5px;
		background-color: #ffbf00;
		border: none;
		border-radius: 5px;
		color: white;
		font-weight: bold;
		font-size: 14px;
		cursor: pointer;
	}
	
</style>
</head>
<body>
	<div id="left">
		<div id="info">
			<div><span class="infoText1">회장</span><span id="master"></span></div>
			<div><span class="infoText1">회원수</span><span id="memberCount"></span></div>
			<div><span class="infoText1">설립일</span><span id="createDate"></span></div>
			<div><span class="infoText1">주제</span><span id="subject"></span></div>
			<div><span class="infoText1">지역</span><span id="location"></span></div>
		</div> 
		<input type="hidden" value="가입하기" id="btn1" class="btn" />
		<div id="menu" class="menu">
			<div>
				<img id="list" src="./resources/image/list.png" />
				<a id="menu1" href="./clubAllList?club_id=<%= request.getParameter("club_id") %>">전체글보기</a>
			</div>	
			
			<div>
				<img id="list2" src="./resources/image/list.png" />
				<a id="menu2" href="./clubNoticeList=<%= request.getParameter("club_id") %>&sort=notice">공지사항</a>
			</div>
			
			<div>
				<img id="list3" src="./resources/image/list.png" />
				<a id="menu3" href="./clubFreeBbsList?club_id=<%= request.getParameter("club_id") %>&sort=free">자유게시판</a>
			</div>
			
			<div>
				<img id="list4" src="./resources/image/list.png" />
				<a id="menu4" href="./clubPhotoBbsList?club_id=<%= request.getParameter("club_id") %>&sort=photo">사진첩</a>
			</div>
		</div>
		
		<div id="meeting" class="menu">
			<div>
				<img id="list5" src="./resources/image/list.png" />
				<a id="menu4" href="./clubMeetingList?club_id=<%= request.getParameter("club_id") %>">모임일정</a>
			</div>
		</div>
		
		<input type="hidden" value="탈퇴하기" id="btn2" class="btn" />
		<input type="hidden" value="멤버관리" id="btn3" class="btn" />
		<input type="hidden" value="동호회 폐쇄" id="btn4" class="btn" />
		<input type="hidden" value="폐쇄 취소" id="btn5" class="btn" />
	</div>
</body>
<script>
	$(document).ready(function() {
		// 동호회 아이디
		var club_id = "<%= request.getParameter("club_id") %>";
		
		/* 권한에 따라 버튼 보여주기 */
		var userId = "<%= session.getAttribute("userId") %>";
		if(userId == "null") {  
			// 로그인 하지 않은 경우 가입하기 버튼만 활성화
			$("#btn1").attr("type", "button");
		} else {  
			// 로그인 한 경우
			$.ajax({
		        url: "./memberCheck",
		        type: "post",
		        data: {
		            "userId": userId,
		            "club_id": club_id
		        },
		        dataType: "json",
		        success: function(data) {
		        	// 동호회 회원이 아닌 경우
		        	if(data.isMember == 0) {
		        		// 가입하기 활성화
		        		$("#btn1").attr("type", "button");
		        	}
		        	// 동호회 회원인 경우
		        	else if(data.isMember > 0 && data.isMaster == 0) {
		        		// 탈퇴하기 활성화
		        		$("#btn2").attr("type", "button");
		        	}
		        	else if(data.isMaster > 0) {
		        		// 멤버관리, 동호회 폐쇄, 폐쇄 취소 활성화
		        		$("#btn3").attr("type", "button");
		        		
		        		// 동호회가 폐쇄 중인 경우
		        		if (data.isClose > 0) {
		        			// 폐쇄 취소 활성화
			        		$("#btn5").attr("type", "button");
		        		}
		        		// 동호회가 폐쇄 중이 아닌 경우
		        		else {
		        			// 동호회 폐쇄 활성화
		        			$("#btn4").attr("type", "button");
		        		}
		        		// 메인화면의 사진 수정, 글 수정 활성화
		        		$(".masterBtn").attr("type", "button");
		        	}
		        },
		        error: function(err) {console.log(err);}
		    });
		}
		
		// 멤버관리 클릭
		$("#btn3").click(function(){
			location.href="./clubMemberList?club_id=" + club_id;
		});
	
		// 동호회 폐쇄 클릭
		$("#btn4").click(function() {
			var url = "./clubCloseForm?club_id=" + club_id;
			var option = "width=450px, height=230px left=200px top=100px";
			window.open(url, "_blank", option);
		});
		
		// 폐쇄 취소 클릭
		$("#btn5").click(function() {
			var url = "./clubCloseCancelForm?club_id=" + club_id;
			var option = "width=350px, height=160px left=200px top=100px";
			window.open(url, "_blank", option);
		});
		
	});
</script>
</html>