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
		table{
			width : 800px;
			text-align: center;
			border-collapse: collapse;
		}
		th{
			background-color:#F8F3D4;
		}
		td{
			border-bottom: 1px solid #ffbf00;
		}
		input[type="button"]{
			width: 50px;
			padding: 7px 0px;
			margin-top : 5px;
			margin-bottom: 5px;
			background-color: #ffbf00;
			border: none;
			border-radius: 5px;
			color: white;
			font-weight: bold;
			font-size: 14px;
			cursor: pointer;
		}
		#add{
			position: relative;
			left: 172px;
		}
		a{
			color: black;
			text-decoration: none;
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
			<table id="listTable">
				<thead>
					<tr>
						<th>글번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>모임일시</th>
					</tr>
				</thead>
				<tbody >
				</tbody>
				<tfoot>
					<tr>
						<td style="text-align: right; border-color: white;" colspan="4">	
							<input type="button" value="등록" id="add" onclick="location.href='clubMeetingWriteForm?club_id=<%= request.getParameter("club_id") %>'"/>
						</td>
					</tr>
				</tfoot>
			</table>
		
		
		
		<!------------------- 양식 ------------------->
			</div>
		</div>
		<!------------------- 양식 ------------------->
	</body>
	<script>
	
		var obj = {};
		obj.error=function(e){console.log(e)};
		obj.type="POST";
		obj.dataType = "JSON";
		$(document).ready(function(){
			obj.url="./MeetingList";
			obj.data = {"club_id": "<%= request.getParameter("club_id") %>"};
			obj.success = function(data){
				console.log(data);
				listPrint(data.list);
		}
			ajaxCall(obj);
		});
		function listPrint(list){
			console.log(list);
			var content ="";
			list.forEach(function(item, idx){
				content +="<tr>";
				content +="<td>"+item.meetingPlan_idx+"</td>";
				content +="<td><a href='#'>"+item.meetingPlan_subject+"</a></td>";
				content +="<td>"+item.clubJoin_nickname+"</td>";
				content +="<td>"+item.meetingPlan_date+"</td>";
				content +="<td>"+item.meetingPlan_when+"</td>";
				content += "</tr>";
			});		
			
			$("#listTable").append(content);
			
		}
		function ajaxCall(param){
			$.ajax(param);
		}
	
	</script>
</html>