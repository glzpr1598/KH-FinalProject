<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="./resources/js/jundo_paging.js" type="text/javascript"></script>
<style>
	table, th, td {
		border: thin solid black;
		border-collapse: collapse;
		text-align: center;
		padding: 5px 10px;
	}
</style>
</head>
<body>
	<table>
		<thead>
			<tr>
				<th>동호회명</th>
				<th>주제</th>
				<th>지역</th>
			</tr>
		</thead>
		<tbody id="tbody">
			
		</tbody>
	</table>
</body>
<script>
$(document).ready(function(){
	
	// 최초 리스트 불러오기
	$.ajax({
		type: "post",
		dataType: "json",
		error: function(e) {console.log(e);},
		url: "./totalClubSearch",
		data: {"search": ""},
		success: function(data) {
			
			var pagingList = $.kPaging(data.list);
			console.log("pagingList", pagingList);
			
			content = "";
			pagingList.forEach(function(item, idx) {
				content += "<tr>";
				content += "<td>" + item.club_name + "</td>";
				content += "<td>" + item.interest_interest + "</td>";
				content += "<td>" + item.club_location + "</td>";
				content += "</tr>";
			});
	
			$("#tbody").append(content);
		}
	});
	
});
</script>
</html>