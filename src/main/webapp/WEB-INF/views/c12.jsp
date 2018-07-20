<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="//code.jquery.com/jquery-3.1.0.min.js"></script>
<script type="text/javascript" src="<%= request.getContextPath() %>/resources/se2/js/HuskyEZCreator.js" charset="utf-8"></script>
<title>Insert title here</title>
<style>
	#save{
		border: none;
		background-color: #ffbf00;
		width: 70px;
		height: 30px;
		margin-left:3%;
		margin-top:3%;
		font-weight: 600;
		color: white;
		text-align: center;
		cursor: pointer;
	}
	#cancel{
		border: none;
		background-color: #ffbf00;
		width: 70px;
		height: 30px;
		margin-left:37%;
		text-align: center;
		color: white;
		font-weight: 600;
		font-size: small;
		cursor: pointer;
	}
	#writefrm{
		margin-left:0.5%;
		margin-top:2%;
		width: 800px;
	}
	#title{
		margin-left:0.5%;
		font-weight: 600;
		font-size: large;
	}
	#text{
		width: 400px;
		height: 30px;
		margin-bottom: 2%;
	}
</style>
</head>
<body>
	<jsp:include page="club-header.jsp"/>
	<div id="container">
		<jsp:include page="club-menu.jsp"/>
		<div id="right">
			<div id="title">| 자유게시판 |</div>
			<form action="" name="writefrm" id="writefrm" method="post">
				<input id="text" type="text" name="subject" placeholder="제목을 입력하세요" maxlength="20" value="${info.clubBbs_subject}"/>
		    	<textarea name="editor" id="editor" rows="10" cols="100" style="width:766px; height:412px;">${info.clubBbs_content}</textarea>
		    	<div id="btn">
	    			<input id="cancel" type="button" value="취소"/>
	    			<button id="save">저장</button>
	    		</div>
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
		sSkinURI: "<%= request.getContextPath() %>/resources/se2/SmartEditor2Skin.html",
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
		oEditors.getById["editor"].exec("UPDATE_CONTENTS_FIELD", []);
		
		if($("#text").val() == ""){
			alert("제목을 입력하세요");
		}else if($("#editor").val() == "<p>&nbsp;</p>" 
		|| $("#editor").val() == "" 
		|| $("#editor").val() == "<p><br style='clear:both;'>&nbsp;<p>" 
		|| $("#editor").val() == "<br style='clear:both;'><br/>" 
		|| $("#editor").val() == "<br style='clear:both;'>"){
			alert("내용을 입력하세요.");
		}else{
			if($("#editor").val().length > 2000){
				alert("최대 2000자까지 입력 가능합니다.");
				return;	
			}else{
				var str = $("#editor").val();

				var pattern = /src="(.*?)"/g;
				var list = str.match(pattern);
				if(list != null){
					for(var i = 0; i < list.length; i++) {
						   list[i] = list[i].substring(list[i].lastIndexOf('/')+1);
						   list[i] = list[i].substring(0, list[i].length - 1);
						}
				}
				
				var param = "";
				if(list != null){
					for(var i = 0; i < list.length; i++){
						param += "&filePath"+i+"="+list[i];
						count++;
					}
				}
				$("#writefrm").attr("action","./clubFreeBbsUpdate?&club_id="+${info.club_id}+"&clubBbs_id="+${info.clubBbs_id}+param+"&count="+count)
				$("#writefrm").submit();
			}
		}
	});
	
	$("#cancel").click(function(){
		location.href="./clubFreeBbsDetail?club_id=${info.club_id}&clubBbs_id=${info.clubBbs_id}";
	});
</script>
</html>