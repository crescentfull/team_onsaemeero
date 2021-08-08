<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	div#content_main {
		margin : 0 auto;
		padding-top : 100px;
		width : 50%;
	}
	#agree {
		margin : 20px auto;
		width : 50%;
	}
	#agree > #agreechk, #agree > label, button{
		float : right;
	}
	button {
		margin : 30px -180px 0px 0px;
		width : 200px;
		height : 50px;
		border-radius : 15px;
		border : none;
		background-color : lightgray;
		color : black;
		font-weight : bold;
	}
	button:hover {
		background-color : black;
		color : white;
	}
	
</style>
<body>

	<div id="header">
		<jsp:include page="../base/header.jsp"/>
	</div>

	
	<div id="content_main">

	<h2>개인정보 수집 및 이용 동의</h2>

	<h3>1. 수집하는 개인정보</h3>

	<p>이용자는 회원가입을 하여야 온새미로 서비스를 회원과 동일하게 이용할 수 있습니다. 이용자가 예약, 후기 등록 서비스를 이용하기 위해 회원가입을 할 경우, 온새미로는 서비스 이용을 위해 필요한 최소한의 개인정보를 수집합니다.</p>

	<p>회원가입 시점에 온새미로가 이용자로부터 수집하는 개인정보는 아래와 같습니다.</p>
	- 회원 가입 시에 ‘아이디, 비밀번호, 이름, 생년월일, 성별, 이메일 주소, 휴대전화번호’를 필수항목으로 수집합니다.
	서비스 이용 과정에서 이용자로부터 수집하는 개인정보는 아래와 같습니다.
	온새미로 내의 개별 서비스 이용, 이벤트 응모 및 경품 신청 과정에서 해당 서비스의 이용자에 한해 추가 개인정보 수집이 발생할 수 있습니다.
	추가로 개인정보를 수집할 경우에는 해당 개인정보 수집 시점에서 이용자에게 ‘수집하는 개인정보 항목, 개인정보의 수집 및 이용목적, 개인정보의 보관기간’에 대해 안내 드리고 동의를 받습니다.
	
	서비스 이용 과정에서 IP 주소, 쿠키, 서비스 이용 기록, 기기정보, 위치정보가 생성되어 수집될 수 있습니다.
	또한 이미지 및 음성을 이용한 검색 서비스 등에서 이미지나 음성이 수집될 수 있습니다.
	구체적으로 1) 서비스 이용 과정에서 이용자에 관한 정보를 자동화된 방법으로 생성하여 이를 저장(수집)하거나,
	2) 이용자 기기의 고유한 정보를 원래의 값을 확인하지 못 하도록 안전하게 변환하여 수집합니다.
	이와 같이 수집된 정보는 개인정보와의 연계 여부 등에 따라 개인정보에 해당할 수 있고, 개인정보에 해당하지 않을 수도 있습니다.
	
	
	<h3>2. 개인정보의 보관기간</h3>
	회사는 원칙적으로 이용자의 개인정보를 회원 탈퇴 시 지체없이 파기하고 있습니다.
	단, 이용자에게 개인정보 보관기간에 대해 별도의 동의를 얻은 경우, 또는 법령에서 일정 기간 정보보관 의무를 부과하는 경우에는 해당 기간 동안 개인정보를 안전하게 보관합니다.
	
	이용자에게 개인정보 보관기간에 대해 회원가입 시 또는 서비스 가입 시 동의를 얻은 경우는 아래와 같습니다.
	- 부정 가입 및 이용 방지
	탈퇴한 이용자의 휴대전화번호(복호화가 불가능한 일방향 암호화(해시처리)) : 탈퇴일로부터 6개월 보관
	
	ID : 서비스 탈퇴 후 6개월 보관
	eXpert 서비스 및 eXpert 센터 가입 등록정보 : 신청일로부터 6개월(등록 거절 시, 거절 의사 표시한 날로부터 30일) 보관
	전자상거래 등에서의 소비자 보호에 관한 법률, 전자금융거래법, 통신비밀보호법 등 법령에서 일정기간 정보의 보관을 규정하는 경우는 아래와 같습니다. 온새미로는 이 기간 동안 법령의 규정에 따라 개인정보를 보관하며, 본 정보를 다른 목적으로는 절대 이용하지 않습니다.
	- 전자상거래 등에서 소비자 보호에 관한 법률
	계약 또는 청약철회 등에 관한 기록: 5년 보관
	대금결제 및 재화 등의 공급에 관한 기록: 5년 보관
	소비자의 불만 또는 분쟁처리에 관한 기록: 3년 보관
	- 전자문서 및 전자거래 기본법
	공인전자주소를 통한 전자문서 유통에 관한 기록 : 10년 보관
	- 통신비밀보호법
	로그인 기록: 3개월
	
	참고로 온새미로는 ‘개인정보 유효기간제’에 따라 1년간 서비스를 이용하지 않은 회원의 개인정보를 별도로 분리 보관하여 관리하고 있습니다.
	
	3. 개인정보 수집 및 이용 동의를 거부할 권리
	이용자는 개인정보의 수집 및 이용 동의를 거부할 권리가 있습니다. 회원가입 시 수집하는 최소한의 개인정보, 즉, 필수 항목에 대한 수집 및 이용 동의를 거부하실 경우, 회원가입이 어려울 수 있습니다.
	</div>
	
	<div id="agree">
		<input type="checkbox" id="agreechk"/><label for="agreechk">위 약관에 동의합니다.</label><br>
		<button onclick="join()">회원가입 하러 가기</button>
	</div>
	
	<div id="footer">
		<jsp:include page="../base/footer.jsp"/>
	</div>
	
</body>
<script>
	function join(){
		var chk = document.getElementById("agreechk");
		if(chk.checked==true){
			location.href="join";
		}else {
			alert("약관에 동의하셔야 회원가입이 가능합니다.");
		}
		
	}
</script>
</html>