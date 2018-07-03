<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
	<link  rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>HAMO</title>
	<style>
		#myclub{
			background-color: #F3E2A9;
			color: #848484;
		}
		table{
			margin-top: 10px;
			width : 900px;
			text-align: center;
			border-collapse: collapse;
		}
		th{
			background-color:#F8F3D4;
		}
		td{
			border-bottom: 1px solid #ffbf00;
		}
		#div1{
			position: absolute;
			left: 20%;
			top: 30%;
		}
		i{
			color: #FFBF00;
		}
		a{
			color: black;
			text-decoration: none;
		}
		button{
			background-color:white; 
			border: 1px solid #FFBF00;
			/* border-radius: 5px; */
		}
	</style>
		
	</head>
	<body>
		<%@ include file="./main-header.jsp" %>
		<div id="div1">
		
			<div id="myClubList">
				<h3>| 설립한 동호회 |</h3>
				<a href="#"><i class="fa fa-check"></i>설립일순</a>
				<a href="#"><i class="fa fa-check"></i>회원수순</a>
				<table id="myClubListTable">
					<tr>
						<th>주제</th>
						<th>지역</th>
						<th>동호회 명</th>
						<th>소개</th>
						<th>설립일</th>
						<th>회원수 </th>
					</tr>
				</table>
			</div>
			
			<div >
				<h3> | 가입한 동호회 | </h3>
				<a href="#"><i class="fa fa-check"></i>설립일순</a>
				<a href="#"><i class="fa fa-check"></i>회원수순</a>
				<table id="myClubJoinTable">
					<tr>
						<th>주제</th>
						<th>지역</th>
						<th>동호회 명</th>
						<th>소개</th>
						<th>설립일</th>
						<th>회원수 </th>
						<th>탈퇴</th>
					</tr>
				</table>
			</div>
		</div>
	</body>
	<script>
		var obj = {};
		obj.error=function(e){console.log(e)};
		obj.type="POST";
		obj.dataType = "JSON";
		$(document).ready(function(){
			obj.url="./myClubList";
			obj.success = function(data){
				console.log(data);
				 listPrint1(data.myClubList);
	
			}
			ajaxCall(obj);
		});
		$(document).ready(function(){
			obj.url="./myClubJoin";
			obj.success = function(data){
				console.log(data);
				 listPrint2(data.myClubJoin);
	
			}
			ajaxCall(obj);
		});
		
		function listPrint1(list){
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
			$("#myClubListTable").append(content);
		}
		function listPrint2(list){
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
				content +="<td><button>삭제</button></td>";
				content += "</tr>";
			});		
			$("#myClubJoinTable").append(content);
		}
		
		function ajaxCall(param){
			$.ajax(param);
		}
		
	</script>
</html>