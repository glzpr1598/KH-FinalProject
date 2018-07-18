<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="./resources/paging/paging.js" type="text/javascript"></script>
<link href="./resources/paging/paging.css" type="text/css" rel="stylesheet">
<link href="https://use.fontawesome.com/releases/v5.1.1/css/all.css" rel="stylesheet" integrity="sha384-O8whS3fhG2OnA5Kas0Y9l3cfpmYjapjI0E4theH4iuMD+pLhbf6JI0jIMfYcK3yZ" crossorigin="anonymous">

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
	<div id="pagingArea"></div>
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
			
			$.paging(data.list, 5, 5, listPrint);
			
		}
	});
	
	function listPrint(list) {
		content = new String();
		list.forEach(function(item, idx) {
			content += "<tr>";
			content += "<td>" + item.club_name + "</td>";
			content += "<td>" + item.interest_interest + "</td>";
			content += "<td>" + item.club_location + "</td>";
			content += "</tr>";
		});;
		
		$("#tbody").html(content);
	}
	
});
</script>
</html>