<%@page import="aaa.controll.DateCast"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자등록/조회</title>
<% DateCast dc = new DateCast(); %>
<link rel="stylesheet" type="text/css" href="<c:url value="/css/base/admin.css"/>" />
<link rel="stylesheet" type="text/css" href="<c:url value="/css/admin1/regNdel.css"/>" />
</head>
<body>
<jsp:include page="../../base/header.jsp" />

<div class="content_wrapper">

<jsp:include page="../../base/adminDrop.jsp" />
	
	<div id="rnd">
	<h2 id="title">관리자 조회/삭제</h2>
	<table id="tb-rnd" border="">
		<tr id="tit">
			<td>아이디</td>
			<td>지점</td>
			<td>핸드폰번호</td>
			<td>이메일</td>
			<td>등록일</td>
			<td>관리자 삭제</td>
		</tr>
	<c:choose>
		<c:when test="${xxx == 0}">
			<tr>
				<td colspan="6"> 
					조회된 관리자가 없습니다.
				</td>
			</tr>
		</c:when>
		<c:otherwise>
			<c:forEach items="${adminB }" var="B">
			<c:set value="${B.regdate }" var="regdate"/>
			<%
				Date ddd = (Date) pageContext.getAttribute("regdate");
				String dd = dc.dateToStr(ddd);
			%>
		
	
			<tr>
				<td>${B.id }</td>
				<td>${B.name }</td>
				<td>${B.phone }</td>
				<td>${B.email }</td>
				<td><%= dd %></td>
				<td><button id="del" onclick="adminDel('${B.id }')">삭제</button></td>
			
		</tr>
		</c:forEach>
		</c:otherwise>
	</c:choose>
			
	</table>
</div>
</div>
<jsp:include page="../../base/footer.jsp" />
<script src=<c:url value="/js/base/adminDrop.js" />></script>
<script type="text/javascript">

	function adminDel(id){
		var adminId = id;
		var ok = confirm('정말로 삭제하시겠습니까?');
		if(ok == true){
			location.href="/admin1/admin/delete?id="+adminId;
		}
	}
</script>
</body>
</html>