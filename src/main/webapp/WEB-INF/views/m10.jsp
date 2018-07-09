<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
	<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
	<link rel="icon" href="./resources/image/icon-32.png" />
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>HAMO</title>
	<style>
		#findClub{
			background-color: #FDF5DC;
			color: #848484;
		}

		.container {
			text-align: center;
			width:1050px;
			margin: 0 auto;
			padding: 20px 0;
		}

		.nav {
			font-weight: 400; /* 400 thinner */
			font-size: 13px;
			line-height: 13px;
			position: relative;
			padding: 0 0 0 4px; /* Fix for inline-block spacing*/
			margin: 0;
			background-color: #FFBF00;
		}


		.nav a, .nav a:link, .nav a:visited, .nav a:hover, .nav a:focus, span {
			text-decoration: none;
			color: black;
		}

		.nav > li {
			display: inline-block;
			text-align: center;
			margin-left: -4px; /* For the inline-block spacing */
			padding:20px 18px;
		}

		/*  .nav > li > a {
			padding:20px 18px;
			display: block;
		}  */


		.nav > li:hover {
			background-color: #FDF5DC ;
		}



		 .nav > li > ul {
			opacity: 0;
			visibility: visible;
			position: absolute;
			list-style: none;
			top:53px;
			background-color: #FDF5DC;
			width: 200px;
			text-align: left;
			margin-top:30px;
			padding: 0px;
			z-index: 99;
		} 
		.nav > li > .fulldrop {
			opacity: 0;
			visibility: hidden;
			position: absolute;
			list-style: none;
			top:53px;
			left: 0px;
			background-color: #FDF5DC;
			width: 100%;
			min-height: 100px;
			text-align: left;
			margin-top:30px;
			padding: 0;
			z-index: 99;
			overflow: hidden;
		}
	 	.nav > li:hover > ul {
			opacity: 1;
			visibility: visible;
			margin-top: 0px;
		} 
			
			
		.nav li > ul li {
			font-size: 11px;
			position: relative;
			display: block;
			padding: 15px 10px;
		}
		
		.nav > li > ul  li:hover {
			background-color: black;
		}
/* 
.nav ul  li:hover > a {
	color: white;
} */

/* .nav > li > ul li ul li:hover {
	background-color: #FDF5DC;
}

.nav > li > ul li ul li ul {
	background-color: #FDF5DC;
}

.nav > li > ul li ul li ul li:hover {
	background-color: #FDF5DC;
} */



		

		.nav > li:hover .fulldrop {
			opacity: 1;
			visibility: visible;
			margin-top: 0px;
		}

		.nav ul li:hover:after {
			color: black;
		}

		.nav > li:hover .coldrop {
			opacity: 1;
			visibility: visible;
			margin-top: 0px;
		}

		.nav .coldrop .column {
		width: 130px;
		margin:0 9px;
		}



		.nav .column {
			width: 14.1%;
			float: left;
			margin: 10 0 0 2.2%;
		}
		
		.nav .column ul {
			padding: 0;
			margin: 0;
		}

		.nav .column ul li {
			padding: 0;
			list-style: none;
			font-size: 11px;
		}

		.nav .column ul li a {
			display: block;
			padding: 0 0 15px 0;
		}

		.nav > li.dropdown > a:after {
			 content: " \f107";
			 font-family: FontAwesome;
			 color: #fff;
		}
		#text {
			position: relative;
			left: 17%;
		}
		
		
		
		table{
			margin-top: 10px;
			width : 1050px;
			text-align: center;
			border-collapse: collapse;
		}
		th{
			background-color:#FDF5DC;
		}
		td{
			border-bottom: 1px solid #ffbf00;
		}
		#div1{
			position: absolute;
			left: 17%;
			top: 67%;
		}
		i{
			color: #FFBF00;
		}
		a{
			cursor:pointer;
			color: black;
			text-decoration: none;
		}
		input[type=submit]{
			background-color:white; 
			border: 1px solid #FFBF00;
			
			/* border-radius: 5px;  모서리 둥굴게*/
		}
		form{
			margin: 0;
		}
	</style>

	</head>
	<body>
		<%@ include file="./main-header.jsp" %>
	
		<div class="container">
			<div>
            	<ul class="nav">
            		<li  class="dropdown"><a >전체 보기</a>     
                  
              			<div class="fulldrop" >              
               				<div class="column">
			                    	<input type="radio" name="interest" value="전체" checked="checked"/>전체
			                </div>
                
           			    </div>
           			</li>
              		<li class="dropdown"><a>운동/스포츠</a>     
              			<div class="fulldrop">              
            				  <div class="column"><input type="radio" name="interest" value="운동/스포츠/전체"/>전체</div>
            				  <div class="column"><input type="radio" name="interest" value="운동/스포츠/축구"/>축구</div>
            				  <div class="column"><input type="radio" name="interest" value="운동/스포츠/농구"/>농구</div>
            				  <div class="column"><input type="radio" name="interest" value="운동/스포츠/야구"/>야구</div>
            				  <div class="column"><input type="radio" name="interest" value="운동/스포츠/배구"/>배구</div>
            				  <div class="column"><input type="radio" name="interest" value="운동/스포츠/자전거"/>자전거</div>
            				  <div class="column"><input type="radio" name="interest" value="운동/스포츠/배드민턴"/>배드민턴</div>
            				  <div class="column"><input type="radio" name="interest" value="운동/스포츠/볼링"/>볼링</div>
            				  <div class="column"><input type="radio" name="interest" value="운동/스포츠/테니스/스쿼시"/>테니스/스쿼시</div>
     	       				  <div class="column"><input type="radio" name="interest" value="운동/스포츠/수영"/>수영</div>
 							  <div class="column"><input type="radio" name="interest" value="운동/스포츠/족구"/>족구</div>
						</div>
             		</li>
              		<li class="dropdown"><a>아웃도어/여행</a>     
                  
              			<div class="fulldrop">              
            				  <div class="column"><input type="radio" name="interest" value="아웃도어/여행/전체" />전체</div>
            				  <div class="column"><input type="radio" name="interest" value="아웃도어/여행/등산" />등산</div>
            				  <div class="column"><input type="radio" name="interest" value="아웃도어/여행/캠핑" />캠핑</div>
            				  <div class="column"><input type="radio" name="interest" value="아웃도어/여행/국내여행" />국내여행</div>
            				  <div class="column"><input type="radio" name="interest" value="아웃도어/여행/해외여행" />해외여행</div>
            				  <div class="column"><input type="radio" name="interest" value="아웃도어/여행/낚시" />낚시</div>
						</div>
             		</li>
             		<li class="dropdown"><a>공연/문화</a>     
                  
              			<div class="fulldrop">              
            				  <div class="column"><input type="radio" name="interest" value="공연/문화/전체"/>전체</div>
            				  <div class="column"><input type="radio" name="interest" value="공연/문화/뮤지컬/오페라"/>뮤지컬/오페라</div>
            				  <div class="column"><input type="radio" name="interest" value="공연/문화/공연/연극"/>공연/연극</div>
            				  <div class="column"><input type="radio" name="interest" value="공연/문화/영화"/>영화</div>
            				  <div class="column"><input type="radio" name="interest" value="공연/문화/전시회"/>전시회</div>
            				  <div class="column"><input type="radio" name="interest" value="공연/문화/고궁/문화재"/>고궁/문화재</div>
						</div>
             		</li>
             		<li class="dropdown"><a>음악/악기</a>     
                  
              			<div class="fulldrop">              
            				  <div class="column"><input type="radio" name="interest" value="음악/악기/전체"/>전체</div>
            				  <div class="column"><input type="radio" name="interest" value="음악/악기/노래/보컬"/>노래/보컬</div>
            				  <div class="column"><input type="radio" name="interest" value="음악/악기/기타/베이스"/>기타/베이스</div>
            				  <div class="column"><input type="radio" name="interest" value="음악/악기/드럼"/>드럼</div>
            				  <div class="column"><input type="radio" name="interest" value="음악/악기/피아노"/>피아노</div>
            				  <div class="column"><input type="radio" name="interest" value="음악/악기/밴드"/>밴드</div>
            				  <div class="column"><input type="radio" name="interest" value="음악/악기/작사/작곡"/>작사/작곡</div>
            				  <div class="column"><input type="radio" name="interest" value="음악/악기/클래식"/>클래식</div>
            				  <div class="column"><input type="radio" name="interest" value="음악/악기/재즈"/>재즈</div>
            				  <div class="column"><input type="radio" name="interest" value="음악/악기/락/메탈"/>락/메탈</div>
						</div>
             		</li>
             		<li class="dropdown"><a>인문학/책/글</a>     
                  
              			<div class="fulldrop">              
            				  <div class="column"><input type="radio" name="interest" value="인문학/책/글/전체"/>전체</div>
            				  <div class="column"><input type="radio" name="interest" value="인문학/책/글/책/독서"/>책/독서</div>
            				  <div class="column"><input type="radio" name="interest" value="인문학/책/글/인문학"/>인문학</div>
            				  <div class="column"><input type="radio" name="interest" value="인문학/책/글/심리학"/>심리학</div>
            				  <div class="column"><input type="radio" name="interest" value="인문학/책/글/철학"/>철학</div>
            				  <div class="column"><input type="radio" name="interest" value="인문학/책/글/역사"/>역사</div>
            				  <div class="column"><input type="radio" name="interest" value="인문학/책/글/시사/경제" />시사/경제</div>
						</div>
             		</li>
             		<li class="dropdown"><a>봉사활동</a>     
                  
              			<div class="fulldrop">              
            				  <div class="column"><input type="radio" name="interest" value="봉사활동/전체"/>전체</div>
            				  <div class="column"><input type="radio" name="interest" value="봉사활동/양로원"/>양로원</div>
            				  <div class="column"><input type="radio" name="interest" value="봉사활동/보육원"/>보육원</div>
            				  <div class="column"><input type="radio" name="interest" value="봉사활동/환경봉사"/>환경봉사</div>
            				  <div class="column"><input type="radio" name="interest" value="봉사활동/사회봉사"/>사회봉사</div>
            				  <div class="column"><input type="radio" name="interest" value="봉사활동/교육/재능나눔"/>교육/재능나눔</div>
            				  <div class="column"><input type="radio" name="interest" value="봉사활동/유기동물보호"/>유기동물보호</div>
						</div>
             		</li>
             		<li class="dropdown"><a>공예/만들기</a>     
              			<div class="fulldrop">              
            				  <div class="column"><input type="radio" name="interest" value="공예/만들기/전체"/>전체</div>
            				  <div class="column"><input type="radio" name="interest" value="공예/만들기/미술/그림"/>미술/그림</div>
            				  <div class="column"><input type="radio" name="interest" value="공예/만들기/캘리그라피"/>캘리그라피</div>
            				  <div class="column"><input type="radio" name="interest" value="공예/만들기/천연비누"/>천연비누</div>
            				  <div class="column"><input type="radio" name="interest" value="공예/만들기/소품공예"/>소품공예</div>
            				  <div class="column"><input type="radio" name="interest" value="공예/만들기/가죽공예"/>가죽공예</div>
            				  <div class="column"><input type="radio" name="interest" value="공예/만들기/목공예"/>목공예</div>
            				  <div class="column"><input type="radio" name="interest" value="공예/만들기/도자/점토공예"/>도자/점토공예</div>
						</div>
             		</li>
             		<li class="dropdown"><a>차/오토바이</a>     
                  
					<div class="fulldrop">              
						<div class="column"><input type="radio" name="interest" value="차/오토바이/전체" />전체</div>
						<div class="column"><input type="radio" name="interest" value="차/오토바이/국내차" />국내차</div>
						<div class="column"><input type="radio" name="interest" value="차/오토바이/일본차" />일본차</div>
						<div class="column"><input type="radio" name="interest" value="차/오토바이/미국차" />미국차</div>
						<div class="column"><input type="radio" name="interest" value="차/오토바이/유럽차" />유럽차</div>
						<div class="column"><input type="radio" name="interest" value="차/오토바이/바이크" />바이크</div>
            				  
						</div>
             		</li>
				</ul> 
			</div>
		</div>
		
		<div class="container">
			<div>
            	<ul class="nav">
            		<li  class="dropdown"><a >전체 보기</a>     
                  
              			<div class="fulldrop" >              
               				<div class="column">
			                    	<input type="radio" name="location" value="전체" checked="checked"/>전체
			                </div>
                
           			    </div>
           			</li>
              		<li class="dropdown"><a>강남</a>     
                  
              			<div class="fulldrop">              
            				  <div class="column"><input type="radio" name="location" value="강남/전체"/>전체</div>
            				  <div class="column"><input type="radio" name="location" value="강남/강남/역삼"/>강남/역삼</div>
            				  <div class="column"><input type="radio" name="location" value="강남/논현/학동"/>논현/학동</div>
            				  <div class="column"><input type="radio" name="location" value="강남/대치/도곡/양재"/>대치/도곡/양재</div>
            				  <div class="column"><input type="radio" name="location" value="강남/방배/반포"/>방배/반포</div>
            				  <div class="column"><input type="radio" name="location" value="강남/삼성/선릉"/>삼성/선릉</div>
            				  <div class="column"><input type="radio" name="location" value="강남/서초/교대"/>서초/교대</div>
            				  <div class="column"><input type="radio" name="location" value="강남/압구정/청담/신사"/>압구정/청담/신사</div>
						</div>
             		</li>
              		<li class="dropdown"><a>강동</a>     
                  
              			<div class="fulldrop">              
            				  <div class="column"><input type="radio" name="location" value="강동/강동/천호"/>강동/천호</div>
            				  <div class="column"><input type="radio" name="location" value="강동/광진/구의/건대"/>광진/구의/건대</div>
            				  <div class="column"><input type="radio" name="location" value="강동/송파/가락/방이"/>송파/가락/방이</div>
            				  <div class="column"><input type="radio" name="location" value="강동/신천/잠실"/>신천/잠실</div>
						</div>
             		</li>
             		<li class="dropdown"><a>강북</a>     
                  
              			<div class="fulldrop">              
            				  <div class="column"><input type="radio" name="location" value="강북/전체"/>전체</div>
            				  <div class="column"><input type="radio" name="location" value="강북/강북/수유/미아"/>강북/수유/미아</div>
            				  <div class="column"><input type="radio" name="location" value="강북/노원/도봉"/>노원/도봉</div>
            				  <div class="column"><input type="radio" name="location" value="강북/대학로/성북"/>대학로/성북</div>
            				  <div class="column"><input type="radio" name="location" value="강북/동대문/신당"/>동대문/신당</div>
            				  <div class="column"><input type="radio" name="location" value="강북/시청/명동/을지로"/>시청/명동/을지로</div>
            				  <div class="column"><input type="radio" name="location" value="강북/왕십리/성동"/>왕십리/성동</div>
            				  <div class="column"><input type="radio" name="location" value="강북/용산/한남/이태원"/>용산/한남/이태원</div>
            				  <div class="column"><input type="radio" name="location" value="강북/인사동/삼청동"/>인사동/삼청동</div>
            				  <div class="column"><input type="radio" name="location" value="강북/종로/광화문"/>종로/광화문</div>
            				  <div class="column"><input type="radio" name="location" value="강북/중랑/상봉"/>중랑/상봉</div>
						</div>
             		</li>
             		<li class="dropdown"><a>강서</a>     
                  
              			<div class="fulldrop">              
            				  <div class="column"><input type="radio" name="location" value="강서/전체"/>전체</div>
            				  <div class="column"><input type="radio" name="location" value="강서/강서/양천"/>강서/양천</div>
            				  <div class="column"><input type="radio" name="location" value="강서/여의도/영등포/당산"/>여의도/영등포/당산</div>
            				  <div class="column"><input type="radio" name="location" value="강서/신촌/이대/서대문"/>신촌/이대/서대문</div>
            				  <div class="column"><input type="radio" name="location" value="강서/홍대/합정/상수"/>홍대/합정/상수</div>
            				  <div class="column"><input type="radio" name="location" value="강서/마포역/공덕"/>마포역/공덕</div>
            				  <div class="column"><input type="radio" name="location" value="강서/삼암/망원"/>삼암/망원</div>
            				  <div class="column"><input type="radio" name="location" value="강서/신림/관악"/>신림/관악</div>
            				  <div class="column"><input type="radio" name="location" value="강서/신도림/구로/금천"/>신도림/구로/금천</div>
            				  <div class="column"><input type="radio" name="location" value="강서/노량진/사당/동작"/>노량진/사당/동작</div>
            				  <div class="column"><input type="radio" name="location" value="강서/연신내/불광/은평<"/>연신내/불광/은평</div>
						</div>
             		</li>
				</ul> 
			</div>
		</div>
		<div id="text">
			<h5 id="interest">선택한 주제 : 전체</h5>
			<h5 id="location">선택한 지역 : 전체</h5>
		</div>
		
		<div id="div1">
			<div id="myClubList">
				<a id="day"><i class="fa fa-check"></i> 설립일순 &nbsp;</a>
				<a id="count"><i class="fa fa-check"></i> 회원수순 </a>
				<table >
					<thead>					
						<tr>
							<th>주제</th>
							<th>지역</th>
							<th>동호회 명</th>
							<th>소개</th>
							<th>설립일</th>
							<th>회원수 </th>
						</tr>
					</thead>
					<tbody id="myClubListTable">
					<!-- 리스트 보여줄 자리 -->
					</tbody>
				</table>
			</div>
		</div>
	</body>
	<script>
		//$('input:radio[name="interest"]').is(":checked") == true;

		$(document).ready(function () {
	        $(this).click(function () {
	          // getter
	          var interest = $('input[name="interest"]:checked').val();
	          $("#interest").html("선택한 주제 : "+interest);
	        });
		});
		$(document).ready(function () {
	        $(this).click(function () {
	          // getter
	          var location = $('input[name="location"]:checked').val();
	          $("#location").html("선택한 지역 : "+location);
	        });
		});
	</script>
</html>