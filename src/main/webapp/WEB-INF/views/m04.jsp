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
  			    #all{
				width: 300px;
				margin: 70px auto;      
				text-align: center;    
				box-sizing: border-box;                  
  			    }         
		     #logo {
		     	height: 80px;                               
  		     	margin-bottom: 20px;                
		     	cursor: pointer;  
		     	text-align: center;    
		     	box-sizing: border-box;           
		     }   
		     #h5Join{
		     		font-size: 13px;
					text-align: left;
					margin:0px 0px;                    
		     }
  			    input[type='text'], input[type='password']{
  			    padding-left: 10px;      
  					border: 2px solid #ffbf00;
  					border-radius: 5px;
  					height: 30px;
					width: 300px;   
					margin-top: 8px;    
					box-sizing: border-box;       
  			    }     
  			    
  			    #emailInput{
  			    	width: 260px;     
  			    	box-sizing: border-box;    
  			    	border-radius: 5px 0px 0px 5px;
  			    }
  			    
  			    #idChk, #pwdChk, #emailMsg{
							font-size: 12px;
							text-align: left;
							color: #ff1616;
  			    }
  			    button {   
				    width:300px;     
				    background-color: #ffbf00;
				    border: none;
				    color:#fff;
				    padding: 15px 0;
				    text-align: center;
				    text-decoration: none;
				    display: inline-block;
				    font-size: 16px;     
				    font-weight: bold;
				    cursor: pointer;
				    border-radius:5px;
				    box-sizing: border-box;           
				    margin-top: 5px;      
				}

      			    
  			    select {
				    width: 147px;        
				    height: 30px;
				    padding-left: 7px;
				    font-size: 14px;
				    color: black;   
				    border: 2px solid #ffbf00;
				    border-radius: 5px;
				    box-sizing: border-box;   
				    margin-top: 5px;       
				}
				#emailChk{
				  	height: 30px;
  			      	width:40px;           
				    background-color: #ffbf00;    
				    border: none;
				    color:#fff;      
				    padding: 2px 0;                        
				    text-align: center;
				    text-decoration: none;
				    font-size: 12px;      
				    display: inline-block;
				    cursor: pointer;
				    box-sizing: border-box;
				    border-radius: 0px 5px 5px 0px;            
				}
				#pwChk{
				font-size: 6px;
				color:#fff;
				}
          
  			         
  			    
  			       
		</style>    
	</head>
	<body>
	<div id="all">
		<img id="logo" src="./resources/image/logo.png"/>      
		<h5 id='h5Join'>회원가입</h5>     


    					<input class="inputTxt" id="idtxt" type="text" name="userId" id="userId" placeholder="아이디"  onkeyup="chkword(this, 20)"/>
    					
    					<div id='idChk'></div>
    					
				    <input  id="Password" type="password" name="userPw" placeholder="비밀번호" onkeyup="chkword(this, 20)"/>
				    <input id="PasswordChk" type="password" name="pwChk" placeholder="비밀번호 확인" onkeyup="chkword(this, 20)"/><div id='pwdChk'></div>
			     	<input id="nameChk" class="inputTxt" type="text" name="userName" placeholder="이름" maxlength="10"/>
					<input class="idtxt" type="text" name="phone" placeholder="전화번호" id="only_number"/>
					<input id="emailInput"class="inputTxt" type="text" name="email" maxlength="30" placeholder="이메일"/><input  type="button" id="emailChk" value="인증"/><div id='emailMsg'></div>
			     	<input class="inputTxt" type="text" name="serial" placeholder="인증번호" id="only_number2"/>

							<select id="select1" onchange="itemChange()">
								<option>관심사1</option>
								<option>운동/스포츠</option>
								<option>아웃도어/여행</option>
								<option>공연/문화</option>
								<option>음악/악기</option>
								<option>인문학/책/글</option>     
								<option>봉사활동</option>
								<option>공예/만들기</option>
								<option>차/오토바이</option>
							</select>
							<select name="choice11" id="select11">
								<option>소분류</option>        
							</select>

							<select id="select2" onchange="itemChange2()">
								<option>관심사2</option>        
								<option>운동/스포츠</option>
								<option>아웃도어/여행</option>
								<option>공연/문화</option>
								<option>음악/악기</option>
								<option>인문학/책/글</option>     
								<option>봉사활동</option>
								<option>공예/만들기</option>
								<option>차/오토바이</option>
							</select>
							<select name="choice22" id="select22">
								<option>소분류</option>        
							</select>

							<select  id="select3" onchange="itemChange3()">
								<option>관심사3</option>  
								<option>운동/스포츠</option>
								<option>아웃도어/여행</option>
								<option>공연/문화</option>
								<option>음악/악기</option>
								<option>인문학/책/글</option>     
								<option>봉사활동</option>
								<option>공예/만들기</option>
								<option>차/오토바이</option>
							</select>
							<select name="choice33" id="select33">
								<option>소분류</option>        
							</select>

							<select  id="select4" onchange="itemChange4()">
								<option>지역</option>        
								<option>강남</option>
								<option>강동</option>
								<option>강서</option>
								<option>강북</option>
							</select>
							<select name="choice44" id="select44">
								<option>소분류</option>        
							</select>

    					<button id="join">회원가입</button>

    		</div>
	</body>
	<script>
	var obj={};//초기화	
	obj.type="post";
	obj.dataType="json";
	obj.error=function(e){console.log(e)};
	
	var overChk = false;//중복체크 값
	
	$("#idtxt").focusout(function(){			
		obj.url="./idOverlay";
		obj.data = {id:$("input[name='userId']").val()};			
		obj.success=function(d){
			if(d.idLength >=4 && d.idLength <=20) {
					if(d.success==1){
						document.getElementById("idChk").innerHTML =" 사용중인 아이디 입니다.";
						$("#idChk").css("color","red");
						overChk = false;
					}else{
						document.getElementById("idChk").innerHTML =" 사용 가능한 아이디 입니다.";         
						 $("#idChk").css("color","green");
						overChk = true;
					}
			}else{
				/* document.getElementById("idChk").innerHTML = " 아이디는 4자 이상 20자 이하로 입력해주세요."; */
				$("#idChk").html(" 아이디는 4자 이상 20자 이하로 입력해주세요.");
			}
		};		
		//console.log(obj);
		ajaxCall(obj);
	});
	
	var pwdCheck = 0;
	
	$("#PasswordChk").focusout(function(){	
	if($("input[name='pwChk']").val().length >= 10 && $("input[name='pwChk']").val().length <= 20){
			if($("input[name='pwChk']").val()!=$("input[name='userPw']").val()){
				document.getElementById("pwdChk").innerHTML = " 패스워드가 정상적으로 입력 되지 않았습니다.";
				$("#pwdChk").css("color","red");
			}else{
				document.getElementById("pwdChk").innerHTML = " 패스워드가 정상적으로 입력 되었습니다.";
				$("#pwdChk").css("color","green");
				pwdCheck = 1;
			}
			
	}else{
		document.getElementById("pwdChk").innerHTML = " 패스워드는 10자 이상 20자 이하로 입력해주세요.";
		$("#pwdChk").css("color","red");
		pwdCheck = 0
	}
	});
	
	
	var serialNumber = "인증미완료";
	var email = "";
	



	var regExp = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;  
	
	
	/* ajax  1. 유효성 검사 통과 -> 2. 이메일중복검사 통과 -> 3. 메일인증 전송 */
	$("#emailChk").click(function(){
		if(!regExp.test($("#emailInput").val())){ 
		      alert("이메일 주소가 유효하지 않습니다"); 
		      $("#emailInput").focus(); 
		} else { 
			obj.url="./emailOverlay";
			obj.data={email:$("input[name='email']").val()};	
			obj.success=function(d){
				if(d.success>=1){
					document.getElementById("emailMsg").innerHTML =" 사용중인 이메일 입니다.";
				}else{
						alert("입력하신 이메일로 인증번호를 전송하였습니다.");
						document.getElementById("emailMsg").innerHTML =" 사용가능한 이메일 입니다. ";   
						$("#emailMsg").css("color","green");
						obj.url="./emailChk";
						obj.data={email:$("input[name='email']").val()};	
						obj.success=function(d){
							serialNumber = d.serialNumber;		
							email = $("input[name='email']").val();
							//console.log(serialNumber);
							//console.log(email);       
						};
						ajaxCall(obj);   
				}
			};
			ajaxCall(obj);     
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
       
   /*숫자만 넣기*/
$("#only_number").keyup(function () { 
    this.value = this.value.replace(/[^0-9]/g,'');
});
$("#only_number2").keyup(function () { 
    this.value = this.value.replace(/[^0-9]/g,'');
});
	
	
	function ajaxCall(obj){    
		$.ajax(obj);
	}
	
	
	

	function itemChange(){
	
		var first = ["소분류"];
		var sports = ["축구","농구","야구","배구","자전거","배트민턴","볼링","테니스/스쿼시","수영","족구"];
		var tour = ["등산","캠핑","국내여행","해외여행","낚시"];
		var show = ["뮤지컬/오페라","공연/연극","영화","전시회","고궁/문화재"];
		var music = ["노래/보컬","기타/베이스","드럼","피아노","밴드","작사/작곡","클래식","재즈","락/메탈"];
		var book = ["책/독서","인문학","심리학","철학","역사","시사/경제"];
		var service = ["양로원","보육원","환경봉사","사회봉사","교육/재능나눔","유기동물보호"];
		var make = ["미술/그림","캘리그라피","천연비누","소품공예","가죽공예","목공예","도자/점토공예"];
		var car = ["국내차","일본차","미국차","유럽차","바이크"];
		 
		var selectItem = $("#select1").val();
		 
		var changeItem;
		
		if(selectItem == "관심사1"){
		  changeItem = first;
		}
		else if(selectItem == "운동/스포츠"){
			  changeItem = sports;
		}
		else if(selectItem == "아웃도어/여행"){
		  changeItem = tour;
		}
		else if(selectItem == "공연/문화"){
		  changeItem =  show;
		}
		else if(selectItem == "음악/악기"){
			  changeItem =  music;
		}
		else if(selectItem == "인문학/책/글"){
			  changeItem =  book;
		}
		else if(selectItem == "봉사활동"){
			  changeItem =  service;
		}
		else if(selectItem == "공예/만들기"){
			  changeItem =  make;
		}
		else if(selectItem == "차/오토바이"){
			  changeItem =  car;
		}
		
		 
		$("#select11").empty();
		 
		for(var count = 0; count < changeItem.length; count++){                
		                var option = $("<option>"+changeItem[count]+"</option>");
		                $("#select11").append(option);
		            }
		 
		}
	
	function itemChange2(){
		
		var first = ["소분류"];
		var sports = ["축구","농구","야구","배구","자전거","배트민턴","볼링","테니스/스쿼시","수영","족구"];
		var tour = ["등산","캠핑","국내여행","해외여행","낚시"];
		var show = ["뮤지컬/오페라","공연/연극","영화","전시회","고궁/문화재"];
		var music = ["노래/보컬","기타/베이스","드럼","피아노","밴드","작사/작곡","클래식","재즈","락/메탈"];
		var book = ["책/독서","인문학","심리학","철학","역사","시사/경제"];
		var service = ["양로원","보육원","환경봉사","사회봉사","교육/재능나눔","유기동물보호"];
		var make = ["미술/그림","캘리그라피","천연비누","소품공예","가죽공예","목공예","도자/점토공예"];
		var car = ["국내차","일본차","미국차","유럽차","바이크"];
		 
		var selectItem = $("#select2").val();
		 
		var changeItem;
		
		
		if(selectItem == "관심사2"){
		  changeItem = first;
		}
		else if(selectItem == "운동/스포츠"){
			  changeItem = sports;
		}
		else if(selectItem == "아웃도어/여행"){
		  changeItem = tour;
		}
		else if(selectItem == "공연/문화"){
		  changeItem =  show;
		}
		else if(selectItem == "음악/악기"){
			  changeItem =  music;
		}
		else if(selectItem == "인문학/책/글"){
			  changeItem =  book;
		}
		else if(selectItem == "봉사활동"){
			  changeItem =  service;
		}
		else if(selectItem == "공예/만들기"){
			  changeItem =  make;
		}
		else if(selectItem == "차/오토바이"){
			  changeItem =  car;
		}
		
		 
		$("#select22").empty();
		 
		for(var count = 0; count < changeItem.length; count++){                
		                var option = $("<option>"+changeItem[count]+"</option>");
		                $("#select22").append(option);
		            }
		 
		}
	
	function itemChange3(){
		
		var first = ["소분류"];
		var sports = ["축구","농구","야구","배구","자전거","배트민턴","볼링","테니스/스쿼시","수영","족구"];
		var tour = ["등산","캠핑","국내여행","해외여행","낚시"];
		var show = ["뮤지컬/오페라","공연/연극","영화","전시회","고궁/문화재"];
		var music = ["노래/보컬","기타/베이스","드럼","피아노","밴드","작사/작곡","클래식","재즈","락/메탈"];
		var book = ["책/독서","인문학","심리학","철학","역사","시사/경제"];
		var service = ["양로원","보육원","환경봉사","사회봉사","교육/재능나눔","유기동물보호"];
		var make = ["미술/그림","캘리그라피","천연비누","소품공예","가죽공예","목공예","도자/점토공예"];
		var car = ["국내차","일본차","미국차","유럽차","바이크"];
		 
		var selectItem = $("#select3").val();
		 
		var changeItem;
		
		if(selectItem == "관심사3"){
		  changeItem = first;
		}
		else if(selectItem == "운동/스포츠"){
			  changeItem = sports;
		}
		else if(selectItem == "아웃도어/여행"){
		  changeItem = tour;
		}
		else if(selectItem == "공연/문화"){
		  changeItem =  show;
		}
		else if(selectItem == "음악/악기"){
			  changeItem =  music;
		}
		else if(selectItem == "인문학/책/글"){
			  changeItem =  book;
		}
		else if(selectItem == "봉사활동"){
			  changeItem =  service;
		}
		else if(selectItem == "공예/만들기"){
			  changeItem =  make;
		}
		else if(selectItem == "차/오토바이"){
			  changeItem =  car;
		}
		
		 
		$("#select33").empty();
		 
		for(var count = 0; count < changeItem.length; count++){                
		                var option = $("<option>"+changeItem[count]+"</option>");
		                $("#select33").append(option);
		            }
		 
		}
	
	
	function itemChange4(){
		
		var first = ["소분류"];
		var nam = ["강남/역삼","논현/학동","대치/도곡/양재","방배/반포","삼성/선릉","서초/교대","압구정/청담/신사"];
		var dong = ["강동/천호","광진/구의/건대","송파/가락/방이","신천/잠실"];
		var buk = ["강북/수유/미아","노원/도봉","대학로/성북","동대문/신당","시청/명동/을지로","왕십리/성동","용산/한남/이태원","인사동/삼청동","종로/광화문","중랑/상봉"];
		var seo = ["강서/양천","여의도/영등포/당산","신촌/이대/서대문","홍대/합정/상수","마포역/공덕","삼암/망원","신림/관악","신도림/구로/금천","노량진/사당/동작","연신내/불광/은평"];
		 
		var selectItem = $("#select4").val();
		 
		var changeItem;
		
		if(selectItem == "지역"){
		  changeItem = first;
		}
		else if(selectItem == "강남"){
			  changeItem = nam;
		}
		else if(selectItem == "강동"){
		  changeItem = dong;
		}
		else if(selectItem == "강북"){
		  changeItem =  buk;
		}
		else if(selectItem == "강서"){
		 changeItem =  seo;
		}

		
		 
		$("#select44").empty();
		 
		for(var count = 0; count < changeItem.length; count++){                
			            var option = $("<option>"+changeItem[count]+"</option>");
			            $("#select44").append(option);
        }

}
	
	
	
	
	
	
//전화번호 유효성검사 
	$(function(){
	 
	    $("#only_number").on('keydown', function(e){
	       // 숫자만 입력받기
	        var trans_num = $(this).val().replace(/-/gi,'');
		var k = e.keyCode;
					
		if(trans_num.length >= 11 && ((k >= 48 && k <=126) || (k >= 12592 && k <= 12687 || k==32 || k==229 || (k>=45032 && k<=55203)) ))
		{   
	  	    e.preventDefault();
		}
	    }).on('blur', function(){ // 포커스를 잃었을때 실행합니다.
	        if($(this).val() == '') return;
	 
	        // 기존 번호에서 - 를 삭제합니다.
	        var trans_num = $(this).val().replace(/-/gi,'');
	      
	        // 입력값이 있을때만 실행합니다.
	        if(trans_num != null && trans_num != '')
	        {
	            // 총 핸드폰 자리수는 11글자이거나, 10자여야 합니다.
	            if(trans_num.length==11 || trans_num.length==10) 
	            {   
	                // 유효성 체크
	                var regExp_ctn = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})([0-9]{3,4})([0-9]{4})$/;
	                if(regExp_ctn.test(trans_num))
	                {
	                    // 유효성 체크에 성공하면 하이픈을 넣고 값을 바꿔줍니다.
	                    trans_num = trans_num.replace(/^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?([0-9]{3,4})-?([0-9]{4})$/, "$1-$2-$3");                  
	                    $(this).val(trans_num);
	                }
	                else
	                {
	                    alert("유효하지 않은 전화번호 입니다.");
	                    $(this).val("");
	                    $(this).focus();
	                }
	            }
	            else 
	            {
	                alert("유효하지 않은 전화번호 입니다.");
	                $(this).val("");
	                $(this).focus();
	            }
	      }
	  });  
	});
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	$("#join").click(function(){
		if(!overChk){	//아이디 입력 확인
			alert("아이디를 올바르게 입력 해주세요");
			$("").focus();//포커스 이동
		}else{
			if($( "input[name='userPw']").val()=="" ||  pwdCheck == 0 ){//비밀번호 입력 확인
				alert("비밀 번호를 확인 해 주세요");
				$("input[name='userPw']").focus();//포커스 이동
			}else if($("input[name='pwChk']").val()!=$("input[name='userPw']").val() || pwdCheck == 0 ){//비밀번호가 서로 일치하는지 확인
				alert("비밀번호 일치 확인 해주세요");
				$("input[name='pwChk']").focus();//포커스 이동
			}else if($("input[name='userName']").val()==""){//이름 입력 확인
				alert("이름을 확인 해 주세요");
				$("input[name='userName']").focus();//포커스 이동
			}else if($("input[name='phone']").val()==""){//전화번호 입력 확인
				alert("전화번호를 확인 해 주세요");
				$("input[name='phone']").focus();//포커스 이동
			}else if($("input[name='email']").val()=="" || $("input[name='email']").val()!=email){//이메일 입력 확인     
				alert("이메일을 확인 해 주세요");
				$("input[name='email']").focus();//포커스 이동   
			}else if( ($("input[name='serial']").val()!=serialNumber) || ( serialNumber == "인증미완료") ){// 인증번호 확인   
				alert("인증번호를 확인해주세요");
				$("input[name='serial']").focus();//포커스 이동
			}else if( ($("#select11").val() == "소분류") && ($("#select22").val() == "소분류") && ($("#select33").val() == "소분류") ) {            
				alert("관심사를 1가지 이상 선택해주세요");
			}else if($("#select44").val()=="소분류"){
				alert("지역을 설정해주세요");
			}else{
				//console.log("서버 전송");
				obj.url="./hamoJoin";
				obj.data.id=$("input[name='userId']").val();
				obj.data.pw=$("input[name='userPw']").val();
				obj.data.name=$("input[name='userName']").val();
				obj.data.phone=$("input[name='phone']").val();
				obj.data.email=$("input[name='email']").val();
				obj.data.select1=$("#select11").val();
				obj.data.select2=$("#select22").val();
				obj.data.select3=$("#select33").val();
				obj.data.select4=$("#select44").val();
				obj.success = function(data){
					if(data.success == 1){
						alert("회원 가입이 정상 처리 되었습니다.");
						location.href="loginForm"; 
					}else{
						alert("회원 가입에 실패 했습니다.");
						location.href="loginForm"; 
					}
				}
				//console.log(obj);
				ajaxCall(obj);
			}				
		}
	});
	

	
	$("#logo").click(function() {
		location.href="./"
	});
	
	
	
	
	
	</script>
</html>