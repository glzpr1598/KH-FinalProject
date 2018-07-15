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
		img#img{width: 400px; height: 250px;} 
		.picture{position: absolute; left: 380px; top: 300px;}
		#all{position: absolute; left: 337px; top: 230px; border: 5px solid #ffbf00; width: 1050px; height: 350px;}   
		 #back{position: absolute; left: 285px; top: 390px; font-size: 20px; border: 2px solid #ffbf00;}             
         #next{position: absolute; left: 1403px; top: 390px; font-size: 20px;border: 2px solid #ffbf00;}       
         
         #we{position: absolute; left: 380px; top: 260px; font-weight: bold;  font-size: 24px; background: white;}     
         .club_name{position: absolute; left: 840px; top: 300px; font-weight: bold;  font-size: 35px; background: white; }   
         .club_interest{position: absolute; left: 840px; top: 370px; font-weight: normal;  font-size: 15px; background: white; }   
         .club_date{position: absolute; left: 840px; top: 390px; font-weight: normal;  font-size: 15px; background: white; }      
         .club_introduce{position: absolute; left: 840px; top: 430px; font-weight: normal;  font-size: 20px; background: white; width: 500px; height: 120px;}       
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
  		
</style>   
</head>
<body>

	<%@ include file="./main-header.jsp" %>
	<a id='we'>우리 동호회를 소개합니다.</a>
	<div id='all'>
	</div>

	<div id='d1'>
		<c:if test="${list0.clubPicture_newName != null}">
			<div class='picture' id='p1'><a><img id="img" src="./resources/image/${list0.clubPicture_newName}"/></a></div>
		</c:if>


			<div class='club_name'><a>${list0.club_name}</a></div>
			<div class='club_interest'><a>${list0.interest_interest}  |  ${list0.club_location} </a></div><!-- 주제 | 지역 -->
			<div class='club_date'><a>${list0.club_memberCount} 명  |  SINCE ${list0.club_date} </a></div><!-- 회원수 | 설립일 -->
			<div class='club_introduce'><a>${list0.club_introduce}</a></div><!-- 소개 -->


	</div>
		
	<div id='d2'>
		<c:if test="${list1.clubPicture_newName != null}">
			<div class='picture' id='p2'><a><img id="img" src="./resources/image/${list1.clubPicture_newName}"/></a></div>
		</c:if>     


			<div class='club_name'><a>${list1.club_name}</a></div>
			<div class='club_interest'><a>${list1.interest_interest}  |  ${list1.club_location} </a></div><!-- 주제 | 지역 -->
			<div class='club_date'><a>${list1.club_memberCount} 명  |  SINCE ${list1.club_date} </a></div><!-- 회원수 | 설립일 -->
			<div class='club_introduce'><a>${list1.club_introduce}</a></div><!-- 소개 -->


	</div>
		
	<div id='d3'>
		<c:if test="${list2.clubPicture_newName != null}">
			<div class='picture' id='p3'><a><img id="img" src="./resources/image/${list2.clubPicture_newName}"/></a></div>
		</c:if>


			<div class='club_name'><a>${list2.club_name}</a></div>
			<div class='club_interest'><a>${list2.interest_interest}  |  ${list2.club_location} </a></div><!-- 주제 | 지역 -->
			<div class='club_date'><a>${list2.club_memberCount} 명  |  SINCE ${list2.club_date} </a></div><!-- 회원수 | 설립일 -->
			<div class='club_introduce'><a>${list2.club_introduce}</a></div><!-- 소개 -->


	</div>
		
	<div id='d4'>
		<c:if test="${list3.clubPicture_newName != null}">      
			<div class='picture' id='p4'><a><img id="img" src="./resources/image/${list3.clubPicture_newName}"/></a></div>
		</c:if>


			<div class='club_name'><a>${list3.club_name}</a></div>
			<div class='club_interest'><a>${list3.interest_interest}  |  ${list3.club_location} </a></div><!-- 주제 | 지역 -->
			<div class='club_date'><a>${list3.club_memberCount} 명  |  SINCE ${list3.club_date} </a></div><!-- 회원수 | 설립일 -->
			<div class='club_introduce'><a>${list3.club_introduce}</a></div><!-- 소개 -->


	</div>
		
	<div id='d5'>
		<c:if test="${list4.clubPicture_newName != null}">
			<div class='picture' id='p5'><a><img id="img" src="./resources/image/${list4.clubPicture_newName}"/></a></div>
		</c:if>


			<div class='club_name'><a>${list4.club_name}</a></div>
			<div class='club_interest'><a>${list4.interest_interest}  |  ${list4.club_location} </a></div><!-- 주제 | 지역 -->
			<div class='club_date'><a>${list4.club_memberCount} 명  |  SINCE ${list4.club_date} </a></div><!-- 회원수 | 설립일 -->
			<div class='club_introduce'><a>${list4.club_introduce}</a></div><!-- 소개 -->


	</div>
	
		
		

<input id="next" type="button" onclick="next()" value="▶">             
<input id="back" type="button" onclick="back()" value="◀"> 

</body>
<script>


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
 
 
 
 
 
 
 
 
</script>
</html>