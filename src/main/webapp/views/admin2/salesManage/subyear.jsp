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
<title>지점관리자 / 연 정산</title>
<link rel="stylesheet" type="text/css" href="<c:url value="/css/base/admin2.css"/>" />
<link rel="stylesheet" type="text/css" href="<c:url value="/css/admin2/subyear.css"/>" />
</head>
<body>
<c:set value="${year1 }" var="yr1"/>
<c:set value="${year2 }" var="yr2"/>


<jsp:include page="../../base/header.jsp" />

	<div class="content_wrapper">

	<jsp:include page="../../base/adminDrop2.jsp" />
	

	<div id="salesYear">
		<h2 id="title">${branch } 연 정산</h2>
	<form  id="form1" method="get">
		
		<p>	
			
		    <select name="year1" id="YEAR1" title="년도" >
		    	
		    </select> 
		    <b>~</b>
		    <select name="year2" id="YEAR2" title="년도" >
		    	
		    </select>   
		    <button id="btn-sch" type="button" onclick="chkVal()">조회</button> 
		</p>
	</form>	
		<div>
			<c:choose>
				<c:when test="${xxx eq '1' }">
					<h3 id="schnull"> 년도를 선택해주세요.</h3>
				</c:when>
				
				<c:otherwise>
					<h3 id="td-title">${year1 } ~ ${year2 } 연매출정산  </h3>
					
				
					<table id="tb-sales" border="">
						<tr id="tit">
							<th>년도</th>
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
							<td><%= list.get(i).getFirdate() %>년</td>
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
<jsp:include page="../../base/footer.jsp" />
<script src=<c:url value="/js/base/adminDrop.js" />></script>
<script>
	$(document).ready(function(){
	    setDateBox();
	});    
	
	// select box 연도
	function setDateBox(){
		
		var year = "${yr1 }";
		var year2 = "${yr2 }";
		var xxx = "${xxx }";
	    var dt = new Date();
	    
	    var com_year = dt.getFullYear();
	    //  뿌려주기
	    
	    $("#YEAR1").append("<option value='' selected='selected'>년도</option>");
	    for(var y = com_year-5; y <= com_year; y++){
			if(year == y){
				$("#YEAR1").append("<option value='"+ y +"' selected='selected'>"+ y + "년" +"</option>");
    		}else{
    			$("#YEAR1").append("<option value='"+ y +"'>"+ y + "년" +"</option>");
    		}
    			
    		
	    }
 
	    $("#YEAR2").append("<option value='' selected='selected'>년도</option>");
		for(var y = com_year-5; y <= com_year; y++){
	    	
			if(year2 == y){
				$("#YEAR2").append("<option value='"+ y +"' selected='selected'>"+ y + "년" +"</option>");
    		}else{
    			$("#YEAR2").append("<option value='"+ y +"'>"+ y + "년" +"</option>");
    		}
	    }
	    
	    
		
	}
	function chkVal(){
		var year1 = document.getElementById("YEAR1");
		var sel_val1 = document.getElementById("YEAR1").options.selectedIndex;
		var rst1 = year1.options[sel_val1].value;
		
		var year2 = document.getElementById("YEAR2");
		var sel_val2 = document.getElementById("YEAR2").options.selectedIndex;
		var rst2 = year2.options[sel_val2].value;
		
		
		
		if(rst1 == ""){
			alert('년도를 선택해주세요.');
		}else if(rst2 == ""){
			alert('년도를 선택해주세요.');
		}else{
			document.getElementById("form1").submit();
		}
	}
	
</script>
</body>
</html>

