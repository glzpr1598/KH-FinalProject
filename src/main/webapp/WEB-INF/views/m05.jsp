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
  			    #all{position: absolute; left: 700px; top: 200px;}         
  			    #logo {height: 80px;cursor: pointer; position: absolute; left: 850px; top: 140px;}
  			    input[type='text'], input[type='password']{
  					border: 2px solid #ffbf00;
  					height: 30px;
					width: 300px;
  			    }
  			    
  			      
  			    #update {   
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
				
				.updateBtn{
					width:110px;       
				    background-color: white;
				    border: 2px solid #ffbf00;
				    color:black;
	 			    padding: 3px 0; 
				    text-align: center;
				    text-decoration: none;
				    display: inline-block;
				    font-size: 15px;
 				    margin: 4px;    
				    cursor: pointer;     
				    height: 40px;  
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
  			    
  			    
  			    select {
				    width: 150px;
				    height: 30px;
				    padding-left: 10px;
				    font-size: 14px;
				    color: #ffbf00;
				    border: 2px solid #ffbf00;
				    border-radius: 3px;
				}
				
				#pwChk{
				font-size: 6px;
				color:#fff;
				}
  
  			    #serialBtn{position: absolute; left: 255px; top: 262px;}          
  			         
  			    
  			       
		</style>    
	</head>
	<body>
	<img id="logo" src="./resources/image/logo.png"/>
	<div id="all">
		<h5>회원정보수정</h5>
		    <table>              
		        <tr>
		        	<hr size="1" color="#ffbf00">           
    				<td><strong>이름&emsp;&emsp;&emsp;&emsp;&emsp;</strong><input id="nameChk" class="inputTxt" type="text" name="userName" placeholder="이름" value="${bbs.member_name}" onkeyup="chkword(this, 5)"/></td>
    			</tr>
    			<tr>
    				
    				<td><hr size="1" color="#ffbf00">   <strong>전화번호&emsp;&emsp;&emsp;</strong><input class="idtxt" type="text" name="phone" placeholder="전화번호" value="${bbs.member_phone}"  id="only_number"/></td>
    			</tr>

				<tr>
					 
					<td><hr size="1" color="#ffbf00">   <strong>관심사&emsp;&emsp;&emsp;&nbsp;&nbsp;</strong>    
							<select id="select1" onchange="itemChange()">
								<option>변경 전</option>
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
								<option>${inter1}</option>        
							</select>
					</td>
				</tr>
    			
    			<tr>
					<td><strong>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;</strong>   
							<select id="select2" onchange="itemChange2()">
								<option>변경 전</option>        
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
								<option>${inter2}</option>        
							</select>
					</td>
				</tr>
    			
    			<tr>
					<td><strong>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;</strong>
							<select  id="select3" onchange="itemChange3()">
								<option>변경 전</option>  
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
								<option>${inter3}</option>        
							</select>
					</td>
				</tr>
    			
    			<tr>
					<td><hr size="1" color="#ffbf00">   <strong>지역&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;</strong>     
							<select  id="select4" onchange="itemChange4()">
								<option>변경 전</option>        
								<option>강남</option>
								<option>강동</option>
								<option>강서</option>
								<option>강북</option>
							</select>
							<select name="choice44" id="select44">
								<option>${bbs.member_location}</option>        
							</select>
					</td>
				</tr>
				
				<tr>
					<td><hr size="1" color="#ffbf00">   <strong>비밀번호&emsp;&emsp;&emsp;</strong>
						<button id="pwUpdate" class="updateBtn"  onclick="pwPopup()">수정</button>
					</td>
				</tr>
				
				<tr>
					<td><hr size="1" color="#ffbf00">   <strong>이메일&emsp;&emsp;&emsp;&nbsp;&nbsp;&nbsp;</strong> 
						<button id="emailUpdate"class="updateBtn" onclick="emailPopup()">수정</button>
					</td>
				</tr>

    			<tr>
    				<td ><hr size="1" color="#ffbf00">   <strong>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;&nbsp;</strong>           
    					<button id="update">수정완료</button>
    				</td>
    			</tr>
    		</table>
    		</div>
	</body>
	<script>
	
	var member_id = "${bbs.member_id}";     // 아이디를 기준으로 수정하기 때문에 필요
	
	
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
       
  
	
	

	function itemChange(){
	
		var first = ["${inter1}"];
		var choice = ["소분류"];
		var sports = ["축구","야구","배구","자전거","배트민턴","볼링","테니스/스쿼시","수영","족구"];
		var tour = ["등산","캠핑","국내여행","해외여행","낚시"];
		var show = ["뮤지컬/오페라","공연/연극","영화","전시회","고궁/문화재"];
		var music = ["노래/보컬","기타/베이스","드럼","피아노","밴드","작사/작곡","클래식","재즈","락/메탈"];
		var book = ["책/독서","인문학","심리학","철학","역사","시사/경제"];
		var service = ["양로원","보육원","환경봉사","사회봉사","교육/재능나눔","유기동물보호"];
		var make = ["미술/그림","캘리그라피","천연비누","소품공예","가죽공예","목공예","도자/점토공예"];
		var car = ["국내차","일본차","미국차","유럽차","바이크"];
		 
		var selectItem = $("#select1").val();
		 
		var changeItem;
		
		if(selectItem == "변경 전"){
		  changeItem = first;
		}
		else if(selectItem == "관심사1"){
			  changeItem = choice;
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
		
		var first = ["${inter2}"];
		var choice = ["소분류"];
		var sports = ["축구","야구","배구","자전거","배트민턴","볼링","테니스/스쿼시","수영","족구"];
		var tour = ["등산","캠핑","국내여행","해외여행","낚시"];
		var show = ["뮤지컬/오페라","공연/연극","영화","전시회","고궁/문화재"];
		var music = ["노래/보컬","기타/베이스","드럼","피아노","밴드","작사/작곡","클래식","재즈","락/메탈"];
		var book = ["책/독서","인문학","심리학","철학","역사","시사/경제"];
		var service = ["양로원","보육원","환경봉사","사회봉사","교육/재능나눔","유기동물보호"];
		var make = ["미술/그림","캘리그라피","천연비누","소품공예","가죽공예","목공예","도자/점토공예"];
		var car = ["국내차","일본차","미국차","유럽차","바이크"];
		 
		var selectItem = $("#select2").val();
		 
		var changeItem;
		
		
		if(selectItem == "변경 전"){
		  changeItem = first;
		}
		else if(selectItem == "관심사2"){
			  changeItem = choice;
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
		
		var first = ["${inter3}"];
		var choice = ["소분류"];
		var sports = ["축구","야구","배구","자전거","배트민턴","볼링","테니스/스쿼시","수영","족구"];
		var tour = ["등산","캠핑","국내여행","해외여행","낚시"];
		var show = ["뮤지컬/오페라","공연/연극","영화","전시회","고궁/문화재"];
		var music = ["노래/보컬","기타/베이스","드럼","피아노","밴드","작사/작곡","클래식","재즈","락/메탈"];
		var book = ["책/독서","인문학","심리학","철학","역사","시사/경제"];
		var service = ["양로원","보육원","환경봉사","사회봉사","교육/재능나눔","유기동물보호"];
		var make = ["미술/그림","캘리그라피","천연비누","소품공예","가죽공예","목공예","도자/점토공예"];
		var car = ["국내차","일본차","미국차","유럽차","바이크"];
		 
		var selectItem = $("#select3").val();
		 
		var changeItem;
		
		if(selectItem == "변경 전"){
		  changeItem = first;
		}
		else if(selectItem == "관심사3"){
			  changeItem = choice;
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
		
		var first = ["${bbs.member_location}"];
		var nam = ["강남/역삼","논현/학동","대치/도곡/양재","방배/반포","삼성/선릉","서초/교대","압구정/청담/신사"];
		var dong = ["강동/천호","광진/구의/건대","송파/가락/방이","신천/잠실"];
		var buk = ["강북/수유/미아","노원/도봉","대학로/성북","동대문/신당","시청/명동/을지로","왕십리/성동","용산/한남/이태원","인사동/삼청동","종로/광화문","중랑/상봉"];
		var seo = ["강서/양천","여의도/영등포/당산","신촌/이대/서대문","홍대/합정/상수","마포역/공덕","삼암/망원","신림/관악","신도림/구로/금천","노량진/사당/동작","연신내/불광/은평"];
		 
		var selectItem = $("#select4").val();
		    
		var changeItem;
		
		if(selectItem == "변경 전"){
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
	
	$("#update").click(function(){

			if($("input[name='userName']").val()==""){//이름 입력 확인
				alert("이름을 확인 해 주세요");
				$("input[name='phone']").focus();//포커스 이동
			}else if($("input[name='phone']").val()==""){//전화번호 입력 확인
				alert("전화번호를 확인 해 주세요");
				$("input[name='phone']").focus();//포커스 이동
			}else if( ($("#select11").val() == "소분류") && ($("#select22").val() == "소분류") && ($("#select33").val() == "소분류") ) {
				alert("관심사를 1가지 이상 선택해주세요");
			}else{
				$.ajax({
					url:"./userUpdate",
					type:"post",
					dataType:"json",
					data:{
						"id":member_id,
						"name":$("input[name='userName']").val(),
						"phone":$("input[name='phone']").val(),
						"select1":$("#select11").val(),
						"select2":$("#select22").val(),
						"select3":$("#select33").val(),
						"select4":$("#select44").val()
					},
					success:function(d){
						if(d.success>0){
							alert("회원정보 수정이 완료되었습니다.");
							location.href="./";
						}else{
							alert("회원정보 수정 실패");
						}
					}
				});
			}
		});
	

	
	$("#logo").click(function() {
		location.href="./"
	});
	

	     
	function pwPopup(){
		window.open('./pwUpdate2?userId='+member_id,  'windowpopup', 'width=330px , height=330px, scrollbars=no, resizable=no, left=580 , top=270');       
	}
	function emailPopup(){
		window.open('./emailUpdate2?userId='+member_id,  'windowpopup', 'width=330px , height=330px, scrollbars=no, resizable=no, left=580 , top=270');     
	}
	
	$("#only_number").keyup(function () { 
	    this.value = this.value.replace(/[^0-9]/g,'');
	});
	
	</script>
</html>