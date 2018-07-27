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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
		<style>
			  input[type='password']{
			  		padding-left: 10px;   
  					border: 2px solid #ffbf00;
  					height: 30px;
					width: 300px;
					box-sizing: border-box;    
  			    }
  			      #pwUpdateBtn {   
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
				}
				
				  #pwdChk1,#pwdChk2{
  				    font-weight: bold;   
  			    	font-size: 12px;      
  			    }
		</style>
		
	</head>
	<body>
			<h5>비밀번호 수정</h5>
			<hr size="1" color="#ffbf00">
			<table>
				<tr>
					<td><input id="userPw" class="inputTxt" type="password" name="userPw" placeholder="현재 비밀번호" onkeyup="chkword(this, 20)"/></td>
				</tr>
				<tr>
				<td><div id='pwdChk2'></div></td>      
				</tr>
				<tr>
					<td><hr size="1" color="white"><input id="pwUpdate" class="inputTxt" type="password" name="pwUpdate" placeholder="변경할 비밀번호"onkeyup="chkword(this, 20)"/></td>
				</tr>
				<tr>
					<td><input id="pwUpdateChk" class="inputTxt" type="password" name="pwUpdateChk" placeholder="비밀번호 확인"onkeyup="chkword(this, 20)"/></td>   
				</tr>
				<tr>
				<td><div id='pwdChk1'></div></td>
				</tr>
			</table>
			<hr size="1" color="white">
			
			
			<button id="pwUpdateBtn">수정</button>
	</body>
	<script>
	var userId = "${userId}";
	//console.log(userId);
	
	var pwdCheck = 0;
	
	$("#pwUpdateChk").focusout(function(){	
	if($("input[name='pwUpdateChk']").val().length >= 10 && $("input[name='pwUpdateChk']").val().length <= 20){
			if($("input[name='pwUpdate']").val()!=$("input[name='pwUpdateChk']").val()){
				document.getElementById("pwdChk1").innerHTML = " 패스워드가 정상적으로 입력 되지 않았습니다.";
				$("#pwdChk1").css("color","red");
			}else{
				document.getElementById("pwdChk1").innerHTML = " 패스워드가 정상적으로 입력 되었습니다.";
				$("#pwdChk1").css("color","green");
				pwdCheck = 1;
			}
			
	}else{
		document.getElementById("pwdChk1").innerHTML = " 패스워드는 10자 이상 20자 이하로 입력해주세요.";
		$("#pwdChk1").css("color","red");   
		pwdCheck = 0
	}
	});
	
    function chkword(obj, maxByte) {//글자수 조건 제한
        var strValue = obj.value;
        var strLen = strValue.length;
        var totalByte = 0;
        var len = 0;
        var oneChar = "";
        var str2 = "";
        for (var i = 0; i < strLen; i++) {
           oneChar = strValue.charAt(i);
           if (escape(oneChar).length > 0) {
              totalByte += 1;
           }
           // 입력한 문자 길이보다 넘치면 잘라내기 위해 저장
           if (totalByte <= maxByte) {
              len = i + 1;
           }
        }
        // 넘어가는 글자는 자른다.
        if (totalByte > maxByte) {
           document.getElementById("pwdChk1").innerHTML = "허용 가능한 글자수를 초과하셨습니다.";
           $("#pwdChk1").css("color","red");   
           str2 = strValue.substr(0, len);
           obj.value = str2;
        }

     }
 
var userPw = 0; // 0 현재 비밀번호 확인되지 않음 | 1 현재 비밀번호 확인 완료    
    
    $("#userPw").focusout(function(){	
    	$.ajax({
    		url:"./passwordChk",
    		type:"post",
    		dataType:"json",
    		data:{
    			"id":userId,
    			"pw":$("input[name='userPw']").val()
    		},
    		success:function(d){
    			if(d.success){
    				document.getElementById("pwdChk2").innerHTML = "현재 비밀번호가 확인되었습니다.";
    				$("#pwdChk2").css("color","green");
    				userPw = 1;
    			}else{
    				document.getElementById("pwdChk2").innerHTML = "현재 비밀번호를 재확인해주세요";
    				$("#pwdChk2").css("color","red");
    				userPw = 0;
    			}
    		}
    	});
	});
	
	
    $("#pwUpdateBtn").click(function(){
    	if($("input[name='pwUpdate']").val()!=$("input[name='pwUpdateChk']").val() || pwdCheck == 0){//비밀번호가 서로 일치하는지 확인
    		document.getElementById("pwdChk1").innerHTML = "비밀번호가 서로 일치하는지 확인해주세요";
			$("input[name='pwChk']").focus();//포커스 이동
		}else if(userPw==0){
			document.getElementById("pwdChk2").innerHTML = "현재 비밀번호를 재확인해주세요";
		}else{
			$.ajax({
				url:"./pwUpdate",
				type:"post",
				dataType:"json",
				data:{ 
					"id":userId,
					"pw":$("input[name='pwUpdate']").val() 
				},
				success:function(d){
					close();
				}
			});
		}
    });
	</script>
</html>




