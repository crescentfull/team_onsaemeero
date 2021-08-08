<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지점관리 / 객실료관리</title>

<link rel="stylesheet" type="text/css" href="<c:url value="/css/base/admin.css"/>" />
<link rel="stylesheet" type="text/css" href="<c:url value="/css/admin1/roomCharge.css"/>" />

</head>
<body>
<jsp:include page="../../base/header.jsp" />

<div class="content_wrapper">

<jsp:include page="../../base/adminDrop.jsp" />

<div id="div-manage">	
<h2 id="title">요금관리</h2>
<c:set value="${map }" var="mmm"/>
<fmt:formatNumber type="number" maxFractionDigits="3" value="${mmm.get('서울').black_price }" var="su1" />
<fmt:formatNumber type="number" maxFractionDigits="3" value="${mmm.get('서울').red_price }" var="su2" />
<fmt:formatNumber type="number" maxFractionDigits="3" value="${mmm.get('강릉').black_price }" var="gr1" />
<fmt:formatNumber type="number" maxFractionDigits="3" value="${mmm.get('강릉').red_price }" var="gr2" />
<fmt:formatNumber type="number" maxFractionDigits="3" value="${mmm.get('전주').black_price }" var="jj1" />
<fmt:formatNumber type="number" maxFractionDigits="3" value="${mmm.get('전주').red_price }" var="jj2" />
<fmt:formatNumber type="number" maxFractionDigits="3" value="${mmm.get('경주').black_price }" var="gj1" />
<fmt:formatNumber type="number" maxFractionDigits="3" value="${mmm.get('경주').red_price }" var="gj2" />
<form id="frm1" action="/admin1/branch/fix">

	<table id="tb-charge" border="" >
		<tr id="tit">
			<th>지점</th>
			<th>주중</th>
			<th>주말</th>
			<th>주중-수정</th>
			<th>주말-수정</th>
		</tr>
		
		<tr>
			<td>${mmm.get('서울').b_name }</td>
			<td>${su1 }</td>
			<td>${su2 }</td>
			<td><input id="su1" type="text" name="su1" placeholder="금액" /></td>
			<td><input id="su2" type="text" name="su2"  placeholder="금액" /></td>
		</tr>
		<tr>
			<td>${mmm.get('강릉').b_name }</td>
			<td>${gr1 }</td>
			<td>${gr2 }</td>
			<td><input id="gr1" type="text" name="gr1"  placeholder="금액" /></td>
			<td><input id="gr2" type="text" name="gr2"  placeholder="금액" /></td>
		</tr>
		<tr>
			<td>${mmm.get('전주').b_name }</td>
			<td>${jj1 }</td>
			<td>${jj2 }</td>
			<td><input id="jj1" type="text" name="jj1"  placeholder="금액" /></td>
			<td><input id="jj2" type="text" name="jj2"  placeholder="금액" /></td>
		</tr>
		<tr>
			<td>${mmm.get('경주').b_name }</td>
			<td>${gj1 }</td>
			<td>${gj2 }</td>
			<td><input id="gj1" type="text" name="gj1"  placeholder="금액" /></td>
			<td><input id="gj2" type="text" name="gj2"  placeholder="금액" /></td>
		</tr>
		
		<tr>
			<td colspan="5"><button id="fix" type="button" onclick="chkStr()">수정</button></td>
		</tr>
	</table>
</form>
</div>
</div>
<jsp:include page="../../base/footer.jsp" />

<script src=<c:url value="/js/base/adminDrop.js" />></script>
<script type="text/javascript">
	function chkStr(){
		var frm = document.getElementById("frm1");
		var a1 = document.getElementById("su1").value;
		var a2 = document.getElementById("su2").value;
		var a3 = document.getElementById("gr1").value;
		var a4 = document.getElementById("gr2").value;
		var a5 = document.getElementById("jj1").value;
		var a6 = document.getElementById("jj2").value;
		var a7 = document.getElementById("gj1").value;
		var a8 = document.getElementById("gj2").value;
		if(isNaN(a1) || isNaN(a2) ||isNaN(a3) ||isNaN(a4) ||isNaN(a5) ||isNaN(a6) ||isNaN(a7) ||isNaN(a8)){
			alert('숫자만 입력해주세요.');
		}else if(a1 =="" && a2 =="" && a3 =="" && a4 =="" && a5 =="" && a6 =="" && a7 =="" && a8 =="" ){
			alert('전부 공백입니다.');
		}else{
			var ok = confirm('객실요금을 수정합니다');
			if(ok == true){
				frm.submit();
			}
		}
	
	}
</script>
</body>
</html>