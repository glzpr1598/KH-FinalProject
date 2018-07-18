<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
<link rel="icon" href="./resources/image/icon-32.png" />
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>HAMO</title>
<style>
	#findClub {
		background-color: #FDF5DC;
		color: black;
	}

	#container {
		width: 1000px;
		margin: 0px auto;
	}
	
	.option{
	border:none;
	border:0px;
	margin:0px;
	padding:0px;
	font: 67.5% "Lucida Sans Unicode", "Bitstream Vera Sans", "Trebuchet Unicode MS", "Lucida Grande", Verdana, Helvetica, sans-serif;
	font-size:13px;
	font-weight:bold;
	}
	
	/* 선택 안했을 때 */
	.option ul{
	background: #FFFFFF;
	height:50px;
	list-style:none;
	margin:0;
	padding:0;
	}
	
	.option li{
	float:left;
	padding:0px;
	}
	
	/* 선택 안했을 때 */
	.option li a{
	background: #FFFFFF;
	color:#000000;
	display:block;
	font-weight:normal;
	line-height:50px;
	margin:0px;
	padding:0px 11px;
	text-align:center;
	text-decoration:none;
	}
	
	/* 선택했을 때 */
	.option li a:not(.sort):hover{
	background: #FFFFFF;
	color:#000000;
	text-decoration:underline;
	cursor: pointer;
	}
	
	/* 선택 안했을 때 */
	.option li ul{
	background: #FFFFFF;
	display:none; /* 평상시에는 드랍메뉴가 안보이게 하기 */
	height:auto;
	padding:0px;
	margin:0px;
	border:0px;
	position:absolute;
	width:150px;
	z-index:200;
	border: thin solid #ffbf00;
	/*top:1em;
	/*left:0;*/
	}
	
	/* 선택 안했을 때 */
	.option li li {
	background: #FFFFFF;
	display:block;
	float:none;
	margin:0px;
	padding:0px;
	width:150px;
	}
	
	.option li:hover li a{
	background:none;
	}
	
	.option li ul a{
	display:block;
	height:40px;
	font-size:13px;
	font-style:normal;
	margin:0px;
	padding:0px 10px 0px 15px;
	text-align:left;
	}
	
	
	.option li a.sort {
		width: 100px;
		background: #FDF5DC;
		color: #000000;
		font-weight: bold;
		text-decoration: none;
	    border-right: thin solid #ffbf00;
	}
	
	.option#interest {
		border-color: #ffbf00;
		border-style: solid;
		border-width: thin;
	}
	.option#location {
		border-color: #ffbf00;
		border-style: solid;
		border-width: 0 thin thin thin;
	}
	
	.option > ul > li > a:not(.sort):not(.all):after {
		content: " \f107";
		font-family: FontAwesome;
		color: #000000;
	}
	
	/* 선택한 옵션 */
	#text {
		margin: 10px 0px;
		font-size: 13px;
	}
	
	/* 정렬 버튼 */	
	#clubSearch {
		margin-top: 20px;
	}
	#clubSearch .order {
		font-size: 13px;
		cursor: pointer;
		color: #a4a4a4;
	}
	#clubSearch .order#day i {
		color: #ffbf00;
	}
	#clubSearch .order#day span {
		color: #000000;
	}
	
	/* 리스트 */
	#clubSearch table {
		margin-top: 10px;
		width : 1000px;
		text-align: center;
		border-collapse: collapse;
		font-size: 13px;
	}
	#clubSearch th{
		background-color:#FDF5DC;
		height: 35px;
	}
	#clubSearch th.clubName {
		width: 500px;
	}
	#clubSearch th:not(.clubName) {
		width: 125px;
	}
	#clubSearch td{
		border-bottom: 1px solid #ffbf00;
		height: 35px;
	}
	#clubSearch a.club {
		color: black;
		text-decoration: none;
	}
	#clubSearch a.club:hover {
		text-decoration: underline;
	}
</style>
</head>
<body>
	<%@ include file="./main-header.jsp" %>

	<div id="container">
		<div class="option" id="interest">
			<ul>
				<li><a class="sort">주제</a></li>
				<li><a class="all">전체</a></li>
				<li><a>운동/스포츠</a>
					<ul>
						<li><a class="sports">축구</a></li>
						<li><a class="sports">농구</a></li>
						<li><a class="sports">야구</a></li>
						<li><a class="sports">배구</a></li>
						<li><a class="sports">자전거</a></li>
						<li><a class="sports">배드민턴</a></li>
						<li><a class="sports">볼링</a></li>
						<li><a class="sports">테니스/스쿼시</a></li>
						<li><a class="sports">수영</a></li>
						<li><a class="sports">족구</a></li>
				    </ul>
				</li>
				<li><a>아웃도어/여행</a>
					<ul>
						<li><a class="travel">등산</a></li>
						<li><a class="travel">캠핑</a></li>
						<li><a class="travel">국내여행</a></li>
						<li><a class="travel">해외여행</a></li>
						<li><a class="travel">낚시</a></li>
				    </ul>
				</li>
				<li><a>공연/문화</a>
					<ul>
						<li><a class="culture">뮤지컬/오페라</a></li>
						<li><a class="culture">공연/연극</a></li>
						<li><a class="culture">영화</a></li>
						<li><a class="culture">전시회</a></li>
						<li><a class="culture">고궁/문화재</a></li>
				    </ul>
				</li>
				<li><a>음악/악기</a>
					<ul>
						<li><a class="music">노래/보컬</a></li>
						<li><a class="music">기타/베이스</a></li>
						<li><a class="music">드럼</a></li>
						<li><a class="music">피아노</a></li>
						<li><a class="music">밴드</a></li>
						<li><a class="music">작사/작곡</a></li>
						<li><a class="music">클래식</a></li>
						<li><a class="music">재즈</a></li>
						<li><a class="music">락/메탈</a></li>
				    </ul>
				</li>
				<li><a>인문학/책/글</a>
					<ul>
						<li><a class="book">책/독서</a></li>
						<li><a class="book">인문학</a></li>
						<li><a class="book">심리학</a></li>
						<li><a class="book">철학</a></li>
						<li><a class="book">역사</a></li>
						<li><a class="book">시사/경제</a></li>
				    </ul>
				</li>
				<li><a>봉사활동</a>
					<ul>
						<li><a class="service">양로원</a></li>
						<li><a class="service">보육원</a></li>
						<li><a class="service">환경봉사</a></li>
						<li><a class="service">사회봉사</a></li>
						<li><a class="service">교육/재능나눔</a></li>
						<li><a class="service">유기동물보호</a></li>
				    </ul>
				</li>
				<li><a>공예/만들기</a>
					<ul>
						<li><a class="crafts">미술/그림</a></li>
						<li><a class="crafts">캘리그라피</a></li>
						<li><a class="crafts">천연비누</a></li>
						<li><a class="crafts">소품공예</a></li>
						<li><a class="crafts">가죽공예</a></li>
						<li><a class="crafts">목공예</a></li>
						<li><a class="crafts">도자/점토공예</a></li>
				    </ul>
				</li>
				<li><a>차/오토바이</a>
					<ul>
						<li><a class="car">국내차</a></li>
						<li><a class="car">일본차</a></li>
						<li><a class="car">미국차</a></li>
						<li><a class="car">유럽차</a></li>
						<li><a class="car">바이크</a></li>
				    </ul>
				</li>
			</ul>
		</div>
		<div class="option" id="location">
			<ul>
				<li><a class="sort">지역</a></li>
				<li><a class="all">전체</a></li>
				<li><a>강남</a>
					<ul>
						<li><a class="south">강남/역삼</a></li>
						<li><a class="south">논현/학동</a></li>
						<li><a class="south">대치/도곡/양재</a></li>
						<li><a class="south">방배/반포</a></li>
						<li><a class="south">삼성/선릉</a></li>
						<li><a class="south">서초/교대</a></li>
						<li><a class="south">압구정/청담/신사</a></li>
				    </ul>
				</li>
				<li><a>강동</a>
					<ul>
						<li><a class="east">강동/천호</a></li>
						<li><a class="east">광진/구의/건대</a></li>
						<li><a class="east">송파/가락/방이</a></li>
						<li><a class="east">신천/잠실</a></li>
				    </ul>
				</li>
				<li><a>강북</a>
					<ul>
						<li><a class="north">강북/수유/미아</a></li>
						<li><a class="north">노원/도봉</a></li>
						<li><a class="north">대학로/성북</a></li>
						<li><a class="north">동대문/신당</a></li>
						<li><a class="north">시청/명동/을지로</a></li>
						<li><a class="north">왕십리/성동</a></li>
						<li><a class="north">용산/한남/이태원</a></li>
						<li><a class="north">인사동/삼청동</a></li>
						<li><a class="north">종로/광화문</a></li>
						<li><a class="north">중랑/상봉</a></li>
				    </ul>
				</li>
				<li><a>강서</a>
					<ul>
						<li><a class="west">강서/양천</a></li>
						<li><a class="west">여의도/영등포/당산</a></li>
						<li><a class="west">신촌/이대/서대문</a></li>
						<li><a class="west">홍대/합정/상수</a></li>
						<li><a class="west">마포역/공덕</a></li>
						<li><a class="west">삼암/망원</a></li>
						<li><a class="west">신림/관악</a></li>
						<li><a class="west">신도림/구로/금천</a></li>
						<li><a class="west">노량진/사당/동작</a></li>
						<li><a class="west">연신내/불광/은평</a></li>
				    </ul>
				</li>
			</ul>
		</div>
		
		<div id="text">
			<div>
				<b>주제 <i class="fas fa-chevron-right"></i></b>
				<span id="interest1"></span>
				<span id="interest2">전체</span>
			</div>
			<div>
				<b>지역 <i class="fas fa-chevron-right"></i></b>
				<span id="location1"></span>
				<span id="location2">전체</span>
			</div>
		</div>
		
		<div id="clubSearch">
				<a class="order" id="day">
					<i class="fa fa-check"></i>
					<span>설립일순</span>
				</a>
				&nbsp;
				<a class="order" id="count">
					<i class="fa fa-check"></i>
					<span>회원수순</span>
				</a>
				
				<table>
					<thead>					
						<tr>
							<th class="clubName">동호회 명</th>
							<th>주제</th>
							<th>지역</th>
							<th>설립일</th>
							<th>회원수 </th>
						</tr>
					</thead>
					<tbody id="clubListTable">
						<!-- 리스트 보여줄 자리 -->
					</tbody>
				</table>
			</div>
	</div>
</body>
<script>
$(document).ready(function() {
	
	/* 옵션 마우스 효과 */
	$(".option>ul>li").mouseenter(function() {
		$(this).children("ul").slideDown("fast");
	});
	$(".option>ul>li").mouseleave(function() {
		$(this).children("ul").hide();
	});
	
	/* 선택한 주제, 지역 */
	var interest = "전체";
	var location = "전체";
	
	var obj = {
		url: "./clubSearch",
		type: "post",
		data: {
			"interest": interest,
			"location": location
		},
		dataType: "JSON",
		error: function(e) {console.log(e);}
	}
	
	/* 최초 리스트 보여주기 */
	$.ajax({
		url: "./clubSearch",
		type: "post",
		data: {
			"interest": interest,
			"location": location
		},
		dataType: "JSON",
		error: function(e) {console.log(e);},
		success: function(data) {
			listPrint(data.list);
		}
	});
	
	/* 설립일순 클릭 */
	$("#day").click(function() {
		// 색 바꾸기
		$("#day i").css("color", "#ffbf00");
		$("#day span").css("color", "#000000");
		$("#count i").css("color", "#a4a4a4");
		$("#count span").css("color", "#a4a4a4");
		
		// 리스트 출력
		$.ajax({
			url: "./clubSearch",
			type: "post",
			data: {
				"interest": interest,
				"location": location
			},
			dataType: "JSON",
			error: function(e) {console.log(e);},
			success: function(data) {
				// 설립일 내림차순
				data.list.sort(function(a, b) { 
				    return a.club_date > b.club_date ? -1 : a.club_date < b.club_date ? 1 : 0;
				});
				listPrint(data.list);
			}
		});
	});
	
	/* 회원수순 클릭 */
	$("#count").click(function() {
		// 색 바꾸기
		$("#day i").css("color", "#a4a4a4");
		$("#day span").css("color", "#a4a4a4");
		$("#count i").css("color", "#ffbf00");
		$("#count span").css("color", "#000000");
		
		// 리스트 출력
		$.ajax({
			url: "./clubSearch",
			type: "post",
			data: {
				"interest": interest,
				"location": location
			},
			dataType: "JSON",
			error: function(e) {console.log(e);},
			success: function(data) {
				// 설립일 내림차순
				data.list.sort(function(a, b) { 
					return a.club_memberCount > b.club_memberCount ? -1 : a.club_memberCount < b.club_memberCount ? 1 : 0;
				});
				listPrint(data.list);
			}
		});
	});
	
	/* 주제 선택 */
	$("#interest a:not(.sort)").click(function() {
		interest = $(this).html();
		
		// 하위 카테고리 표시
		$("#interest2").html(interest);
		// 상위 카테고리 표시
		if($(this).attr("class") == null || $(this).attr("class") == "all") {
			$("#interest1").html("");
		} 
		else {
			var className = $(this).attr("class");
			
			if(className == "sports") {
				$("#interest1").html("운동/스포츠 <i class='fas fa-chevron-right'></i>");
			} 
			else if(className == "travel") {
				$("#interest1").html("아웃도어/여행 <i class='fas fa-chevron-right'></i>");
			} 
			else if(className == "culture") {
				$("#interest1").html("공연/문화 <i class='fas fa-chevron-right'></i>");
			}
			else if(className == "music") {
				$("#interest1").html("음악/악기 <i class='fas fa-chevron-right'></i>");
			}
			else if(className == "book") {
				$("#interest1").html("인문학/책/글 <i class='fas fa-chevron-right'></i>");
			}
			else if(className == "service") {
				$("#interest1").html("봉사활동 <i class='fas fa-chevron-right'></i>");
			}
			else if(className == "crafts") {
				$("#interest1").html("공예/만들기 <i class='fas fa-chevron-right'></i>");
			}
			else if(className == "car") {
				$("#interest1").html("차/오토바이 <i class='fas fa-chevron-right'></i>");
			}
		}
		
		// 리스트 출력
		$.ajax({
			url: "./clubSearch",
			type: "post",
			data: {
				"interest": interest,
				"location": location
			},
			dataType: "JSON",
			error: function(e) {console.log(e);},
			success: function(data) {
				listPrint(data.list);
			}
		});
	});
	
	/* 지역 선택 */
	$("#location a:not(.sort)").click(function() {
		location = $(this).html();
		
		// 하위 카테고리 표시
		$("#location2").html(location);
		// 상위 카테고리 표시
		if($(this).attr("class") == null || $(this).attr("class") == "all") {
			$("#location1").html("");
		} 
		else {
			var className = $(this).attr("class");
			
			if(className == "south") {
				$("#location1").html("강남 <i class='fas fa-chevron-right'></i>");
			} 
			else if(className == "east") {
				$("#location1").html("강동 <i class='fas fa-chevron-right'></i>");
			} 
			else if(className == "north") {
				$("#location1").html("강북 <i class='fas fa-chevron-right'></i>");
			}
			else if(className == "west") {
				$("#location1").html("강서 <i class='fas fa-chevron-right'></i>");
			}
		}
		
		// 리스트 출력
		$.ajax({
			url: "./clubSearch",
			type: "post",
			data: {
				"interest": interest,
				"location": location
			},
			dataType: "JSON",
			error: function(e) {console.log(e);},
			success: function(data) {
				listPrint(data.list);
			}
		});
	});
	
	/* 리스트 출력 함수 */		
	function listPrint(list){
		var content ="";
		list.forEach(function(item, idx){
			content += "<tr>";
			content += "<td><a class='club' href='./clubMain?club_id="+item.club_id+"'>"+item.club_name+"</a></td>";
			content += "<td>"+item.interest_interest+"</td>";
			content += "<td>"+item.club_location+"</td>";
			content += "<td>"+item.club_date+"</td>";
			content += "<td>"+item.club_memberCount+"</td>";
			content += "</tr>";
			
		});		
		$("#clubListTable").empty();
		$("#clubListTable").html(content);
	}
	
});
</script>
</html>