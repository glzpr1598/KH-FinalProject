<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="//code.jquery.com/jquery-3.1.0.min.js"></script>
<title>Insert title here</title>
<style>
	#info{
		width : 200px;
		height: 150px;
		border: 3px solid #ffbf00;
		font-weight: 600;
		position: absolute;
		top: 340px;
		left: 345;
	}
	#info2{
		position: absolute;
		top: 25px;
		left:10;
	}
	#menu{
		width : 200px;
		height: 170px;
		border: 3px solid #ffbf00;
		background-color: #FDF5DC;
		position: absolute;
		left: 345px;
		top: 545px;
	}
	#join{
		width : 200px;
		height: 45px;
		border: 3px solid #ffbf00;
		background-color: #FDF5DC;
		position: absolute;
		left: 345px;
		top: 725px;
	}
	.btn{
		width: 204px;
		height: 40px;
		position: absolute;
		top: 500px;
		left: 345px;
		border: none;
		background-color: #ffbf00;
		color: white;
		font-weight: 600;
		font-size: large;
	} 	
	#btn2{
		width: 204px;
		height: 40px;
		position: absolute;
		top: 780px;
		left: 345px;
		border: none;
		background-color: #ffbf00;
		color: white;
		font-weight: 600;
		font-size: large;
	} 	
	#btn3{
		width: 204px;
		height: 40px;
		position: absolute;
		top: 825px;
		left: 345px;
		border: none;
		background-color: #ffbf00;
		color: white;
		font-weight: 600;
		font-size: large;
	} 	
		#btn4{
		width: 204px;
		height: 40px;
		position: absolute;
		top: 870px;
		left: 345px;
		border: none;
		background-color: #ffbf00;
		color: white;
		font-weight: 600;
		font-size: large;
	} 	
		#btn5{
		width: 204px;
		height: 40px;
		position: absolute;
		top: 915px;
		left: 345px;
		border: none;
		background-color: #ffbf00;
		color: white;
		font-weight: 600;
		font-size: large;
	} 	
	#list{
		width: 20px;
		height: 20px;
	}
	#list2{
		width: 20px;
		height: 20px;
	}
	#list3{
		width: 20px;
		height: 20px;
	}
	#list4{
		width: 20px;
		height: 20px;
	}
	#list5{
		width: 20px;
		height: 20px;
	}
	#menu1{
		text-decoration: none;
		color: #5a5a5a;
		font-weight: 600;
		position: absolute;
		top: 10px;
		left: 10px;
	}
	#menu2{
		text-decoration: none;
		color: #5a5a5a;
		font-weight: 600;
		position: absolute;
		top: 50px;
		left: 10px;
	}
	#menu3{
		text-decoration: none;
		color: #5a5a5a;
		font-weight: 600;
		position: absolute;
		top: 90px;
		left: 10px;
	}
	#menu4{
		text-decoration: none;
		color: #5a5a5a;
		font-weight: 600;
		position: absolute;
		top: 130px;
		left: 10px;
	}
	#menu5{
		text-decoration: none;
		color: #5a5a5a;
		font-weight: 600;
		position: absolute;
		top: 10px;
		left: 10px;
	}
</style>
</head>
<body>
	<div id="info">
		<div id="info2">
		회장: <span></span><br>
		회원수: <span></span><br>
		설립일: <span></span><br>
		주제: <span></span><br>
		지역: <span></span>
		</div>
	</div> 
	<input type="button" value="가입하기" class="btn"/>
	<div id="menu">
		<a id="menu1" href="#"><img id="list" src="./resources/image/list.png" />&nbsp;&nbsp;&nbsp;&nbsp;전체글보기</a>
		<a id="menu2" href="./clubNoticeList?sort=공지사항"><img id="list2" src="./resources/image/list.png" />&nbsp;&nbsp;&nbsp;&nbsp;공지사항</a>
		<a id="menu3" href="#"><img id="list3" src="./resources/image/list.png" />&nbsp;&nbsp;&nbsp;&nbsp;자유게시판</a>
		<a id="menu4" href="#"><img id="list4" src="./resources/image/list.png" />&nbsp;&nbsp;&nbsp;&nbsp;사진첩</a>
	</div>
	<div id="join">
		<a id="menu5" href="#"><img id="list5" src="./resources/image/list.png" />&nbsp;&nbsp;&nbsp;&nbsp;모임일정</a>
	</div>
	<input type="button" value="탈퇴하기" id="btn2"/><br>
	<input type="button" value="멤버관리" id="btn3"/><br>
	<input type="button" value="동호회 폐쇄" id="btn4"/><br>
	<input type="button" value="페쇄 취소" id="btn5"/>
</body>
<script>
</script>
</html>