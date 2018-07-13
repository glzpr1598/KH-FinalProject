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
			color: #848484;
		}
		table{
			margin: 10px 0px 40px 0px;
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
		input[type=submit]{
			background-color:white; 
			border: 1px solid #FFBF00;
			border-radius: 5px;
			padding: 3px 7px;
			font-size: 13px;
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
		.sort:hover {
			text-decoration: underline;
		}
		.title {
			font-size: 20px;
			font-weight: bold;
			margin: 5px 0px;
		}
		#day {
			font-weight: bold;
		}
		#joinDay {
			font-weight: bold;
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
	</style>
		
	</head>
	<body>
		<%@ include file="./main-header.jsp" %>
		<div id="div1">
			<div id="myClubList">
				<div class="title">| 설립한 동호회 |</div>
				<a id="day" class="sort"><i class="fa fa-check"></i> 설립일순</a>
				&nbsp;
				<a id="count" class="sort"><i class="fa fa-check"></i> 회원수순 </a>
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
			</div>
			<div >
				<div class="title">| 가입한 동호회 |</div>
				<a id="joinDay" class="sort"><i class="fa fa-check"></i> 설립일순</a>
				&nbsp;
				<a id="joinCount" class="sort"><i class="fa fa-check"></i> 회원수순</a>
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
			obj.data = {"id": "<%= session.getAttribute("userId") %>"};
			obj.success = function(data){
				//console.log(data);
				 listPrint1(data.myClubList);
				 /* 설립일 순 클릭 햇을 때 */
				$("#day").click(function(){
					$("#day").css("font-weight", "bold");
					$("#count").css("font-weight", "normal");
					
					data.myClubList.sort(function(a, b) { // 내림차순
					    return a.club_date > b.club_date ? -1 : a.club_date < b.club_date ? 1 : 0;
					}); 
					listPrint1(data.myClubList);
				});
				 
				 /* 회원수 순 클릭 햇을 때 */
				$("#count").click(function(){
					$("#day").css("font-weight", "normal");
					$("#count").css("font-weight", "bold");
					
					data.myClubList.sort(function(a, b) { // 내림차순
					    return a.club_memberCount > b.club_memberCount ? -1 : a.club_memberCount < b.club_memberCount ? 1 : 0;
					}); 
					listPrint1(data.myClubList);
				});
			}
			ajaxCall(obj);
		});
		$(document).ready(function(){
			obj.url="./myClubJoin";
			obj.data = {"id": "<%= session.getAttribute("userId") %>"};
			obj.success = function(data){
				//console.log(data);
				 listPrint2(data.myClubJoin);
				 
				 /* 설립일 순 클릭 햇을 때 */
				 $("#joinDay").click(function(){
					 $("#joinDay").css("font-weight", "bold");
					 $("#joinCount").css("font-weight", "normal");
				 
					 data.myClubJoin.sort(function(a, b) { // 내림차순
					     return a.club_date > b.club_date ? -1 : a.club_date < b.club_date ? 1 : 0;
					 }); 
					 listPrint2(data.myClubJoin);
				});
				 
				 /* 회원수 순 클릭 햇을 때 */
				$("#joinCount").click(function(){
					$("#joinDay").css("font-weight", "normal");
					$("#joinCount").css("font-weight", "bold");
					
					data.myClubJoin.sort(function(a, b) { // 내림차순
					    return a.club_memberCount > b.club_memberCount ? -1 : a.club_memberCount < b.club_memberCount ? 1 : 0;
					}); 
					listPrint2(data.myClubJoin);
				});
			}
			ajaxCall(obj);
		});
		
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
					content +="<td><form action='myClubRemove'><input type='hidden' name='myClubRemove' value='"+item.clubJoin_id+"'/><input type='submit' onclick='clubDel()' value='탈퇴'/></form></td>";
					content += "</tr>";
				}
			});		
			$("#myClubJoinTable").empty();
			$("#myClubJoinTable").append(content);
			
		}
		function clubDel(){
			var del=confirm('동호회 탈퇴 하시겠습니까?')
			if(del){
				alert("탈퇴 되었습니다.");
			}else{
				$("form").attr("action","m09move");
			}
		}
		
		function ajaxCall(param){
			$.ajax(param);
		}
			
	</script>
</html>