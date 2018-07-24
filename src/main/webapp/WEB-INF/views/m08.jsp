<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
	
	<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
	<script src="./resources/paging/paging.js" type="text/javascript"></script>
	<link href="./resources/paging/paging.css" type="text/css" rel="stylesheet">
	<link href="https://use.fontawesome.com/releases/v5.1.1/css/all.css" rel="stylesheet" integrity="sha384-O8whS3fhG2OnA5Kas0Y9l3cfpmYjapjI0E4theH4iuMD+pLhbf6JI0jIMfYcK3yZ" crossorigin="anonymous">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="icon" href="./resources/image/icon-32.png" />
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
			<div id="pagingArea"></div>
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
				$.pagingHash(data.list, 10, 5, listPrint);
			}
			$.ajax(obj);
			
			function listPrint(list){
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
				$("tbody").html(content);
				
			}
			
			
		
		});
	</script>
		
</html>