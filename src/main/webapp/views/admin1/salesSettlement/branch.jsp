<%@page import="aaa.controll.DateCast"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
</head>
<body>
<c:set value="${year }" var="yr"/>
<% String year = (String) pageContext.getAttribute("yr"); %>

<jsp:include page="../../base/header.jsp" />

<div class="content_wrapper">

<a href="/admin1/sales/total">총 정산</a>
<a href="/admin1/sales/branch">지점 정산</a>

	<form  id="form1" method="get">
		<h2>전체조회</h2>
		<p>	
			<select name="b_name" id="b_name" title="지점" >
				<option value="" >지점</option>
				
				<option value="온새미로-서울" 
					<c:if test="${branch eq '온새미로-서울'}">
						selected="selected"
					</c:if>>서울
				</option>
				
				<option value="온새미로-강릉" 
					<c:if test="${branch eq '온새미로-강릉'}">
						selected="selected"
					</c:if>>강릉
				</option>
				
				<option value="온새미로-전주" 
					<c:if test="${branch eq '온새미로-전주'}">
						selected="selected"
					</c:if>>전주
				</option>
				
				<option value="온새미로-경주" 
					<c:if test="${branch eq '온새미로-경주'}">
						selected="selected"
					</c:if>> 경주
				</option>
			</select>
		    
		    <select name="indate" id="YEAR" title="년도" ></select>    
		    <button type="button" onclick="chkVal()">조회</button> 
		</p>
		
		<div>
			<c:choose>
				<c:when test="${xxx eq '1' }">
					<h3>지점과 년도를 선택해주세요.</h3>
				</c:when>
				
				<c:otherwise>
					<h3>${branch } ${year }년 매출정산 </h3>
					<c:set value="${list }" var="hs"/>
					
					<fmt:formatNumber type="number" maxFractionDigits="3" value="${hs.get('1월')}" var="commaPrice1" />
					<fmt:formatNumber type="number" maxFractionDigits="3" value="${hs.get('2월')}" var="commaPrice2" />
					<fmt:formatNumber type="number" maxFractionDigits="3" value="${hs.get('3월')}" var="commaPrice3" />
					<fmt:formatNumber type="number" maxFractionDigits="3" value="${hs.get('4월')}" var="commaPrice4" />
					<fmt:formatNumber type="number" maxFractionDigits="3" value="${hs.get('5월')}" var="commaPrice5" />
					<fmt:formatNumber type="number" maxFractionDigits="3" value="${hs.get('6월')}" var="commaPrice6" />
					<fmt:formatNumber type="number" maxFractionDigits="3" value="${hs.get('7월')}" var="commaPrice7" />
					<fmt:formatNumber type="number" maxFractionDigits="3" value="${hs.get('8월')}" var="commaPrice8" />
					<fmt:formatNumber type="number" maxFractionDigits="3" value="${hs.get('9월')}" var="commaPrice9" />
					<fmt:formatNumber type="number" maxFractionDigits="3" value="${hs.get('10월')}" var="commaPrice10" />
					<fmt:formatNumber type="number" maxFractionDigits="3" value="${hs.get('11월')}" var="commaPrice11" />
					<fmt:formatNumber type="number" maxFractionDigits="3" value="${hs.get('12월')}" var="commaPrice12" />
					<fmt:formatNumber type="number" maxFractionDigits="3" value="${hs.get('합계')}" var="commaPrice13" />
						
					<p>1월: ${commaPrice1 }원</p>
					<p>2월: ${commaPrice2 }원</p>
					<p>3월: ${commaPrice3 }원</p>
					<p>4월: ${commaPrice4 }원</p>
					<p>5월: ${commaPrice5 }원</p>
					<p>6월: ${commaPrice6 }원</p>
					<p>7월: ${commaPrice7 }원</p>
					<p>8월: ${commaPrice8 }원</p>
					<p>9월: ${commaPrice9 }원</p>
					<p>10월: ${commaPrice10 }원</p>
					<p>11월: ${commaPrice11 }원</p>
					<p>12월: ${commaPrice12 }원</p>
					
					<h4>합계: ${commaPrice13 }원</h4>
					
				</c:otherwise>
			</c:choose>
		</div>
	</form>
</div>	
<jsp:include page="../../base/footer.jsp" />

<script>
	$(document).ready(function(){
	    setDateBox();
	});    
	
	// select box 연도
	function setDateBox(){
		
		var year = "<%=year%>";
	    var dt = new Date();
	    
	    var com_year = dt.getFullYear();
	    //  뿌려주기
	    $("#YEAR").append("<option value='' selected='selected' >년도</option>");
	    // 올해 기준으로 -5년부터 +15년을 보여준다.
	    for(var y = (com_year-5); y <= (com_year+15); y++){
	    	
	    	if(year == y){
    			$("#YEAR").append("<option value='"+ y +"' selected='selected' >"+ y + " 년" +"</option>");
    		}else{
    			$("#YEAR").append("<option value='"+ y +"'>"+ y + " 년" +"</option>");
    		}
	    	
	    }
	}
	function chkVal(){
		var year1 = document.getElementById("YEAR");
		var sel_val1 = document.getElementById("YEAR").options.selectedIndex;
		var rst2 = year1.options[sel_val1].value;
		
		var branch1 = document.getElementById("b_name");
		var sel_val2 = document.getElementById("b_name").options.selectedIndex;
		var rst1 = branch1.options[sel_val2].value;
		
		if(rst1 == ""){
			alert('지점을 선택해주세요.');
		}else if(rst2 == ""){
			alert('년도를 선택해주세요.');
		}else{
			document.getElementById("form1").submit();
		}
	}
</script>
</body>
</html>

