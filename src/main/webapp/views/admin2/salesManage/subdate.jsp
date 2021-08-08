<%@page import="java.text.DecimalFormat"%>
<%@page import="aaa.vo.ReservationVO"%>
<%@page import="java.util.List"%>
<%@page import="aaa.controll.DateCast"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정산관리 / 일 정산</title>
<link rel="stylesheet" type="text/css" href="<c:url value="/css/base/admin2.css"/>" />
<link rel="stylesheet" href=<c:url value="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" /> />
<link rel="stylesheet" type="text/css" href="<c:url value="/css/admin2/subdate.css"/>" />
</head>
<body>
<c:set value="${date1 }" var="dt1"/>
<c:set value="${date2 }" var="dt2"/>


<jsp:include page="../../base/header.jsp" />

<div class="content_wrapper">

	<jsp:include page="../../base/adminDrop2.jsp" />
	
	<div id="salesDate">
	<h2 id="title">${branch } 일 정산</h2>
	<form  id="form1" method="get">
		
		<p>		    
		    <input type="text" id="datepicker1" name="date1" autocomplete="off" placeholder = "날짜선택를 선택해주세요." value=${dt1 }> 
		    <b>~</b>
	  		<input type="text" id="datepicker2" name="date2" autocomplete="off"  value=${dt2 }>
	   
		    
		    <button  id="btn-sch" type="button" onclick="chkVal()">조회</button> 
		</p>
</form>	
		<div>
			<c:choose>
				<c:when test="${xxx eq '1' }">
					<h3 id="schnull">날짜를 선택해주세요.</h3>
				</c:when>
				<c:otherwise>
					<h3 id="td-title">${date1 } ~ ${date2 } 일매출정산</h3>
					
				<c:set var = "total" value = "0" />	
					<table id ="tb-sales" border="">
						<tr id="tit">
							<th>일/지점</th>
							<th>${branch}</th>
						</tr>
					
					<%
						List<ReservationVO> list = (List<ReservationVO>) request.getAttribute("list");
						
						DecimalFormat df = new DecimalFormat("###,###");
						int rtotal = 0;
						
						
						for(int i=0; i<list.size();i++){
							
							int btotal = list.get(i).getPrice();
							
											
				 	%>
						
					
						
						<tr>
							<td><%= list.get(i).getFirdate() %></td>
							<td><%= df.format(list.get(i).getPrice()) %>원</td>
						</tr>
						
					<%
						
						rtotal += btotal;
						}
					%>
						<tr id="tr-result">
							<td>합계</td>
							<td><%= df.format(rtotal) %>원</td>
						</tr>
					
					</table>
					
				</c:otherwise>
			</c:choose>
		</div>
	
	</div>
</div>	
<div class="clear"></div>
<jsp:include page="../../base/footer.jsp" />
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
	    yearSuffix: '년',
	    maxDate: 0,
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
function chkVal(){
	var rst1 = document.getElementById('datepicker1').value;
	var rst2 = document.getElementById('datepicker2').value;
	
	
	if(rst1 == ""){
		alert('날짜를 선택해주세요.');
	}else if(rst2 == ""){
		alert('날짜를 선택해주세요.');
	}else{
		document.getElementById("form1").submit();
	}
}
</script>
</body>
</html>

