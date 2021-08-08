<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="<c:url value="/css/branch/branch_su_sightseeing.css"/>"></link>
<meta charset="UTF-8">
<title>서울지점</title>
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
			<li class="branch"><a href="/branch/branch_su" >지점소개</a></li>
			<li class="branch"><a href="/branch/branch_su_sightseeing" >주변관광지</a></li>
			<li class="branch"><a href="/branch/branch_su_place" >부대시설</a></li>
			<li class="branch"><a href="/branch/branch_su_review" >후기</a></li>
		</ul>
	</div>
	<div id="content">

		<div id="onsemiro_su_ex1">
			
			<div id="reservation_btn">
				<button type="button" onclick="seoul()" id="reservation_btn">서울지점-예약하기</button>
			</div>
			
			
			<h1>온새미로. 서울 주변 관광지</h1>
		</div>
		
		<div id="bukchon">
			<h2>북촌 한옥 마을</h2>
			<p><span>종로의 북쪽마을</span><br>도심을 흐르는 청계천과<br><span>600년 선조</span>의 숨결이 살아숨쉬는 곳</p>
		</div>
		<div class="bukchonImg" id="bukchonimg1">
			<img src="/views/img1/온새미로_서울/온새미로_서울_관광지_북촌한옥마을1.PNG" alt="" id="bukchonimg1"/>
		</div>
		<div class="bukchonImg" id="bukchonimg2">
			<img src="/views/img1/온새미로_서울/온새미로_서울_관광지_북촌한옥마을2.PNG" alt="" id="bukchonimg2"/>
		</div>
	
		
		<div id="gyeong">
		<h2>경복궁</h2>
			<p><span>조선 왕조의</span><br>제일의 법궁으로<br>격조 높고 품위있는<span>왕실 문화의 진수</span></p>
		</div>
		<div class="gyeongImg" id="gyeongimg1">
			<img src="/views/img1/온새미로_서울/온새미로_서울_관광지_경복궁2.PNG" alt="" id="gyeongimg1"/>
		</div>
		<div class="gyeongImg" id="gyeongimg2">
			<img src="/views/img1/온새미로_서울/온새미로_서울_관광지_경복궁.PNG" alt="" id="gyeongimg2"/>
		</div>
	
		

	</div>
	
	<div id="footer">
		<jsp:include page="../base/footer.jsp"/>
	</div>
</body>
<script>
function seoul(){
	location.href="../reservation/calendar?b_name=온새미로-서울"
}


</script>
</html>