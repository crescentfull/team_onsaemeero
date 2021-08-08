<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>온새미로 ID/PW 찾기</title>
<link rel="stylesheet" href='<c:url value="/css/login/find.css"/>'></link>
</head>
<body>

	<div id="header">
		<jsp:include page="../base/header.jsp"/>
	</div>

	<div class="content_wrapper">
		<div id="id" onclick="findId()">
			<p>아이디 찾기</p>
		</div>
		
		<div id="pw" onclick="findPw()">
			<p>비밀번호 찾기</p>
		</div>
	</div>
	
	<div id="footer">
		<jsp:include page="../base/footer.jsp"/>
	</div>

</body>

<script>
function findId(){
	location.href="findId";
}
function findPw(){
	location.href="findPw";
}
</script>
</html>