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
		font-weight: bold;
		padding: 5px 0px;
		margin-bottom: 5px;
	}
	#left #info div {
		padding: 5px 10px;
	}
	
	/* 메뉴 */
	#left .menu{
		margin-bottom: 5px;
		padding: 5px 0px;
		border: medium solid #ffbf00;
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
		font-weight: bold;
		text-decoration: none;
		margin-left: 5px;
	}
	
	/* 버튼 */
	#left .btn{
		width: 100%;
		padding: 7px 0px;
		margin-bottom: 5px;
		background-color: #ffbf00;
		border: none;
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
			<div>회장: <span></span></div>
			<div>회원수: <span></span></div>
			<div>설립일: <span></span></div>
			<div>주제: <span></span></div>
			<div>지역: <span></span></div>
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
</script>
</html>