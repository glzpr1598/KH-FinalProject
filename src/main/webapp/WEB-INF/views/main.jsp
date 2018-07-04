<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="icon" href="./resources/image/icon-32.png" />
<title>HAMO</title>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<style>

</style>
</head>
<body>
	<%@ include file="./main-header.jsp" %>
</body>
<script>
var msg = "${msg}";

if(msg == "로그인성공"){
	alert(msg);
}else if(msg == "로그인실패"){
	alert(msg);
}	
</script>
</html>