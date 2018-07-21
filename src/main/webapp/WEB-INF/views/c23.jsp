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
	#nickNameMsg {
		font-size: 12px;
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
			<form id="form" action="">
				<input type="text" id="nick_name" name="nickname" value="" maxlength="10" placeholder="닉네임" />
				<div class="msg" id="nickNameMsg"></div><!-- 에러 메시지 -->
				<!-- 경고글 -->
				
				<div id="alertText">원활한 동호회 운영을 위해 동호회 회장에게 아이디, 이메일, 전화번호가 동호회 이용기간 동안 공개됩니다.<br />
					<!-- 가입하기 버튼 -->				
					<input type="hidden" name="club_id" value="${club_id }"/>
					<input type="button" id="joinBtn" value="가입하기" />	
				</div>
			</form>
	<!------------------- 양식 ------------------->
		</div>
	</div>
	<!------------------- 양식 ------------------->
</body>
<script>
$(document).ready(function() {
	/* 동호회 소개 말  가져오기 */
	var club_introduce = "${introduce}"; 
	console.log( $('#nick_name').val());
	$("#club_introduce").html(club_introduce);
	
	/* 동호회 닉네임 중복 여부 체크  */
	//nickName_ok = false : 닉네임명 승인  X
	var nickName_ok  = false;
	
	$("input[name='nickname']").focusout(function(){
		console.log("focusout");
		if($(this).val() != "") {
			$.ajax({
				url:"./club_overLap",
				type:"GET",
				data:{
					"club_id" : "${club_id}",
					"nickName" : $('#nick_name').val()
				},
				dataType:"JSON",
				success:function(data){
					console.log(data);
					nickName_ok = data.success ; 
					if(nickName_ok){
						$("#nickNameMsg").html("사용가능한 닉네임 입니다.");
						$("#nickNameMsg").css("color","blue");
					}else{
						$("#nickNameMsg").html("이미 사용중인 닉네임 입니다.");
						$("#nickNameMsg").css("color","red");
					}
				},error:function(error){console.log(error);}
			});	
		} else {
			$("#nickNameMsg").html("닉네임을 입력해주세요.");
			$("#nickNameMsg").css("color","red");
		}
	});
	
	$("#joinBtn").click(function(){
		/* submit가 0일 경우 모든 조건을 만족했다는 가정 하에 동호호 만들기 요청 */
		var submit = 0; 		
		$("#nickNameMsg").html("");
		
		if("${sessionScope.userId}" == "null"){
			alert("로그인이 필요한 서비스입니다.");
			location.href="./loginForm";
			submit++
		}
		if($('#nick_name').val() == ""){
			$("#nickNameMsg").html("닉네임을 입력해주세요.");
			$("#nickNameMsg").css("color","red");
			submit++
		}else if(!nickName_ok){
			$("#nickNameMsg").html("닉네임 중복 여부 확인해주세요.");
			$("#nickNameMsg").css("color","red");
			submit++
		}
		if(submit == 0 ){
			$("#form").attr("action","./clubJoin");
			$("#form").submit();
		}
	});
	
	
	

	
	
});
</script>
</html>