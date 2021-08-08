<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value="/css/reservation/calendar.css"/>"></link>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script src="<c:url value="/js/reservation/calendar.js"/>"></script>
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

</script>
<style>
</style>

</head>
<body>
	<div class="warpper">
	<div class="header">
		<jsp:include page="../base/header.jsp"/>
		</div>
	<div class="aaa">
			<div id="left_window">
		<img src="/views/img1/etc/팔각창_왼.PNG" alt=""/>
		</div>
	<div class="bbb">
	<form method="GET" action="roomList" onsubmit="return check()">
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
		<div id="right_window">
		<img src="/views/img1/etc/팔각창_오.PNG" alt=""/>
		</div>
	</div>
	
	
	<div class="ccc">
	<h1 id="h1">예약 확인</h1>
	<h3 id="h3">지점(지역)과 호수를 확인하여 주세요</h3>
    <c:forEach items="${nowReservation }" var="vo" varStatus="no">
		<div class="content">
			<h3>${vo.b_name }</h3>
			<p class="big">객실</p><p> ${vo.room_name}</p>
			<p class="big">결제 금액</p><p><fmt:formatNumber value="${vo.price }" /> 원</p>
			<p class="big">체크인&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;체크아웃</p><p>${vo.indate } &nbsp;&nbsp;~&nbsp;&nbsp; ${vo.outdate }</p>
			<p class="big">요청사항</p><p> ${vo.requestBr }</p>
			    	<img src="/views/img1/etc/예약_지붕.PNG" alt="" id="reservation_roof"/>
		</div>
	</c:forEach>
	</div>
	</div>
	<div class="footer1">
		<jsp:include page="../base/footer.jsp"/>
	</div>
	</div>
	
</body>
<script type="text/javascript">
$('select').val('<%=request.getParameter("b_name")%>');
</script>
</html>