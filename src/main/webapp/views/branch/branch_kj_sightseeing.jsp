<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="<c:url value="/css/branch/branch_su_sightseeing.css"/>"></link>
<meta charset="UTF-8">
<title>경주지점</title>
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
			
			
			<h1>온새미로. 경주 주변 관광지</h1>
		</div>
		
		<div id="bukchon">
			<h2>불국사</h2>
			<p><span>통일 신라의 </span><br>건축된 절<br><span>대한민국에서 </span>가장 유명한 절</p>
		</div>
		<div class="bukchonImg" id="bukchonimg1">
			<img src="/views/img1/온새미로_경주/경주_관광지_불국사1.PNG" alt="" id="jjho1"/>
		</div>
		<div class="bukchonImg" id="bukchonimg2">
			<img src="/views/img1/온새미로_경주/경주_관광지_불국사2.PNG" alt="" id="jjho2"/>
		</div>
	
		
		<div id="gyeong">
		<h2>보문정</h2>
			<p><span>한국의 비경</span><br>어느 계절 빼놓지 않고<br>풍경을 감상하기 좋은 곳 <span>사진 찍기 좋은 스팟</span></p>
		</div>
		<div class="gyeongImg" id="gyeongimg1">
			<img src="/views/img1/온새미로_경주/경주_관광지_보문정1.PNG" alt="" id="bmj1"/>
		</div>
		<div class="gyeongImg" id="gyeongimg2">
			<img src="/views/img1/온새미로_경주/경주_관광지_보문정2.PNG" alt="" id="bmj2"/>
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