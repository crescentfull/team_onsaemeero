<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>온새미로 회원가입</title>
<link rel="stylesheet" href='<c:url value="/css/login/join.css"/>'></link>
<script src="<c:url value="/js/jquery-3.6.0.min.js"/>"></script>
<style>
	form {
		width: 500px;
	}
</style>
</head>
<body>

	<div id="header">
		<jsp:include page="../base/header.jsp"/>
	</div>

	<section>
		<form method="post" id="joinform">
			<table>
				<tr>
					<td class="first">아이디</td>
					<td class="second"><input type="text" id="inputid" name="id" placeholder="아이디를 입력하시오." value="${joinData.id }" />
						<button id="chkidbtn" type="submit" formaction="chkId">중복 확인</button>
						<div id="idchkbox"><input type="text" id="id" value="${joinData.id}" readonly/>
						<input type="text" id="idok" readonly/>
						<input type="hidden" name="idok" id="idhidden" value="${joinData.idok }"/></div>
					</td>
				</tr>
				<tr>
					<td class="first">비밀번호</td>
					<td class="second"><input type="password" id="pw" name="pw" value="${joinData.pw }" maxlength="16" placeholder="비밀번호를 입력하시오."/></td>
				</tr>
				<tr>
					<td class="first">비밀번호 확인</td>
					<td class="second">
						<div id="pwchkbox">
							<input type="password" id="pwchk" name="pwchk" value="${joinData.pwchk }" maxlength="16" placeholder="입력한 비밀번호를 입력하시오."/>
							<img id="pwx" src='<c:url value="/views/img1/etc/x.png"/>'/>
							<img id="pwok" src='<c:url value="/views/img1/etc/check.png"/>'/>
						</div>
					</td>
				</tr>
				<tr>
					<td class="first">이름</td>
					<td class="second"><input type="text" id="name" name="name" value="${joinData.name }" placeholder="이름을 입력하시오."/></td>
				</tr>
				<tr>
					<td class="first" >주민등록번호</td>
					<td class="second" id="ddddd"><p><input type="text" name="front" id="front" maxlength="6" placeholder="앞 6자리" value="${joinData.front }"/>-
					<input type="text" name="back" id="back" maxlength="1" value="${joinData.back }" /> XXXXXX</p>
					</td>
				</tr>
				<tr>
					<td class="first">이메일</td>
					<td class="second"><input type="email" id="inputemail" name="email" value="${joinData.email }" placeholder="이메일을 입력하시오."/>
						<button id="chkemailbtn" type="submit" formaction="chkemail">중복 확인</button>
						<div id="emailchkbox"><input type="text" id="email" value="${joinData.email }" readonly/>
						<input type="text" id="emailok" readonly/>
						<input type="hidden" name="emailok" id="emailhidden" value="${joinData.emailok }"/></div>
					</td>
				</tr>
				<tr>
					<td class="first">휴대폰 번호</td>
					<td class="second"><input type="text" id="phone" name="phone" value="${joinData.phone }" placeholder="휴대폰번호를 입력하시오."/></td>
				</tr>
				<tr>
					<td colspan=2 align="center"><input type=button id="joinbtn" onclick="joinReg()" value="가입하기"></td>
				</tr>
			</table>
		</form>
	</section>
	
	<div id="footer">
		<jsp:include page="../base/footer.jsp"/>
	</div>

</body>
<script src="<c:url value="/js/login/join.js"/>"></script>
</html>