<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
<style>
	body {
		margin: 0px;
	}

	#header {
		width: 1000px;
		height: 40px;
		margin: auto;
		position: relative;
	}

	/* 로그인, 회원정보수정 */
	#header #link {
		position: absolute;
		top: 10px;
		right: 0px;
	}
	#header #link a {
		font-size: 12px;
		color: black;
		text-decoration: none;
		font-weight: bold;
		cursor: pointer;
	}
	#header #link a:hover {
		text-decoration: underline;
	}
	
	#header #link a#nickName {
		cursor: auto;
		text-decoration: none;           
	}
    
	/* 동호회 이름 */
	#clubNameArea {
		width: 1000px;
		line-height: 140px;
		margin: 15px auto;
		position: relative;
		text-align: center;
		border: medium solid #ffbf00;
    	border-radius: 5px;
	}
	#clubNameArea #clubName {
		font-size: 40px;
		color: black;
		text-decoration: none;
		font-family: 'Jua', sans-serif;
	}
</style>
</head>
<body>
	<div id="header">
		<div id="link">
			<a href="./">HAMO</a>
			|
			<a id="nickName"></a>
			<span id="bar"></span>
			<a id="login"></a>
			|
			<a id="update1">회원정보수정</a>
		</div>
	</div>
	<div id="clubNameArea">
		<a href="./clubMain?club_id=<%= request.getParameter("club_id") %>" id="clubName"></a>
	</div>
</body>
<script>
	// 로그인 상태 변수
	var loginState = "logout";  
	
	// 로그인 체크
	if('<%= session.getAttribute("userId") %>' == 'null') {  // 로그아웃 상태
		loginState = "logout";
		$("#login").html("로그인");
		$("#update1").html("회원가입");
	} else {  // 로그인 상태
		loginState = "login";
		$("#login").html("로그아웃");
		$("#update1").html("회원정보수정");
	}
	
	// 로그인/로그아웃 클릭
	$("#login").click(function() {
		if(loginState == "login") {  // 로그인 상태
			// 로그아웃
			location.href="./logout";
		} else {  // 로그아웃 상태
			// 로그인 페이지로 이동
			location.href="./loginForm";
		}
	});
	
	$("#update1").click(function() {    
		if(loginState == "login") {  // 로그인 상태
			// 로그아웃   
			location.href="./updateForm";
		} else {  // 로그아웃 상태
			// 로그인 페이지로 이동
			location.href="./hamoJoinForm";            
		}
	});
	
	// 동호회 정보 가져오기
	// 동호회명, 회장, 회원수, 설립일, 주제, 지역
	$(document).ready(function() {
		var club_id = "<%= request.getParameter("club_id") %>";
		
		$.ajax({
	        url: "./clubInfo",
	        type: "post",
	        data: {
	            "club_id": club_id,
	        },
	        dataType: "json",
	        success: function(data) {
	            $("#clubName").html(data.CLUB_NAME);
	            $("#master").html(data.CLUB_MASTERNICKNAME);
	            $("#memberCount").html(data.CLUB_MEMBERCOUNT + "명");
	            $("#createDate").html(data.CLUB_DATE);
	            $("#subject").html(data.INTEREST_INTEREST);
	            $("#location").html(data.CLUB_LOCATION);


							    		$.ajax({
							    	        url: "./nickNameSearch",
							    	        type: "post",
							    	        data: {
							    	            "userId": '<%= session.getAttribute("userId") %>',
							    	            "clubId" : '<%= request.getParameter("club_id") %>'          
							    	        },
							    	        dataType: "json",
							    	        success: function(data) {
							    	        	if(data.nick != null){  
							    	      	      $("#nickName").html(data.nick);
							    		      	  $("#bar").html("|");
							    	        	}           
							    	        },
							    	        error: function(err) {console.log(err);}
							    	    });

	    		$.ajax({
	    	        url: "./nickNameSearch",
	    	        type: "post",
	    	        data: {
	    	            "userId": '<%= session.getAttribute("userId") %>',
	    	            "clubId" : '<%= request.getParameter("club_id") %>'          
	    	        },
	    	        dataType: "json",
	    	        success: function(data) {
	    	        	if(data.nick != null){
	    	      	      $("#nickName").html(data.nick);
	    		      	  $("#bar").html("|");
	    	        	}           
	    	        },
	    	        error: function(err) {console.log(err);}
	    	    });

	            
	            
	        },
	        error: function(err) {
	        	location.href="./error404";
	        }
	    });
	});

</script>
</html>