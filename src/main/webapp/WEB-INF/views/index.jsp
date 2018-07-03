<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<style>
	#menu{
		width : 200px;
		height: 170px;
		border: 3px solid #ffbf00;
		background-color: #FDF5DC;
		position: absolute;
		left: 480px;
		top: 245px;
	}
	#frm{
		position: absolute;
		left: 730px;
		top: 245px;
	}
</style>
<body>
	<%@ include file="./main-header.jsp" %>
	<div id="menu">
		<a id="menu1" href="#"><img id="list3" src="./resources/image/list.png" />&nbsp;&nbsp;&nbsp;&nbsp;자유게시판</a>
		<a id="menu2" href="#"><img id="list4" src="./resources/image/list.png" />&nbsp;&nbsp;&nbsp;&nbsp;동호회 친목</a>
	</div>
	<form action="home" name="frm" id="frm">
	    <b>|자유게시판|<b></br>
		<input type="text" placeholder="포스트 제목을 입력해주세요." style="width:766px;">
	    <textarea name="smarteditor" id="smarteditor" rows="10" cols="100" style="width:766px; height:412px;"></textarea>
	    <input type="button" id="savebutton" value="저장" />
	</form>
</body>
<script>
$(function(){
    //전역변수선언
    var editor_object = [];
     
    nhn.husky.EZCreator.createInIFrame({
        oAppRef: editor_object,
        elPlaceHolder: "smarteditor",
        sSkinURI: "<%=request.getContextPath() %>/smarteditor/SmartEditor2Skin.html ",
        htParams : {
            // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseToolbar : true,            
            // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseVerticalResizer : true,    
            // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
            bUseModeChanger : true,
        }
    });
     
    //전송버튼 클릭이벤트
    $("#savebutton").click(function(){
        //id가 smarteditor인 textarea에 에디터에서 대입
        editor_object.getById["smarteditor"].exec("UPDATE_CONTENTS_FIELD", []);
         

        //폼 submit
        $("#frm").submit();
    })
})
</script>
</html>