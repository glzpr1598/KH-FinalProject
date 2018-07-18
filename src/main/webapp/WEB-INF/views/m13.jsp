<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--****자유게시판 글쓰기 jsp  ****-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- <script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script> -->
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript" 
	src="<%=request.getContextPath() %>/resources/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
</head>
<style>
	input[type='button']{
		border:none;
	 	background-color:#FFBF00 ;
	 	color: white;
	 	margin:7px;
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
	#right {
		width: 800px;
		float: left;
		margin-left: 20px;
	}
	#btn{
		margin-left: 300px;
		margin-top:25px;
	}
</style>
<body>
	<%@ include file="./main-header.jsp" %>
	<div id="container">
		<%@ include file="./main-community_menu.jsp" %>
		<div id="right">
			<form action="" name="frm" id="frm" method="post">
			 	<div id="title">| 자유게시판 |</div>
				<input type="text" id="subject" placeholder="포스트 제목을 입력해주세요." name="subject" style="width:766px;"maxlength="20">
			    <textarea  name="content" id="smarteditor"  placeholder="10" cols="100" style="width:766px; height:312px;">
			    </textarea>
			    <div id="btn">
				    <input type="button" id="cancel" value="취소" />
				    <input type="button" id="save" value="저장" />
				 </div>
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
        sSkinURI: "<%=request.getContextPath() %>/resources/smarteditor/SmartEditor2Skin.html ",
        htParams : {
            // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseToolbar : true,            
            // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseVerticalResizer : true,    
            // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
            bUseModeChanger : true
        }

    });
     
     //전송버튼 클릭이벤트
     $("#save").click(function(){
    	//id가 smarteditor인 textarea에 에디터에서 대입
	    editor_object.getById["smarteditor"].exec("UPDATE_CONTENTS_FIELD", []);
		         
         //폼 submit
         	console.log("subject: "+$("#subject").val());
         	console.log("content: "+$("#smarteditor").val());
         	if( "${sessionScope.userId}" !=null){     	
	         	if($("#subject").val()==""){
	         		alert("제목을 입력 해 주세요.");
	         	}else if($("#smarteditor").val()=="<p>&nbsp;</p>" || $("#smarteditor").val()==""){
	         		alert("내용을 입력 해 주세요.");
	         	}else{
	         		console.log($("#smarteditor").val());
	         		//글쓰기 내용 입력 제한
	         		if($("#smarteditor").val().length > 2000){
	         			alert("최대 2000자 까지 입력 가능합니다");
	         		}else{
	        			var str = $("#smarteditor").val();

	        			var pattern = /src="(.*?)"/g;
	        			var list = str.match(pattern);
	        			if(list != null) {
		        			for(var i = 0; i < list.length; i++) {
		        				list[i] = list[i].substring(list[i].lastIndexOf('/') + 1);
		        			   list[i] = list[i].substring(0, list[i].length - 1);
		        			}
	        			}
	        			
	        			var param = "";
	        			var count =0; //선언
	        			if(list != null) {
		        			for(var i = 0; i < list.length; i++){
		        				param += "&filePath"+i+"="+list[i];
		        				console.log(param);
		        				count++;
		        				console.log("textarea 파일 개수 : "+count);
		        			}
	        			}
	        			console.log("글 쓰기 test");
	        			$("#frm").attr("action","./freeBbsWrite?count="+count+param);
	        			$("#frm").submit();
	         		}
	         	}
         	}else{
         		alert("접속 시간이 만료되어 다시 로그인 후에 이용가능합니다.");
         	}
     });
     
    $("#cancel").click(function(){
    	if(confirm("작성을 취소하시겠습니까?")){ 
    		//true 일 경우 자유게시판 리스트로 이동
    		location.href="./freeBbsList";
    	}
    });
    
	$("#subject").keyup(function(){
		console.log("제목 keyup");
		console.log($("#subject").val().length);
		if($("#subject").val().length>"20"){
			alert("제목은 최대 20자까지만 입력 가능합니다.");
		}
	});
	
});
</script>
</html>