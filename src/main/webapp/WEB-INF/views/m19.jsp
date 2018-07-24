 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--****동호회 친목 게시판 글 수정하기 폼 jsp  ****-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" 
	src="<%=request.getContextPath() %>/resources/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
<link rel="icon" href="./resources/image/icon-32.png" />
<title>HAMO</title>	
</head>
<style>
	#menu #friendBbs{
		font-weight: bold;
		color:black;
	}
	
	#subject {
		margin-top: 20px;
		height: 30px;
		width: 100%;
		padding: 0px 5px;
	}
	
	#btn{
		margin-top: 10px;
		margin-bottom: 100px;
		text-align: center;
	}
	#btn input[type="button"] {
		padding: 5px 10px;
		background: #ffbf00;
	    border: none;
		border-radius: 5px;
		color: white;
		font-weight: bold;
		cursor: pointer;
	}
</style>
<body>
	<%@ include file="./main-header.jsp" %>
	<div id="container">
		<%@ include file="./main-community_menu.jsp" %>
		<div id="right">
			<form action="" name="frm" id="frm" method="POST">
			 	<div id="title">| 동호회 친목 |</div>
			 	<input type="text" id="subject" name ="subject" value="${ detail.mainBbs_subject }" maxlength="20" />
			    <textarea name="content" id="smarteditor" rows="10" cols="80" style="width:798px; height:300px;">
			    </textarea>
			    <div id="btn">
				    <input type="hidden" name="idx" value="${detail.mainBbs_id}">
				    <input type="button" id="cancelbutton" value="취소" />
				    <input type="button" id="savebutton" value="저장" />
			    </div>
		    </form>
		</div>		
	</div>
		
</body>
<script>
$(function(){
	//textarea에 값 넣기
	$("#smarteditor").val( '${detail.mainBbs_content }' );
	//console.log("초기 content: "+$("#smarteditor").val());
	
	
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
       	//console.log("content:"+$("#smarteditor").val());
       if($("#subject").val() == ""){
    	   alert("제목을 입력 해 주세요."); 
       }
       	if($("#smarteditor").val()== "<p>&nbsp;</p>" 
       	|| $("#smarteditor").val()== ""
       	|| $("#smarteditor").val()== '<p><br style="clear:both;">&nbsp;</p>' 
       	|| $("#smarteditor").val()== '<br style="clear:both;"><br>'
      	|| $("#smarteditor").val()== '<br style="clear:both;">'){
       		alert("내용을 입력 해 주세요.");
       	}else{
       		var str = $("#smarteditor").val();
       		var pattern = /src="(.*?)"/g;
       		var list = str.match(pattern);
       		if(list !=null){
       			for(var i=0; i < list.length; i++){
       				list[i] = list[i].substring(list[i].lastIndexOf('/') + 1);
        			list[i] = list[i].substring(0, list[i].length - 1);
       			}
       		}
       		var param = "";
   			var count =0; //선언
   			if(list != null) {
       			for(var i = 0; i < list.length; i++){
       				param += "&filePath"+i+"="+list[i];
       				//console.log(param);
       				count++;
       				//console.log("textarea 파일 개수 : "+count);
       			}
   			}
   			//console.log("글 수정 test");
   			$("#frm").attr("action","friendShipBbsUpdate?count="+count+param);
       		$("#frm").submit();	
       	}
    });
    
    //수정 취소  클릭 시 
    $("#cancelbutton").click(function(){
    	if(confirm("수정 취소하시겠습니까?")){ 
    		location.href="./friendShipBbsdetail?idx=${detail.mainBbs_id}&updateAfter=0";
    	}
    });
    
})
</script>
</html>