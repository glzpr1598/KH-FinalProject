<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--****자유게시판 글쓰기 jsp  ****-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" 
	src="<%=request.getContextPath() %>/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
</head>
<style>
	input[type='button']{
		border:none;
	 	background-color:#FFBF00 ;
	 	color: white;
		margin:4px;
		padding:10px;
		cursor: pointer;
	}
	#menu #freeBbs{
		font-weight: 900;
		color:black;
	}
	#title{
		float:left;
	}
</style>
<body>
	<%@ include file="./main-header.jsp" %>
	<div id="container">
		<%@ include file="./main-community_menu.jsp" %>
		<div id="right">
			<form action="freeBbsWrite" name="frm" id="frm">
			 <div id="title">| 자유게시판 |</div>
				<input type="text" placeholder="포스트 제목을 입력해주세요." name="subject" style="width:766px;">
			    <textarea name="content" id="smarteditor" rows="10" cols="100" style="width:666px; height:312px;">
			    </textarea>
				    <input type="button" id="cancelbutton" value="취소" />
				    <input type="button" id="savebutton" value="저장" />
			</form>
		</div>
	</div>
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
        if(confirm("글쓰기를 등록하시겠습니까?")){
        	   $("#frm").submit();
        	 //true 일 경우 상세보기 이동
        }
     
    });
    $("#cancelbutton").click(function(){
    	if(confirm("작성을 취소하시겠습니까?")){ 
    		//true 일 경우 자유게시판 리스트로 이동
    		location.href="./freeBbsList";
    	}
    });
})
</script>
</html>