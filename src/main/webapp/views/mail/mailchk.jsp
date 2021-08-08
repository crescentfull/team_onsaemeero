<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href='<c:url value="/css/login/mailchk.css"/>'></link>
</head>
<body>

	<div>
		<jsp:include page="../base/header.jsp"/>
	</div>

	<div class="content_wrapper">
	
		<form action="chkno">
			<h2>인증번호 확인</h2>
			<p>이메일로 전송 된 인증번호를 적어주세요</p>
			<p><input type="text" name="chk">
			<button type="submit">확인</button></p>
		</form>
	</div>
	
	<div>
		<jsp:include page="../base/footer.jsp"/>
	</div>

</body>
</html>