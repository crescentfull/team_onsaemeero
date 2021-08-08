<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="<c:url value="/css/branch/branchInfo.css"/>"></link>
<meta charset="UTF-8">
<title>지점 소개</title>
</head>
<style>

</style>
<body>
	<div id="header">
		<jsp:include page="../base/header.jsp"/>
	</div>
	<br>

	<br>
	<div id="onsemiroInfo">
		<div id="onsemiro_ex">
			<img src="/views/img1/로고/LOGO1.PNG" alt="" id="logo1"/>
		</div>
		<h1>온새미로 소개</h1>
		<p>온새미로는 <span id="onsemiro1">'언제나 변함없이'</span>라는 뜻의 순 우리말 입니다.</p>
		<p>온새미로는 전국에 총 4곳(서울, 강릉, 전주, 경주)의 펜션을 운영 중입니다.</p>
		<P>한옥의 전통적인 멋과 현대식 인테리어로 편안함을 느껴보세요.</P>
	</div>
	
	<div id="b_info">
		
		<div class="info" id="s_info"><h1>온새미로-서울</h1>
			<img src="/views/img1/온새미로_서울/낮밤.PNG" alt="" id="seoulInfo"/>
			<input type="button" value="구경하기" onclick="seoul()" id="seoulBt"/>		
		</div>
		
		<div class="info" id="g_info"><h1>온새미로-강릉</h1>
			<img src="/views/img1/온새미로_강릉/강릉표지.PNG" alt="" id="gInfo"/>
			<input type="button" value="구경하기" onclick="gangreung()" id="gBt"/>		
		</div>
		
		<div class="info" id="s_info"><h1>온새미로-전주</h1>
			<img src="/views/img1/온새미로_전주/전주표지.PNG" alt="" id="seoulInfo"/>
			<input type="button" value="구경하기" onclick="jeonju()" id="seoulBt"/>		
		</div>
		
		<div class="info" id="g_info"><h1>온새미로-경주</h1>
			<img src="/views/img1/온새미로_경주/경주표지.PNG" alt="" id="gInfo"/>
			<input type="button" value="구경하기" onclick="kyeongju()" id="gBt"/>		
		</div>
		
	</div>
	

	<div id="footer">
		<jsp:include page="../base/footer.jsp"/>
	</div>
</body>
<script>
	function seoul(){
		location.href="branch_su"
	}
	function gangreung(){
		location.href="branch_gr"
	}
	function jeonju(){
		location.href="branch_jj"
	}
	function kyeongju(){
		location.href="branch_kj"
	}
</script>
</html>