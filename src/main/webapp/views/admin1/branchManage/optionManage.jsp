<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지점관리 / 옵션관리</title>
<link rel="stylesheet" type="text/css" href="<c:url value="/css/base/admin.css"/>" />
<link rel="stylesheet" type="text/css" href="<c:url value="/css/admin1/optionManage.css"/>" />
</head>
<body>

<jsp:include page="../../base/header.jsp" />

<div class="content_wrapper">

	<jsp:include page="../../base/adminDrop.jsp" />
	<div id="option">
	
	<div id="div-option">

	<form id="form1" action="/admin1/branch/option_reg">
		<h2 class="title">옵션등록</h2>
		<p>
			<select id="event_sel" name="b_name">
				<option value="지점">지점</option>
				<option value="온새미로-서울">온새미로-서울</option>
				<option value="온새미로-강릉">온새미로-강릉</option>
				<option value="온새미로-전주">온새미로-전주</option>
				<option value="온새미로-경주">온새미로-경주</option>
			</select>
			<input id="event" type="text" name="event" placeholder="이벤트명">
			<input id="price" type="text" name="price" placeholder="가격">
			<button id="reg" type="button" onclick="chkOption()">등록</button>
		</p>
	</form>
	
	</div>
	
	<div id="div-option-now">
	<h2 class="title">옵션현황</h2>
	
		<table class="tb-option" border="">
			<tr class="tr-table-tit">
				<th class="table-tit" colspan="3">온새미로-서울</th>
			</tr>
		<c:choose>
			
			<c:when test="${b1 == 1}">
				<tr>
					<td class="innull" colspan="3">등록된 이벤트가 없습니다.</td>
				</tr>
				
			</c:when>
			
			<c:otherwise>
				<tr class="tit">
					<td>이벤트명</td>
					<td>가격</td>
					<td>삭제</td>
				</tr>
				
				<c:forEach items="${osmrSu }"  var="su">
					<fmt:formatNumber type="number" maxFractionDigits="3" value="${su.price }" var="su1" />

				<tr>
					<td>${su.event }</td>
					<td class="price">${su1 }</td>
					<td class="non-padding"><button class="del" onclick="location.href='/admin1/option/delete?b_name=${su.b_name}&&event=${su.event }'">삭제</button></td>
				</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		
	</table>
	
	
	<table class="tb-option" border="">
		<tr class="tr-table-tit">
			<th class="table-tit" colspan="3">온새미로-강릉</th>
		</tr>
		<c:choose>
			<c:when test="${b2 == 1}">
				<tr>
					<td class="innull" colspan="2">등록된 이벤트가 없습니다.</td>
				</tr>
			</c:when>
			<c:otherwise>
				<tr class="tit">
				<td>이벤트명</td>
				<td>가격</td>
				<td>삭제</td>
				</tr>
				<c:forEach items="${osmrGr }"  var="gr">
<fmt:formatNumber type="number" maxFractionDigits="3" value="${gr.price }" var="gr1" />

				<tr>
					<td>${gr.event }</td>
					<td class="price">${gr1 }</td>
					<td class="non-padding"><button class="del" onclick="location.href='/admin1/option/delete?b_name=${gr.b_name}&&event=${gr.event }'">삭제</button></td>
				</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
	
	<table class="tb-option" border="">
		<tr class="tr-table-tit">
			<th class="table-tit" colspan="3">온새미로-전주</th>
		</tr>
		<c:choose>
			<c:when test="${b3 == 1}">
				<tr>
					<td class="innull" colspan="2">등록된 이벤트가 없습니다.</td>
				</tr>
			</c:when>
			<c:otherwise>
				<tr class="tit">
				<td>이벤트명</td>
				<td>가격</td>
				<td>삭제</td>
				</tr>
				<c:forEach items="${osmrJj }"  var="jj">
<fmt:formatNumber type="number" maxFractionDigits="3" value="${jj.price }" var="jj1" />

				<tr>
					<td>${jj.event }</td>
					<td class="price">${jj1 }</td>
					<td class="non-padding"><button class="del" onclick="location.href='/admin1/option/delete?b_name=${jj.b_name}&&event=${jj.event }'">삭제</button></td>
				</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
	
	<table class="tb-option" border="">
		<tr class=" tr-table-tit">
			<th class="table-tit" colspan="3">온새미로-경주</th>
		</tr>
		<c:choose>
			<c:when test="${b4 == 1}">
				<tr>
					<td class="innull" colspan="2">등록된 이벤트가 없습니다.</td>
				</tr>
			</c:when>
			<c:otherwise>
				<tr class="tit">
				<td>이벤트명</td>
				<td>가격</td>
				<td>삭제</td>
				</tr>
				<c:forEach items="${osmrGj }"  var="gj">
<fmt:formatNumber type="number" maxFractionDigits="3" value="${gj.price }" var="gj1" />

				<tr>
					<td>${gj.event }</td>
					<td class="price">${gj1 }</td>
					<td class="non-padding"><button class="del" onclick="location.href='/admin1/option/delete?b_name=${gj.b_name}&&event=${gj.event }'">삭제</button></td>
				</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
	
	</div>
</div>
	
	
</div>
<jsp:include page="../../base/footer.jsp" />	

</body>
<script src=<c:url value="/js/base/adminDrop.js" />></script>

<script type="text/javascript">
function chkOption(){
	var sel = document.getElementById("event_sel");
	var sel_val = document.getElementById("event_sel").options.selectedIndex;
	var rst = sel.options[sel_val].value;
	var event = document.getElementById("event").value;
	var price = document.getElementById("price").value;
	var frm = document.getElementById("form1");
	if(rst == "지점"){
		alert('지점을 선택해주세요.');
	}else if(event ==""){
		alert('이벤트명을 입력해주세요');
	}else if(price ==""){
		alert('가격을 입력해주세요.')
	}else if(isNaN(price)){
		alert('숫자만 입력해주세요.')
	}else{
		var ok = confirm('등록하시겠습니까?');
		if(ok ==true){
			frm.submit();
		}
		
	}
}

</script>
</html>