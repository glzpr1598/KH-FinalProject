<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="icon" href="./resources/image/icon-32.png" />
<title>HAMO</title>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<style>
	/* 내용 */
	#content1 {
		margin-top: 45px;
	}
	.content {
		margin: 5px 0px;
		text-align: center;
		font-size: 14px;
		font-weight: bold;
	}
	
	/* a링크 */
	a {
		color: black;
		text-decoration: none;
		font-size: 13px;
		cursor: pointer;
	}
	a:hover {
		text-decoration: underline;
	}
	
	/* 하루동안 안보기 */
	#notOpen {
		position: absolute;
		bottom: 10px;
		left: 10px;
	}
	
	/* 닫기 */
	#close {
		position: absolute;
		bottom: 10px;
		right: 10px;
	}
</style>
</head>
<body>
	<div class="content" id="content1">본 동호회는 <%= request.getParameter("clubClose_date") %>에 폐쇄됩니다.</div>
	<div class="content" id="content2">필요한 자료는 백업해주시기 바랍니다.</div>
	<a id="notOpen">하루동안 안보기</a>
	<a id="close">닫기</a>
</body>
<script>
	// 하루동안 안보기 클릭
	$("#notOpen").click(function() {
		// 쿠키에 등록
		var club_id = "<%= request.getParameter("club_id") %>";
		var cookieName = "clubClose"+club_id
		setCookie(cookieName, "no", 1);
		// 창 닫기
		window.close();
	});
	
	// 닫기 클릭
	$("#close").click(function() {
		window.close();
	});
	
	// 쿠키 등록 함수
	function setCookie(name, value, expiredays) {
    	var todayDate = new Date();
        todayDate.setDate (todayDate.getDate() + expiredays);
        document.cookie = name + "=" + escape(value) + "; path=/; expires=" + todayDate.toGMTString() + ";";
    }

</script>
</html>