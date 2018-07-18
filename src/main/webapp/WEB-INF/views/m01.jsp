<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="icon" href="./resources/image/icon-32.png" />
<title>HAMO - 로그인</title>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<style>
	#container {
		width: 300px;
		margin: 150px auto;
		text-align: center;
	}
	
	/* 로고 */
	#logo {
		height: 80px;
		margin-bottom: 20px;
		cursor: pointer;
	}
	
	/* 입력창 */
	.inputText {
		box-sizing: border-box;
		width: 300px;
		padding: 10px;
		margin: 5px 0px;
		border: medium solid #FFBF00;
		border-radius: 5px;
	}
	
	/* 확인 메시지 */
	#msg {
		margin: 0 5px 5px 5px;
		font-size: 13px;
		text-align: left;
		color: #ff1616;
	}
	
	/* 로그인 버튼 */
	#login {
		box-sizing: border-box;
		width: 300px;
		padding: 10px;
		margin: 5px 0px;
		border: none;
		border-radius: 5px;
		background: #FFBF00;
		color: #FFFFFF;
		font-size: 16px;
		font-weight: bold;
		cursor: pointer;
	}
	
	/* 아이디/비밀번호 찾기 */
	#idPw a {
		float: left;
		margin: 5px;
		color: black;
		font-size: 13px;
		text-decoration: none;
	}
	#idPw a:hover {
		text-decoration: underline;
	}
	
	/* 회원가입 */
	#join a {
		float: right;
		margin: 5px;
		color: black;
		font-size: 13px;
		text-decoration: none;
	}
	#join a:hover {
		text-decoration: underline;
	}
	
</style>
</head>
<body>
	<div id="container">
		<img id="logo" src="./resources/image/logo.png"/>
		<input type="text" id="userId" class="inputText" placeholder="아이디" />
		<input type="password" id="userPw" class="inputText" placeholder="비밀번호" />
		<div id="msg"></div>
		<input type="button" id="login" value="로그인" />
		<div id="idPw"><a href="idpwSearchForm">아이디/비밀번호 찾기</a></div>
		<div id="join"><a href="hamoJoinForm">회원가입</a></div>
	</div>
</body>
<script>
	// 로고 클릭
	$("#logo").click(function() {
		location.href="./"
	});
	
	// 로그인 클릭
	$("#login").click(function() {
		// 아이디를 입력하지 않은 경우
		if($("#userId").val() == "") {
			$("#msg").html("아이디를 입력해주세요.");
		}
		// 비밀번호를 입력하지 않은 경우
		else if($("#userPw").val() == "") {
			$("#msg").html("비밀번호를 입력해주세요.");
		}
		// 정상 입력한 경우
		else {
			$.ajax({
		        url: "./login",
		        type: "post",
		        data: {
		            "userId": $("#userId").val(),
		            "userPw": $("#userPw").val()
		        },
		        dataType: "json",
		        success: function(data) {
		            // 로그인 성공
		            if(data.success == true) {
		            	// 이전 주소
		            	var referer = "${referer}";
		            	
		            	// 이전 주소가 있는 경우
		            	if(referer != "") {
		            		location.href = referer;
		            	}
		            	// 이전 주소가 없을 경우 메인 페이지로
		            	else {
		            		location.href="./";
		            	}
		            }
		            // 로그인 실패
		            else {
		            	$("#msg").html("아이디 또는 비밀번호를 확인해주세요.");
		            }
		            var next = "<%= request.getParameter("next") %>";
		        },
		        error: function(err) {console.log(err);}
		    });
		}
	});
	
	// 엔터 키 눌렀을 때 로그인
	$('.inputText').keypress(function(event){
		if(event.which == 13) {
		    $('#login').click();
		    return false;
		}
	});

</script>
</html>




