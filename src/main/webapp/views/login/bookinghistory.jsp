<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이용 내역</title>
<link rel="stylesheet" href='<c:url value="/css/login/bookinghistory.css"/>'></link>
</head>
<body>

	<div id="header">
		<jsp:include page="../base/header.jsp"/>
	</div>
	
	<div class="content_wrapper">
		<h1 id="h1">이용 내역 조회</h1>
		<h3 id="h3">이용 했던 지점에 후기를 달아주실 수 있습니다.</h3>
		<c:forEach items="${historyData }" var="vo" varStatus="no">
			<form action="../board/review_writeForm">
				<div class="content">
					<div class="maincont">
						<h3 id="h3">${vo.b_name }</h3>
						<p class="big">객실</p><p>${vo.room_name}</p>
						<p class="big">결제금액</p><p><fmt:formatNumber value="${vo.price }" /></p>
						<p class="big">체크인&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;체크아웃</p><p>${vo.indate } &nbsp;&nbsp;~&nbsp;&nbsp; ${vo.outdate }</p>
						<p class="big">요청사항</p><p>${vo.requestBr }</p>
					</div>
					<div class="reviewbtn">
						<button id="btn" type="submit">후기 쓰기</button>
					</div>
				</div>
				<input type="hidden" name="indate" value="${vo.indate }"/>
				<input type="hidden" name="outdate" value="${vo.outdate }"/>
				<input type="hidden" name="b_name" value="${vo.b_name }"/>
			</form>
		</c:forEach>
	</div>
	<div id="footer">
		<jsp:include page="../base/footer.jsp"/>
	</div>

</body>
</html>