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
			  input[type='text']{
  					border: 2px solid #ffbf00;
  					height: 30px;
					width: 300px;
  			    }
  			      #emailUpdate {   
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
				 #emailChk {   
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
				#serialBtn{position: absolute; left: 262px; top: 90px;}   
				
				#emailMsg{
  				    font-weight: bold;   
  			    	font-size: 12px;      
  			    }
		</style>
		
	</head>
	<body>
			<h5>이메일 수정</h5>
			<hr size="1" color="#ffbf00">
			<table>
				<tr>
					<td><hr size="1" color="white"><input id="email" class="inputTxt" type="text" name="email" placeholder="변경할 이메일"><span id='emailMsg'></span></td>
				</tr>
				<tr>
					<td><hr size="1" color="white"><input id="serialNumber" class="inputTxt" type="text" name="serialNumber" placeholder="인증번호"></td>
				</tr>
			</table>          
			<hr size="1" color="white">         
			
			<div id=serialBtn><button id="emailChk">인증</button></div>
			<button id="emailUpdate">확인</button>        
	</body>
	<script>
	var userId = "${userId}";
	console.log(userId);
	
	var serialNumber = "인증미완료";
	
	$("#emailChk").click(function(){
		$.ajax({
			url:"./emailOverlay",
			type:"post",
			dataType:"json",
			data:{ "email":$("input[name='email']").val() },
			success:function(d){
				if(d.success>=1){
					document.getElementById("emailMsg").innerHTML =" 사용중인 이메일 입니다.";
					$("#emailMsg").css("color","red");
				}else{
					$.ajax({
						url:"./emailChk",
						type:"post",
						dataType:"json",
						data:{"email":$("input[name='email']").val()},
						success:function(d){
							document.getElementById("emailMsg").innerHTML ="입력하신 이메일로 인증번호를 전송하였습니다.";
							$("#emailMsg").css("color","green");
							serialNumber = d.serialNumber;		
							console.log(serialNumber);
						}          
					});
				}
			}          
		}); 
	});


	$("#emailUpdate").click(function(){

			if($("input[name='email']").val()==""){//이메일 입력 확인
				alert("이메일을 확인 해 주세요");
				$("input[name='email']").focus();//포커스 이동   
			}else if( ($("input[name='serialNumber']").val()!=serialNumber) || ( serialNumber == "인증미완료") ){// 인증번호 확인
				alert("인증번호를 확인해주세요");
				$("input[name='serial']").focus();//포커스 이동
			}else{
					$.ajax({
					url:"./emailUpdate",
					type:"post",
					dataType:"json",
					data:{
						"email":$("input[name='email']").val(),
						"id": userId
					},
					success:function(data){
						if(data.success == 1){
							close(); 
						}else{
							alert("이메일 수정실패");
						}
				}
			});	
		}	
	});
	
	</script>
</html>




