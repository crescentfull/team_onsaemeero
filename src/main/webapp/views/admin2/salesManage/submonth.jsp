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
<title>지점관리자 / 월 정산</title>
<link rel="stylesheet" type="text/css" href="<c:url value="/css/base/admin2.css"/>" />
<link rel="stylesheet" type="text/css" href="<c:url value="/css/admin2/submonth.css"/>" />
</head>
<body>
<c:set value="${year1 }" var="yr1"/>
<c:set value="${year2 }" var="yr2"/>
<c:set value="${month1 }" var="mt1"/>
<c:set value="${month2 }" var="mt2"/>
<%
	String y1 = request.getParameter("year1");
	String y2 = request.getParameter("year2");
	String m1 = request.getParameter("month1");
	String m2 = request.getParameter("month2");
	
%>
<jsp:include page="../../base/header.jsp" />

<div class="content_wrapper">

	<jsp:include page="../../base/adminDrop2.jsp" />
	

		<div id="salesMonth">	
			<h2 id="title">${branch } 월 정산</h2>
			
	<form  id="form1" method="get">
		
		<p>	
		    
		    <select name="year1" id="YEAR1" title="년도" >
		    
		    </select> 
		    
		    <select name="month1" id="MONTH1" title="월" >
		    
		    </select> 
		    <b>~</b>
		    <select name="year2" id="YEAR2" title="년도" >
		    	
		    </select> 
		    <select name="month2" id="MONTH2" title="월" >
		    
		    </select>   
		    <button id="btn-sch" type="button" onclick="chkVal()">조회</button> 
		</p>
	</form>	
		<div>
			<c:choose>
				<c:when test="${xxx eq '1' }">
					<h3 id="schnull"> 년, 월을 선택해주세요.</h3>
				</c:when>
				
				<c:otherwise>
					<h3 id="td-title">${year1 }-${month1 } ~ ${year2 }-${month2 } 월매출정산</h3>
					
				
					<table id="tb-sales" border="">
						<tr id="tit">
							<th>월</th>
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
<script>
	$(document).ready(function(){
		$("#YEAR1").append("<option value='' selected='selected'>년도</option>");
		$("#MONTH1").append("<option value='' selected='selected'>월</option>");
		$("#YEAR2").append("<option value='' selected='selected'>년도</option>");
		$("#MONTH2").append("<option value='' selected='selected'>월</option>");
	    setDateBox();
	});    
	
	// select box 연도
	function setDateBox(){
		
		var year1 = "<%= y1 %>";
		var year2 = "<%= y2 %>";
		var month1 = "<%= m1 %>";
		var month2 = "<%= m2 %>";
		
		
		var dt = new Date();
	    
	    var com_year = dt.getFullYear();
	            
	        for(var y = com_year-5; y <= com_year; y++){
		    	if(year1 == y){
		    		$("#YEAR1").append("<option value='"+ y +"' selected='selected'>"+ y + "년" +"</option>");	
		    	}else{
		    		$("#YEAR1").append("<option value='"+ y +"'>"+ y + "년" +"</option>");	
		    	}
	    		
	    		
		    }
	        
	        for(var y = com_year-5; y <= com_year; y++){
		    	if(year2 == y){
		    		$("#YEAR2").append("<option value='"+ y +"' selected='selected'>"+ y + "년" +"</option>");	
		    	}else{
		    		$("#YEAR2").append("<option value='"+ y +"'>"+ y + "년" +"</option>");
		    	}
	    		
	    		
		    }
	        
	    		for(var m = 1; m <= 12; m++){
	    			
	    			
	    			if(month1 == m){
	    				if(m<10){
	        	    		m = "0"+m;
	        	    		$("#MONTH1").append("<option value='"+ m +"' selected='selected' >"+  m + "월" +"</option>");	
	    				}else{
	    					$("#MONTH1").append("<option value='"+ m +"' selected='selected' >"+  m + "월" +"</option>");	
	    				}
	    				
	    			}else if(m<10){
	    	    		m = "0"+m;
	    	    		$("#MONTH1").append("<option value='"+ m +"'>"+  m + "월" +"</option>");	
	    	    	}else{
	    	    		
	    	    		$("#MONTH1").append("<option value='"+ m +"'>"+ m + "월" +"</option>");	
	    	    	}
	        		
	    	    }
	    	        
				for(var m = 1; m <= 12; m++){
	    			
		    			if(month2 == m){
		    				
		    				if(m<10){
		        	    		m = "0"+m;
		        	    		$("#MONTH2").append("<option value='"+ m +"' selected='selected' '>"+  m + "월" +"</option>");
		    				}else{
		    					$("#MONTH2").append("<option value='"+ m +"' selected='selected' '>"+  m + "월" +"</option>");	
		    				}
		    					
		    			}else if(m<10){
		    	    		m = "0"+m;
		    	    		$("#MONTH2").append("<option value='"+ m +"'>"+  m + "월" +"</option>");	
		    	    	}
		    	    	else{
		    	    		
		    	    		$("#MONTH2").append("<option value='"+ m +"'>"+ m + "월" +"</option>");	
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
		
		
		var month1 = document.getElementById("MONTH1");
		var sel_val4 = document.getElementById("MONTH1").options.selectedIndex;
		var rst4 = month1.options[sel_val4].value;
		
		var month2 = document.getElementById("MONTH2");
		var sel_val5 = document.getElementById("MONTH2").options.selectedIndex;
		var rst5 = month2.options[sel_val5].value;
		
		if(rst1 == "" || rst1 == null){
			alert('년도를 선택해주세요.');
		}else if(rst2 == "" || rst2 == null){
			alert('년도를 선택해주세요.');
		}else if(rst4 == "" || rst4 == null){
			alert('월을 선택해주세요.');
		}else if(rst5 == "" || rst5 == null){
			alert('월을 선택해주세요.');
		}else{
			document.getElementById("form1").submit();
		}
	}
	
</script>
</body>
</html>

