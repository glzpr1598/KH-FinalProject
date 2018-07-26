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
		#menu5{
			font-weight: bold;
			color: black;
		}
		
		#title {
			font-weight: bold;
			font-size: large;
		}
		
		#right #subject {
			margin-top: 20px;
			padding: 10px;
			font-size: 14px;
			font-weight: bold;
			border-top: thin solid #ffbf00;
			border-bottom: thin dashed #ffbf00;
		}
		
		#c {
			padding: 10px 10px 0px 10px; 
			font-size: 12px;
		}
		#d {
			margin-top: 10px;
			padding: 10px;
			font-size: 13px;
		}
		.gray {
			color: gray;
		}
		#content {
			padding: 10px 10px 50px 10px;
			font-size: 13px;
		}
		
		#attendArea {
			padding: 10px;
		}
		.btnArea {
			text-align: center;
		}
		.btnAreaRight {
			margin-top: 10px;
			text-align: right;
		}
		button{
			padding: 5px 10px;
			background: #ffbf00;
		    border: none;
			border-radius: 5px;
			color: white;
			font-weight: bold;
			cursor: pointer;
		}
		#attendTitle {
			font-size: 13px;
			font-weight: bold;
		}
		#attendName {
			margin-top: 10px;
			font-size: 13px;
		}
		
		#reply_count {
			padding: 10px;
			font-size: 13px;
		}
		#reply{
			background-color: #FDF5DC;
			padding: 5px 15px;
			font-size: 12px;
			border-bottom: thin solid #ffbf00;
		}
		#replyArea{
			background-color: #FDF5DC;
			width: 100%;
		}
		.reply {
			padding: 10px 0px;
			border-bottom: thin dashed #ffbf00;
		}
		.reply .date {
			font-size: 11px;
			color: #848484;
		}
		.reply .replyDel {
			float: right;
			color: black;
			text-decoration: none;
		}
		.reply .replyDel:hover {
			text-decoration: underline;
			cursor: pointer;
		}
		.reply .replyContent {
			margin-top: 5px;
		}
		
		#replyfrm {
			padding: 15px 0px;
		}
		#replyfrm #replyContent {
			width: 690px;
		    height: 50px;
		    resize: none;
		    border: thin solid #BDBDBD;
		}
		#replyfrm #save {
			float: right;
			width: 70px;
		    height: 50px;
		    background: white;
		    border: thin solid #BDBDBD;
		    cursor: pointer;
		}
		
		a{
			cursor: pointer;
		}
		#replyTable{
			width: 800px;
		}
		.delA{
			width:50px; 
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
					<div id="title"> | 모임일정 | </div>
					<div id="subject">${list.meetingPlan_subject}</div>
					<div id="c"><b>${list.clubJoin_nickname}</b> | ${list.meetingPlan_date}</div>
					<div id="d">
						<div id="day"><span class="gray">일시</span> ${list.meetingPlan_when}</div>
						<div id="money"><span class="gray">회비</span> ${list.meetingPlan_money}</div>
					</div>
					<input type="hidden" value="${list.member_id}" id="member"/>
					<input type="hidden" value="${list.meetingPlan_locationX}" id="locationX"/>
					<input type="hidden" value="${list.meetingPlan_locationY}" id="locationY"/>
					<div id="content">${list.meetingPlan_content}</div>
					<div id="map" style="width:800px;height:400px;"></div>
					
					<div id="attendArea">
						<div class="btnArea">
							<button id="attend">참석</button>
						</div>
						<div id="attendTitle">참석자</div>
						<div id="attendName"></div>
						<input type="hidden" value="${list.meetingPlan_id}" id="meetingPlan_id"/>
					</div>
					
					<div id="reply_count">댓글 <span id="replyCount"></span></div>
					<div id="reply">
						<div id="replyArea">
						</div>
						<div id="replyfrm">
							<textarea rows="3" cols="88" id="replyContent" name="replyContent" maxlength="100"></textarea>
							<input id="save" type="button" value="등록"/>
						</div>
					</div>
					
					<div class="btnAreaRight">
						<button id="back" onclick="location.href='clubMeetingList?club_id=<%= request.getParameter("club_id") %>'">목록</button>
						<button id="update" onclick="location.href='clubMeetingUpdateForm?club_id=<%= request.getParameter("club_id") %>&member_id=<%= session.getAttribute("userId") %>&meetingPlan_id=${list.meetingPlan_id}'" >수정</button>
						<button id="del" onclick="location.href='clubMeetingDel?meetingPlan_id=${list.meetingPlan_id}&member_id=<%= session.getAttribute("userId") %>&club_id=<%= request.getParameter("club_id") %>'">삭제</button>          
					</div>	
					
				<!------------------- 양식 ------------------->
			</div>
		</div>
		<!------------------- 양식 ------------------->
	</body>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=217bc7d15bb1073faf6529f765e194a5&libraries=services"></script>
	<script>
	//console.log("+++++++++++++++++++++");
	//console.log($("#member").val());
	$("#save").click(function(){
		if($("#replyContent").val()==""){         
			alert("댓글을 입력해 주세요");
		}
	});	
	   
	if($("#member").val()!="<%= session.getAttribute("userId") %>"){
		$("#update").hide();
		$("#del").hide();
	} 
	                
	       
	var replyCount;
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
				"replyContent": $("#replyContent").val(),
				"club_id":"<%= request.getParameter("club_id") %>",
			},
			success: function(data) {
				//console.log(data);    
				replyList(data.list);
				replyCount = data.replyCount;   
				$("#replyCount").html(replyCount);   
				     
			}
		});
		function replyList(list){
			//console.log(list);
			var userId = "${sessionScope.userId}";
			var content ="";
			list.forEach(function(item, idx){
				content += "<div class='reply'>";
				content += "<span><b>"+item.clubJoin_nickname+"</b></span> ";
				content += "<span class='date'>"+item.meetingPlanReply_date+"</span>";
				if(userId != item.member_id){
					content += "<a class='replyDel' id='"+item.meetingPlanReply_id+"' style='display:none'>삭제</a>";
				}else{
					content += "<a class='replyDel' id='"+item.meetingPlanReply_id+"'>삭제</a>";
				}
				content += "<div class='replyContent'>"+item.meetingPlanReply_content+"</div>";
				content += "</div>"
			});		  
			$("#replyArea").empty();
			$("#replyArea").append(content);
			
		}
		//댓글 삭제
	 	$(document).on("click",".replyDel",function() {
	 		if(confirm("댓글을 삭제하시겠습니까?")){
				$.ajax({
					type: "post",  
					dataType: "JSON",
					error: function(e) {console.log(e)},
					url: "./replyDel",
					data: {
						"meetingPlanReply_id":  $(this).attr('id'),     
						"member_id": "<%= session.getAttribute("userId") %>"
					},
					success: function(data) {
						//console.log(data.list);
						$(document).ready(function() {
							$.ajax({
								type: "post",
								dataType: "JSON",
								error: function(e) {console.log(e)},
								url: "./replyList",
								data: {
									"meetingPlan_id": $("#meetingPlan_id").val(),
									"member_id": "<%= session.getAttribute("userId") %>",
									"replyContent": $("#replyContent").val(),
									"club_id":"<%= request.getParameter("club_id") %>"
								},
								success: function(data) {
									replyList(data.list);
									replyCount = data.replyCount;   
									$("#replyCount").html(replyCount);    
									
								}
							});
						});
					}
				});
	 		}
		}); 
		//댓글 등록
		$("#save").click(function() {
			$.ajax({
				type: "post",
				dataType: "JSON",
				error: function(e) {
					console.log(e);
					//alert("동호회 회원가입해야 댓글을 작성할 수 있습니다. ");
				},
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
								"replyContent": $("#replyContent").val(),
								"club_id":"<%= request.getParameter("club_id") %>"
							},
							success: function(data) {
								replyList(data.list);
								replyCount = data.replyCount;
								$("#replyCount").html(replyCount); 
								$("#replyContent").val(""); 
							}
						});
					});
				}
			});
		});
	
		var obj = {};
		obj.error=function(e){
			console.log(e);
			//alert("동호회 회원가입해야 참석할 수 있습니다. ");
		};
		obj.type="POST";
		obj.dataType = "JSON";
		obj.data={"meetingPlan_id": $("#meetingPlan_id").val(),
				"club_id": "<%= request.getParameter("club_id") %>",
				"member_id":"<%= session.getAttribute("userId") %>",
				
		};
		// 참석자 리스트
		obj.url="./meetingAttendList";
		obj.success = function(data){
			//console.log(data);
			//console.log(data.btn);
			if(data.btn>=1){
				$("#attend").html("참석취소");	
			}
			$("#attend").click(function(){
				if($("#attend").html()=="참석"){
					obj.url="./meetingAttend";
					obj.success = function(data){
						//console.log(data);
						$("#attend").html("참석취소");
						$(document).ready(function(){
							obj.url="./meetingAttendList";
							obj.success = function(data){
								//console.log(data);
								//console.log(data.btn);
								listPrint(data.list);
							}
							ajaxCall(obj);
						});
		 			}
					ajaxCall(obj);
				}else if ($("#attend").html()=="참석취소"){
					obj.url="./meetingAttendCancel";
					obj.success = function(data){
						//console.log(data);
						$("#attend").html("참석");
						$(document).ready(function(){
							obj.url="./meetingAttendList";
							obj.success = function(data){
								//console.log(data);
								//console.log(data.btn);
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
			//console.log(list);
			var content ="";
			list.forEach(function(item, idx){
				content += item +", ";
			});		
			if(content.length > 2) {
				content = content.substring(0, content.length-2);
			}
			$("#attendName").empty();
			$("#attendName").append(content);
			
		}
		function ajaxCall(param){
			$.ajax(param);
		}
	
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new daum.maps.LatLng($("#locationX").val(), $("#locationY").val()), // 지도의 중심좌표
	        level: 5, // 지도의 확대 레벨
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
		var markerImageUrl = 'http://icons.iconarchive.com/icons/paomedia/small-n-flat/128/map-marker-icon.png', 
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
		/* var infowindow = new daum.maps.InfoWindow({
		    content : '<div style="padding:5px;" >여기</div>' // 인포윈도우에 표시할 내용
		}); */
		
		// 인포윈도우를 지도에 표시한다
		//infowindow.open(map, marker);
	});
	</script>
</html>