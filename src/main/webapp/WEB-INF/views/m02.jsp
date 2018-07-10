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
				#logo {height: 90px;cursor: pointer; position: absolute; left: 850px; top: 130px;}
				#idSearch{position: absolute; left: 780px; top: 250px;}     
				#pwSearch{position: absolute; left: 963px; top: 250px;}
				 input[type='text'], input[type='password']{
  					border: 2px solid #ffbf00;    
  					height: 30px;
					width: 366px;     
					margin-top:10px;    
  			    }
  			    .btn{
  			    	width:366px;
				    background-color: #ffbf00;    
				    border: 2px solid #ffbf00;
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
				  #pwdChk{
  			    			margin: 5px;
							font-size: 13px;
							text-align: left;
							color: #ff1616;
  			    }
  			      
  			    #msgChk{          
  			    	position: absolute; top: 125px; left: 0px; float: left;       
  			    	text-decoration: none;        
  			    	font-weight: bold;   
  			    	font-size: 15px;
  			    }
  			    
  			    
  			    #spanId{
  				    font-weight: bold;   
  			    	font-size: 15px;
  			    }
  			    
  			    
  			    .aTag:link { color: red; text-decoration: none;}
				.aTag:visited { color: black; text-decoration: none;}
 				.aTag:hover { color: blue; text-decoration: underline;}
				.aTag{display: none;}    
				#emailChk{position: absolute; left: 320px; top: 63px;}                
		</style>
		
	</head>
	<body>
	<img id="logo" src="./resources/image/logo.png"/>
	<button class="idSearch" id="idSearch">아이디 찾기</button><button class="pwSearch" id="pwSearch">비밀번호 찾기</button>
	
	
	
		<div id="1">
			<table>
				<tr>
					<td><input type="text" name="userName1" id="userName1" placeholder="이름"></td>
				</tr>
				<tr>
					<td><input type="text" name="email1" id="email1" placeholder="이메일"></td>
				</tr>
				<tr>
					<td><button class="btn" id="idCheck">확인</button></td>
				</tr>
			</table>
			<div id="msgChk">
				<a href="./" class="aTag">홈으로</a>   
				<a  class="aTag"> | </a>
				<a href="loginForm"  class="aTag">로그인</a>&nbsp;&nbsp;
				<span id = spanId></span>   
			</div>
		</div>
		     
		
		<div id="2">
			<table>
				<tr>
					<td><input type="text" name="userId" placeholder="아이디"></td>
				</tr>
				<tr>
					<td><input type="text" name="email2" placeholder="이메일"><input  type="button" id="emailChk" value="인증"/>
				</tr>
				<tr>
					<td><input type="text" name="serial" placeholder="인증번호"></td>
				</tr>
				<tr>
					<td><button class="btn" id="pwCheck">확인</button></td>
				</tr>
			</table>
			
			
			
		</div>
		
		
		<div id="3">
			<table>
				<tr>
					<td><input type="password" name="userPw" placeholder="변경할 비밀번호" onkeyup="chkword(this, 20)"></td>
				</tr>
				<tr>
					<td><input id="PasswordChk" type="password" name="pwChk" placeholder="비밀번호 확인" onkeyup="chkword(this, 20)"></td>
					<span id='pwdChk'></span>
				</tr>
				<tr>
					<td><button class="btn" id="pwUpdate">확인</button></td>
				</tr>
			</table>
			
			
		</div>
		
	</body>
	<script>
	var serialNumber = "인증미완료";
	
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
		
	
	$("#idCheck").click(function(){
			if($( "input[name='userName1']").val()==""){//이름확인
				alert("이름을 확인해주세요");
				$("input[name='userName1']").focus();//포커스 이동
			}else if($("input[name='email1']").val()==""){//이메일확인
				alert("이메일을 확인해주세요");
				$("input[name='email1']").focus();//포커스 이동
			}else{
				console.log("서버 전송");
				$.ajax({
						url: "./idSearch",
						type: "post",
						dataType: "json",
						data: {
							"name": $("input[name='userName1']").val(),
							"email": $("input[name='email1']").val()
						},
						success: function(data) {
							console.log("success");
							if(data.success){
								document.getElementById("spanId").innerHTML = "요청하신 아이디는 : "+data.userId+" 입니다.";
								/* $("#msgChk").show();     */
								$(".aTag").css("display","inline");
							}else{
								alert(data.userId);  
							}
						},
						error: function(e){console.log(e)}
				});      
			}				
		});

	
var userId =""; // 비밀번호 변경화면으로 바뀌었을때 아이디값이 필요

	$("#pwCheck").click(function(){
		if($( "input[name='userId']").val()==""){//아이디확인
			alert("아이디를 확인해주세요");
			$("input[name='userId']").focus();//포커스 이동
		}else if($("input[name='email2']").val()==""){//이메일확인
			alert("이메일을 확인해주세요");
			$("input[name='email2']").focus();//포커스 이동
		}else if( ($("input[name='serial']").val()!=serialNumber) || ( serialNumber == "인증미완료") ){// 인증번호 확인
			alert("인증번호를 확인해주세요");
			$("input[name='serial']").focus();//포커스 이동
		}else{
			console.log("서버 전송");
			$.ajax({
					url: "./pwSearch",
					type: "post",
					dataType: "json",
					data: {
						"userId": $("input[name='userId']").val(),
						"email": $("input[name='email2']").val()
					},
					success: function(data) {
						console.log("success");
						if(data.success){
							userId = $("input[name='userId']").val();
							console.log(userId);
					    	$("#1").hide();
					        $("#2").hide(); 
					        $("#3").show();
						}else{
							alert("입력내용이 맞지 않습니다.");  
						}
					},
					error: function(e){console.log(e)}
			});
		}				
	});

	
	$("#emailChk").click(function(){
		$.ajax({
			url: "./emailChk",
			type: "post",
			dataType: "json",
			data: {
				"email": $("input[name='email2']").val()
			},
			success: function(d) {
				console.log("success");
					serialNumber = d.serialNumber;		
					alert("입력하신 이메일로 인증번호를 전송하였습니다.");
					console.log(serialNumber);
			},
			error: function(e){console.log(e)}
			});
		});
	
	  $("#pwUpdate").click(function(){
		  if($( "input[name='userPw']").val()=="" ||  pwdCheck == 0 ){//비밀번호 입력 확인
				alert("비밀 번호를 확인 해 주세요");
				$("input[name='userPw']").focus();//포커스 이동
			}else if($("input[name='pwChk']").val()!=$("input[name='userPw']").val() || pwdCheck == 0 ){//비밀번호가 서로 일치하는지 확인
				alert("비밀번호 일치 확인 해주세요");
				$("input[name='pwChk']").focus();//포커스 이동
			}else{
		  $.ajax({
			  url: "./pwUpdate",
			  type: "post",
			  dataType: "json",
			  data: {
				 "pw": $("input[name='userPw']").val(), 
				 "id" : userId
			  },
			  success:function(d){
				  if(d.success){
					  alert("비밀번호 변경이 완료되었습니다.");
					  location.href="./";
				  }else{
					  alert("비밀번호 변경 실패");
				  }
			  }  
		  });
		}
	  });
	  
		$("#PasswordChk").focusout(function(){	
			if($("input[name='pwChk']").val().length >= 10 && $("input[name='pwChk']").val().length <= 20){
					if($("input[name='pwChk']").val()!=$("input[name='userPw']").val()){
						document.getElementById("pwdChk").innerHTML = " 패스워드가 정상적으로 입력 되지 않았습니다.";
					}else{
						document.getElementById("pwdChk").innerHTML = " 패스워드가 정상적으로 입력 되었습니다.";
						pwdCheck = 1;
					}
					
			}else{
				document.getElementById("pwdChk").innerHTML = " 패스워드는 10자 이상 20자 이하로 입력해주세요.";
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
	           alert("허용 가능한 글자수를 초과하셨습니다.");
	           str2 = strValue.substr(0, len);
	           obj.value = str2;
	        }

	     }
	</script>
</html>




