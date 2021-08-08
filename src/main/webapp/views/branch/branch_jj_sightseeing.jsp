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
			<li class="branch"><a href="/branch/branch_jj" >지점소개</a></li>
			<li class="branch"><a href="/branch/branch_jj_sightseeing" >주변관광지</a></li>
			<li class="branch"><a href="/branch/branch_jj_place" >부대시설</a></li>
			<li class="branch"><a href="/branch/branch_jj_review" >후기</a></li>
		</ul>
	</div>
	<div id="content">

		<div id="onsemiro_su_ex1">
			
			<div id="reservation_btn">
				<button type="button" onclick="jeonju()" id="reservation_btn">전주지점-예약하기</button>
			</div>
			
			
			<h1>온새미로. 전주 주변 관광지</h1>
		</div>
		
		<div id="bukchon">
			<h2>전주 한옥마을</h2>
			<p><span>한복을 입고 </span><br>걷고, 춤추고, 노래하는<br><span>슬로시티</span>전주 한옥마을</p>
		</div>
		<div class="bukchonImg" id="bukchonimg1">
			<img src="/views/img1/온새미로_전주/온새미로_전주_관광지_전주한옥마을1.PNG" alt="" id="jjho1"/>
		</div>
		<div class="bukchonImg" id="bukchonimg2">
			<img src="/views/img1/온새미로_전주/온새미로_전주_관광지_전주한옥마을2.PNG" alt="" id="jjho2"/>
		</div>
	
		
		<div id="gyeong">
		<h2>전주 전동성당</h2>
			<p><span>서양식 근대건축</span><br>1914년에 준공되어 전주의 <br>랜드마크가 된 <span>전주 전동성당</span></p>
		</div>
		<div class="gyeongImg" id="gyeongimg1">
			<img src="/views/img1/온새미로_전주/온새미로_전주_관광지_전주성당1.PNG" alt="" id="jjsd1"/>
		</div>
		<div class="gyeongImg" id="gyeongimg2">
			<img src="/views/img1/온새미로_전주/온새미로_전주_관광지_전주성당2.PNG" alt="" id="jjsd2"/>
		</div>
	
		

	</div>
	
	<div id="footer">
		<jsp:include page="../base/footer.jsp"/>
	</div>
</body>
<script>
function jeonju(){
	location.href="../reservation/calendar?b_name=온새미로-전주"
}


</script>
</html>