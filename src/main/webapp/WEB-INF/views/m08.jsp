<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
	<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
	<script type="text/javascript" src="./resources/js/jquery.paging.js" ></script>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>HAMO</title>
	<style>
		table{
			width : 900px;
			text-align: center;
			border-collapse: collapse;
			position: absolute;
			left: 20%;
			top: 40%;
		}
		th{
			background-color:#F8F3D4;
		}
		td{
			border-bottom: 1px solid #ffbf00;
		}
	</style>
	</head>
	<body>
		<%@ include file="./main-header.jsp" %>
			<table id="listTable">
					<tr>
						<th>주제</th>
						<th>지역</th>
						<th>동호회명</th>
						<th>소개</th>
						<th>설립일</th>
						<th>회원수</th>
					</tr>
			</table>
		<div id="paging">
		</div>
	</body>
	<script>
	
		var obj = {};
		obj.error=function(e){console.log(e)};
		obj.type="POST";
		obj.dataType = "JSON";
		obj.data ={"search": "${search}"};
		$(document).ready(function(){
			obj.url="./totalClubSearch";
			obj.success = function(data){
				console.log(data);
				listPrint(data.list);
				$("#paging").paging({
					current:1,
					max:50
					//,
					//length:5
				});
		}
			ajaxCall(obj);
		});
		
		function listPrint(list){
			console.log(list);
			var content ="";
			list.forEach(function(item, idx){
				content +="<tr>";
				content +="<td>"+item.interest_interest+"</td>";
				content +="<td>"+item.club_location+"</td>";
				content +="<td>"+item.club_name+"</td>";
				content +="<td>"+item.club_introduce+"</td>";
				content +="<td>"+item.club_date+"</td>";
				content +="<td>"+item.club_memberCount+"</td>";
				content += "</tr>";
			});		
			
			$("#listTable").append(content);
		}
		
		
		function ajaxCall(param){
			$.ajax(param);
		}
	
		
		
		
		
	</script>
		
</html>