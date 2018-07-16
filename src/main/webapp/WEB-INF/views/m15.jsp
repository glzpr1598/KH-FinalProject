<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--****자유게시판 글 수정하기 폼 jsp  ****-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" 
	src="<%=request.getContextPath() %>/resources/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
</head>
<style>
	#right {
		width: 800px;
		float: left;
		margin-left: 20px;
	}
	#member{
		font-weight: 800;
	}
	input[type='button']{
		border:none;
	 	background-color:#FFBF00 ;
	 	color: white;
		margin:4px;
		padding:10px;
		cursor: pointer;
	}
	#content{
		background-color: transparent;
		resize: none;
		border-color: #FFBF00;
		border-width: 1px;
		border-style: solid;
	}
	#file{
		width:500px;
		height:40px;
		border-color: #FFBF00;
		border-width: 1px;
		border-style: solid;
		margin-top:-12px;
	}
	h4{
		margin-top:7px;
	}
	#menu #freeBbs{
		font-weight: 900;
		color:black;
	}
</style>
<body>
	<%@ include file="./main-header.jsp" %>
	<div id="container">
		<%@ include file="./main-community_menu.jsp" %>
		<div id="right">
			<form action="freeBbsUpdate" name="frm" id="frm">
			 	<div id="title">| 자유게시판 |</div>
			    <h2>${detail.mainBbs_subject }</h2>
			   <div><span id="member">${detail.member_id }</span> | 조회수 : ${detail.mainBbs_hit } | ${detail.mainBbs_date }</div>
			    <textarea name="content" id="smarteditor" rows="10" cols="80" style="width:633px; height:300px;">
			    </textarea>
			    <input type="hidden" name="idx" value="${detail.mainBbs_id}">
			    <h4>첨부파일</h4>
			    <div id="file">
			    <!-- 상세보기 컨트롤러에서 file 리스트 조회 -->
			   <%--  	${detail. }  --%>
			    </div>
				    <input type="button" id="cancelbutton" value="취소" />
				    <input type="button" id="savebutton" value="저장" />
		    </form>
		</div>
		
	</div>
		
</body>
<script>
$(function(){
	//textarea에 값 넣기
	$("#smarteditor").val("${detail.mainBbs_content }");
	console.log("초기 content: "+$("#smarteditor").val());
	
	
    //전역변수선언
    var editor_object = [];
     
    nhn.husky.EZCreator.createInIFrame({
        oAppRef: editor_object,
        elPlaceHolder: "smarteditor",
        sSkinURI: "<%=request.getContextPath() %>/resources/smarteditor/SmartEditor2Skin.html ",
        htParams : {
            // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseToolbar : true,            
            // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseVerticalResizer : true,    
            // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
            bUseModeChanger : true,
        }
    });
 
    //수정 하기  클릭 시 
    $("#savebutton").click(function(){
        //id가 smarteditor인 textarea에 에디터에서 대입
        editor_object.getById["smarteditor"].exec("UPDATE_CONTENTS_FIELD", []);
        
        //폼 submit
        if(confirm("수정 하시겠습니까?")){
        	console.log("content:"+$("#smarteditor").val());
        	if($("#smarteditor").val()=="<p>&nbsp;</p>" || $("#smarteditor").val()==""){
        		alert("내용을 입력 해 주세요.");
        	}else{
        		$("#frm").submit();	
        	}
        } 
    });
    
    //수정 취소  클릭 시 
    $("#cancelbutton").click(function(){
    	if(confirm("수정 취소하시겠습니까?")){ 
    		location.href="./freeBbsdetail?idx=${detail.mainBbs_id}&updateAfter=0";
    	}
    });
    
})
</script>
</html>