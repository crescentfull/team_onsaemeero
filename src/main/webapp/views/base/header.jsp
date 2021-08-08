<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<meta charset=UTF-8>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

<link rel="stylesheet" type="text/css" href="<c:url value="/css/base/header.css"/>" />
<script src="<c:url value="/js/jquery-3.6.0.min.js"/>"></script>



 
		<div id="header" >
			<ul class="main_menu">
				<li class="basic" id="logo"><a href="<c:url value="/"/>">
							  <img src="<c:url value="/img/base/LOGO1.PNG"/>" alt="" height="120px" width="150px"/>
							  </a></li>
				<li class="basic"><a href="<c:url value="/"/>">HOME</a></li>
				<li class="basic"><a href="<c:url value="/branch/branch"/>">지점</a>
					<ul class="sub_menu">
						<li><a href="<c:url value="/branch/branch_su"/>">온새미로 서울</a></li>
						<li><a href="<c:url value="/branch/branch_gr"/>">온새미로 강릉</a></li>
						<li><a href="<c:url value="/branch/branch_kj"/>">온새미로 경주</a></li>
						<li><a href="<c:url value="/branch/branch_jj"/>">온새미로 전주</a></li>
					</ul>
				</li>
				<li class="basic"><a href="<c:url value="/reservation/calendar"/>">예약</a>

				</li>
				<li class="basic"><a href="<c:url value="/board/notice_list"/>">고객센터</a>
					<ul class="sub_menu">
						<li><a href="<c:url value="/board/notice_list"/>">공지사항</a></li>
						<li class="review"><a href="<c:url value="/board/review_list"/>">후기</a></li>
						<li><a href="<c:url value="/board/faq_list"/>">자주묻는 질문</a></li>
						<li class="qna"><a href="<c:url value="/board/qna_list"/>">1:1문의</a></li>
					</ul>
				</li>
				<li class="basic" id="admin2"><a href="<c:url value="/admin2/reserve/manage"/>">지점관리자</a>
					<ul class="sub_menu">
						<li><a href="<c:url value="/admin2/reserve/manage"/>">예약관리</a></li>
						<li><a href="<c:url value="/admin2/sales/year"/>">정산관리</a></li>
						<li><a href="<c:url value="/board/boardlist"/>">관리자게시판</a></li>
					</ul>
				</li>
				<li class="basic" id="admin"><a href="<c:url value="/admin1/user/search"/>">관리자</a>
					<ul class="sub_menu">
						<li><a href="<c:url value="/admin1/user/search"/>">회원관리</a></li>
						<li><a href="<c:url value="/admin1/reservation/total"/>">예약관리</a></li>
						<li><a href="<c:url value="/admin1/sales/year"/>">정산관리</a></li>
						<li><a href="<c:url value="/admin1/admin/manage"/>">지점관리</a></li>
						<li><a href="<c:url value="/admin1/admin/manage"/>">관리자관리</a></li>
					</ul>
				</li>
				<li class="basic" id="mypage"><a href="<c:url value="/login/mypage"/>">마이페이지</a></li>
				<li class="basic" id="messengertotal"><a href="<c:url value="/admin_messenger/total"/>">메신저</a></li>
				<li class="basic" id="messengersu"><a href="<c:url value="/admin_messenger/messenger?roomId=su"/>">메신저</a></li>
				<li class="basic" id="messengerjj"><a href="<c:url value="/admin_messenger/messenger?roomId=jj"/>">메신저</a></li>
				<li class="basic" id="messengerkj"><a href="<c:url value="/admin_messenger/messenger?roomId=kj"/>">메신저</a></li>
				<li class="basic" id="messengergr"><a href="<c:url value="/admin_messenger/messenger?roomId=gr"/>">메신저</a></li>
				<li class="cs" id="logout"><a href="<c:url value="/login/logOut"/>">로그아웃</a></li>
				<li class="cs" id="login"><a href="<c:url value="/login/loginForm"/>">로그인</a></li>
			</ul>
			
		</div>


	<input type="hidden" id="kind" value="${userdata.kind }"/>
	<input type="hidden" id="userid" value="${userdata.id }"/>
	<input type="hidden" id="name" value="${userdata.name }"/>
	
	<div class=clear></div>
<script src="<c:url value="/js/jquery-3.6.0.min.js"/>"></script>
<script src="<c:url value="/js/base/header.js"/>"></script>
<script type="text/javascript">
<%
if(session.getAttribute("userdata")==null) {	//세션이 없다면
%>
$(document).ready(function(){

	$(".qna").hide();
	});
<%
}else {//세션이 있다면 회원정보 가져오기
%>
$(document).ready(function(){

	$(".qna").show(); 
	});
<%
}
%>


</script>

