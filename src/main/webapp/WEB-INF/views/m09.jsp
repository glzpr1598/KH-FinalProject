<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
	<head>
	<link rel="icon" href="./resources/image/icon-32.png" />
	<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
	<link  rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>HAMO</title>
	<style>
		#myclub{
			background-color: #FDF5DC;
			color: #848484;
		}
		table{
			margin-top: 10px;
			width : 1050px;
			text-align: center;
			border-collapse: collapse;
		}
		th{
			background-color:#FDF5DC;
		}
		td{
			border-bottom: 1px solid #ffbf00;
		}
		#div1{
			position: absolute;
			left: 17%;
			top: 30%;
		}
		i{
			color: #FFBF00;
		}
		a{
			cursor:pointer;
			color: black;
			text-decoration: none;
		}
		input[type=submit]{
			background-color:white; 
			border: 1px solid #FFBF00;
			
			/* border-radius: 5px;  모서리 둥굴게*/
		}
		form{
			margin: 0;
		}
	</style>
		
	</head>
	<body>
		<%@ include file="./main-header.jsp" %>
		<div id="div1">
		
			<div id="myClubList">
				<h3>| 설립한 동호회 |</h3>
				<a id="day"><i class="fa fa-check"></i> 설립일순 &nbsp;</a>
				<a id="count"><i class="fa fa-check"></i> 회원수순 </a>
				<table >
					<thead>					
						<tr>
							<th>주제</th>
							<th>지역</th>
							<th>동호회 명</th>
							<th>소개</th>
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
				<h3> | 가입한 동호회 | </h3>
				<a id="joinDay"><i class="fa fa-check"></i> 설립일순&nbsp;</a>
				<a id="joinCount"><i class="fa fa-check"></i> 회원수순</a>
				
					<table >
						<thead>	
							<tr>
								<th>주제</th>
								<th>지역</th>
								<th>동호회 명</th>
								<th>소개</th>
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
			obj.success = function(data){
				console.log(data);
				 listPrint1(data.myClubList);
				 /* 설립일 순 클릭 햇을 때 */
				$("#day").click(function(){
					console.log(data.myClubList);
					data.myClubList.sort(function(a, b) { // 내림차순
					    return a.club_date > b.club_date ? -1 : a.club_date < b.club_date ? 1 : 0;
					}); 
					listPrint1(data.myClubList);
				});
				 
				 /* 회원수 순 클릭 햇을 때 */
				$("#count").click(function(){
					console.log(data.myClubList);
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
			obj.success = function(data){
				console.log(data);
				 listPrint2(data.myClubJoin);
				 
				 /* 설립일 순 클릭 햇을 때 */
				 $("#joinDay").click(function(){
						console.log(data.myClubList);
						data.myClubJoin.sort(function(a, b) { // 내림차순
						    return a.club_date > b.club_date ? -1 : a.club_date < b.club_date ? 1 : 0;
						}); 
						listPrint2(data.myClubJoin);
					});
					 
					 /* 회원수 순 클릭 햇을 때 */
					$("#joinCount").click(function(){
						console.log(data.myClubList);
						data.myClubJoin.sort(function(a, b) { // 내림차순
						    return a.club_memberCount > b.club_memberCount ? -1 : a.club_memberCount < b.club_memberCount ? 1 : 0;
						}); 
						listPrint2(data.myClubJoin);
					});
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
				content +="<td>"+item.club_memberCount+"</td>";
				content += "</tr>";
				;
				
			});		
			$("#myClubListTable").empty();
			$("#myClubListTable").append(content);
		}
		function listPrint2(list){
			console.log(list);
			var content ="";
			list.forEach(function(item, idx){
				content +="<tr>";
				content +="<td>"+item.interest_interest+"<input type='hidden' name='myClubRemove' value='"+item.clubJoin_id+"'/></td>";
				content +="<td>"+item.club_location+"</td>";
				content +="<td>"+item.club_name+"</td>";
				content +="<td>"+item.club_introduce+"</td>";
				content +="<td>"+item.club_date+"</td>";
				content +="<td>"+item.club_memberCount+"</td>";
				content +="<td><form action='myClubRemove'><input type='hidden' name='myClubRemove' value='"+item.clubJoin_id+"'/><input type='submit' onclick='clubDel()' value='탈퇴'/></form></td>";
				content += "</tr>";
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