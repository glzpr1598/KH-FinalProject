<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="icon" href="./resources/image/icon-32.png" />
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous">
<title>HAMO - 가입하기</title>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<style>
	/* 제목 */
	#title {
		font-size: 20px;
		font-weight: bold;
	}
	.subTitle {
		font-size: 16px;
		font-weight: bold;
		margin-top: 20px;
	}
	
	/* 소개글 */
	#club_introduce {
		box-sizing: border-box;
		margin-top: 10px;
		width: 800px;
		height: 54px;
		padding: 8px;
		font-size: 14px;
		background: #FDF5DC;
		border: thin solid #FDF5DC;
		border-radius: 5px; 
	}
	
	/* 닉네임 */
	input[type="text"] {
		margin-top: 10px;
		box-sizing: border-box;
		width: 200px;
		padding: 8px;
		border: thin solid #ffbf00;
		border-radius: 5px;
	}
	
	/* 경고글 */
	#alertText {
		margin-top: 20px;
		box-sizing: border-box;
		width: 800px;
		font-size: 12px;
		text-align: center;
	}
	
	/* 가입하기 버튼*/
	#joinBtn {
		margin-top: 10px;
		padding: 5px 10px;
		background: #ffbf00;
		border: thin solid #ffbf00;
		border-radius: 5px;
		font-size: 14px;
		font-weight: bold;
		color: white;
		cursor: pointer;
	}
</style>
</head>
<body>
	<!------------------- 양식 ------------------->
	<%@ include file="./club-header.jsp" %>
	<div id="container">
		<%@ include file="./club-menu.jsp" %>
		<div id="right"> <!-- width: 800px -->
	<!------------------- 양식 ------------------->
			<div id="title">| 가입하기 |</div>
			
			<!-- 동호회 소개 -->
			<div class="subTitle"><i class="fas fa-angle-right"></i> 동호회 소개</div>
			<div id="club_introduce"></div>
			
			<!-- 닉네임 설정 -->
			<div class="subTitle"><i class="fas fa-angle-right"></i> 닉네임 설정</div>
			<input type="text" name="nickname" maxlength="10" placeholder="닉네임" />
			
			<!-- 경고글 -->
			<div id="alertText">원활한 동호회 운영을 위해 동호회 회장에게 아이디, 이메일, 전화번호가 동호회 이용기간 동안 공개됩니다.<br />
				<!-- 가입하기 버튼 -->
				<input type="button" id="joinBtn" value="가입하기" />
			</div>
	<!------------------- 양식 ------------------->
		</div>
	</div>
	<!------------------- 양식 ------------------->
</body>
<script>
$(document).ready(function() {
	
});
</script>
</html>