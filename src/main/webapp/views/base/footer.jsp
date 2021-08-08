<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
		
		<footer>
		<div class="footer">
			<div class="foot_box">
				<div class="foot_content">
					<h3>(주)온새미로</h3>
					<p>주소 : 서울시 광나루로 90길 34 (우편 98546)</p>
					<br>
					<h3>고객센터 0000-0000</h3>
					<p>영업시간 AM 10:00 ~ PM 18:00 (토,일,공휴일 휴무)</p>
					<p>*영업시간 외 카카오톡 상담 가능</p>
					<p>점심시간 PM 13:00 ~ PM 14:00</p>
				</div>
			</div>
			<div class="foot_menu">
				<div class="menu_foot">
					<h3>지점</h3>
					<a href="<c:url value="/branch/branch_su"/>">온새미로 서울</a><br />
					<a href="<c:url value="/branch/branch_gr"/>">온새미로 강릉</a><br />
					<a href="<c:url value="/branch/branch_kj"/>">온새미로 경주</a><br />
					<a href="<c:url value="/branch/branch_jj"/>">온새미로 전주</a><br />
				</div>
				<div class="menu_foot">
					<h3>예약</h3>
					<a href="<c:url value="/reservation/calendar"/>">예약하기</a>
				</div>
				<div id="mypage2" class="menu_foot">
					<h3>마이페이지</h3>
					<a href="<c:url value="/login/mypage"/>">마이페이지</a><br>
				</div>
				<div class="menu_foot">
					<h3>고객센터</h3>
					<a href="<c:url value="/board/notice_list"/>">공지사항</a><br />
					<a class="review" href="<c:url value="/board/review_list"/>">후기</a><br />
					<a href="<c:url value="/board/faq_list"/>">자주묻는 질문</a><br />
					<a class="qna" href="<c:url value="/board/qna_list"/>">1:1문의</a>
				</div>
			</div>
		</div>
	</footer>
	<div class="copywrite">
		<p>copyright ⓒ 2021 by onsaemeero All Page Content is property of onsaemeero</p>
	</div>
	