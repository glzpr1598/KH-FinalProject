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
				div{position: absolute; left: 774px; top: 340px;}
				#logo {height: 70px;cursor: pointer; position: absolute; left: 880px; top: 130px;}
				#idSearch{position: absolute; left: 780px; top: 250px;}     
				#pwSearch{position: absolute; left: 963px; top: 250px;}
				 input[type='text'], input[type='password']{
  					border: 3px solid #ffbf00;
  					height: 30px;
					width: 366px;     
					margin-top:10px;    
  			    }
  			    .btn{
  			    	width:366px;
				    background-color: #ffbf00;    
				    border: 3px solid #ffbf00;
				    color:#fff;
				    padding: 15px 0;
				    text-align: center;
				    text-decoration: none;
				    display: inline-block;
				    font-size: 15px;
				    margin: 4px;
				    cursor: pointer;
				    position:absolute;     
				    top:170px;
  			    }
  			    input[type='button']{                 
  			    	width:50px;     
				    background-color: #ffbf00;
				    border: none;
				    color:#fff;
				    padding: 8px 0;
				    text-align: center;
				    text-decoration: none;
				    display: inline-block;
				    font-size: 14px;
				    margin: 2px;
				    cursor: pointer;
  			    }
  			    
				.idSearch{    
					width:183px;
				    background-color: #ffbf00;
				    border: 3px solid #ffbf00;
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
				    border: 3px solid #ffbf00;  
				    color:black;      
				    padding: 15px 0;
				    text-align: center;
				    text-decoration: none;
				    display: inline-block;
				    font-size: 15px;
				    margin: 0px;
				    cursor: pointer;       
				}
				    
				#emailChk{position: absolute; left: 320px; top: 64px;}                
		</style>
		
	</head>
	<body>
	<img id="logo" src="./resources/image/logo.png"/>
	<button class="idSearch" id="idSearch">아이디 찾기</button><button class="pwSearch" id="pwSearch">비밀번호 찾기</button>
	
		<div id="1">
			<table>
				<tr>
					<td><input type="text" name="userName" placeholder="이름"></td>
				</tr>
				<tr>
					<td><input type="text" name="email" placeholder="이메일"></td>
				</tr>
				<tr>
					<td><button class="btn" id="idCheck">확인</button></td>
				</tr>
				<span id = spanId></span>
			</table>
		</div>
		
		
		<div id="2">
			<table>
				<tr>
					<td><input type="text" name="userName" placeholder="아이디"></td>
				</tr>
				<tr>
					<td><input type="text" name="email" placeholder="이메일"><input  type="button" id="emailChk" value="인증"/>
				</tr>
				<tr>
					<td><input type="text" name="email" placeholder="인증번호"></td>
				</tr>
				<tr>
					<td><button class="btn">확인</button></td>
				</tr>
			</table>
		</div>
		
		
		<div id="3">
			<table>
				<tr>
					<td><input type="text" name="userName" placeholder="변경할 비밀번호"></td>
				</tr>
				<tr>
					<td><input type="text" name="email" placeholder="비밀번호 확인"></td>
				</tr>
				<tr>
					<td><button class="btn">확인</button></td>
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
 
              
	$("#pwSearch").click(function(){
		var x = document.getElementById("idSearch");
	    x.style.backgroundColor = "white";              
	    x.style.color = "black";
	    var x2 = document.getElementById("pwSearch");
 	    x2.style.backgroundColor = "#ffbf00";
 	    x2.style.color = "#fff";
    	$("#1").hide();
        $("#2").show();
        $("#3").hide();
	});
	
	
	
	$("#idSearch").click(function(){
		var x = document.getElementById("pwSearch");
	    x.style.backgroundColor = "white";              
	    x.style.color = "black";
	    var x2 = document.getElementById("idSearch");
 	    x2.style.backgroundColor = "#ffbf00";
 	    x2.style.color = "#fff";
    	$("#1").show();
        $("#2").hide(); 
        $("#3").hide();
	});
	
	$("#logo").click(function() {
		location.href="./"
	});
	
	
	var obj={};//초기화	
	obj.type="post";
	obj.dataType="json";
	obj.error=function(e){console.log(e)};
	
	$("#idCheck").click(function(){
			if($( "input[name='userName']").val()==""){//이름확인
				alert("이름을 적어주세요");
				$("input[name='userName']").focus();//포커스 이동
			}else if($("#email").val()==""){
				alert("지역을 설정해주세요");
				$("input[name='email']").focus();//포커스 이동
			}else{
				console.log("서버 전송");
				obj.url="./idSearch";
				obj.data.userName=$("input[name='userName']").val();
				obj.data.email=$("input[name='email']").val();

				obj.success = function(data){
					if(data.success == 1){
						alert("회원 가입이 정상 처리 되었습니다.");
						location.href="loginForm"; 
					}else{
						alert("회원 가입에 실패 했습니다.");
						location.href="loginForm"; 
					}
				}
				console.log(obj);
				ajaxCall(obj);
			}				
		}
	});
	
	</script>
</html>




