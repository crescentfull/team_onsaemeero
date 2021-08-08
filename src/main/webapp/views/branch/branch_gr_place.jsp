<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="<c:url value="/css/branch/branch_su_place.css"/>"></link>
<meta charset="UTF-8">
<title>강릉지점</title>
</head>
<style>

</style>
<body>
	<div id="header">
		<jsp:include page="../base/header.jsp"/>
	</div>
		<div id="onsemiro_ex">
			<img src="/views/img1/로고/LOGO1.PNG" alt="" />
		</div>
		
		<div id="branchContent">
		<ul id="branch">
			<li class="branch"><a href="/branch/branch_gr" >지점소개</a></li>
			<li class="branch"><a href="/branch/branch_gr_sightseeing" >주변관광지</a></li>
			<li class="branch"><a href="/branch/branch_gr_place" >부대시설</a></li>
			<li class="branch"><a href="/branch/branch_gr_review" >후기</a></li>
		</ul>
	</div>
	<div id="content">
		
		<div id="onsemiro_su_ex1">
			<div id="reservation_btn">
				<button type="button" onclick="gangneung()" id="reservation_btn">강릉지점-예약하기</button>
			</div>
			<h1>온새미로. 강릉 부대시설</h1>
		</div>

		<div class="branchImg"  id="fireimg">
			<h1>서핑 체험</h1>
			<p>강릉 바다에서 서핑 체험
			<br>(동절기 불가능, 서핑보드 대여 10,000원/대)
			<br><span id="gr_bo">*서핑 강습은 하지 않습니다.</span></p>
			<img src="/views/img1/온새미로_강릉/강릉_보드.PNG" alt=""  id="fireimg"/>
		</div>
		
						 <div class="branchImg"  id="fireimg">
			<h1>족욕장</h1>
			<p>계절에 맞게 족욕이 가능한 공간
			<br>(객실 별로 공간 마련)</p>
			<img src="/views/img1/온새미로_강릉/강릉_족욕.PNG" alt=""  id="fireimg"/>
		</div>
		<div class="branchImg"  id="fireimg">
			<h1>모닥불</h1>
			<p>객실별 단독 모닥불
			감성적인 불멍과 함께하는 시간<br>(사계절 가능, 객실 별로 각자의 공간 마련)</p>
			<img src="/views/img1/온새미로_서울/서울_모닥불.PNG" alt=""  id="fireimg"/>
		</div>
		
				<div class="branchImg"  id="fireimg">
			<h1>텃밭 체험</h1>
			<p>알찬 구성의 작은 텃밭체험 공간<br>(직접 수확한 채소 제공)</p>
			<img src="/views/img1/온새미로_서울/서울_텃밭.PNG" alt=""  id="fireimg"/>
		</div>
		

	</div>
	
	

	

	<div id="footer">
		<jsp:include page="../base/footer.jsp"/>
	</div>
</body>
<script>
function gangneung(){
	location.href="../reservation/calendar?b_name=온새미로-강릉"
}


</script>
</html>