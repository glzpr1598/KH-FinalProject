<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
	<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>HAMO</title>
	<style>
		table, th{
			width : 900px;
			border: 1px solid #ffbf00;
			border-collapse: collapse;
			text-align: center;
		}
		table{
			position: absolute;
			left: 20%;
			top: 40%;
		}
	</style>
	</head>
	<body>
		<%@ include file="./main-header.jsp" %>
		<table id="listTable">
			<thead>
				<tr>
					<th>주제</th>
					<th>지역</th>
					<th>동호회명</th>
					<th>소개</th>
					<th>설립일</th>
					<th>회원수</th>
				</tr>
			</thead>
			<tr>
				<td colspan="6" id="paging">
					<div id="container"></div>
			</td>
			</tr>						
			
		</table>
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
				content +="<td>"+item.club_memberConunt+"</td>";
				content += "</tr>";
			});		
			$("#listTable").append(content);
		}
		
		
		function ajaxCall(param){
			$.ajax(param);
		}
	
	
	</script>
</html>