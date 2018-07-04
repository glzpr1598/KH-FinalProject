<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="icon" href="./resources/image/icon-32.png" />
<title>HAMO - 멤버관리</title>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<style>
	table {
		width: 800px;
	}
	table, th, td {
		border-style: solid;
		border-color: #FFBF00;
		border-width: thin 0px;
		border-collapse: collapse;
		padding: 10px;
		font-size: 13px;
		text-align: center;
	}
	th {
		background-color: #FDF5DC;
	}
	
	/* 제목 */
	#title {
		font-size: 20px;
		font-weight: bold;
	}
	
	/* 강퇴 버튼 */
	button.fire {
		border: thin solid #FFBF00;
		background: none;
		padding: 5px 10px;
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
			<div id="title">| 멤버관리 |</div>
			<br />
			<table>
				<tr>
					<th>아이디</th>
					<th>닉네임</th>
					<th>이메일</th>
					<th>전화번호</th>
					<th>강퇴</th>
				</tr>
				<c:forEach var="item" items="${ list }">
				<tr>
					<td>${ item.MEMBER_ID }</td>
					<td>${ item.CLUBJOIN_NICKNAME }</td>
					<td>${ item.MEMBER_EMAIL }</td>
					<td>${ item.MEMBER_PHONE }</td>
					<td>
						<!-- 클래스 : fire, clubJoin_id, club_id, member_id -->
						<button class="fire ${ item.CLUBJOIN_ID } ${ item.CLUB_ID } ${ item.MEMBER_ID }">강퇴</button>
					</td>
				</tr>
				</c:forEach>
			</table>
	<!------------------- 양식 ------------------->
		</div>
	</div>
	<!------------------- 양식 ------------------->
</body>
<script>
	// 강퇴 버튼 클릭
	$(".fire").click(function() {
		// 회원 강퇴 uri(clubJoin_id, club_id, member_id를 파라미터로 보냄)
		var uri = './clubMemberFire' +
		'?clubJoin_id=' + $(this)[0].classList[1] +
		'&club_id=' + $(this)[0].classList[2] + 
		'&member_id=' + $(this)[0].classList[3];
		
		// 확인 버튼 누를 경우
		if(confirm('강퇴한 회원은 이 동호회에 다시 가입할 수 없습니다. \n정말로 강퇴시키시겠습니까?')) {
			location.href = uri;
		}
	});
</script>
</html>