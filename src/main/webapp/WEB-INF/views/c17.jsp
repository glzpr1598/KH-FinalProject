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
		#title {
			font-weight: bold;
			font-size: large;
		}
		table{
		    margin-top: 20px;
		    width: 800px;
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
		.idx{
			width: 80px;
		}
		input[type="button"]{
			margin-top: 10px;
			padding: 5px 10px;
			background: #ffbf00;
		    border: none;
			border-radius: 5px;
			color: white;
			font-weight: bold;
			cursor: pointer;
		}
		#add{
			float: right;        
		}
		#right a{
			color: black;
			text-decoration: none;
		}
		#right a:hover{
			text-decoration: underline;
		}
		#menu5{
			font-weight: bold;
			color: black;
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
			<div id='title'> | 모임일정 | </div>
			<table id="listTable">    
				<thead>
					<tr>
						<th class="idx">글번호</th>
						<th class="subject">제목</th>
						<th>모임일시</th>
						<th>작성자</th>
						<th>작성일</th>
					</tr>
				</thead>
				<tbody >
				</tbody>
			</table>
			<div>
			<input type="button" value="등록" id="add" onclick="location.href='clubMeetingWriteForm?club_id=<%= request.getParameter("club_id") %>&member_id=<%= session.getAttribute("userId") %>'"/>
			</div>
			<div id="pagingArea"></div>
		<!------------------- 양식 ------------------->
			</div>
		</div>
		<!------------------- 양식 ------------------->
	</body>
	<script src="./resources/paging/paging.js" type="text/javascript"></script>
	<link href="./resources/paging/paging.css" type="text/css" rel="stylesheet">
	<link href="https://use.fontawesome.com/releases/v5.1.1/css/all.css" rel="stylesheet" integrity="sha384-O8whS3fhG2OnA5Kas0Y9l3cfpmYjapjI0E4theH4iuMD+pLhbf6JI0jIMfYcK3yZ" crossorigin="anonymous">
	<script>
		var obj = {};
		obj.error=function(e){console.log(e)};
		obj.type="POST";
		obj.dataType = "JSON";
		$(document).ready(function(){
			obj.url="./MeetingList";
			obj.data = {"club_id": "<%= request.getParameter("club_id") %>","member_id":"<%= session.getAttribute("userId") %>"};
			obj.success = function(data){
				//console.log(data);
				//listPrint(data.list);
				$.pagingHash(data.list, 10, 5, listPrint);
		}
			ajaxCall(obj);
		});
		function listPrint(list){
			//console.log(list);
			var content ="";
			list.forEach(function(item, idx){
				content +="<tr>";
				content +="<td>"+item.meetingPlan_idx+"</td>";
				content +="<td><a href='clubMeetingDetail?club_id="+<%= request.getParameter("club_id") %>+"&meetingPlan_id="+item.meetingPlan_id+"&member_id="+"<%= session.getAttribute("userId") %>"+"'>"+item.meetingPlan_subject+"</a></td>";
				content +="<td >"+item.meetingPlan_when+"</td>";
				content +="<td >"+item.clubJoin_nickname+"</td>";
				content +="<td '>"+item.meetingPlan_date+"</td>";
				content += "</tr>";
			});		
			$("#listTable tbody").html(content);
			
		}
		function ajaxCall(param){
			$.ajax(param);
		}
	
	</script>
</html>