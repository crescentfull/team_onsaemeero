<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
	result = confirm( "${msg}" );
	if(result){
		location.href="<c:url value="${url}"/>";
	}else {
		history.back();
	}
</script>
</body>
</html>