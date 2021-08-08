<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="<c:url value="/css/branch/branch_su_place.css"/>"></link>
<meta charset="UTF-8">
<title>전주지점</title>
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
			<li class="branch"><a href="/branch/branch_kj" >지점소개</a></li>
			<li class="branch"><a href="/branch/branch_kj_sightseeing" >주변관광지</a></li>
			<li class="branch"><a href="/branch/branch_kj_place" >부대시설</a></li>
			<li class="branch"><a href="/branch/branch_kj_review" >후기</a></li>
		</ul>
	</div>
	<div id="content">
		
		<div id="onsemiro_su_ex1">
			<div id="reservation_btn">
				<button type="button" onclick="gyeongju()" id="reservation_btn">경주지점-예약하기</button>
			</div>
			<h1>온새미로. 경주 부대시설</h1>
		</div>
							 <div class="branchImg"  id="fireimg">
			<h1>전통 한복 대여</h1>
			<p>한복 체험이 가능하도록 대여
			<br>(요청사항에 사이즈를 남겨주세요 XL/L/M)</p>
			<img src="/views/img1/온새미로_전주/전주_한복.PNG" alt=""  id="fireimg"/>
		</div>
	
		 <div class="branchImg"  id="fireimg">
			<h1>수영장</h1>
			<p>아이들과 함께 즐길수 있는 수영장
			<br>(객실 별로 공간 마련)</p>
			<img src="/views/img1/온새미로_경주/경주_수영장.PNG" alt=""  id="fireimg"/>
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
function gyeongju(){
	location.href="../reservation/calendar?b_name=온새미로-경주"
}
</script>
</html>