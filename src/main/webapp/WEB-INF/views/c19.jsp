<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
	<link rel="icon" href="./resources/image/icon-32.png" />
	<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>HAMO</title>
	<style>
		textarea{
			font-size: 20px;
			width: 100%;
			resize: none;
			margin-bottom: 20px;
		}
		button{
			width: 100px;
			padding: 7px 0px;
			margin-top : 5px;
			margin-bottom: 15px;
			background-color: #ffbf00;
			border: none;
			border-radius: 5px;
			color: white;
			font-weight: bold;
			font-size: 14px;
			cursor: pointer;
			position: relative;
			left: 50%;
		}
		p{
			width: 700px;
		}
		table,tr,td{
			border: 1px solid black;
			border-collapse: collapse;
		}
		a{
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
					<h1> | 모임일정 | </h1>
					<h2 id="subject">제목 :${list.meetingPlan_subject}</h2>
					<h4>회비 :${list.meetingPlan_money}</h4>
					<h4>모임일시 : ${list.meetingPlan_when}</h4>
					<h4>내용</h4></br>
					<input type="hidden" value="${list.meetingPlan_locationX}" id="locationX"/>
					<input type="hidden" value="${list.meetingPlan_locationY}" id="locationY"/>
					<textarea readonly  rows="10" cols="70">${list.meetingPlan_content}</textarea>
					<div id="map" style="width:800px;height:350px;"></div>
					<hr>
					<button id="attend">참석</button>
					<p><b>참석자</b></p>
					<p id="attendName"></p>
					<input type="hidden" value="${list.meetingPlan_id}" id="meetingPlan_id"/>
					<hr>
					
					<div id="reply">
						댓글 <span id="replyCount"></span>
						<table id="replyTable">
						</table>
					</div>
					<div id="replyfrm">
							<input type="text" maxlength="150" id="replyContent" name="replyContent"/>
							<input id="save" type="button" value="등록"/>
					</div>
					
					<div id="btn">
						<button id="back">목록</button>
						<button id="update">수정</button>
						<button id="del">삭제</button>
					</div>	
					
				<!------------------- 양식 ------------------->
			</div>
		</div>
		<!------------------- 양식 ------------------->
	</body>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=217bc7d15bb1073faf6529f765e194a5&libraries=services"></script>
	<script>	
	$(document).ready(function(){
		
		//댓글
		$.ajax({
			type: "post",
			dataType: "JSON",
			error: function(e) {console.log(e)},
			url: "./replyList",
			data: {
				"meetingPlan_id": $("#meetingPlan_id").val(),
				"member_id": "<%= session.getAttribute("userId") %>",
				"replyContent": $("#replyContent").val()
			},
			success: function(data) {
				console.log(data);
				console.log(data.list);
				replyList(data.list);
			}
		});
		function replyList(list){
			console.log(list);
			var content ="";
			list.forEach(function(item, idx){
				content += "<tr>";
				content += "<td>"+item.clubJoin_nickname+"</td>";
				content += "<td><input class='reply' type='hidden' value='"+item.meetingPlanReply_id+"'/>"+item.meetingPlanReply_date+"</td>";
				content += "<td rowspan=2><a class='replyDel'>삭제</a></td>";
				content += "</tr>";
				content += "<tr>";
				content += "<td colspan=2>"+item.meetingPlanReply_content+"</td>";
			});		  
			$("#replyTable").empty();
			$("#replyTable").append(content);
			    
		}
		//댓글 삭제
	 	$(document).on("click",".replyDel",function() {
			$.ajax({
				type: "post",  
				dataType: "JSON",
				error: function(e) {console.log(e)},
				url: "./replyDel",
				data: {
					"meetingPlanReply_id":  $(".reply").val(),
					"member_id": "<%= session.getAttribute("userId") %>"
				},
				success: function(data) {
					console.log(data.list);
					$(document).ready(function() {
						$.ajax({
							type: "post",
							dataType: "JSON",
							error: function(e) {console.log(e)},
							url: "./replyList",
							data: {
								"meetingPlan_id": $("#meetingPlan_id").val(),
								"member_id": "<%= session.getAttribute("userId") %>",
								"replyContent": $("#replyContent").val()
							},
							success: function(data) {
								replyList(data.list);
							}
						});
					});
				}
			});
			
		}); 
		//댓글 등록
		$("#save").click(function() {
			$.ajax({
				type: "post",
				dataType: "JSON",
				error: function(e) {console.log(e)},
				url: "./replyAdd",
				data: {
					"meetingPlan_id": $("#meetingPlan_id").val(),
					"member_id": "<%= session.getAttribute("userId") %>",
					"replyContent": $("#replyContent").val()
				},
				success: function(data) {
					$(document).ready(function() {
						$.ajax({
							type: "post",
							dataType: "JSON",
							error: function(e) {console.log(e)},
							url: "./replyList",
							data: {
								"meetingPlan_id": $("#meetingPlan_id").val(),
								"member_id": "<%= session.getAttribute("userId") %>",
								"replyContent": $("#replyContent").val()
							},
							success: function(data) {
								replyList(data.list);
							}
						});
					});
				}
			});
		});
	
		var obj = {};
		obj.error=function(e){console.log(e)};
		obj.type="POST";
		obj.dataType = "JSON";
		obj.data={"meetingPlan_id": $("#meetingPlan_id").val(),
				"club_id": "<%= request.getParameter("club_id") %>",
				"member_id":"<%= session.getAttribute("userId") %>",
				
		};
		
		// 참석자 리스트
		obj.url="./meetingAttendList";
		obj.success = function(data){
			console.log(data);
			console.log(data.btn);
			if(data.btn>=1){
				$("#attend").html("참석취소");	
			}
			$("#attend").click(function(){
				if($("#attend").html()=="참석"){
					obj.url="./meetingAttend";
					obj.success = function(data){
						console.log(data);
						$("#attend").html("참석취소");
						$(document).ready(function(){
							obj.url="./meetingAttendList";
							obj.success = function(data){
								console.log(data);
								console.log(data.btn);
								listPrint(data.list);
							}
							ajaxCall(obj);
						});
		 			}
					ajaxCall(obj);
				}else if ($("#attend").html()=="참석취소"){
					obj.url="./meetingAttendCancel";
					obj.success = function(data){
						console.log(data);
						$("#attend").html("참석");
						$(document).ready(function(){
							obj.url="./meetingAttendList";
							obj.success = function(data){
								console.log(data);
								console.log(data.btn);
								listPrint(data.list);
							}
							ajaxCall(obj);
						});
					} 
					ajaxCall(obj);
				}
			});
			listPrint(data.list);
		}
		ajaxCall(obj);
		
		    
		
		function listPrint(list){
			console.log(list);
			var content ="";
			list.forEach(function(item, idx){
				content += item +" , ";
			});		
			$("#attendName").empty();
			$("#attendName").append(content);
			
		}
		function ajaxCall(param){
			$.ajax(param);
		}
	
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new daum.maps.LatLng($("#locationX").val(), $("#locationY").val()), // 지도의 중심좌표
	        level: 3, // 지도의 확대 레벨
	        mapTypeId : daum.maps.MapTypeId.ROADMAP // 지도종류
	    }; 

		// 지도를 생성한다 
		var map = new daum.maps.Map(mapContainer, mapOption); 
		
		// 지도 타입 변경 컨트롤을 생성한다
		var mapTypeControl = new daum.maps.MapTypeControl();
		
		// 지도의 상단 우측에 지도 타입 변경 컨트롤을 추가한다
		map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);	
		
		// 지도에 확대 축소 컨트롤을 생성한다
		var zoomControl = new daum.maps.ZoomControl();
		
		// 지도의 우측에 확대 축소 컨트롤을 추가한다
		map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);
		// 마커 이미지의 주소
		var markerImageUrl = 'http://icons.iconarchive.com/icons/icons-land/vista-map-markers/256/Map-Marker-Push-Pin-1-Azure-icon.png', 
		    markerImageSize = new daum.maps.Size(40, 42), // 마커 이미지의 크기
		    markerImageOptions = { 
		        offset : new daum.maps.Point(20, 42)// 마커 좌표에 일치시킬 이미지 안의 좌표
		    };
		
		// 마커 이미지를 생성한다
		var markerImage = new daum.maps.MarkerImage(markerImageUrl, markerImageSize, markerImageOptions);
		
		// 지도에 마커를 생성하고 표시한다
		var marker = new daum.maps.Marker({
		    position: new daum.maps.LatLng($("#locationX").val(), $("#locationY").val()), // 마커의 좌표
		    image : markerImage, // 마커의 이미지
		    map: map // 마커를 표시할 지도 객체
		});
		
		// 마커 위에 표시할 인포윈도우를 생성한다
		var infowindow = new daum.maps.InfoWindow({
		    content : '<div style="padding:5px;" >여기</div>' // 인포윈도우에 표시할 내용
		});
		
		// 인포윈도우를 지도에 표시한다
		infowindow.open(map, marker);
	});
	</script>
</html>