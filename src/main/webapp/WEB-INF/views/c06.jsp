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
	#text{
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
		<h3>제목 : <input id="text" type="text" name="subject" placeholder="제목을 입력하세요" maxlength="20"/></h3>
    	<textarea name="editor" id="editor" rows="10" cols="100" style="width:766px; height:412px;" onKeyUp="checkLength(this);" onKeyDown="checkLength(this);"><div></div></textarea>
    	<button id="save">저장</button>
    	<div id="cancel"><a href="./clubNoticeList?club_id=<%=request.getParameter("club_id") %>&sort=공지사항">취소</a></div>
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
	         var title = localStorage.getItem("title");                      
	         var contents = localStorage.getItem("contents"); 
	         //DB에서 불러온 값을 채워 넣음
	         document.getElementById("title").value = title;     
	         oEditors.getById["txtContent"].exec("PASTE_HTML", [contents]); //로딩이 끝나면 contents를 txtContent에 넣습니다.
	     }, */
	     htParams : {
			// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseToolbar : true,             
			// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseVerticalResizer : true,     
			// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
			bUseModeChanger : true,
	     }
	});
	
<%-- 	// textArea에 이미지 첨부
	function pasteHTML(filepath){
	    var sHTML = '<img src="<%=request.getContextPath()%>/resources/multiuploder/'+filepath+'">';
	    oEditors.getById["editor"].exec("PASTE_HTML", [sHTML]);
	} --%>
	
/* 		window.onload=function(){
		var btn = document.getElementById("save");
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
	} */
	
	$("#save").click(function(){
		oEditors.getById["editor"].exec("UPDATE_CONTENTS_FIELD", []);
		writefrm.action="./clubNoticeWrite?club_id="+<%=request.getParameter("club_id")%>+"&sort=notice";
	});
	
	//textarea 공백 확인
	function validation(){
		var contents = $.trim(oEditors[0].getContents());
		if(contents == ""){
			alert("내용을 입력하세요");
			oEditors.getById["editor"].exec("FOCUS");
			return;
		}
	}
	
</script>
</html>