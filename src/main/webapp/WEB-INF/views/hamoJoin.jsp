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
		<style></style>
	</head>
	<body>
	<h1>회원가입</h1>
		    <table>
    			<tr>
    				<td>
    					<input id="idtxt" type="text" name="userId" placeholder="아이디" maxlength="11"/>
    				</td>
    			</tr>
    			<tr>
    				<td><input class="inputTxt" type="password" name="userPw" placeholder="비밀번호" onkeyup="chkword(this, 20)"/></td>
    			</tr>
    			<tr>
    				<td><input class="inputTxt" type="password" name="pwChk" placeholder="비밀번호 재확인" onkeyup="chkword(this, 20)"/></td>
    			</tr>
    			<tr>
    				<td><input class="inputTxt" type="text" name="userName" placeholder="이름" onkeyup="chkword(this, 5)"/></td>
    			</tr>
    			<tr>
    				<td><input class="inputTxt" type="text" name="email" placeholder="이메일"/></td>
    			</tr>
    			<tr>
    				<td>
    					<input class="idtxt" type="text" name="phone" placeholder="폰 번호" onkeypress="hypNum()"/>
    					<input class="overlay" id="phoneOverlay" type="button" value="등록 체크"/>	
    				</td>
    			</tr>
    			<tr>
    				<td><input class="inputTxt" type="text" name="address" placeholder="주소"/></td>
    			</tr>
    			<tr>
    				<td >
    					<button id="join">회원가입</button>
    				</td>
    			</tr>
    		</table>
	</body>
	<script>
	var obj={};//초기화	
	obj.type="get";
	obj.dataType="json";
	obj.error=function(e){console.log(e)};
	
	var overChk = false;//중복체크 값
	
	$("#idtxt").focusout(function(){			
		obj.url="idOverlay";
		obj.data = {id:$("input[name='userId']").val()};			
		obj.success=function(d){
				if(d.overlay==1){
					alert("사용중인 아이디 입니다.");
					$("input[name='userId']").val("");
					$("input[name='userId']").css("color","");	
					overChk = false;
				}else{
					alert("사용 가능한 아이디 입니다.");
					$("input[name='userId']").css("color","green");	
					overChk = true;
				}
			};		
		console.log(obj);
		ajaxCall(obj);
	});
	
	
	
	</script>
</html>