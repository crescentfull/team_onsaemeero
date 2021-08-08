<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>온새미로 취소내역</title>
<link rel="stylesheet" href="<c:url value="/css/login/bookingCancel.css"/>"></link>
</head>
<body>

	<div id="header">
		<jsp:include page="../base/header.jsp"/>
	</div>
	
	<div class="content_wrapper">
		<h1 id="h1">예약 취소 내역</h1>
			<c:forEach items="${cancelList }" var="vo">
				<div class="content">
					<div class="maincont">
						<h3 id="h3">${vo.b_name }</h3>
						<p class="big">결제금액</p><p><fmt:formatNumber value="${vo.price }"/>원</p>
						<p class="big">취소(환불) 금액</p><p id="red"><fmt:formatNumber value="${vo.cancelprice }"/>원</p>
						<p class="big">체크인&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;체크아웃</p><p>${vo.indate } &nbsp;&nbsp;~&nbsp;&nbsp; ${vo.outdate }</p>
						<p class="big">취소 날짜</p><p>${vo.canceldate }</p>
					</div>
				</div>
			</c:forEach>
	</div>
	
	<div id="footer">
		<jsp:include page="../base/footer.jsp"/>
	</div>
</body>
</html>