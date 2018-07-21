<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="icon" href="./resources/image/icon-32.png" />
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css?family=Jua|Nanum+Gothic" rel="stylesheet">
<title>HAMO</title>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<style>
	/* 랜덤 동호회 */
	#all {
		box-sizing: border-box;
		width: 1000px;
		height: 300px;
		margin: 0 auto 30px auto;
		border: medium solid #ffbf00;
		border-radius: 5px;
	}
	.left {
		float: left;
	}
	.right {
		float: right;
	}
	#back, #next {
	    line-height: 294px;
	    width: 50px;
	    font-size: 30px;
	    text-align: center;
	    color: #ffbf00;
	    cursor: pointer;
	}
	
	#we {
	    font-size: 27px;
	    margin: 15px 0px 10px 0px;
	    font-family: 'Jua', sans-serif;
	}
	
	.picture {
		float: left;
	}
	.picture img{
		height: 215px;
	    max-width: 400px;
	}
	
	.text {
		width: 470px;
		margin-left: 20px;
		font-size: 13px;
	}
	.text .club_name {
		font-size: 23px;
		font-family: 'Nanum Gothic', sans-serif;
		font-weight: bold;
		margin-bottom: 15px;
	}
	.text .club_name a {
		color: black;
		text-decoration: none;
	}
	.text .club_interest {
		margin-bottom: 3px;
	}
	.text .club_introduce {
		font-size: 14px;
		margin-top: 10px;
	}
	
	/* 인기 동호회 */
	#intContainer {
		width: 1000px;
		height: 300px;
		margin: 0 auto 20px auto;
	}
	#intTitle {
		font-size: 20px;
		font-weight: bold;
		margin-bottom: 10px;
	}
	.interDiv {
		float: left;
		margin-right: 50px;
		box-sizing: border-box;
		width: 300px;
		height: 250px;
		border: medium solid #ffbf00;
		border-radius: 5px;
		padding: 15px;
	}
	.interDiv#interDiv3 {
		margin-right: 0px;
	}
	.intPicture img {
	    width: 264px;
    	height: 170px;
	}
	.intText1 {
		margin-top: 8px;
		font-size: 13px;
		font-weight: bold;
	}
	.intText1 a {
		color: black;
		text-decoration: none;
	}
	.intText2 {
		margin-top: 5px;
		font-size: 12px;
	}
	
	/* 맞춤 동호회 */
	#bestContainer {
		width: 1000px;
		height: 300px;
		margin: 0 auto 20px auto;
	}
	#bestTitle {
		font-size: 20px;
		font-weight: bold;
		margin-bottom: 10px;
	}
	.bestDiv {
		float: left;
		margin-right: 50px;
		box-sizing: border-box;
		width: 300px;
		height: 250px;
		border: medium solid #ffbf00;
		border-radius: 5px;
		padding: 15px;
	}
	.bestDiv#bestDiv3 {
		margin-right: 0px;
	}
</style>                  
</head>   
<body>               
	<%@ include file="./main-header.jsp" %>
	<!-- 랜덤동호회  5개 -->
	<c:if test="${size >= 1}">
		<div id='all'>
			<div class="left">
				<i id="back" onclick="back()" class="fas fa-angle-left"></i>
			</div> 
			<div class="left">
				<div id='we'>우리 동호회를 소개합니다.</div>
				
				<div id='d1'>
					<c:if test="${list0.clubPicture_newName != null}">
						<div class='picture left'><a href="./clubMain?club_id=${ list0.club_id }"><img src="./resources/club-picture/${list0.clubPicture_newName}"/></a></div>
					</c:if>
					<c:if test="${list0.clubPicture_newName == null}">
						<div class='picture left'><a href="./clubMain?club_id=${ list0.club_id }"><img src="./resources/club-picture/default.png"/></a></div>
					</c:if>
					
					<c:if test="${list0.club_name != null}">
						<div class="left text">
							<div class='club_name'><a href="./clubMain?club_id=${ list0.club_id }">${list0.club_name}</a></div>
							<div class='club_interest'><a>${list0.interest_interest}  |  ${list0.club_location} </a></div>
							<div class='club_date'><a><i class="fa fa-user"></i> ${list0.club_memberCount} | since ${list0.club_date} </a></div>
							<div class='club_introduce'><a>${list0.club_introduce}</a></div>
						</div>
					</c:if>
				</div>
				
				<c:if test="${size >= 2}">
					<div id='d2'>
						<c:if test="${list1.clubPicture_newName != null}">
							<div class='picture left'><a href="./clubMain?club_id=${ list1.club_id }"><img src="./resources/club-picture/${list1.clubPicture_newName}"/></a></div>
						</c:if>
						<c:if test="${list1.clubPicture_newName == null}">
							<div class='picture left'><a href="./clubMain?club_id=${ list0.club_id }"><img src="./resources/club-picture/default.png"/></a></div>
						</c:if>
						
						<c:if test="${list1.club_name != null}">
							<div class="left text">
								<div class='club_name'><a href="./clubMain?club_id=${ list1.club_id }">${list1.club_name}</a></div>
								<div class='club_interest'><a>${list1.interest_interest}  |  ${list1.club_location} </a></div>
								<div class='club_date'><a><i class="fa fa-user"></i> ${list1.club_memberCount} | since ${list1.club_date} </a></div><!-- 회원수 | 설립일 -->
								<div class='club_introduce'><a>${list1.club_introduce}</a></div>
							</div>
						</c:if>
					</div>
				</c:if>
				
				<c:if test="${size >= 3}">
					<div id='d3'>
						<c:if test="${list2.clubPicture_newName != null}">
							<div class='picture left'><a href="./clubMain?club_id=${ list2.club_id }"><img src="./resources/club-picture/${list2.clubPicture_newName}"/></a></div>
						</c:if>
						<c:if test="${list2.clubPicture_newName == null}">
							<div class='picture left'><a href="./clubMain?club_id=${ list0.club_id }"><img src="./resources/club-picture/default.png"/></a></div>
						</c:if>
						
						<c:if test="${list2.club_name != null}">
							<div class="left text">
								<div class='club_name'><a href="./clubMain?club_id=${ list2.club_id }">${list2.club_name}</a></div>
								<div class='club_interest'><a>${list2.interest_interest}  |  ${list2.club_location} </a></div>
								<div class='club_date'><a><i class="fa fa-user"></i> ${list2.club_memberCount} | since ${list2.club_date} </a></div><!-- 회원수 | 설립일 -->
								<div class='club_introduce'><a>${list2.club_introduce}</a></div>
							</div>
						</c:if>
					</div>
				</c:if>
				
				<c:if test="${size >= 4}">
					<div id='d4'>
						<c:if test="${list3.clubPicture_newName != null}">
							<div class='picture left'><a href="./clubMain?club_id=${ list3.club_id }"><img src="./resources/club-picture/${list3.clubPicture_newName}"/></a></div>
						</c:if>
						<c:if test="${list3.clubPicture_newName == null}">
							<div class='picture left'><a href="./clubMain?club_id=${ list0.club_id }"><img src="./resources/club-picture/default.png"/></a></div>
						</c:if>
						
						<c:if test="${list3.club_name != null}">
							<div class="left text">
								<div class='club_name'><a href="./clubMain?club_id=${ list3.club_id }">${list3.club_name}</a></div>
								<div class='club_interest'><a>${list3.interest_interest}  |  ${list3.club_location} </a></div>
								<div class='club_date'><a><i class="fa fa-user"></i> ${list3.club_memberCount} | since ${list3.club_date} </a></div><!-- 회원수 | 설립일 -->
								<div class='club_introduce'><a>${list3.club_introduce}</a></div>
							</div>
						</c:if>
					</div>
				</c:if>
				
				<c:if test="${size >= 5}">
					<div id='d5'>
						<c:if test="${list4.clubPicture_newName != null}">
							<div class='picture left'><a href="./clubMain?club_id=${ list4.club_id }"><img src="./resources/club-picture/${list4.clubPicture_newName}"/></a></div>
						</c:if>
						<c:if test="${list4.clubPicture_newName == null}">
							<div class='picture left'><a href="./clubMain?club_id=${ list0.club_id }"><img src="./resources/club-picture/default.png"/></a></div>
						</c:if>
						
						<c:if test="${list4.club_name != null}">
							<div class="left text">
								<div class='club_name'><a href="./clubMain?club_id=${ list4.club_id }">${list4.club_name}</a></div>
								<div class='club_interest'><a>${list4.interest_interest}  |  ${list4.club_location} </a></div>
								<div class='club_date'><a><i class="fa fa-user"></i> ${list4.club_memberCount} | since ${list4.club_date} </a></div><!-- 회원수 | 설립일 -->
								<div class='club_introduce'><a>${list4.club_introduce}</a></div>
							</div>
						</c:if>
					</div>
				</c:if>
				
			</div>
			<div class="right">
				<i id="next" onclick="next()" class="fas fa-angle-right"></i>
			</div>
			
		</div>
	</c:if>		
		
	<!-- 인기동호회 3개 -->
	<c:if test="${size2 >= 1}">
		<div id="intContainer">
			<div id='intTitle'>| 인기 동호회 |</div>
			
			<div class="interDiv" id='interDiv1'>
				<c:if test="${inter.clubPicture_newName == null}">
					<div class='intPicture' id='int1'>
						<a href="./clubMain?club_id=${ inter.club_id }">
							<img class="interImg" src="./resources/club-picture/default.png"/>
						</a>
					</div>
				</c:if>
				<c:if test="${inter.clubPicture_newName != null}">
					<div class='intPicture' id='int1'>
						<a href="./clubMain?club_id=${ inter.club_id }">
							<img class="interImg" src="./resources/club-picture/${inter.clubPicture_newName}"/>
						</a>
					</div>
				</c:if>
				<div class="intText">
					<div class="intText1" id='ip1'>
						<a href="./clubMain?club_id=${ inter.club_id }">${inter.club_name}</a>
					</div>
					<div class="intText2" id='ipp1'>
						${inter.interest_interest} | ${inter.club_location} | <i class="fa fa-user"></i> ${inter.club_memberCount}
					</div>
				</div>
			</div>
			
			<c:if test="${size2 >= 2}">
				<div class="interDiv" id='interDiv2'>
					<c:if test="${inter2.clubPicture_newName == null}">
						<div class='intPicture' id='int2'>
							<a href="./clubMain?club_id=${ inter2.club_id }">
								<img class="interImg" src="./resources/club-picture/default.png"/>
							</a>
						</div>
					</c:if>
					<c:if test="${inter2.clubPicture_newName != null}">
						<div class='intPicture' id='int2'>
							<a href="./clubMain?club_id=${ inter2.club_id }">
								<img class="interImg" src="./resources/club-picture/${inter2.clubPicture_newName}"/>
							</a>
						</div>
					</c:if>
					<div class="intText">
						<div class="intText1" id='ip2'>
							<a href="./clubMain?club_id=${ inter2.club_id }">${inter2.club_name}</a>
						</div>
						<div class="intText2" id='ipp2'>
							${inter2.interest_interest} | ${inter2.club_location} | <i class="fa fa-user"></i> ${inter2.club_memberCount}
						</div>
					</div>
				</div>
			</c:if>
			
			<c:if test="${size2 >= 3}">
				<div class="interDiv" id='interDiv3'>
					<c:if test="${inter3.clubPicture_newName == null}">
						<div class='intPicture' id='int3'>
							<a href="./clubMain?club_id=${ inter3.club_id }">
								<img class="interImg" src="./resources/club-picture/default.png"/>
							</a>
						</div>
					</c:if>
					<c:if test="${inter3.clubPicture_newName != null}">
						<div class='intPicture' id='int3'>
							<a href="./clubMain?club_id=${ inter3.club_id }">
								<img class="interImg" src="./resources/club-picture/${inter3.clubPicture_newName}"/>
							</a>
						</div>
					</c:if>
					<div class="intText">
						<div class="intText1" id='ip3'>
							<a href="./clubMain?club_id=${ inter3.club_id }">${inter3.club_name}</a>
						</div>
						<div class="intText2" id='ipp3'>
							${inter3.interest_interest} | ${inter3.club_location} | <i class="fa fa-user"></i> ${inter3.club_memberCount}
						</div>
					</div>
				</div>
			</c:if>
		</div>
	</c:if>
	
	<!-- 맞춤동호회 3개  -->
	<c:if test="${size3 >= 1}">
		<div id="bestContainer">
			<div id='bestTitle'><a>| 맞춤 동호회 |</a></div>
			
			<div class="bestDiv" id='bestDiv1'>
				<c:if test="${best1.clubPicture_newName == null}">
					<div class='intPicture' id='bp1'><a href="./clubMain?club_id=${ best1.club_id }"><img class="interImg" src="./resources/club-picture/default.png"/></a></div>
				</c:if>
				<c:if test="${best1.clubPicture_newName != null}">
					<div class='intPicture' id='bp1'><a href="./clubMain?club_id=${ best1.club_id }"><img class="interImg" src="./resources/club-picture/${best1.clubPicture_newName}"/></a></div>
				</c:if>
				<div class="intText">
					<div class="intText1" id='b1'><a>${best1.club_name}</a></div><!-- 이름 -->
					<div class="intText2" id='bb1'>
						${best1.interest_interest} | ${best1.club_location} | <i class="fa fa-user"></i> ${best1.club_memberCount}
					</div>
				</div>
			</div>
			
			<c:if test="${size3 >= 2}">
				<div class="bestDiv" id='bestDiv2'>
					<c:if test="${best2.clubPicture_newName == null}">
						<div class='intPicture' id='bp1'><a href="./clubMain?club_id=${ best2.club_id }"><img class="interImg" src="./resources/club-picture/default.png"/></a></div>
					</c:if>
					<c:if test="${best2.clubPicture_newName != null}">
						<div class='intPicture' id='bp1'><a href="./clubMain?club_id=${ best2.club_id }"><img class="interImg" src="./resources/club-picture/${best2.clubPicture_newName}"/></a></div>
					</c:if>
					<div class="intText">
						<div class="intText1" id='b1'><a>${best2.club_name}</a></div><!-- 이름 -->
						<div class="intText2" id='bb1'>
							${best2.interest_interest} | ${best2.club_location} | <i class="fa fa-user"></i> ${best2.club_memberCount}
						</div>
					</div>
				</div>
			</c:if>
			
			<c:if test="${size3 >= 3}">
				<div class="bestDiv" id='bestDiv3'>
					<c:if test="${best3.clubPicture_newName == null}">
						<div class='intPicture' id='bp1'><a href="./clubMain?club_id=${ best3.club_id }"><img class="interImg" src="./resources/club-picture/default.png"/></a></div>
					</c:if>
					<c:if test="${best3.clubPicture_newName != null}">
						<div class='intPicture' id='bp1'><a href="./clubMain?club_id=${ best3.club_id }"><img class="interImg" src="./resources/club-picture/${best3.clubPicture_newName}"/></a></div>
					</c:if>
					<div class="intText">
						<div class="intText1" id='b1'><a>${best3.club_name}</a></div><!-- 이름 -->
						<div class="intText2" id='bb1'>
							${best3.interest_interest} | ${best3.club_location} | <i class="fa fa-user"></i> ${best3.club_memberCount}
						</div>
					</div>
				</div>
			</c:if>
		</div>
	</c:if>
		<%@ include file="./footer.jsp" %>     
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