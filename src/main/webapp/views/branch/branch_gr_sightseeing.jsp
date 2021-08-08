<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="<c:url value="/css/branch/branch_su_sightseeing.css"/>"></link>
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
			
			
			<h1>온새미로. 강릉 주변 관광지</h1>
		</div>
		
		<div id="bukchon">
			<h2>경포대</h2>
			<p><span>동해안 최대 해변</span><br>아름다운 백사장과<br><span>소나무 숲</span>이 우거져 있는 곳</p>
		</div>
		<div class="bukchonImg" id="bukchonimg1">
			<img src="/views/img1/온새미로_강릉/온새미로_강릉_관광지_경포대1.PNG" alt="" id="gp1"/>
		</div>
		<div class="bukchonImg" id="bukchonimg2">
			<img src="/views/img1/온새미로_강릉/온새미로_강릉_관광지_경포대2.PNG" alt="" id="gp2"/>
		</div>
	
		
		<div id="gyeong">
		<h2>주문진항</h2>
			<p><span>동해안 최대 규모 어시장</span><br> 배에서 갓 내려놓은<br>구미 당기는<span>횟감</span></p>
		</div>
		<div class="gyeongImg" id="gyeongimg1">
			<img src="/views/img1/온새미로_강릉/온새미로_강릉_관광지_주문진항.PNG" alt="" id="jmj1"/>
		</div>
		<div class="gyeongImg" id="gyeongimg2">
			<img src="/views/img1/온새미로_강릉/온새미로_강릉_관광지_주문진항2.PNG" alt="" id="jmj2"/>
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