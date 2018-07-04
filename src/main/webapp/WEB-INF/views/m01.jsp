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

	</style>
	</head>
	<body>
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
                    <input onclick="join()" class="js"  type="button" value="회원가입"/>
                    <input onclick="search()" class="js" type="button" value="아이디 /비번 찾기"/>
                </td>
            </tr>      
            <tr>
        </table>
        </form>
	</body>
	<script>
	function join(){
		location.href="hamoJoinForm";
	}
	
	</script>
</html>




