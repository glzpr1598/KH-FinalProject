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
		<form id="form" action="./makeClub">
			<!-- 주제 선택 -->
			<div id="interestArea">
				<select id ="sel_ck1" name="interest1">
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
			<div class="msg" id="interestMsg"></div><!-- 에러 메시지 -->
			
			<!-- 지역 선택 -->
			<div id="locationArea">
				<select  id ="sel_ck2" name="location1">
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
			<div class="msg" id="locationMsg"></div><!-- 에러 메시지 -->
			
			<!-- 동호회명 -->
			<input type="text" name="club_name" maxlength="20" placeholder="동호회명" />
			<div class="msg" id="nameMsg"></div><!-- 에러 메시지 -->
			
			<!-- 동호회 소개 -->
			<div id="textLengthArea">
				<span id="textLength">0</span> / 100 자
			</div>
			<textarea name="club_introduce" placeholder="동호회 소개"></textarea>
			<div class="msg" id="introduceMsg"></div><!-- 에러 메시지 -->
			
			<!-- 회장 닉네임 -->
			<input type="text" name="club_masterNickname" maxlength="10" placeholder="회장 닉네임" />
			<div class="msg" id="nicknameMsg"></div><!-- 에러 메시지 -->
			
			<!-- 버튼 -->
			<input type="button" class="btn" value="만들기" />
		</form>
	</div>
</body>
<script>
	$(document).ready(function(){
		//createOk = false : 동호회명 승인  X
		var createOk = false;
		
		
		/* 동호회명 중복 체크 이벤트 */
		$("input[name='club_name']").focusout(function(){
			console.log($(this).val());
			$.ajax({
				url:"./clubName_overLap",
				type:"GET",
				data:{
					"club_name" : $(this).val()
				},
				dataType:"JSON",
				success:function(data){
					console.log(data);
					createOk = data.success;
					if(createOk){
						$("#nameMsg").html("사용 가능한 동호회명 입니다.");
					}else{
						$("#nameMsg").html("이미 존재하는 동호회명 입니다");
						$("#nameMsg").css("color","red");
					}
				},error:function(error){console.log(error);}
			});
		});
		
		
		
		/* 동호회 만들기 버튼 이벤트 */
		$(".btn").click(function(){
			/* submit가 0일 경우 모든 조건을 만족했다는 가정 하에 동호호 만들기 요청 */
			var submit = 0; 
			
			/* select의 option 주제 선택 여부 체크 */
			if( $("select[name=interest1]").val() == $("#sel_ck1 option:eq(0)").val() ){
				$("#interestMsg").html("주제를 선택해주세요");
				$("#interestMsg").css("color","red");
				submit++;
			}else{
				$("#interestMsg").html("");
			}
			/* select의 option 지역 선택 여부 체크 */
			if( $("select[name='location1']").val() == $("#sel_ck2 option:eq(0)").val() ){
				$("#locationMsg").html("지역을 선택해주세요");
				$("#locationMsg").css("color","red");
				submit++;
			}else{
				$("#locationMsg").html("");
			}
			/* 동호회명 중복 체크를 하였는지 */
			if(createOk ==false){
				$("#nameMsg").html("동호회명 중복 체크를 해주세요");
				$("#nameMsg").css("color","red");
				submit++;
			}else{
				$("#nameMsg").html("");
			}
			/* 동호회 소개를 입력하였는지  */
			if($("textarea[name='club_introduce']").val() == "" ){
				$("#introduceMsg").html("동호회 소개말을 입력해주세요");
				$("#introduceMsg").css("color","red");
				submit++;
			}else if($("textarea[name='club_introduce']").val().length> 100){
				$("#introduceMsg").html("동호회 소개는 100자 이하로 입력해주세요");
				$("#introduceMsg").css("color","red");
				submit++;
			}else{
				$("#introduceMsg").html("");
			}

			/* 닉네임을 입력하였는지  */
			if( $("input[name='club_masterNickname']").val() == "" ){
				$("#nicknameMsg").html("동호회 소개말을 입력해주세요");
				$("#nicknameMsg").css("color","red");
				submit++;
			}else{
				$("#nicknameMsg").html("");
			}
			if("${sessionScope.userId}" == ""){
				alert("로그인이 필요한 서비스입니다.");
				location.href="./makeClubForm";
				submit++
			}
			
			/* 모든 조건을 만족하였을 경우 동호회 만들기 요청 */
			if( submit == 0 ){
				$("#form").submit();
			}	
		});

		
		
		/* textarea 글자수 제한 */
		$("textarea").keyup(function() {
			// 제한 글자수
			var limit = 100;
			
	        // 텍스트 길이
	        var textLength = $(this).val().length;
	        $("#textLength").css("color","black");
	        
	        // 텍스트 길이 표시
	        $("#textLength").html(textLength);
	        
	        // 제한된 길이보다 입력된 길이가 큰 경우 제한 길이만큼만 자르고 텍스트영역에 넣음
	        if (textLength > limit) {
	        	alert("소개글은 최대 100자 까지만 가능 합니다");
	            $("#textLength").css("color","red");
	            $(this).val($(this).val().substring(0,limit+1));
	        }
	    });
		
		$("#sel_ck1").change(function(){
			
			var content ="";
			$("select[name='interest2']").empty();
			
			if($("#sel_ck1").val() == $("#sel_ck1 option:eq(1)").val()){
				console.log("운동/스포츠");
				content+="<option>축구</option>"
				content+="<option>농구</option>"
				content+="<option>야구</option>"
				content+="<option>배구</option>"
				content+="<option>자전거</option>"
				content+="<option>배드민턴</option>"
				content+="<option>볼링</option>"
				content+="<option>테니스/스쿼시</option>"
				content+="<option>수영</option>"
				content+="<option>족구</option>"
				$("select[name='interest2']").append(content);
			}else if($("#sel_ck1").val() == $("#sel_ck1 option:eq(2)").val()){
				console.log("아웃도어/여행");
				content+="<option>등산</option>"
				content+="<option>캠핑</option>"
				content+="<option>국내여행</option>"
				content+="<option>해외여행</option>"
				content+="<option>낚시</option>"
				$("select[name='interest2']").append(content);
			}else if($("#sel_ck1").val() == $("#sel_ck1 option:eq(3)").val()){
				console.log("공연/문화");
				content+="<option>뮤지컬/오페라</option>"
				content+="<option>공연/연극</option>"
				content+="<option>영화</option>"
				content+="<option>전시회</option>"
				content+="<option>고궁/문화재</option>"
				$("select[name='interest2']").append(content);
			}else if($("#sel_ck1").val() == $("#sel_ck1 option:eq(4)").val()){
				console.log("음악/악기");
				content+="<option>노래/보컬</option>"
				content+="<option>기타/베이스</option>"
				content+="<option>드럼</option>"
				content+="<option>피아노</option>"
				content+="<option>밴드</option>"
				content+="<option>작사/작곡</option>"
				content+="<option>클래식</option>"
				content+="<option>재즈</option>"
				content+="<option>락/메탈</option>"
				$("select[name='interest2']").append(content);
			}else if($("#sel_ck1").val() == $("#sel_ck1 option:eq(5)").val()){
				console.log("인문학/책/글");
				content+="<option>책/독서</option>"
				content+="<option>인문학</option>"
				content+="<option>심리학</option>"
				content+="<option>철학</option>"
				content+="<option>역사</option>"
				content+="<option>시사/경제</option>"
				$("select[name='interest2']").append(content);
			}else if($("#sel_ck1").val() == $("#sel_ck1 option:eq(6)").val()){
				console.log("봉사활동");
				content+="<option>양로원</option>"
				content+="<option>보육원</option>"
				content+="<option>환경봉사</option>"
				content+="<option>사회봉사</option>"
				content+="<option>교육/재능나눔</option>"
				content+="<option>유기동물보호</option>"
				$("select[name='interest2']").append(content);
			}else if($("#sel_ck1").val() == $("#sel_ck1 option:eq(7)").val()){
				console.log("공예/만들기");
				content+="<option>미술/그림</option>"
				content+="<option>캘리그라피</option>"
				content+="<option>천연비누</option>"
				content+="<option>소품공예</option>"
				content+="<option>가죽공예</option>"
				content+="<option>목공예</option>"
				content+="<option>도자/점토공예</option>"
				$("select[name='interest2']").append(content);
			}else if($("#sel_ck1").val() == $("#sel_ck1 option:eq(8)").val()){
				console.log("차/오토바이");
				content+="<option>국내차</option>"
				content+="<option>일본차</option>"
				content+="<option>미국차</option>"
				content+="<option>유럽차</option>"
				content+="<option>바이크</option>"
				$("select[name='interest2']").append(content);
			}else{
				content+="<option>소분류</option>"
				$("select[name='interest2']").append(content);
			}
		});
		/*****************************************************/
		$("#sel_ck2").change(function(){
			
			var content ="";
			$("select[name='location2']").empty();
			if($("#sel_ck2").val() == $("#sel_ck2 option:eq(1)").val()){
				console.log("강남");
				content+="<option>강남/역삼</option>"
				content+="<option>논현/학동</option>"
				content+="<option>대치/도곡/양재</option>"
				content+="<option>방배/반포</option>"
				content+="<option>삼성/선릉</option>"
				content+="<option>서초/교대</option>"
				content+="<option>압구정/청담/신사</option>"
				$("select[name='location2']").append(content);
			}else if($("#sel_ck2").val() == $("#sel_ck2 option:eq(2)").val()){
				console.log("강동");
				content+="<option>강동/천호</option>"
				content+="<option>광진/구의/건대</option>"
				content+="<option>송파/가락/방이</option>"
				content+="<option>신천/잠실</option>"
				$("select[name='location2']").append(content);
			}else if($("#sel_ck2").val() == $("#sel_ck2 option:eq(3)").val()){
				console.log("강북");
				content+="<option>강북/수유/미아</option>"
				content+="<option>노원/도봉</option>"
				content+="<option>대학로/성북</option>"
				content+="<option>동대문/신당</option>"
				content+="<option>시청/명동/을지로</option>"
				content+="<option>왕십리/성동</option>"
				content+="<option>용산/한남/이태원</option>"
				content+="<option>인사동/삼청동</option>"
				content+="<option>종로/광화문</option>"
				content+="<option>중랑/상봉</option>"
				$("select[name='location2']").append(content);
			}else if($("#sel_ck2").val() == $("#sel_ck2 option:eq(4)").val()){
				console.log("강서");
				content+="<option>강서/양천</option>"
				content+="<option>여의도/영등포/당산</option>"
				content+="<option>신촌/이대/서대문</option>"
				content+="<option>홍대/합정/상수</option>"
				content+="<option>마포역/공덕</option>"
				content+="<option>삼암/망원</option>"
				content+="<option>신림/관악</option>"
				content+="<option>신도림/구로/금천</option>"
				content+="<option>노량진/사당/동작</option>"
				content+="<option>연신내/불광/은평</option>"
				$("select[name='location2']").append(content);
			}else{
				content+="<option>소분류</option>"
				$("select[name='location2']").append(content);
			}
		});
		
	});
	
	
</script>
</html>