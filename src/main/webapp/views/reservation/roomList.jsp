<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> </title>
<link rel="stylesheet" href="<c:url value="/css/reservation/roomList.css"/>"></link>
</head>
<body>
	<div class="header">
		<jsp:include page="../base/header.jsp"/>
	</div>
	<div id="img1">
	<img src="/views/img1/etc/1단계.PNG" alt="" class="img11"/>
	</div>
	<h1 id="h1">예약 가능 객실</h1>
	<div id="search">
		<h1>검색 조건</h1>
	<div id="search1">
		<h2>지점 :  <%=request.getParameter("b_name") %></h2>
		<h2>날짜 :  <%=request.getParameter("indate")%> ~ <%=request.getParameter("outdate")%></h2>
		<p id="wk">*평일 : 일요일 ~ 목요일 / <span>주말 : 금요일 ~ 토요일</span> </p>	
	</div>
	</div>

	<c:forEach items="${roomData }" var="vo" varStatus="no">
		<form action="payment">
			<div id="room">
				<div id="aaa">
					<img class="roomImg" src="<c:url value="${vo.img }"/>" alt="" />
				</div>
				<div id="bbb">
				<h3 id="room_name">${vo.room_name }</h3>
					<input type="hidden" name="b_name" value="${vo.b_name }" />
					<input type="hidden" name="room_name" value="${vo.room_name }"/>
					<input type="hidden" name="indate" value="<%=request.getParameter("indate")%>"/>
					<input type="hidden" name="outdate" value="<%=request.getParameter("outdate")%>"/>
					<p>최대 인원  6명</p>
					<input type="hidden" name="price" value="${vo.black_price }"/>
					<input type="hidden" name="red_price" value="${vo.red_price }"/>
				<p id="room_ex"> ${vo.room_ex } </p>
				<p>*사진은 해당 지점의 사진입니다.<br> &nbsp;각 객실 동일</p>
				</div>
				<div id="ccc">
					<p id="price1"><fmt:formatNumber value="${vo.black_price }" />원/박(평일)</p>
					<p id="price2"><fmt:formatNumber value="${vo.red_price }" />원/박<span>(주말)</span> </p>
					<input type="submit" value="예약하기" id="ccc"/>
				</div>
			</div>
		</form>
	</c:forEach>
	<div id="footer">
		<jsp:include page="../base/footer.jsp"/>
	</div>
</body>
</html>