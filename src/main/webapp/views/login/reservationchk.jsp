<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 확인</title>
<link rel="stylesheet" href='<c:url value="/css/login/reservationchk.css"/>'></link>
</head>
<body>

	<div id="header">
		<jsp:include page="../base/header.jsp"/>
	</div>
	
	<div class="content_wrapper">
		<h1 id="h1">현재 예약 확인</h1>
		<h3 id="h3">지점(지역)과 호수를 확인하여 주세요</h3>
		<button id="bookingcancel" type="button" onclick="bookingcancel()">취소 내역</button>
		<c:forEach items="${reservationData }" var="vo" varStatus="no">	
			<form action="cancelroom">
				<div class="content">
					<div class="maincont">
						<h3 id="h3">${vo.b_name }</h3>
						<p class="big">객실</p><p>${vo.room_name}</p>
						<p class="big">결제금액</p><p><fmt:formatNumber value="${vo.price }" />원</p>
						<p class="big">체크인&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;체크아웃</p><p>${vo.indate } &nbsp;&nbsp;~&nbsp;&nbsp; ${vo.outdate }</p>
						<p class="big">요청사항</p><p>${vo.requestBr }</p>
					</div>
					<div class="cancelbtn">
						<button id="btn" type="submit">예약 취소</button>
					</div>
				</div>
				<input type="hidden" name="no" value="${vo.no }"/>
				<input type="hidden" name="indate" value="${vo.indate }"/>
				<input type="hidden" name="outdate" value="${vo.outdate }"/>
				<input type="hidden" name="price" value="${vo.price }"/>
				<input type="hidden" name="b_name" value="${vo.b_name }"/>
			</form>
		</c:forEach>
	</div>
	
	<div id="footer">
		<jsp:include page="../base/footer.jsp"/>
	</div>

</body>
<script>
function bookingcancel(){
	location.href="bookingCancel";
}
</script>
</html>