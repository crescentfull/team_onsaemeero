<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>온새미로 비밀번호 찾기</title>
<link rel="stylesheet" href='<c:url value="/css/login/findPw.css"/>'></link>
</head>
<body>

	<div id="header">
		<jsp:include page="../base/header.jsp"/>
	</div>

	<div class="content_wrapper">
		<h2>비밀번호 찾기</h2>
		<p>ID,이름과 등록된 이메일을 입력하시오.</p>
		
		<form action="findPwReg">
			<div id="input">
				<p>아이디&nbsp;&nbsp;<input type="text" name="id" placeholder="아이디"/></p>
				<p>이름 &nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="name" placeholder="이름"/></p>
				<p>이메일&nbsp;&nbsp;<input type="email" name="email" placeholder="이메일"/></p>
			</div>
			<div id="submitbtn">
				<button type="submit">임시 비밀번호 보내기</button>
			</div>
		</form>
	</div>
		
	<div id="footer">
		<jsp:include page="../base/footer.jsp"/>
	</div>

</body>
</html>