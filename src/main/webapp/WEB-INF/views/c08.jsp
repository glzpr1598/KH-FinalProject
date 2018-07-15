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
	#name{
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
	<jsp:include page="club-menu.jsp"/>
	<div id="name">
		| 공지사항 |
	</div>
	<form name="writefrm" id="writefrm" method="post">
		<h3>제목 : <input id="subject" type="text" name="subject" placeholder="제목을 입력하세요" maxlength="20" value="${info.clubBbs_subject}"/></h3>
    	<textarea name="editor" id="editor" rows="10" cols="100" style="width:766px; height:412px;" onKeyUp="checkLength(this);" onKeyDown="checkLength(this);">${info.clubBbs_content}</textarea>
    	<button id="save">저장</button>
    	<div id="cancel"><a href="./clubNoticeDetail?club_id=${info.club_id}&clubBbs_id=${info.clubBbs_id}">취소</a></div>
	</form>
</body>
<script>
	var oEditors = [];
	//스마트에디터 프레임생성
	nhn.husky.EZCreator.createInIFrame({
		oAppRef : oEditors,
		elPlaceHolder: "editor",
		sSkinURI: "<%= request.getContextPath() %>/resources/smarteditor/SmartEditor2Skin.html",
		 /* fOnAppLoad: function () { //수정시 필요한 코드
	         var title = localStorage.getItem("subject");                      
	         var contents = localStorage.getItem("editor"); 
	         //DB에서 불러온 값을 채워 넣음
	         document.getElementById("subject").value = title;
	         oEditors.getById["editor"].exec("PASTE_HTML", [contents]); //로딩이 끝나면 contents를 txtContent에 넣습니다.
	     }, */
	     htParams : {
			// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseToolbar : true,             
			// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseVerticalResizer : true,     
			// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
			bUseModeChanger : true,
			fOnBeforeUnload : function(){
			},
	   	fCreator: "createSEditor2"
	     }
	});
	
	window.onload=function(){
		var btn = document.getElementById("writefrm");
		btn.onclick = function(){
			submitContents(btn);
		}
	}
	
	function submitContents(elClickedObj){
		oEditors.getById["editor"].exec("UPDATE_CONTENTS_FIELD", []);
		if(validation()){
			$("#writefrm").submit();
		}
		try{
			
		}catch(e){
			elClickedObj.form.submit();
		}
	}
	
	/* //작성된 내용 전송
	$("#save").click(function(){
		oEditors.getById["editor"].exec("UPDATE_CONTENTS_FIELD", []);
		if(validation()){
			$("#writefrm").submit();
		}
	}); */
	
	//textarea 공백 확인
	function validation(){
		var contents = $.trim(oEditors[0].getContents());
		if(contents == ""){
			alert("내용을 입력하세요");
			oEditors.getById["editor"].exec("FOCUS");
			 return;
		}
	}

	//textarea 글자수 제한
	$(document).ready(function() {
	    $('#editor').on('keyup', function() {
	        if($(this).val().length > 10) {
	            $(this).val($(this).val().substring(0, 10));
	        }
	    });
	});
	
	$("#save").click(function(){
		writefrm.action = "./clubNoticeUpdate?&club_id="+${info.club_id}+"&clubBbs_id="+${info.clubBbs_id};
	});
</script>
</html>