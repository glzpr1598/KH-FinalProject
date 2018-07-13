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
<style>
		#gongbaeg{position: absolute;  left: 380px; top: 2000px;}         
      
		/* 메인화면 */
		img#img{width: 400px; height: 250px;} 
		.picture{position: absolute; left: 380px; top: 320px;}
		#all{position: absolute; left: 280px; top: 250px; border: 5px solid #ffbf00; width: 1150px; height: 350px;}   
		 #back{position: absolute; left: 295px; top: 410px; font-size: 25px; border: 2px solid #ffbf00;}             
         #next{position: absolute; left: 1380px; top: 410px; font-size: 25px;border: 2px solid #ffbf00;}       
            
         #we{position: absolute; left: 380px; top: 280px; font-weight: bold;  font-size: 24px; background: white;}    
         .club_default{position: absolute; left: 700px; top: 390px; font-weight: bold;  font-size: 40px; background: white; }    
         .club_name{position: absolute; left: 840px; top: 320px; font-weight: bold;  font-size: 35px; background: white; }   
         .club_interest{position: absolute; left: 840px; top: 390px; font-weight: normal;  font-size: 15px; background: white; }   
         .club_date{position: absolute; left: 840px; top: 410px; font-weight: normal;  font-size: 15px; background: white; }      
         .club_introduce{position: absolute; left: 840px; top: 450px; font-weight: normal;  font-size: 20px; background: white; width: 500px; height: 120px;} 
              
               
        input[type='button']{                       
  			    	width:40px;        
				    background-color: #ffbf00;
				    color:#fff;
				    text-align: center;
				    text-decoration: none;    
				    display: inline-block;
				    margin: 2px;
				    cursor: pointer;
				    border-radius:10px;
  			    }
  			       
  		/* 인기동호회 3개 */   
  		 .club_default2{position: absolute; left: 670px; top: 850px; font-weight: bold;  font-size: 30px; background: white; }    /* 동호회가 하나도 없을경우 */
  		   
  		.interImg{width: 300px; height: 150px;}          
  		#intTitle{position: absolute; left: 290px; top: 700px; font-weight: bold;  font-size: 20px;}
  	
  		#int1{position: absolute; left: 310px; top: 780px;}     
  		#ip1{position: absolute; left: 310px; top: 950px; font-weight: bold;  font-size: 15px;} /* 이름 */
  		#ipp1{position: absolute; left: 310px; top: 970px; font-weight: normal;  font-size: 13px;} /* 회원수 */
  		#interDiv1{position: absolute; left: 280px; top: 750px; border: 4px solid #ffbf00; width: 350px; height: 250px;} 
  		
  		#int2{position: absolute; left: 710px; top: 780px;}     
  		#ip2{position: absolute; left: 710px; top: 950px; font-weight: bold;  font-size: 15px;} /* 이름 */
  		#ipp2{position: absolute; left: 710px; top: 970px; font-weight: normal;  font-size: 13px;} /* 회원수 */
  		#interDiv2{position: absolute; left: 680px; top: 750px; border: 4px solid #ffbf00; width: 350px; height: 250px;} 
  		
  		#int3{position: absolute; left: 1110px; top: 780px;}     
  		#ip3{position: absolute; left: 1110px; top: 950px; font-weight: bold;  font-size: 15px;} /* 이름 */
  		#ipp3{position: absolute; left: 1110px; top: 970px; font-weight: normal;  font-size: 13px;} /* 회원수 */
  		#interDiv3{position: absolute; left: 1080px; top: 750px; border: 4px solid #ffbf00; width: 350px; height: 250px;} 
  		
  		  /* 맞춤동호회 3개*/   
  		 .club_default3{position: absolute; left: 670px; top: 1250px; font-weight: bold;  font-size: 30px; background: white; }    /* 동호회가 하나도 없을경우 */
  		   
  		.interImg{width: 300px; height: 150px;}          
  		#bestTitle{position: absolute; left: 290px; top: 1100px; font-weight: bold;  font-size: 20px;}
  	
  		#bp1{position: absolute; left: 310px; top: 1180px;}     
  		#b1{position: absolute; left: 310px; top: 1350px; font-weight: bold;  font-size: 15px;} /* 이름 */
  		#bb1{position: absolute; left: 310px; top: 1370px; font-weight: normal;  font-size: 13px;} /* 회원수 */
  		#bestDiv1{position: absolute; left: 280px; top: 1150px; border: 4px solid #ffbf00; width: 350px; height: 250px;} 
  		
  		#bp2{position: absolute; left: 710px; top: 1180px;}     
  		#b2{position: absolute; left: 710px; top: 1350px; font-weight: bold;  font-size: 15px;} /* 이름 */
  		#bb2{position: absolute; left: 710px; top: 1370px; font-weight: normal;  font-size: 13px;} /* 회원수 */
  		#bestDiv2{position: absolute; left: 680px; top: 1150px; border: 4px solid #ffbf00; width: 350px; height: 250px;} 
  		
  		#bp3{position: absolute; left: 1110px; top: 1180px;}     
  		#b3{position: absolute; left: 1110px; top: 1350px; font-weight: bold;  font-size: 15px;} /* 이름 */
  		#bb3{position: absolute; left: 1110px; top: 1370px; font-weight: normal;  font-size: 13px;} /* 회원수 */
  		#bestDiv3{position: absolute; left: 1080px; top: 1150px; border: 4px solid #ffbf00; width: 350px; height: 250px;} 
</style>                  
</head>   
<body>               


	<%@ include file="./main-header.jsp" %>
	<!-- 랜덤동호회  5개 -->
	<a id='we'>우리 동호회를 소개합니다.</a>
	<div id='all'>
	</div>
<c:if test="${size == 0}">
	<div class='club_default'><a>동호회를 준비중입니다.</a></div>
</c:if>	

<c:if test="${size >= 1}">
	<div id='d1'>
		<c:if test="${list0.clubPicture_newName != null}">
			<div class='picture' id='p1'><a><img id="img" src="./resources/club-picture/${list0.clubPicture_newName}"/></a></div>
		</c:if>
		<c:if test="${list0.clubPicture_newName == null}">
			<div class='picture' id='p1'><a><img id="img" src="./resources/club-picture/default.png"/></a></div>
		</c:if>
		
		<c:if test="${list0.club_name != null}">
			<div class='club_name'><a>${list0.club_name}</a></div>
			<div class='club_interest'><a>${list0.interest_interest}  |  ${list0.club_location} </a></div><!-- 주제 | 지역 -->
			<div class='club_date'><a>${list0.club_memberCount} 명  |  SINCE ${list0.club_date} </a></div><!-- 회원수 | 설립일 -->
			<div class='club_introduce'><a>${list0.club_introduce}</a></div><!-- 소개 -->
		</c:if>
	</div>
</c:if>		
		
		
		
<c:if test="${size >= 2}">		
	<div id='d2'>
		<c:if test="${list1.clubPicture_newName != null}">
			<div class='picture' id='p2'><a><img id="img" src="./resources/club-picture/${list1.clubPicture_newName}"/></a></div>
		</c:if>     
		<c:if test="${list1.clubPicture_newName == null}">
			<div class='picture' id='p2'><a><img id="img" src="./resources/club-picture/default.png"/></a></div>
		</c:if>

		<c:if test="${list1.club_name != null}">
			<div class='club_name'><a>${list1.club_name}</a></div>
			<div class='club_interest'><a>${list1.interest_interest}  |  ${list1.club_location} </a></div><!-- 주제 | 지역 -->
			<div class='club_date'><a>${list1.club_memberCount} 명  |  SINCE ${list1.club_date} </a></div><!-- 회원수 | 설립일 -->
			<div class='club_introduce'><a>${list1.club_introduce}</a></div><!-- 소개 -->
		</c:if>
	</div>
</c:if>			
		
		
		
		
<c:if test="${size >= 3}">			
	<div id='d3'>
		<c:if test="${list2.clubPicture_newName != null}">
			<div class='picture' id='p3'><a><img id="img" src="./resources/club-picture/${list2.clubPicture_newName}"/></a></div>
		</c:if>
		<c:if test="${list2.clubPicture_newName == null}">
			<div class='picture' id='p3'><a><img id="img" src="./resources/club-picture/default.png"/></a></div>
		</c:if>

		<c:if test="${list2.club_name != null}">
			<div class='club_name'><a>${list2.club_name}</a></div>
			<div class='club_interest'><a>${list2.interest_interest}  |  ${list2.club_location} </a></div><!-- 주제 | 지역 -->
			<div class='club_date'><a>${list2.club_memberCount} 명  |  SINCE ${list2.club_date} </a></div><!-- 회원수 | 설립일 -->
			<div class='club_introduce'><a>${list2.club_introduce}</a></div><!-- 소개 -->
		</c:if>
	</div>
</c:if>		
		
		
		

<c:if test="${size >= 4}">				
	<div id='d4'>
		<c:if test="${list3.clubPicture_newName != null}">      
			<div class='picture' id='p4'><a><img id="img" src="./resources/club-picture/${list3.clubPicture_newName}"/></a></div>
		</c:if>
		<c:if test="${list3.clubPicture_newName == null}">
			<div class='picture' id='p4'><a><img id="img" src="./resources/club-picture/default.png"/></a></div>
		</c:if>

		<c:if test="${list3.club_name != null}">
			<div class='club_name'><a>${list3.club_name}</a></div>
			<div class='club_interest'><a>${list3.interest_interest}  |  ${list3.club_location} </a></div><!-- 주제 | 지역 -->
			<div class='club_date'><a>${list3.club_memberCount} 명  |  SINCE ${list3.club_date} </a></div><!-- 회원수 | 설립일 -->
			<div class='club_introduce'><a>${list3.club_introduce}</a></div><!-- 소개 -->
		</c:if>
	</div>
</c:if>			
		
		
		
		
<c:if test="${size >= 5}">			
	<div id='d5'>
		<c:if test="${list4.clubPicture_newName != null}">
			<div class='picture' id='p5'><a><img id="img" src="./resources/club-picture/${list4.clubPicture_newName}"/></a></div>
		</c:if>
		<c:if test="${list4.clubPicture_newName == null}">
			<div class='picture' id='p5'><a><img id="img" src="./resources/club-picture/default.png"/></a></div>
		</c:if>

		<c:if test="${list4.club_name != null}">
			<div class='club_name'><a>${list4.club_name}</a></div>
			<div class='club_interest'><a>${list4.interest_interest}  |  ${list4.club_location} </a></div><!-- 주제 | 지역 -->
			<div class='club_date'><a>${list4.club_memberCount} 명  |  SINCE ${list4.club_date} </a></div><!-- 회원수 | 설립일 -->
			<div class='club_introduce'><a>${list4.club_introduce}</a></div><!-- 소개 -->
		</c:if>
	</div>
</c:if>		
	
<!-- 인기동호회 3개 -->
<div id='intTitle'><a>인기동호회</a></div>

<c:if test="${size2 == 0}">
	<div class='club_default2'><a>동호회를 준비중입니다.</a></div>
</c:if>

<c:if test="${size2 >= 1}">
<div id='interDiv1'></div>
		<c:if test="${inter.clubPicture_newName == null}">
			<div class='intPicture' id='int1'><a><img class="interImg" src="./resources/club-picture/default.png"/></a></div>
		</c:if>
		<c:if test="${inter.clubPicture_newName != null}">
			<div class='intPicture' id='int1'><a><img class="interImg" src="./resources/club-picture/${inter.clubPicture_newName}"/></a></div>
		</c:if>
	<div id='ip1'><a>${inter.club_name}</a></div><!-- 이름 -->
	<div id='ipp1'><a>회원수 : ${inter.club_memberCount}명</a></div>
</c:if>

<c:if test="${size2 >= 2}">
<div id='interDiv2'></div>
		<c:if test="${inter2.clubPicture_newName == null}">
			<div class='intPicture' id='int2'><a><img class="interImg" src="./resources/club-picture/default.png"/></a></div>
		</c:if>
		<c:if test="${inter2.clubPicture_newName != null}">
			<div class='intPicture' id='int2'><a><img class="interImg" src="./resources/club-picture/${inter2.clubPicture_newName}"/></a></div>	
		</c:if>
	<div id='ip2'><a>${inter2.club_name}</a></div><!-- 이름  -->
	<div id='ipp2'><a>회원수 : ${inter2.club_memberCount}명</a></div>
</c:if>

<c:if test="${size2 == 3}">
<div id='interDiv3'></div>
		<c:if test="${inter3.clubPicture_newName == null}">
			<div class='intPicture' id='int3'><a><img class="interImg" src="./resources/club-picture/default.png"/></a></div>
		</c:if>
		<c:if test="${inter3.clubPicture_newName != null}">
			<div class='intPicture' id='int3'><a><img class="interImg" src="./resources/club-picture/${inter3.clubPicture_newName}"/></a></div>
		</c:if>
	<div id='ip3'><a>${inter3.club_name}</a></div><!-- 이름 -->
	<div id='ipp3'><a>회원수 : ${inter3.club_memberCount}명</a></div>
</c:if>   
	
	
	
	
	
	
<!-- 맞춤동호회 3개  -->
<c:if test="${userId != null}">

<div id='bestTitle'><a>맞춤동호회</a></div>


<c:if test="${size3 == 0}">
	<div class='club_default3'><a>맞춤 동호회를 준비중입니다.</a></div>
</c:if>

<c:if test="${size3 >= 1}">
<div id='bestDiv1'></div>
<c:if test="${best1.clubPicture_newName == null}">
	<div class='intPicture' id='bp1'><a><img class="interImg" src="./resources/club-picture/default.png"/></a></div>
</c:if>
<c:if test="${best1.clubPicture_newName != null}">
<div class='intPicture' id='bp1'><a><img class="interImg" src="./resources/club-picture/${best1.clubPicture_newName}"/></a></div>
</c:if>
	<div id='b1'><a>${best1.club_name}</a></div><!-- 이름 -->
	<div id='bb1'><a>회원수 : ${best1.club_memberCount}명</a></div>
</c:if>

<c:if test="${size3 >= 2}">
<div id='bestDiv2'></div>
<c:if test="${best2.clubPicture_newName == null}">
	<div class='intPicture' id='bp2'><a><img class="interImg" src="./resources/club-picture/default.png"/></a></div>
</c:if>
<c:if test="${best2.clubPicture_newName != null}">
<div class='intPicture' id='bp2'><a><img class="interImg" src="./resources/club-picture/${best2.clubPicture_newName}"/></a></div>
</c:if>
	<div id='b2'><a>${best2.club_name}</a></div><!-- 이름  -->
	<div id='bb2'><a>회원수 : ${best2.club_memberCount}명</a></div>
</c:if>

<c:if test="${size3 >= 3}">
<div id='bestDiv3'></div>
<c:if test="${best3.clubPicture_newName == null}">
	<div class='intPicture' id='bp3'><a><img class="interImg" src="./resources/club-picture/default.png"/></a></div>
</c:if>
<c:if test="${best3.clubPicture_newName != null}">
<div class='intPicture' id='bp3'><a><img class="interImg" src="./resources/club-picture/${best3.clubPicture_newName}"/></a></div>
</c:if>
	<div id='b3'><a>${best3.club_name}</a></div><!-- 이름 -->
	<div id='bb3'><a>회원수 : ${best3.club_memberCount}명</a></div>
</c:if>   

</c:if>
    
		
		
    
<input id="next" type="button" onclick="next()" value="▶">             
<input id="back" type="button" onclick="back()" value="◀"> 


<div id='gongbaeg'><a>공백ㅋ</a></div>            
</body>
<script>

var size = "${size}";

/* 동호회가 5개 이상일때 */

if(size>=5){
	

$(document).ready(function(){
	$("#d1").show();
	$("#d2").hide();
	$("#d3").hide();
	$("#d4").hide();
	$("#d5").hide();
 });
 
 var a = 5;

playAlert = setInterval(function() {
 	$("#d1").hide();
	$("#d2").hide();
	$("#d3").hide();
	$("#d4").hide();
	$("#d5").hide();
if(a==5){
	a=4;
	$("#d2").show();
}else if(a==4){
	a=3;
	$("#d3").show();
}else if(a==3){
	a=2;
	$("#d4").show();
}else if(a==2){
	a=1;
	$("#d5").show();
}else if(a==1){
	a=5;
	$("#d1").show();
}
}, 5000);


	function next(){
     	$("#d1").hide();
		$("#d2").hide();
		$("#d3").hide();
		$("#d4").hide();
		$("#d5").hide();
		console.log(a);
		if(a==5){
			a=4;
			$("#d2").show();
		}else if(a==4){
			a=3;
			$("#d3").show();
		}else if(a==3){
			a=2;
			$("#d4").show();
		}else if(a==2){
			a=1;
			$("#d5").show();
		}else if(a==1){
			a=5;
			$("#d1").show();
		}
   }
        
   function back(){     
     	$("#d1").hide();
		$("#d2").hide();
		$("#d3").hide();
		$("#d4").hide();
		$("#d5").hide();
	   console.log(a);
		if(a==5){
			a=1;
			$("#d2").show();
		}else if(a==4){
			a=5;
			$("#d3").show();
		}else if(a==3){
			a=4;
			$("#d4").show();
		}else if(a==2){
			a=3;
			$("#d5").show();
		}else if(a==1){
			a=2;    
			$("#d1").show();
		}
   }
 
}   
   /* 동호회가 4개 일때 */
if(size==4){   
   
	
	   $(document).ready(function(){
			$("#d1").show();
			$("#d2").hide();
			$("#d3").hide();
			$("#d4").hide();
		 });
	   
	   var a = 4;
	   
	   playAlert = setInterval(function() {
		 	$("#d1").hide();
			$("#d2").hide();
			$("#d3").hide();
			$("#d4").hide();

		if(a==4){
			a=3;
			$("#d2").show();
		}else if(a==3){
			a=2;
			$("#d3").show();
		}else if(a==2){
			a=1;
			$("#d4").show();
		}else if(a==1){
			a=4;
			$("#d1").show();
		}
}, 5000);
   
	   
	   function next(){
	     	$("#d1").hide();
			$("#d2").hide();
			$("#d3").hide();
			$("#d4").hide();

			console.log(a);
			if(a==4){
				a=3;
				$("#d2").show();
			}else if(a==3){
				a=2;
				$("#d3").show();
			}else if(a==2){
				a=1;
				$("#d4").show();
			}else if(a==1){
				a=4;
				$("#d1").show();
			}
	   }
	   
	   function back(){     
	     	$("#d1").hide();
			$("#d2").hide();
			$("#d3").hide();
			$("#d4").hide();

		   console.log(a);
			if(a==4){
				a=1;
				$("#d2").show();
			}else if(a==3){
				a=4;
				$("#d3").show();
			}else if(a==2){
				a=3;
				$("#d4").show();
			}else if(a==1){
				a=2;
				$("#d1").show();
			}
	   }
}   
   
   
   
   /* 동호회가 3개 일때 */
if(size==3){
	
	

   $(document).ready(function(){
	$("#d1").show();
	$("#d2").hide();
	$("#d3").hide();
 });
   var a = 3;

playAlert = setInterval(function() {
 	$("#d1").hide();
	$("#d2").hide();
	$("#d3").hide();

if(a==3){
	a=2;
	$("#d2").show();
}else if(a==2){
	a=1;
	$("#d3").show();
}else if(a==1){
	a=3;
	$("#d1").show();
}
}, 5000);


	function next(){
     	$("#d1").hide();
		$("#d2").hide();
		$("#d3").hide();

		console.log(a);
		if(a==3){
			a=2;
			$("#d2").show();
		}else if(a==2){
			a=1;
			$("#d3").show();
		}else if(a==1){
			a=3;
			$("#d1").show();
		}
   }
        
   function back(){     
     	$("#d1").hide();
		$("#d2").hide();
		$("#d3").hide();

	   console.log(a);
		if(a==3){
			a=1;
			$("#d2").show();
		}else if(a==2){
			a=3;
			$("#d3").show();
		}else if(a==1){
			a=2;
			$("#d1").show();
		}
   }
   
}   
   
   
   
   
   
   /* 동호회가 2개 일때 */
if(size==2){
	
	

  $(document).ready(function(){
	$("#d1").show();
	$("#d2").hide();
 });
   var a = 2;

playAlert = setInterval(function() {
 	$("#d1").hide();
	$("#d2").hide();

if(a==2){
	a=1;
	$("#d2").show();
}else if(a==1){
	a=2;
	$("#d1").show();
}
}, 5000);


	function next(){
     	$("#d1").hide();
		$("#d2").hide();

		console.log(a);
		if(a==2){
			a=1;
			$("#d1").show();
		}else if(a==1){
			a=2;
			$("#d2").show();
		}
   }
        
   function back(){     
     	$("#d1").hide();
		$("#d2").hide();

	   console.log(a);
		if(a==2){
			a=1;
			$("#d1").show();
		}else if(a==1){
			a=2;
			$("#d2").show();
		}
   }
   
   
}   
   /* 동호회가 1개 일때 */
if(size==1){
  $(document).ready(function(){
	$("#d1").show();
 });
 function next(){ $("#d1").show();}
 function back(){ $("#d1").show();}
}
 
   
if(size==0){
	 function next(){ console.log("동호회없음");}
	 function back(){ console.log("동호회없음");}
}
 
 
</script>
</html>