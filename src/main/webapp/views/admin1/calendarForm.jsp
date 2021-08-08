<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script src="//code.jquery.com/jquery-1.9.1.js" ></script>
<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<style>
	
</style>


<a href="#">1</a>
<a href="#">2</a>

	<form name="serachForm" method="get">
	<h2>전체조회</h2>
	<p>
	    <input type="text" id="datepicker1" name="firdate" autocomplete="off" placeholder = "날짜선택 필수" > -
	    <input type="text" id="datepicker2" name="secdate" autocomplete="off" >
	    <button type="submit">조회</button>
	</p>
	</form>

	




<script>
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

</script>




</body>
</html>

