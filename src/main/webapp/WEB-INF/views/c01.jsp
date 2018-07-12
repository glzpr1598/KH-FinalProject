<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="icon" href="./resources/image/icon-32.png" />
<title>HAMO - 동호회</title>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<style>
	/* 사진 */
	#picture {
		box-sizing: border-box;
		width: 600px;
		border: medium solid #ffbf00;
		border-radius: 5px;
	}
	
	/* 소개글 */
	#introduce {
		box-sizing: border-box;
		width: 600px;
		font-size: 14px;
		margin-top: 10px;
		padding: 10px;
		border: medium solid #ffbf00;
		border-radius: 5px;
	}
	
	/* 버튼 */
	#buttons {
		width: 600px;
		margin-top: 10px;
		text-align: right;
	}
	.masterBtn {
		padding: 5px;
		background-color: #ffbf00;
		border: none;
		border-radius: 5px;
		color: white;
		font-weight: bold;
		font-size: 13px;
		cursor: pointer;
	}
</style>
</head>
<body>
	<!------------------- 양식 ------------------->
	<%@ include file="./club-header.jsp" %>
	<div id="container">
		<%@ include file="./club-menu.jsp" %>
		<div id="right"> <!-- width: 800px -->
	<!------------------- 양식 ------------------->
			<img id="picture" src="./resources/club-picture/default.png"></img>
			<div id="introduce"></div>
			<div id="buttons">
				<input class="masterBtn" id="pictureEdit" type="hidden" value="사진 수정" />
				<input class="masterBtn" id="introduceEdit" type="hidden" value="글 수정" />
			</div>
	<!------------------- 양식 ------------------->
		</div>
	</div>
	<!------------------- 양식 ------------------->
</body>
<script>
	// 동호회 아이디
	var club_id = "<%= request.getParameter("club_id") %>"; 
	
	// 사진 수정 클릭
	$("#pictureEdit").click(function() {
		var url = "./clubPictureUploadForm?club_id=" + club_id;
		var option = "width=360, height=160, left=200, top=100";
		window.open(url, "_blank", option);
	});

	// 동호회가 폐쇄 예정인지 검사
    $.ajax({
        url: "./clubCloseCheck",
        type: "post",
        data: {
            "club_id": club_id
        },
        dataType: "json",
        success: function(data) {
        	// 폐쇄 예정일이 있으면
        	if(data.clubClose_date != null) {
        		// 쿠키가 등록되어있지 않으면
        		if(getCookie("clubClose"+club_id) != "no") {
        			var url = "./clubCloseAlert?clubClose_date=" + data.clubClose_date +
        					"&club_id=" + club_id;
        			var option = "width=350px, height=160px left=200px top=100px";
	        		window.open(url, "_blank", option);
        		}
        	}
        },
        error: function(err) {console.log(err);}
    });
	
	// 쿠키 가져오기 함수
	function getCookie(name){
        var nameOfCookie = name + "=";
        var x = 0;
        while (x <= document.cookie.length){
            var y = (x + nameOfCookie.length);
            if (document.cookie.substring(x, y) == nameOfCookie){
            if ((endOfCookie = document.cookie.indexOf(";", y)) == -1){
            endOfCookie = document.cookie.length;
            }
            return unescape (document.cookie.substring(y, endOfCookie));
            }
            x = document.cookie.indexOf (" ", x) + 1;
            if (x == 0) break;
        }
        return "";
    }

</script>
</html>