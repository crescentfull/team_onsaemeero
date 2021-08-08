<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정산관리 / 일 정산</title>
</head>
<link rel="stylesheet" type="text/css" href="<c:url value="/css/base/admin.css"/>" />
<link rel="stylesheet" type="text/css" href="<c:url value="/css/admin1/day.css"/>" />
<link rel="stylesheet" href=<c:url value="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" /> />
<body>
	
	
	<jsp:include page="../../base/header.jsp"/>
	
	<div class="content_wrapper">
		
		<jsp:include page="../../base/adminDrop.jsp" />
		
		<div id="salesDate">
		<h2 id="title">일 정산</h2>
		<form id="form1" action="day">
		
		<p>
		    <input type="text" id="datepicker1" name="date1" value="${date1 }" autocomplete="off" placeholder = "날짜선택 필수" > 
		    <b>~</b>
		    <input type="text" id="datepicker2" name="date2" value="${date2 }" autocomplete="off" >
		    <button id="btn-sch" type="submit">조회</button>
		</p>
		</form>
	
		<table id ="tb-sales" border="">
	
		<c:choose>
			
		<c:when test="${date1 == null }">	
			<tr >
				<td id="schnull" height="300px;">
					날짜를 입력해주세요.
				</td>
			</tr>
		</c:when>
		
		<c:otherwise>
		<tr >
			<td id="td-title" colspan="6">
				${date1 } ~ ${date2 } 일매출정산
			</td>
		</tr>	
		<tr id="tit">
			<th>날짜/지점</th>
			<th>서울</th>
			<th>강릉</th>
			<th>경주</th>
			<th>전주</th>
			<th>합계</th>
		</tr>
		
		<c:set var = "sum" value = "0" />
		
		<c:set var = "su" value = "0" />
		<c:set var = "gr" value = "0" />
		<c:set var = "kj" value = "0" />
		<c:set var = "jj" value = "0" />
		
	
		<c:forEach items="${dayData }" var="vo" varStatus="no">
		
		
		
		
		<c:set value="${vo.su+vo.gr+vo.kj+vo.jj}" var="colsto"/>
		
			
			<tr>
				<td>${vo.date }</td>
				<td id="su"><fmt:formatNumber value="${vo.su }" pattern="#,###"/></td>
				<td class="gr"><fmt:formatNumber value="${vo.gr }" pattern="#,###"/></td>
				<td class="kj"><fmt:formatNumber value="${vo.kj }" pattern="#,###"/></td>
				<td class="jj"><fmt:formatNumber value="${vo.jj }" pattern="#,###"/></td>
				<c:set var = "sum" value = "${sum+vo.su}" />
				<td class="sum"><fmt:formatNumber value="${colsto }" pattern="#,###"/></td>
				<c:set var = "su" value = "${su+vo.su}" />
				<c:set var = "gr" value = "${gr+vo.gr}" />
				<c:set var = "kj" value = "${kj+vo.kj}" />
				<c:set var = "jj" value = "${jj+vo.jj}" />
			</tr>
		</c:forEach>
		
			<tr id="tr-result">	
				<td>합계</td>
				<td><fmt:formatNumber value="${su }" pattern="#,###"/></td>
				<td><fmt:formatNumber value="${gr }" pattern="#,###"/></td>
				<td><fmt:formatNumber value="${kj }" pattern="#,###"/></td>
				<td><fmt:formatNumber value="${jj }" pattern="#,###"/></td>
				<td><fmt:formatNumber value="${su+gr+kj+jj }" pattern="#,###"/></td>
			</tr>
	</c:otherwise>	
	</c:choose>	
	</table>
	</div>

</div>
<div class="claer"></div>
<jsp:include page="../../base/footer.jsp"/>
</body>
<script src=<c:url value="/js/base/adminDrop.js" />></script>
<script src=<c:url value="//code.jquery.com/jquery-1.9.1.js" />></script>
<script src=<c:url value="//code.jquery.com/ui/1.10.4/jquery-ui.js" />></script>
<script>
jQuery.noConflict();
jQuery( document ).ready(function( $ ) {   

	$.datepicker.setDefaults({
	    dateFormat: 'yy-mm-dd',
	    prevText: '이전 달',
	    nextText: '다음 달',
	    monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	    monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	    dayNames: ['일', '월', '화', '수', '목', '금', '토'],
	    dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
	    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
	    showMonthAfterYear: true,
	    maxDate: 0,
	    yearSuffix: '년'
	    
	});
	
	$(document).ready(function(){
		$("#datepicker1").datepicker({
			numberOfMonths: 1,
		onSelect: 
			function(selected) {
				$("#datepicker2").datepicker("option","minDate", selected)
			}
		});
	$("#datepicker2").datepicker({
		numberOfMonths: 1,
			onSelect: function(selected) {
				$("#datepicker1").datepicker("option","maxDate", selected)
			}
		});
	});
});
</script>
</html>