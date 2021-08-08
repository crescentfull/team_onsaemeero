<%@page import="aaa.controll.DateCast"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약관리/지점조회</title>
<script src="//code.jquery.com/jquery-1.9.1.js" ></script>
<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<link rel="stylesheet" type="text/css" href="<c:url value="/css/base/admin.css"/>" />
<link rel="stylesheet" type="text/css" href="<c:url value="/css/admin1/resvBranch.css"/>" />
<c:set value="${branch }" var="bbb"/> 
<style>
td.td-page a{
	text-decoration:none;
	color:black;
	padding:30px;
}
td.td-page a {
	
	color: black;
	font-size:20px;
	padding:30px;
	text-align:center;
	
}
td.td-page{
	height:60px;
}
td.td-page a:hover{
	
	font-weight:bold;
	transition:0.2s;
}
td#td-now{
	text-align:center;
}
td.red{
	color:red;
}
.selbb{
	font-weight:bold;
}
</style>
<%	DateCast dc = new DateCast(); 
	int index =0;
	int cnt=0;
	String cntStr = (String) request.getAttribute("cnt");
	if(cntStr == null){
		cntStr = "1";
	}
	cnt = Integer.parseInt(cntStr);	
	index = (int)Math.ceil((double) cnt / 10); // 총 갯수 40개면은 4개가 나오고 41개 5개나와요 
	String name = (String) pageContext.getAttribute("name");
	if(name == null){
		name="";
	}
%>
</head>
<body>


<jsp:include page="../../base/header.jsp" />


<div class="content_wrapper">

<jsp:include page="../../base/adminDrop.jsp" />
	<div id="u-sch">
		<form id="form1" name="searchForm" method="get">
			<h2 id="title">지점예약조회</h2>
			<p>
				<select id="b_name" name="b_name" onchange="handleOnChange(this)">
					<option value = '' selected="selected">지점</option>
	
					<option value="온새미로-서울" 
						<c:if test="${bbb eq '온새미로-서울'}">selected="selected"</c:if>>서울
					</option>
					<option value="온새미로-강릉"
						<c:if test="${bbb eq '온새미로-강릉'}">selected="selected"</c:if>>강릉
					</option>
					<option value="온새미로-전주" 
						<c:if test="${bbb eq '온새미로-전주'}">selected="selected"</c:if>>전주
					</option>
					<option value="온새미로-경주"
						<c:if test="${bbb eq '온새미로-경주'}">selected="selected"</c:if>>경주
					</option>
				</select>
			   
			    <input type="text" id="datepicker1" name="firdate" autocomplete="off" placeholder = "시작 날짜" value=${indate }> 
			    <b>~</b>
			    <input type="text" id="datepicker2" name="secdate" autocomplete="off" placeholder = "마지막 날짜" value=${outdate }>
			</p>
				
			<p id="id">
				<input type="text"  name="id" placeholder="아이디나 이름으로 검색" value="">
				<button id="btn-sch" type="button" onclick="chkVal()">
	   	    		검색
	   			</button>	
			</p>
		    
		</form>
	
	<div id="rsv_list">
		<table id="tb-sch" border="">
			<tr id="tit">
				<th>예약 #</th>
				<th>지점</th>
				<th>아이디</th>
				<th>이름</th>
				<th>방이름</th>
				<th>체크인</th>
				<th>체크아웃</th>
				<th>금액</th>
				<th>요청사항</th>
				<th>예약취소</th>
				<th>블랙리스트 사유</th>
			</tr>
<c:set value="${inNull}" var="rst" />		
<%
	String result =  (String) pageContext.getAttribute("rst");
	
	if(result == null){
		result="1";
	}
	
	if(result.isEmpty()){		
%>			
			<tr>
				<td id="td-none" colspan="10
				" align="center">예약 건이 없습니다.<br><br>날짜를 선택해주세요.</td>
			</tr>
<%
	}else{ 
%> 			
<c:forEach items="${total }" var="tt">	
	<c:set value="${tt.indate }" var="in"/>	
	<c:set value="${tt.no }" var="rrr"/>	
	<c:set value="${tt.id }"  var="aaa"/>
<%	
	Integer resvNo = (Integer) pageContext.getAttribute("rrr");
	String in =  (String) pageContext.getAttribute("in");
	String id = (String) pageContext.getAttribute("aaa");
%>	
			<tr align="center">
				<td>${tt.no }</td>
				<td>${tt.b_name}</td>
				<td <c:if test="${tt.content != null }"> class="bbb"</c:if>> ${tt.id }</td>
				<td>${tt.name }</td>
				<td>${tt.room_name }</td>
				<td>${tt.indate }</td>
				<td>${tt.outdate }</td>
				<td><fmt:formatNumber value="${tt.price }" /></td>
				<td>${tt.requestBr }</td>
				<td id="td-btn"><%
					int ddd = dc.dateCasting(in);
					if(ddd == 1){
					%>	
						<button class="btn-cxl" onclick='resvCxl(<%= resvNo%>)' > 취소 </button>
				<%	
					}
				
				%></td>
				<td class="black">${tt.content }</td>
			</tr>
		</c:forEach>	
<%		 
	String firdate = (String) pageContext.getAttribute("indate");
	String secdate = (String) pageContext.getAttribute("outdate");


int start = 0;
int pi=0;

	if(request.getParameter("pageIndex")!=null){
		pi = Integer.parseInt(request.getParameter("pageIndex"));
	}else {
		pi=1;
	}

	if(pi>=1 && pi<=5){
		start = 1;
	}else {
		if(pi%5==0){
			start = pi - 4;
		}else {
			start = (pi/5) * 5 + 1;
		}
	}

	int end = start+4; // 글끝번호 1 2 3 4 5  1 시작 5 끝

	if(index<=end){
		end = index;
	}
%>
	<tr>
		<td class="td-page" colspan="11">
<%
if(start!=1){
	%>
		<a href="/admin1/reservation/branch?pageIndex=<%=start-1 %>&&firdate=${indate }&&secdate=${outdate }&&name=${name}&&b_name=${bbb}">◀</a>
	<% 
	}
			int pageBlock = 5;
			
			for(int i=start; i <= end; i++){
				
				if(pi==i){			
	%>	
					<a class="selbb">[<%=i%>]</a>
	<% 	
				}else{
	%>
					<a href="/admin1/reservation/branch?pageIndex=<%=i%>&&firdate=${indate }&&secdate=${outdate }&&name=${name}&&b_name=${bbb}"><%=(i)%></a>
	<%				
				}
			}
	%>		
	<%
			if(start+4 < index){
	%>
			<a href="/admin1/reservation/branch?pageIndex=<%=start+5 %>&&firdate=${indate }&&secdate=${outdate }&&name=${name}&&b_name=${bbb}">▶</a>
	<%
			}
	%>
</td>
</tr>



<tr>
<td colspan="11" id="td-now" align="center"><%=pi %>/<%=index %> page</td>
</tr>
<%
}
%>
		

		</table>
	</div>
</div>
</div>
<div class="claer"></div>
<jsp:include page="../../base/footer.jsp" />



<script src=<c:url value="/js/base/adminDrop.js" />></script>
<script src=<c:url value="//code.jquery.com/jquery-1.9.1.js" />></script>
<script src=<c:url value="//code.jquery.com/ui/1.10.4/jquery-ui.js" />></script>
<script>

jQuery.noConflict();
jQuery( document ).ready(function( $ ) {   
	

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
	});
	
	

});


function resvCxl(no){
	
	
	var resvNo = no;
	var chk = confirm('예약번호:'+no+'의 예약 건을 취소 하시겠습니까?');
	if(chk == true){
		location.href="/admin1/rsvManage/cancel?no="+no;
	}
}


function chkVal(){

	document.getElementById("form1").submit();

	 
}
</script>
</body>
</html>

