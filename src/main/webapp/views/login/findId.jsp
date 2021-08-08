<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>온새미로 ID찾기</title>
<link rel="stylesheet" href='<c:url value="/css/login/findId.css"/>'></link>
</head>
<body>

	<div id="header">
		<jsp:include page="../base/header.jsp"/>
	</div>

	<div class="content_wrapper">
		<h2>ID 찾기</h2>
		<p>이름과 등록된 이메일을 입력하시오.</p>
		
		<form action="findIdReg">
			<div id="input">
				<p>이름 &nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="name" placeholder="이름을 입력하시오."/></p>
				<p>이메일&nbsp;&nbsp;<input type="email" name="email" placeholder="이메일을 입력하시오."/></p>
			</div>
			<div id="submitbtn">
				<button type="submit">Id 이메일로 보내기</button>
			</div>
		</form>
	</div>
	
	<div id="footer">
		<jsp:include page="../base/footer.jsp"/>
	</div>
</body>
</html>