<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
<link rel="icon" href="./resources/image/icon-32.png" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>HAMO - 동호회 만들기</title>
<style>
	#makeClub {
		background-color: #FDF5DC;
		color: black;
	}

	.container {
		width: 400px;
		margin: 0 auto;
	}
	
	.container select {
		box-sizing: border-box;
		width: 197px;
		height: 40px;
		border: medium solid #ffbf00;
		border-radius: 5px;
		padding: 0 5px;
	}
	
	.container #locationArea {
		margin-top: 10px;
	}
	
	.container input[type="text"] {
		box-sizing: border-box;
		width: 400px;
		height: 40px;
		border: medium solid #ffbf00;
		border-radius: 5px;
		margin-top: 10px;
		padding: 0 10px;
	}
	
	#textLengthArea {
		box-sizing: border-box;
		width: 400px;
		margin-top: 10px;
    	text-align: right;
    	font-size: 14px;
    	color: gray;
	}
	
	.container textarea {
		box-sizing: border-box;
		width: 400px;
		height: 100px;
		border: medium solid #ffbf00;
		border-radius: 5px;
		padding: 10px;
		resize: none;
	    font: 400 13.3333px Arial;
	}
	
	.container .btn {
		box-sizing: border-box;
		width: 400px;
		height: 40px;
		border: medium solid #ffbf00;
		border-radius: 5px;
		margin-top: 10px;
		background: #ffbf00;
		color: white;
		font-weight: bold;
		text-align: center;
		cursor: pointer;
		font-size: 14px;
	}
	
	.msg {
		font-size: 12px;
		color: red;
		margin-top: 3px;
	}
</style>
</head>
<body>
	<%@ include file="./main-header.jsp" %>
	<div class="container">
		<form action="./makeClub">
			<!-- 주제 선택 -->
			<div id="interestArea">
				<select name="interest1">
					<option>주제</option>
					<option>운동/스포츠</option>
					<option>아웃도어/여행</option>
					<option>공연/문화</option>
					<option>음악/악기</option>
					<option>인문학/책/글</option>     
					<option>봉사활동</option>
					<option>공예/만들기</option>
					<option>차/오토바이</option>
				</select>
				
				<select name="interest2">
					<option>소분류</option>
				</select>
			</div>
			
			<div class="msg" id="interestMsg"></div>
			
			<!-- 지역 선택 -->
			<div id="locationArea">
				<select name="location1">
					<option>지역</option>        
					<option>강남</option>
					<option>강동</option>
					<option>강북</option>
					<option>강서</option>
				</select>
				
				<select name="location2">
					<option>소분류</option>
				</select>
			</div>
			
			<div class="msg" id="locationMsg"></div>
			
			<!-- 동호회명 -->
			<input type="text" name="club_name" maxlength="20" placeholder="동호회명" />
			
			<div class="msg" id="nameMsg"></div>
			
			<!-- 동호회 소개 -->
			<div id="textLengthArea">
				<span id="textLength">0</span> / 100 자
			</div>
			<textarea name="club_introduce" placeholder="동호회 소개"></textarea>
			
			<div class="msg" id="introduceMsg"></div>
			
			<!-- 회장 닉네임 -->
			<input type="text" name="club_masterNickname" placeholder="회장 닉네임" />
			
			<div class="msg" id="nicknameMsg"></div>
			
			<!-- 버튼 -->
			<input type="submit" class="btn" value="만들기" />
		</form>
	</div>
</body>
<script>
$(document).ready(function() {
	
	/* textarea 글자수 제한 */
	$("textarea").keyup(function() {
		// 제한 글자수
		var limit = 100;
		
        // 텍스트 길이
        var textLength = $(this).val().length;
        
        // 텍스트 길이 표시
        $("#textLength").html(textLength);
 
        // 제한된 길이보다 입력된 길이가 큰 경우 제한 길이만큼만 자르고 텍스트영역에 넣음
        if (textLength > limit) {
            $(this).val($(this).val().substr(0, limit));
        }
    });
	
});
</script>
</html>