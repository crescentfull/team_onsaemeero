<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지</title>
</head>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<link rel="stylesheet" href="<c:url value="/css/reservation/calendar.css"/>"></link>
<style>
/* 배너사진 */

	.content_wrapper {
		margin: 0 auto;
		width:1890px;
		position: relative;
	}
	
	.content {
		width: 100%;
		height: 500px;
		clear: both;
	}
	.abc div {
		margin-bottom: 200px;
	}
	div#content_map{
		width : 1400px;
		height : 500px;
		background-color : white;
		margin : 100px auto 0px auto;
		margin-top: 200px;
	}
	div#content_map h1{
		font-weight: 900;
		font-size : 40px;
		color : black;
	}
	div#mapdiv  {
	float : left;
	}
	
	div#content_map p {
		font-size : 20px;
		margin : 70px 0px 0px 850px;
	}
	div#content_map p span {
		font-weight: 900;
	}
	
	.list2 {
		opacity: 0;
	}
	
	#slide_2 {
		width : 50%;
		height : 500px;
		background-color : blue;
		border: 1px solid black;
		margin : 0px auto;
		margin-top: 100px;
	}
	#reservation {
		border : 2px solid black;
		width : ;
	}

	.ui-datepicker-calendar > tbody td.ui-datepicker-week-end:first-child a {
	 	color: red; 
	 	}
	.ui-datepicker-calendar > tbody td.ui-datepicker-week-end:last-child a {
		 color: blue; 
		}
/* 예약 검색창 */

div#search_room_index{

	margin : 150px 0px;
}


div#left_window{
	margin : -30px 0px 0px 90px; 
	float : left;
}
div#left_window img{
	width : 100px;
}
div#right_window{
	margin : -180px 90px 0px 0px; 
	float : right;
}
div#right_window img{
	width : 100px;
}

		
		
/* 주변관광지	 */	

div#roof img{
	margin : 10px 10px -8px 0px;
	width : 1500px;
}

#slide_1 *{
  	margin:0;
  	padding:0;
}
  ul,li{
  	list-style:none;
  	text-align: center;
}
  #slide_1{
 	margin : 0px auto;
  	height:500px;
  	position:relative;
  	overflow:hidden;
  	width: 50%;
}
  #slide_1 ul{width:400%;height:100%;transition:1s;}
  #slide_1 ul:after{content:"";display:block;clear:both;}
  #slide_1 li{float:left;width:25%;height:100%;}
  #slide_1 li:nth-child(1){background:#ff0;}
  #slide_1 li:nth-child(2){background:#f00;}
  #slide_1 li:nth-child(3){background:#0ff;}
  #slide_1 li:nth-child(4){background:#00f;}
  #slide_1 input{display:none;}
  #slide_1 label{display:inline-block;vertical-align:middle;width:10px;height:10px;border:1px solid #666;background:#fff;transition:0.5s;border-radius:50%;cursor:pointer;}
  #slide_1 .pos{text-align:center;position:absolute;bottom:10px;left:0;width:100%;text-align:center;}
  #pos1:checked~ul{margin-left:0%;}
  #pos2:checked~ul{margin-left:-100%;}
  #pos3:checked~ul{margin-left:-200%;}
  #pos4:checked~ul{margin-left:-300%;}
  #pos1:checked~.pos>label:nth-child(1){background:#666;}
  #pos2:checked~.pos>label:nth-child(2){background:#666;}
  #pos3:checked~.pos>label:nth-child(3){background:#666;}
  #pos4:checked~.pos>label:nth-child(4){background:#666;}

	#video {
		width : 70%;
		height : 700px;
		margin : 70px auto 0 auto;
	}
	#video > iframe {
		width : 100%;
		height : 100%;
	}
	
	div#place{
		text-align : center;
		margin : 200px auto;
		width : 1400px;
		height : 500px;
		display: table;
	}
	input#placeIndex1{
		background-image : url(/views/img1/온새미로_서울/온새미로_서울_관광지_북촌한옥마을1.PNG);
		background-size : cover ; 
		border : none;
		margin : 0px;
		width : 350px;
		height : 400px;
	}
		input#placeIndex1:active{
			box-shadow : 0 5px gray;
			transform : translateY(4px);
		
	}
		input#placeIndex2{
		background-image : url(/views/img1/온새미로_강릉/온새미로_강릉_관광지_경포대1.PNG);
		background-size : cover ; 
		border : none;
		margin : 0px;
		width : 350px;
		height : 400px;
	}
			input#placeIndex2:active{
			box-shadow : 0 5px gray;
			transform : translateY(4px);
		
	}
		input#placeIndex3{
		background-image : url(/views/img1/온새미로_전주/온새미로_전주_관광지_전주한옥마을1.PNG);
		background-size : cover ; 
		border : none;
		margin : 0px;
		width : 350px;
		height : 400px;
	}
			input#placeIndex3:active{
			box-shadow : 0 5px gray;
			transform : translateY(4px);
		
	}
		input#placeIndex4{
		background-image : url(/views/img1/온새미로_경주/경주_관광지_불국사1.PNG);
		background-size : cover ; 
		border : none;
		margin : 0px;
		width : 350px;
		height : 400px;
	}
			input#placeIndex4:active{
			box-shadow : 0 5px gray;
			transform : translateY(4px);
		
	}
</style>
<body>
	<div>
		<jsp:include page="base/header.jsp"/>
	</div>
	<div class="content_wrapper">

	<div>
	
		<div class="content_imgSlide">
			<jsp:include page="base/imgslide.jsp"/>
		</div>
		
		<div id="search_room_index">
		<div id="left_window">
		<img src="/views/img1/etc/팔각창_왼.PNG" alt=""/>
		</div>
		<div class="bbb">
			<form method="GET" action="reservation/roomList" onsubmit="return check()">
				<div class="b_name">
					<h3>지점 선택</h3>
					<select id="b_name" name="b_name">
						<option value="0">지점을 선택하시오</option>
						<option value="온새미로-서울">온새미로-서울</option>
						<option value="온새미로-강릉">온새미로-강릉</option>
						<option value="온새미로-전주">온새미로-전주</option>
						<option value="온새미로-경주">온새미로-경주</option>
					</select>
				</div>
		
				<div class="b_name">
					<h3>체크인</h3>
					<input type="text" id="inDate" value="체크인" name="indate"  autocomplete="off">
					</div>
				<div class="b_name">
					<h3>체크아웃</h3>
					<input type="text" id="outDate" value="체크아웃" name="outdate"  autocomplete="off">
				</div>
		
				<div class="ch">
					<br>
					<input type="submit" value="검색" id="search">
				</div>
				
			</form>
		</div>
			<div id="right_window">
		<img src="/views/img1/etc/팔각창_오.PNG" alt=""/>
		</div>
		</div>
		
		
		<div class="list2" id="place">
			<h1>주변관광지</h1>
		
		<div id="roof">
			<img src="/views/img1/etc/지붕.PNG" alt=""/>	
		</div>
			<input type="button" id="placeIndex1"  onclick="seoul()">
			<input type="button" id="placeIndex2" onclick="gangneung()">
			<input type="button" id="placeIndex3" onclick="jeonju()">
			<input type="button" id="placeIndex4" onclick="gyeongju()">
			<p>*이미지 클릭시 해당 지점소개로 넘어갑니다</p>
		</div>	
	
	
	<div class="list2" id="video">
		<iframe width="900" height="506" src="https://www.youtube.com/embed/OO4g3UG4mtQ" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe> 
	</div>
	</div>
			
			<div class="list2" id="content_map">
			<h1>위치정보</h1>
			<div id="mapdiv">
			<jsp:include page="base/map.jsp"/>
			</div>
			<p><span>서울지점</span> : 서울특별시 광나루로 90길 34</p>
			<p><span>강릉지점</span> : 강원도 강릉시 강릉대로 33</p>
			<p><span>전주지점</span> : 전라북도 전주시 완산구 노송광장로 10</p>
			<p><span>경주지점</span> : 경상북도 경주시 양정로 260</p>
		</div>
	
	<div id="footer">
		<jsp:include page="base/footer.jsp"/>
	</div>
</div>

<script src="<c:url value="/js/jquery-3.6.0.min.js"/>"></script>
<script>
$(document).ready(function(){
	$(window).scroll(function(){
		
		$('.list2').each(function(i){
			var bottom_of_element = $(this).offset().top + $(this).outerHeight()/5;
			var bottom_of_window = $(window).scrollTop() + $(window).height();
			
			if(bottom_of_window>bottom_of_element){
				$(this).animate({'opacity':'1'},2000);
			}
		});
	});
});
</script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script src="/js/reservation/calendar.js"></script>
<script type="text/javascript">
jQuery.noConflict();
jQuery( document ).ready(function( $ ) {
	$(document).ready(function () {
	    
	    $( "#outDate" ).datepicker({
	         changeYear: true,
	    	 changeMonth: true, 
	         nextText: '다음 달',
	         prevText: '이전 달',
	         dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
	         dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
	         monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	         monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	         showMonthAfterYear: true,
	         dateFormat: "yy-mm-dd",
	         maxDate: "+3m",
	         onClose: 
	        	 function( selectedDate ) {    
	             	$("#inDate").datepicker( "option", "maxDate", selectedDate );
	         }  
	    });   
	    
	    $.datepicker.setDefaults($.datepicker.regional['ko']); 
	    $( "#inDate" ).datepicker({
	         changeYear: true, 
	    	 changeMonth: true, 
	         nextText: '다음 달',
	         prevText: '이전 달', 
	         dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
	         dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
	         monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	         monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	         showMonthAfterYear: true,
	         dateFormat: "yy-mm-dd",
	         maxDate: "+3m",
	         minDate: 0,
	         onClose: 
	        	 function( selectedDate ) {    
	            	 $("#outDate").datepicker( "option", "minDate", selectedDate );
	         }    
	    });
	});


});
function check() {
    if ($("#b_name").val() == '0' || $("#inDate").val() == '체크인' || $("#outDate").val() == '체크아웃' || $("#outDate").val() == '') {
      alert("지점과 날짜를 선택하세요");
      return false;
    }else if( $("#inDate").val() == $("#outDate").val() ){
        alert("최소 1박 2일 이상을 선택해주세요.");	
        return false;
      }
  }
$('select').val('<%=request.getParameter("b_name")%>');

function gangneung(){
	location.href="/branch/branch_gr_sightseeing"
}
function seoul(){
	location.href="/branch/branch_su_sightseeing"
}
function jeonju(){
	location.href="/branch/branch_jj_sightseeing"
}
function gyeongju(){
	location.href="/branch/branch_kj_sightseeing"
}

</script>	
</body>
</html>