<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="//code.jquery.com/jquery-3.1.0.min.js"></script>
<title>Insert title here</title>
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
	}
	#left #info div {
		padding: 5px 10px;
	}
	#left #info .infoText1 {
		display: inline-block;
		width: 50px;
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
		<input type="button" value="가입하기" class="btn" />
		<div id="menu" class="menu">
			<div>
				<img id="list" src="./resources/image/list.png" />
				<a id="menu1" href="">전체글보기</a>
			</div>	
			
			<div>
				<img id="list2" src="./resources/image/list.png" />
				<a id="menu2" href="./clubNoticeList?sort=공지사항">공지사항</a>
			</div>
			
			<div>
				<img id="list3" src="./resources/image/list.png" />
				<a id="menu3" href="">자유게시판</a>
			</div>
			
			<div>
				<img id="list4" src="./resources/image/list.png" />
				<a id="menu4" href="">사진첩</a>
			</div>
		</div>
		
		<div id="meeting" class="menu">
			<div>
				<img id="list5" src="./resources/image/list.png" />
				<a id="menu4" href="">모임일정</a>
			</div>
		</div>
		
		<input type="button" value="탈퇴하기" id="btn2" class="btn" /><br>
		<input type="button" value="멤버관리" id="btn3" class="btn" /><br>
		<input type="button" value="동호회 폐쇄" id="btn4" class="btn" /><br>
		<input type="button" value="페쇄 취소" id="btn5" class="btn" />
	</div>
</body>
<script>

	// 멤버관리 클릭
	$("#btn3").click(function(){
		club_id = "<%= request.getParameter("club_id") %>";
		location.href="./clubMemberList?club_id=" + club_id;
	});

	// 동호회 폐쇄 클릭
	$("#btn4").click(function() {
		var club_id = "<%= request.getParameter("club_id") %>";
		window.open("./clubCloseForm?club_id=" + club_id, 
				"_blank", "width=450px, height=230px left=200px top=100px");
	});
	
</script>
</html>