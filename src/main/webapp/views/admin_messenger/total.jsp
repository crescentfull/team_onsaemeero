<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>총관리자 메신저</title>
<style>
	.messenger_menu{
		text-align: center;
		margin-top : 50px;
	}
	a {
		font-size: 20px;
		text-decoration: none;
		font-weight: bold;
		color: #52565f;
	}
	a:hover {
		color : red;
	}
</style>
</head>
<body>

	<div id="header">
		<jsp:include page="../base/header.jsp"/>
	</div>

	<p class="messenger_menu"><a href="<c:url value="/admin_messenger/messenger?roomId=su"/>">서울 메신저</a></p>
	<p class="messenger_menu"><a href="<c:url value="/admin_messenger/messenger?roomId=gr"/>">강릉 메신저</a></p>
	<p class="messenger_menu"><a href="<c:url value="/admin_messenger/messenger?roomId=kj"/>">경주 메신저</a></p>
	<p class="messenger_menu"><a href="<c:url value="/admin_messenger/messenger?roomId=jj"/>">전주 메신저</a></p>
	
	<div id="footer">
		<jsp:include page="../base/footer.jsp"/>
	</div>

</body>
</html>