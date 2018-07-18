<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
	
	<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
	<link href="//netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
	<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
   <script src="./resources/js/paginathing.js" type="text/javascript"></script>   
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>HAMO</title>
	<style>
		#container {
			width: 1000px;
			margin: auto;
		}
		#search {
			font-size: 13px;
		}
		table{
			width : 1000px;
			margin: 15px 0px;
			border-collapse: collapse;
			font-size: 13px;
		}
		th{
			background-color:#FDF5DC;
			height: 35px;
			text-align: center;
		}
		td{
			border-bottom: 1px solid #ffbf00;
			height: 35px;
			text-align: center;
		}
		.clubName {
			width: 500px;
		}
		.club {
			color: black;
			text-decoration: none;
		}
		.club:hover {
			text-decoration: underline;
		}
	</style>
	</head>
	<body>
		<%@ include file="./main-header.jsp" %>
		<div id="container">
			<div id="search"><b>'${ search }'</b>에 대한 검색결과입니다.</div>
			<table id="listTable">
				<thead>
					<tr>
						<th class="clubName">동호회명</th>
						<th>주제</th>
						<th>지역</th>
						<th>설립일</th>
						<th>회원수</th>
					</tr>
				</thead>
				<tbody >
				</tbody>
			</table>
		</div>
	</body>
	<script>
		$(document).ready(function(){
	
			var obj = {};
			obj.error=function(e){console.log(e)};
			obj.type="POST";
			obj.dataType = "JSON";
			obj.url="./totalClubSearch";
			obj.data ={"search": "${search}"};
			obj.success = function(data){
				console.log(data);
				listPrint(data.list);

				jQuery(document).ready(function($){
					$('table tbody').paginathing({
				    		perPage: 10,
				    		containerClass: 'paging',
				    		limitPagination: 5,

					})
				});
			}
			$.ajax(obj);
			function listPrint(list){
				console.log(list);
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
				$("#listTable").append(content);
				
			}
		
		
		
		});
	</script>
		
</html>