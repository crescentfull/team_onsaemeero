<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-compatible" content="IE=Edge, chrome=1.0">
<meta http-equiv="imagetoolbar" content="no">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>온새미로 로그인</title>
<link rel="stylesheet" href="<c:url value="/css/login/loginForm.css"/>"></link>
</head>
<body>

	<div id="header">
		<jsp:include page="../base/header.jsp"/>
	</div>

		<section>
            <aside class="login_aside">
                <div class="login_box">
                	<form action="loginReg?id=${vo.id }">
	                    <span class="login_input">
	                        <ul>
	                            <li>
	                                <input type="text" name="id" placeholder="아이디를 입력하세요"/>
	                            </li>
	                            <li>
	                                <input type="password" name="pw" placeholder="패스워드를 입력하세요" />
	                            </li>
	                            <li>
	                                <button type="submit">로그인</button>
	                            </li>
	                        </ul>
	                    </span>
                    </form>
                    <span class="login_join">
                        <ul>
                            <li onclick="join()">회원가입</li>
                            <li>|</li>
                            <li onclick="find()">ID/PW 찾기</li>
                        </ul>
                    </span>
                </div>
            </aside>
        </section>
        
	<div id="footer">
		<jsp:include page="../base/footer.jsp"/>
	</div>
</body>
<script>
function join(){
	location.href="useagree";
}
function find(){
	location.href="find";
}
</script>
</html>