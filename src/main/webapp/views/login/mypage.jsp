<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="aaa.vo.UserVo" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보</title>
<link rel="stylesheet" href="<c:url value="/css/login/mypage.css"/>"></link>
<script src="<c:url value="/js/jquery-3.6.0.min.js"/>"></script>
</head>
<body>

	<div id="header">
		<jsp:include page="../base/header.jsp"/>
	</div>

	<div id="rbtn">
		<button type="button" id="rbtn1" onclick="reservation()">예약확인</button>
		<button type="button" id="rbtn2" onclick="bookinghistory()">이용내역</button>
	</div>

	<section>
		<form id="userform">
			<table id="mypageform">
				<tr>
					<td class="first">아이디</td>
					<td class="second2">${userdata.id }</td>
				</tr>
				
				<tr>
					<td class="first">현재 비밀번호</td>
					<td class="second"><input type="password" name="existingpw" placeholder="현재 비밀번호"/></td>
				</tr>
				
				<tr>
					<td class="first">비밀번호 변경</td>
					<td class="second"><input type="password" id="chpw" name="chpw" placeholder="변경할 비밀번호"/></td>
					<td class="third2"><img id="pwx" src='<c:url value="/views/img1/etc/x.png"/>'/>
					<img id="pwchk" src='<c:url value="/views/img1/etc/check.png"/>'/></td>
				</tr>
				
				<tr>
					<td class="first">비밀번호 확인</td>
					<td class="second"><input type="password" name="chkchpw" id="chkchpw" placeholder="비밀번호 확인"/></td>
					<td class="third2"><button id="pwbtn" type="submit" formaction="pwChange">변경</button></td>
				</tr>
				
				<tr>
					<td class="first">이름</td>
					<td class="second2"><input type="text" id="name" name="name" value="${userdata.name }"/></td>
				</tr>
				
				<tr>
					<td class="first">email</td>
					<td class="second">
						<input type="email" name="email" id="input_email"value="${userdata.email }" />
						<input type="email" id="email" value="${userdata.email }" readonly />
					</td>
					<td class="third">
						<button id="chkbtn" formaction="../mail/doSend">인증</button>
						<input type="text" id="chkok" value="${userdata.emailchk}" readonly />
					</td>
				</tr>
				
				<tr>
					<td class="first">번호</td>
					<td colspan=2 class="second2"><input type="text" name="phone" value="${userdata.phone }"/></td>
				</tr>
			</table>
			<div id="userbtn">
				<button type="button" class="userbtn" id="ub1" onclick="modifyById()">회원 정보 수정</button>
				<button formaction="deleteUser" class="userbtn" id="ub2" type="submit">회원 탈퇴</button>
			</div>
			
			<div id="etcbtn">
				<button type="button" id="qbtn" onclick="question()">나의 1:1문의</button>
				<button type="button" id="adminbtn" onclick="applyAdmin()">관리자 등록 신청</button>
				<input type="text" id="applyadmin" value="${userdata.kind }"/>
			</div>
		</form>
		
	</section>
		
	<div id="footer">
		<jsp:include page="../base/footer.jsp"/>
	</div>
</body>
<script>
<%
UserVo vo = (UserVo) session.getAttribute("userdata");
int userKind = vo.getKind();
%>
function hide(){
	 var chk = document.getElementById("chkok");
	 var btn = document.getElementById("chkbtn");
	 var adminbtn = document.getElementById("adminbtn");
	 var admin = document.getElementById("applyadmin");
	 var input_email = document.getElementById("input_email");
	 var email = document.getElementById("email");
	 var qbtn = document.getElementById("qbtn");
	 var kind = <%=userKind%>;

	 admin.style.display='none';
	 email.style.display='none';

	if(chk.value==="y"){
	      chkbtn.style.display = 'none';
	      chk.value = "인증 완료";
	      chk.style.border = 'none';
	      chk.style.color = 'red';
	      chk.style.display = 'block';
	      email.style.display = 'block';
	      input_email.style.display = 'none';
	}else {
		chk.style.display = 'none';
	}
	
	if(kind==1 || kind==2){
		adminbtn.style.display = 'none';
		qbtn.style.display = 'none';
	}
	$('#pwx').css('display', 'none');
	$('#pwchk').css('display', 'none');
	const $chpw = document.getElementById("chpw");
	const $chkchpw = document.getElementById("chkchpw");
	$chpw.addEventListener("blur", chpw);
	$chkchpw.addEventListener("blur", chpw2);
	function chpw(){
		if($chpw.value==""){
			$('#pwx').css('display', 'none');
			$('#pwchk').css('display', 'none');
		}else if($chpw.value!=$chkchpw.value){
			$('#pwx').css('display', 'block');
			$('#pwchk').css('display', 'none');
		}else {
			$('#pwchk').css('display','block');
			$('#pwx').css('display', 'none');
		}
	}
	function chpw2(){
		if($chpw.value==""){
			$('#pwx').css('display', 'none');
			$('#pwchk').css('display', 'none');
		}else if($chpw.value!=$chkchpw.value){
			$('#pwx').css('display', 'block');
			$('#pwchk').css('display', 'none');
		}else {
			$('#pwchk').css('display','block');
			$('#pwx').css('display', 'none');
		}
	}
	
}
hide();
function reservation(){
	location.href="reservationchk";
}
function bookinghistory(){
	location.href="bookinghistory";
}

function applyAdmin(){
	location.href="applyAdmin";
}
function question(){
	location.href="../board/qna_list";
}

function modifyById(){
	var frm = document.getElementById("userform");
	var name = document.getElementById("name").value;
	var name_m = name.match(/[a-z,A-Z,0-9,!@#$%^&*()_+ =/<>?]/g);
	if(name==''||name==null){
		alert('이름을 입력해 주세요.');
	}else if(name_m!=null){
		alert('이름에는 한글만 입력해 주세요.');
	}else {
		frm.action="modifyById";
		frm.submit();
	}
}

</script>
</html>