<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
		<style>
				div{position: absolute; left: 800px; top: 200px;}
				.idSearch{
					width:183px;
				    background-color: #ffbf00;
				    border: 2px solid #ffbf00;
				    color:#fff;
				    padding: 15px 0;
				    text-align: center;
				    text-decoration: none;
				    display: inline-block;
				    font-size: 15px;
				    margin: 0px;
				    cursor: pointer;  
				}
				.pwSearch{
					width:183px;
				    background-color: white;            
				    border: 2px solid #ffbf00;  
				    color:black;
				    padding: 15px 0;
				    text-align: center;
				    text-decoration: none;
				    display: inline-block;
				    font-size: 15px;
				    margin: 0px;
				    cursor: pointer;          
				}
		</style>
	</head>
	<body>
		<div id="1">
			<table>
				<tr>
					<td><button class="idSearch" id="idSearch1">아이디 찾기</button><button class="pwSearch" id="pwSearch1">비밀번호 찾기</button></td>
				</tr>
				<tr>
					<td><input type="text" name="userName" placeholder="이름"></td>
				</tr>
				<tr>
					<td><input type="text" name="email" placeholder="이메일"></td>
				</tr>
				<tr>
					<td><button>확인</button></td>
				</tr>
				<span id = spanId></span>
			</table>
		</div>
		
		
		<div id="2">
			<table>
				<tr>
					<td><button class="idSearch" id="idSearch2">아이디 찾기</button><button class="pwSearch"  id="pwSearch2">비밀번호 찾기</button></td>
				</tr>
				<tr>
					<td><input type="text" name="userName" placeholder="아이디"></td>
				</tr>
				<tr>
					<td><input type="text" name="email" placeholder="이메일"><button id="serial">확인</button></td>
				</tr>
				<tr>
					<td><input type="text" name="email" placeholder="인증번호"></td>
				</tr>
				<tr>
					<td><button>확인</button></td>
				</tr>
			</table>
		</div>
		
		
		<div id="3">
			<table>
				<tr>
					<td><button class="idSearch">아이디 찾기</button><button class="pwSearch">비밀번호 찾기</button></td>
				</tr>
				<tr>
					<td><input type="text" name="userName" placeholder="변경할 비밀번호"></td>
				</tr>
				<tr>
					<td><input type="text" name="email" placeholder="비밀번호 확인"></td>
				</tr>
				<tr>
					<td><button>확인</button></td>
				</tr>
			</table>
		</div>
	</body>
	<script>
	    
	function cssChange() {
	    var x = document.getElementById("abc");
	    x.style.fontSize = "25px";           
	    x.style.color = "blue"; 
	}
	
    $(document).ready(function(){
    	$("#1").show();
        $("#2").hide();
        $("#3").hide();
     });
 
              
	$("#pwSearch1").click(function(){
		var x = document.getElementById("idSearch1");
	    x.style.backgroundColor = "white";              
	    var x2 = document.getElementById("idSearch2");
/* 	    x.style.backgroundColor = "#ffbf00";
    	$("#1").hide();
        $("#2").show();
        $("#3").hide();
	});
	
	$(".idSearch").click(function(){
    	$("#1").show();
        $("#2").hide(); 
        $("#3").hide();
	});
	</script>
</html>




