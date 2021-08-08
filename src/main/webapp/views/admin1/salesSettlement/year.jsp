<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>

<title>정산관리 / 연 정산</title>
<link rel="stylesheet" type="text/css" href="<c:url value="/css/base/admin.css"/>" />
<link rel="stylesheet" type="text/css" href="<c:url value="/css/admin1/year.css"/>" />
<%
	String y1 = request.getParameter("year1");
	String y2 = request.getParameter("year2");
	
%>

</head>
<body>

<jsp:include page="../../base/header.jsp"/>
	<div class="content_wrapper">
	
	
	<jsp:include page="../../base/adminDrop.jsp" />
	
	<div id="salesYear">
		<h2 id="title">연 정산</h2>
	<form id="form1" action="year">
		<select name="year1" id="year1">
			
		</select>
		
		~
		
		<select name="year2" id="year2">
			
		</select>
		
		<button id="btn-sch" type="button" onclick="chkVal()">검색</button>
	</form>
	
	<div id="div-tb">
		<table id="tb-sales"border="">
	
		<%
			if(y1 == null){
		%>
			<tr>
				<td id="schnull" height="300px;">
					년도를 입력해주세요.
				</td>
			</tr>
		<%
			}else{
		%>
		<tr >
			<td id="td-title" colspan="6" >
				<%=y1 %> ~ <%=y2%> 연매출정산
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
		
	
		<c:forEach items="${yearData }" var="vo" varStatus="no">
		
		
		
		
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
</body>
<script src=<c:url value="/js/base/adminDrop.js" />></script>
<script>

 $(document).ready(function(){
    setDateBox();
    if(<%=request.getParameter("year1")%>!=null){
    	$('#year1').val('<%=y1 %>');
    }
    if(<%=request.getParameter("year2")%>!=null){
    	$('#year2').val('<%=y2 %>');
    }
}); 
function setDateBox(){
	
	
	
	var year = "<%= y1 %>";
	var year2 = "<%= y2 %>";
	
    var dt = new Date();
    
    var com_year = dt.getFullYear();
    //  뿌려주기
    
    // 올해 기준으로 -5년부터 +15년을 보여준다.
   
	    $("#year1").append("<option value='' selected='selected'>년도</option>");
	    for(var y = com_year-5; y <= com_year; y++){
			if(year == y){
				$("#year1").append("<option value='"+ y +"' selected='selected'>"+ y + "년" +"</option>");
			}else{
				$("#year1").append("<option value='"+ y +"'>"+ y + "년" +"</option>");
			}
				
			
	    }
	
	    $("#year2").append("<option value='' selected='selected'>년도</option>");
		for(var y = com_year-5; y <= com_year; y++){
	    	
			if(year2 == y){
				$("#year2").append("<option value='"+ y +"' selected='selected'>"+ y + "년" +"</option>");
			}else{
				$("#year2").append("<option value='"+ y +"'>"+ y + "년" +"</option>");
			}
    }
}		
function chkVal(){
	var rst1 = document.getElementById('year1').value;
	var rst2 = document.getElementById('year2').value;
	
	
	if(rst1 == ""){
		alert('연도를 선택해주세요.');
	}else if(rst2 == ""){
		alert('연도를 선택해주세요.');
	}else{
		document.getElementById("form1").submit();
	}
}
</script>
</html>