<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
	<head>
	<link rel="icon" href="./resources/image/icon-32.png" />
	<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
	<link  rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>HAMO</title>
	<style>
		#myclub{
			background-color: #FDF5DC;
			color: black;
		}
		table{
			margin: 10px 0px 10px 0px;
			width : 1000px;
			text-align: center;
			border-collapse: collapse;
			font-size: 13px;
		}
		th{
			background-color:#FDF5DC;
			height: 35px;
		}
		td{
			border-bottom: 1px solid #ffbf00;
			height: 35px;
		}
		#div1{
			width: 1000px;
			margin: auto;
		}
		i{
			color: #FFBF00;
		}
		.btnOut{
			background-color:white; 
			border: 1px solid #FFBF00;
			border-radius: 5px;
			padding: 3px 7px;
			font-size: 13px;
			cursor: pointer;
		}
		form{
			margin: 0;
		}
		.sort {
			cursor:pointer;
			color: black;
			text-decoration: none;
			font-size: 12px;
		}
		.sort i, .sort span {
			font-size: 13px;
			cursor: pointer;
			color: #a4a4a4;
		}
		
		#day i, #joinDay i {
			color: #ffbf00;
		}
		#day span, #joinDay span {
			color: #000000;
		}
		.title {
			font-size: 20px;
			font-weight: bold;
			margin: 5px 0px;
		}
		.club {
			color: black;
			text-decoration: none;
		}
		.club:hover {
			text-decoration: underline;
		}
		.clubName {
			width: 500px;
		}
		
		#space {
			height: 100px;
		}
		
		/* 페이징 */
		.pagingArea {
			text-align: center;
			margin: 10px 0px;
		}
		.pagingArea a {
			box-sizing: border-box;
			display: inline-block;
		    line-height: 24px;
		    width: 26px;
		    color: black;
		    font-size: 12px;
		    font-weight: bold;
		    font-family: tahoma;
		    text-align: center;
		    text-decoration: none;
		    cursor: pointer;
		}
		/* 숫자 마우스 올렸을 때 */
		.pagingArea .num:hover {
			text-decoration: none;
			color: orange;
		}
		/* 기호 */
		.pagingArea .icon {
		    height: 20px;
		    line-height: 18px;
		    width: 20px;
		    border: thin solid lightgray;
		}
		/* 다음 버튼 */
		.pagingArea .next {
			margin-left: 10px;
		}
		/* 이전 버튼 */
		.pagingArea .prev {
			margin-right: 10px;
		}
		/* 현재 페이지 */
		.pagingArea .currPage {  
		    color: orange;
			border: thin solid lightgray;
		}
	</style>
		
	</head>
	<body>
		<%@ include file="./main-header.jsp" %>
		<div id="div1">
			<div id="myClubList">
				<div class="title">| 설립한 동호회 |</div>
				<a id="day" class="sort">
					<i class="fa fa-check"></i>
					<span>설립일순</span>
				</a>
				&nbsp;
				<a id="count" class="sort">
					<i class="fa fa-check"></i>
					<span>회원수순</span>
				</a>
				<table>
					<thead>					
						<tr>
							<th class="clubName">동호회명</th>
							<th>주제</th>
							<th>지역</th>
							<th>설립일</th>
							<th>회원수 </th>
						</tr>
					</thead>
					<tbody id="myClubListTable">
					<!-- 리스트 보여줄 자리 -->
					</tbody>
				</table>
				<div id="pagingArea1" class="pagingArea"></div>
			</div>
			<div >
				<div class="title">| 가입한 동호회 |</div>
				<a id="joinDay" class="sort">
					<i class="fa fa-check"></i>
					<span>설립일순</span>
				</a>
				&nbsp;
				<a id="joinCount" class="sort">
					<i class="fa fa-check"></i>
					<span>회원수순</span>
				</a>
				<table >
					<thead>	
						<tr>
							<th class="clubName">동호회명</th>
							<th>주제</th>
							<th>지역</th>
							<th>설립일</th>
							<th>회원수 </th>
							<th>탈퇴</th>
						</tr>
					</thead>
					<tbody id="myClubJoinTable">
					<!-- 리스트 보여줄 자리 -->
					</tbody>
				</table>
				<div id="pagingArea2" class="pagingArea"></div>
			</div>
			<div id="space"></div>
		</div>
	</body>
	<link href="./resources/paging/paging.css" type="text/css" rel="stylesheet">
	<link href="https://use.fontawesome.com/releases/v5.1.1/css/all.css" rel="stylesheet" integrity="sha384-O8whS3fhG2OnA5Kas0Y9l3cfpmYjapjI0E4theH4iuMD+pLhbf6JI0jIMfYcK3yZ" crossorigin="anonymous">
	<script>
	
		$(document).ready(function(){
			var obj = {};
			obj.error=function(e){console.log(e)};
			obj.type="POST";
			obj.dataType = "JSON";
			obj.url="./myClubList";
			obj.data = {"id": "<%= session.getAttribute("userId") %>"};
			obj.success = function(data){
				//listPrint1(data.myClubList);
				console.log(data.myClubList);
				$.paging(data.myClubList, 10, 5, listPrint1, 1);
				/* 설립일 순 클릭 햇을 때 */
				$("#day").click(function(){
					// 색 바꾸기
					$("#day i").css("color", "#ffbf00");
					$("#day span").css("color", "#000000");
					$("#count i").css("color", "#a4a4a4");
					$("#count span").css("color", "#a4a4a4");
					
					data.myClubList.sort(function(a, b) { // 내림차순
					    return a.club_date > b.club_date ? -1 : a.club_date < b.club_date ? 1 : 0;
					}); 
					//listPrint1(data.myClubList);
					$.paging(data.myClubList, 10, 5, listPrint1, 1);
				});
				 
				 /* 회원수 순 클릭 햇을 때 */
				$("#count").click(function(){
					// 색 바꾸기
					$("#day i").css("color", "#a4a4a4");
					$("#day span").css("color", "#a4a4a4");
					$("#count i").css("color", "#ffbf00");
					$("#count span").css("color", "#000000");
					
					data.myClubList.sort(function(a, b) { // 내림차순
					    return a.club_memberCount > b.club_memberCount ? -1 : a.club_memberCount < b.club_memberCount ? 1 : 0;
					}); 
					//listPrint1(data.myClubList);
					$.paging(data.myClubList, 10, 5, listPrint1, 1);
				});
			}
			ajaxCall(obj);
			
			
			
			obj.url="./myClubJoin";
			obj.data = {"id": "<%= session.getAttribute("userId") %>"};
			obj.success = function(data){
				 //console.log(data);
				 //listPrint2(data.myClubJoin);
				 $.paging(data.myClubJoin, 10, 5, listPrint2, 2);
				 
				 /* 설립일 순 클릭 햇을 때 */
				 $("#joinDay").click(function(){
					// 색 바꾸기
					$("#joinDay i").css("color", "#ffbf00");
					$("#joinDay span").css("color", "#000000");
					$("#joinCount i").css("color", "#a4a4a4");
					$("#joinCount span").css("color", "#a4a4a4");
				 
					 data.myClubJoin.sort(function(a, b) { // 내림차순
					     return a.club_date > b.club_date ? -1 : a.club_date < b.club_date ? 1 : 0;
					 }); 
					 //listPrint2(data.myClubJoin);
					 $.paging(data.myClubJoin, 10, 5, listPrint2, 2);
				});
				 
				 /* 회원수 순 클릭 햇을 때 */
				$("#joinCount").click(function(){
					// 색 바꾸기
					$("#joinDay i").css("color", "#a4a4a4");
					$("#joinDay span").css("color", "#a4a4a4");
					$("#joinCount i").css("color", "#ffbf00");
					$("#joinCount span").css("color", "#000000");
					
					data.myClubJoin.sort(function(a, b) { // 내림차순
					    return a.club_memberCount > b.club_memberCount ? -1 : a.club_memberCount < b.club_memberCount ? 1 : 0;
					}); 
					//listPrint2(data.myClubJoin);
					$.paging(data.myClubJoin, 10, 5, listPrint2, 2);
				});
			}
			ajaxCall(obj);
		
		
			function listPrint1(list){
				//console.log(list);
				var content ="";
				list.forEach(function(item, idx){
					content +="<tr>";
					content +="<td><a class='club' href='./clubMain?club_id="+item.club_id+"'>"+item.club_name+"</a></td>";
					content +="<td>"+item.interest_interest+"</td>";
					content +="<td>"+item.club_location+"</td>";
					content +="<td>"+item.club_date+"</td>";
					content +="<td>"+item.club_memberCount+"</td>";
					content += "</tr>";
					
				});		
				$("#myClubListTable").empty();
				$("#myClubListTable").append(content);
			}
			function listPrint2(list){
				//console.log(list);
				var content ="";
				list.forEach(function(item, idx){
					// 회장이 아닐 경우에만 출력
					if(item.member_id != "<%= session.getAttribute("userId") %>") {
						content +="<tr>";
						content +="<td><a class='club' href='./clubMain?club_id="+item.club_id+"'>"+item.club_name+"</a></td>";
						content +="<td>"+item.interest_interest+"</td>";
						content +="<td>"+item.club_location+"</td>";
						content +="<td>"+item.club_date+"</td>";
						content +="<td>"+item.club_memberCount+"</td>";
						content +="<td><form id='form1' action='myClubRemove'><input type='hidden' name='myClubRemove' value='"+item.clubJoin_id+"'/><input type='hidden' name='club_id' value='"+item.club_id+"'/><input class='btnOut' type='button' value='탈퇴'/></form></td>";
						content += "</tr>";
					}
				});		
				$("#myClubJoinTable").empty();
				$("#myClubJoinTable").append(content);
				
			}
			
			$(document).on("click", ".btnOut", function() {
				if(confirm('동호회를 탈퇴 하시겠습니까?')){
					$("#form1").submit();
				}
			});
			
			function ajaxCall(param){
				$.ajax(param);
			}
		
		});
		
		
		/* 페이징 플러그인 */
		
		$.paging = function(list, listCount, pageCount, func, num) {

    	// 클릭 이벤트
		$(document).on("click", "#pagingArea"+num+" a", function() {
			pagingPrint($(this).attr("id"), num);
		});
    	
		// 최초 1페이지 출력
		pagingPrint(1, num);
		
    	// 페이징하여 출력하는 함수
    	function pagingPrint(page, num) {
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
    		var result = list.slice(startNum-1, endNum);
    		// 출력
    		func(result);
    		
    		
    		/********************
    		 * 페이징 버튼 출력
    		 ********************/
    		// 초기화
    		$("#pagingArea"+num).html("");
    		
    		// 맨앞
    		if (startPage > 1) {
    			$("#pagingArea"+num).append("<a class='icon' id='1'>&nbsp;<i class='fas fa-angle-double-left'></i>&nbsp;</a>");
    		}
    		
    		// 이전
    		if (startPage > 1) {
    			$("#pagingArea"+num).append("<a class='icon prev' id='"+prevPage+"'>&nbsp;<i class='fas fa-angle-left'></i>&nbsp;</a>");
    		}
    		
    		// 페이지 번호
    		for (var i = startPage; i <= endPage; i++) {
    			if (i == page) {  // 현재 페이지는 class='currPage' 부여
    				$("#pagingArea"+num).append("<a class='currPage num' id='"+i+"'>" + i + "</a>");
    			} else {
    				$("#pagingArea"+num).append("<a class='num' id='"+i+"'>" + i + "</a>");
    			}
    		}
    		
    		// 다음
    		if (endPage != totalPage) {
    			$("#pagingArea"+num).append("<a class='icon next' id='"+nextPage+"'>&nbsp;<i class='fas fa-angle-right'></i>&nbsp;</a>");
    		}
    		
    		// 맨뒤
    		if (endPage != totalPage) {
    			$("#pagingArea"+num).append("<a class='icon' id='"+totalPage+"'>&nbsp;<i class='fas fa-angle-double-right'></i>&nbsp;</a>");
    		}
    	};
    };
			
	</script>
</html>