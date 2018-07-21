<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="//code.jquery.com/jquery-3.1.0.min.js"></script>
<title>HAMO</title>
<style>
	#menu4 {
		font-weight: bold;
		color: black;
	}
	#title{
		font-weight: bold;
		font-size: large;
	}
	#border{
		border-bottom: 1px solid #ffbf00;
		width: 800px;
		margin-top: 20px;
	}
	
	#imgList {
		margin-top: 20px;
	}
	.imgArea {
		display: inline-block;
		margin: 10px;
		width: 180px;
		height: 200px;
	}
	.imgArea img {
		object-fit: cover;
		width: 180px;
		height: 180px;
	}
	.imgArea .imgSubject {
		font-size: 13px;
		font-weight: bold;
		color: black;
		text-decoration: none;
	} 
	.imgArea .imgSubject:hover {
		text-decoration: underline;
	}
	
	
	#writeArea {
		text-align: right;
	}
	#write{
		margin-top: 10px;
		border:none;
		border-radius: 5px;
		background-color: #FFBF00;
		color:white;
		padding:5px 10px;
		cursor: pointer;
		font-weight: bold;
		display: none;
	}
	
	#space {
		height: 100px;
	}
</style>
</head>
<body>
<jsp:include page="./club-header.jsp"/>
<div id="container">
	<jsp:include page="./club-menu.jsp"/>
	<div id="right">
		<div id="title">| 사진첩 |</div>
		<div id="border"></div>
		<div id="imgList"></div>
		<div id="writeArea">
			<input id="write" type="button" value="글쓰기"/>
		</div>
		<div id="pagingArea"></div>
		<div id="space"></div>
	</div>
</div>
</body>
<link href="./resources/paging/paging.css" type="text/css" rel="stylesheet">
<link href="https://use.fontawesome.com/releases/v5.1.1/css/all.css" rel="stylesheet" integrity="sha384-O8whS3fhG2OnA5Kas0Y9l3cfpmYjapjI0E4theH4iuMD+pLhbf6JI0jIMfYcK3yZ" crossorigin="anonymous">
<script>
	$(document).ready(function(){
		$.ajax({
			type : "get",
			url: "./clubPhotoBbsListForm",
			dataType:"json",
			data:{
				"club_id":"<%=request.getParameter("club_id")%>",
				"sort": "<%=request.getParameter("sort")%>"
			},
			success:function(data){
				console.log(data.list);
				console.log(data.photolist);
				//listPrint(data.list, data.photolist);
				$.pagingHash(data.list, data.photolist, 12, 10, listPrint);
				if(data.nick != null){
					document.getElementById("write").style.display='inline';
				}else{
					document.getElementById("write").style.display='none';
				}
			},
			error:function(e){
				console.log(e);
			}
		});
		
		function listPrint(list, photolist){
			var content = "";
			list.forEach(function(item, index){
				// 제목 10글자 이상이면 자르기
				if(item.clubBbs_subject.length > 10) {
					item.clubBbs_subject = item.clubBbs_subject.substring(0, 10)+"...";
				}
				content += "<div class='imgArea'>";
				content += "<a href='./clubPhotoBbsDetail?club_id="+<%=request.getParameter("club_id")%>+"&clubBbs_id="+item.clubBbs_id+"'>";
				content += "<img src='/hamo/resources/multiuploader/"+photolist[index]+"'>";
				content += "</a>";
				content += "<a class='imgSubject' href='./clubPhotoBbsDetail?club_id="+<%=request.getParameter("club_id")%>+"&clubBbs_id="+item.clubBbs_id+"'>"+item.clubBbs_subject+"</a>";
				content += "</div>";
			});
			console.log(content);
			$("#imgList").html(content);
		}
		
	});
	
	$("#write").click(function(){
		location.href="./clubPhotoBbsWriteForm?club_id="+<%=request.getParameter("club_id")%>;
	});
	
	
	/*************************** 페이징 플러그인 *****************************/
	$.pagingHash = function(list, photolist, listCount, pageCount, func) {

		// 해쉬 변경 이벤트
		$(window).on("hashchange", function() {
			var page = location.hash.substring(1);
			// 해쉬가 없으면 1페이지로
			if(page == "") {
				page = 1;
			}
			pagingPrint(page);
		})
    	
		// 최초 로드 시 해쉬 가져옴
		var page = location.hash.substring(1);
		// 해쉬가 없으면 1페이지로
		if(page == "") {
			page = 1;
		}
		
		// 해당 페이지 출력
		pagingPrint(page);
		
    	// 페이징하여 출력하는 함수
    	function pagingPrint(page) {
    		var totalCount;  // 총 데이터 수
    		var totalPage;  // 총 페이지 수
    		var startPage;  // 화면에 보여줄 시작 페이지
    		var endPage;  // 화면에 보여줄 마지막 페이지
    		var startNum;   // 페이지에서 보여줄 첫번째 글번호
    		var endNum;   // 페이지에서 보여줄 마지막 글번호
    		var nextPage;   // 다음 눌렀을 때 이동할 페이지
    		var prevPage;   // 이전 눌렀을 때 이동할 페이지
    		
    		/********************
    		 * 변수 계산
    		 ********************/
    		// 총 데이터 수
    		totalCount = list.length;
    		
    		// 총 페이지수(나누어 떨어질 때 마지막 페이지가 빈페이지로 표시되는 것 방지)
    		totalPage = parseInt(totalCount / listCount);
    		if (totalCount % listCount > 0) {
    			totalPage++;
    		}
    		// 총 페이지수보다 큰 페이지를 입력한 경우 처리
    		if (totalPage < page) {
    			page = totalPage;
    		}
    		
    		// 화면에 보여줄 시작 페이지
    		startPage = (parseInt((page - 1) / pageCount)) * pageCount + 1;
    		// 화면에 보여줄 마지막 페이지
    		endPage = startPage + pageCount - 1;
    		
    		// 마지막 화면에서의 처리
    		if (endPage > totalPage) {
    			endPage = totalPage;
    		}
    		
    		// 페이지에서 보여줄 시작 글번호
    		startNum = (page - 1) * listCount + 1;
    		// 페이지에서 보여줄 마지막 글번호
    		endNum = page * listCount;
    		
    		// 다음 눌렀을 때 이동할 페이지
    		nextPage = endPage + 1;
    		// 이전 눌렀을 때 이동할 페이지
    		prevPage = startPage - 1;
    		
    		
    		/********************
    		 * 리스트 출력
    		 ********************/
    		// 해당 구간 리스트 추출
    		var result1 = list.slice(startNum-1, endNum);
    		var result2 = photolist.slice(startNum-1, endNum);
    		// 출력
    		func(result1, result2);

    		
    		/********************
    		 * 페이징 버튼 출력
    		 ********************/
    		// 초기화
    		$("#pagingArea").html("");
    		
    		// 맨앞
    		if (startPage > 1) {
    			$("#pagingArea").append("<a class='icon' href='#1'>&nbsp;<i class='fas fa-angle-double-left'></i>&nbsp;</a>");
    		}
    		
    		// 이전
    		if (startPage > 1) {
    			$("#pagingArea").append("<a class='icon prev' href='#"+prevPage+"'>&nbsp;<i class='fas fa-angle-left'></i>&nbsp;</a>");
    		}
    		
    		// 페이지 번호
    		for (var i = startPage; i <= endPage; i++) {
    			if (i == page) {  // 현재 페이지는 class='currPage' 부여
    				$("#pagingArea").append("<a class='currPage num' href='#"+i+"'>" + i + "</a>");
    			} else {
    				$("#pagingArea").append("<a class='num' href='#"+i+"'>" + i + "</a>");
    			}
    		}
    		
    		// 다음
    		if (endPage != totalPage) {
    			$("#pagingArea").append("<a class='icon next' href='#"+nextPage+"'>&nbsp;<i class='fas fa-angle-right'></i>&nbsp;</a>");
    		}
    		
    		// 맨뒤
    		if (endPage != totalPage) {
    			$("#pagingArea").append("<a class='icon' href='#"+totalPage+"'>&nbsp;<i class='fas fa-angle-double-right'></i>&nbsp;</a>");
    		}
    	};
    };
</script>
</html>