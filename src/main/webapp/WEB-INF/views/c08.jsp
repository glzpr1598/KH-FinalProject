<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="//code.jquery.com/jquery-3.1.0.min.js"></script>
<script type="text/javascript" src="<%= request.getContextPath() %>/resources/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
<title>Insert title here</title>
<style>
	#save{
		border: none;
		background-color: #ffbf00;
		width: 70px;
		height: 30px;
		position: relative;
		left: 390px;
		top: 30px;
		font-weight: 600;
		color: white;
		text-align: center;
	}
	#cancel{
		border: none;
		background-color: #ffbf00;
		width: 70px;
		height: 29px;
		position: relative;
		left: 300px;
		top: 1px;
		text-align: center;
	}
	#cancel a{
		text-decoration: none;
		color: white;
		font-weight: 600;
		font-size: small;
		position: absolute;
		top: 5px;
		right: 21px;
	}
	#writefrm{
		position: absolute;
		left: 565px;
		width: 800px;
	}
	#title{
	position: absolute;
	left: 565px;
	top: 345px;
	font-weight: 600;
	font-size: large;
	}
	#subject{
		width: 400px;
		height: 30px;
	}
</style>
</head>
<body>
	<jsp:include page="club-header.jsp"/>
	<div id="container">
		<jsp:include page="club-menu.jsp"/>
		<div id="right">
			<div id="title">| 공지사항 |</div>
			<form name="writefrm" id="writefrm" method="post">
				<h3>제목 : <input id="subject" type="text" name="subject" placeholder="제목을 입력하세요" maxlength="20" value="${info.clubBbs_subject}"/></h3>
    			<textarea name="editor" id="editor" rows="10" cols="100" style="width:766px; height:412px;">${info.clubBbs_content}</textarea>
    			<button id="save">저장</button>
    			<div id="cancel"><a href="./clubNoticeDetail?club_id=${info.club_id}&clubBbs_id=${info.clubBbs_id}">취소</a></div>
			</form>
		</div>
	</div>
</body>
<script>
	var count = 0;

	var oEditors = [];
	//스마트에디터 프레임생성
	nhn.husky.EZCreator.createInIFrame({
		oAppRef : oEditors,
		elPlaceHolder: "editor",
		sSkinURI: "<%= request.getContextPath() %>/resources/smarteditor/SmartEditor2Skin.html",
	     htParams : {
			// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseToolbar : true,             
			// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseVerticalResizer : true,     
			// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
			bUseModeChanger : true,
	     }
	});

	$("#save").click(function(){
		if($("#subject").val() == ""){
			alert("제목을 입력하세요");
			return;
		}else{
			oEditors.getById["editor"].exec("UPDATE_CONTENTS_FIELD", []);
			
			var str = $("#editor").val();

			var pattern = /src="(.*?)"/g;
			var list = str.match(pattern);
			for(var i = 0; i < list.length; i++) {
			   list[i] = list[i].substring(41);
			   list[i] = list[i].substring(0, list[i].length - 1);
			}
			
			var param = "";
			for(var i = 0; i < list.length; i++){
				param += "&filePath"+i+"="+list[i];
				count++;
			}
			writefrm.action = "./clubNoticeUpdate?&club_id="+${info.club_id}+"&clubBbs_id="+${info.clubBbs_id}+param+"&count="+count;
		}
	});
</script>
</html>