<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정산관리 / 월 정산</title>
<link rel="stylesheet" type="text/css" href="<c:url value="/css/base/admin.css"/>" />
<link rel="stylesheet" type="text/css" href="<c:url value="/css/admin1/month.css"/>" />
<%
	String y1 = request.getParameter("year1");
	String y2 = request.getParameter("year2");
	String m1 = request.getParameter("month1");
	String m2 = request.getParameter("month2");
	
%>

</head>
<body>

	
<jsp:include page="../../base/header.jsp"/>
	<div class="content_wrapper">
		
		<jsp:include page="../../base/adminDrop.jsp" />
		
		<div id="salesMonth">
			<h2 id="title">월 정산</h2>
		<form id="form1" action="month">
			<select name="year1" id="year1" >
					
			</select>
			
			<select name="month1" id="month1"></select>
			
			~
			
			<select name="year2" id="year2" >
				
				
			</select>
			
			<select name="month2" id="month2">
				
			</select>
			
			<button id="btn-sch" type="button" onclick="chkVal()">검색</button>
		</form>
	
		<div id="div-tb">
			<table id="tb-sales" border="">
		
			<%
				if(y1 == null){
			%>
				<tr>
					<td id="schnull" height="300px;">
						년 / 월을 입력해주세요.
					</td>
				</tr>
			<%
				}else{
			%>
			<tr>
				<td id="td-title" colspan="6">
					<%=y1 %>-<%=m1 %> ~ <%=y2%>-<%=m2 %> 월매출정산
				</td>
			</tr>	
			
			<tr id="tit">
				<th>날짜</th>
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
			
		
			<c:forEach items="${monthData }" var="vo" varStatus="no">
			
			
			
			
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
		<%
	}
		%>		
			
		</table>
		
	
	</div>	
	</div>
	
	</div>
<div class="claer"></div>
<jsp:include page="../../base/footer.jsp"/>	
	
<script src=<c:url value="/js/jquery-3.6.0.min.js"/>></script>
<script>
$(document).ready(function(){
	$("#year1").append("<option value='' selected='selected'>년도</option>");
	$("#month1").append("<option value='' selected='selected'>월</option>");
	$("#year2").append("<option value='' selected='selected'>년도</option>");
	$("#month2").append("<option value='' selected='selected'>월</option>");
	setDateBox();
	
	
}); 

function setDateBox(){
	
	
	
	var year1 = "<%= y1 %>";
	var year2 = "<%= y2 %>";
	var month1 = "<%= m1 %>";
	var month2 = "<%= m2 %>";
	
	
    var dt = new Date();
    
    var com_year = dt.getFullYear();
            
        for(var y = com_year-5; y <= com_year; y++){
	    	if(year1 == y){
	    		$("#year1").append("<option value='"+ y +"' selected='selected'>"+ y + "년" +"</option>");	
	    	}else{
	    		$("#year1").append("<option value='"+ y +"'>"+ y + "년" +"</option>");	
	    	}
    		
    		
	    }
        
        for(var y = com_year-5; y <= com_year; y++){
	    	if(year2 == y){
	    		$("#year2").append("<option value='"+ y +"' selected='selected'>"+ y + "년" +"</option>");	
	    	}else{
	    		$("#year2").append("<option value='"+ y +"'>"+ y + "년" +"</option>");
	    	}
    		
    		
	    }
        
    		for(var m = 1; m <= 12; m++){
    			
    			
    			if(month1 == m){
    				if(m<10){
        	    		m = "0"+m;
        	    		$("#month1").append("<option value='"+ m +"' selected='selected' >"+  m + "월" +"</option>");	
    				}else{
    					$("#month1").append("<option value='"+ m +"' selected='selected' >"+  m + "월" +"</option>");	
    				}
    				
    			}else if(m<10){
    	    		m = "0"+m;
    	    		$("#month1").append("<option value='"+ m +"'>"+  m + "월" +"</option>");	
    	    	}else{
    	    		
    	    		$("#month1").append("<option value='"+ m +"'>"+ m + "월" +"</option>");	
    	    	}
        		
    	    }
    	        
			for(var m = 1; m <= 12; m++){
    			
	    			if(month2 == m){
	    				
	    				if(m<10){
	        	    		m = "0"+m;
	        	    		$("#month2").append("<option value='"+ m +"' selected='selected' '>"+  m + "월" +"</option>");
	    				}else{
	    					$("#month2").append("<option value='"+ m +"' selected='selected' '>"+  m + "월" +"</option>");	
	    				}
	    					
	    			}else if(m<10){
	    	    		m = "0"+m;
	    	    		$("#month2").append("<option value='"+ m +"'>"+  m + "월" +"</option>");	
	    	    	}
	    	    	else{
	    	    		
	    	    		$("#month2").append("<option value='"+ m +"'>"+ m + "월" +"</option>");	
	    	    	}
        		
    	    	}
    	
}
function chkVal(){
	var rst1 = document.getElementById('year1').value;
	var rst2 = document.getElementById('year2').value;
	var rst3 = document.getElementById('month1').value;
	var rst4 = document.getElementById('month2').value;
	
	
	if(rst1 == ""){
		alert('년도를 선택해주세요.');
	}else if(rst2 == ""){
		alert('년도를 선택해주세요.');
	}else if(rst3 == ""){
		alert('월을 선택해주세요.');
	}else if(rst4 == ""){
		alert('월을 선택해주세요.');
	}else{
		document.getElementById("form1").submit();
	}
}
</script>
</body>
<script src=<c:url value="/js/base/adminDrop.js" />></script>

</html>