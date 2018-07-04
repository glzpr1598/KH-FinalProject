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
			#all{position: absolute; left: 800px; top: 350px;}
			#logo {height: 60px;cursor: pointer; position: absolute; left: 880px; top: 250px;}     
			
			input[type='text'], input[type='password']{
  					border: 2px solid #ffbf00;
  					height: 30px;
					width: 300px;
  			    }
			
			 input[type='submit']{
				    width:297px;
				    background-color: #ffbf00;
				    border: none;
				    color:#fff;
				    padding: 15px 0;
				    text-align: center;
				    text-decoration: none;
				    display: inline-block;
				    font-size: 15px;
				    margin: 4px;
				    cursor: pointer;
				    border-radius:10px;
  			    }
  			    a{
  			    	text-decoration: none;
  			    	color: black;
  			        font-size: 14px;
  			    }
		</style>
	</head>
	<body>
	<img id="logo" src="./resources/image/logo.png"/>
	<div id="all">
	<form action="login" method="post">
		<table>
            <tr>
                <td>
                	<input type="text" class="inputbox" name="userId" placeholder="아이디"/>
                </td>
            </tr>
            <tr>
                <td>
                	<input type="password" class="inputbox" name="userPw" placeholder="비밀번호"/>
                </td>
            </tr>
            	<td>
                    <input id="loginBtn" class="inputbox" type="submit" value="로그인"/>
                </td>
            </tr>
            <tr>
                <td>
                   &nbsp<a href="idpwSearch" class="search">아이디 / 비밀번호 찾기</a>&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp<a href="hamoJoinForm" class="search">회원가입</a>
                </td>
            </tr>      
            <tr>
        </table>
        </form>
      </div>
	</body>
	<script>

	$("#logo").click(function() {
		location.href="./"
	});
	</script>
</html>




