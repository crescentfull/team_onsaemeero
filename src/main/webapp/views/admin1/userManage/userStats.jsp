<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<title>온새미로/총관리자/회원통계</title>
<link rel="stylesheet" type="text/css" href="<c:url value="/css/base/admin.css"/>" />
<link rel="stylesheet" type="text/css" href="<c:url value="/css/admin1/userStats.css"/>" />
<link rel="stylesheet" type="text/css" href="<c:url value="/css/base/header.css"/>" />
</head>

<body>
<jsp:include page="../../base/header.jsp" />

	
	<div class="content_wrapper">

		
		
	<jsp:include page="../../base/adminDrop.jsp" />
	
	
	
		<div id="user_stats">	
		<h2 id="title" align=center>회원통계</h2>	
			<div id="gender">
				<h3> 성별통계</h3>
		
				<div id="r"></div><div class="ggg"><b>남자</b> : ${id_no.get('남자') }%</div>
					<div class="clear"></div>
		
				<div id="y"></div><span id="left"><b>여자</b> : ${id_no.get('여자') }%</span>
					<div class="clear"></div>
				
				<div class="pie-chart1"></div>
			</div>


	
			<div id="age">
				<h3 align="center"> 연령통계</h3>
				<div class="pie-chart2"></div>
				<div class="graph_wrap">
		   			 <div class="blind">
				     	
				     	<div id="y2"></div>
				     	<div class="ggg"><b>20대</b> : ${id_no.get('20')}%</div>
						<div class="clear"></div>
					   
					    <div id="y3"></div>
					    <div class="ggg"><b>30대</b> : ${id_no.get('30')}%</div>
				    	<div class="clear"></div>
			  			
			  			<div id="y4"></div>
			  			<div class="ggg"><b>40대</b> : ${id_no.get('40')}%</div>
		  				<div class="clear"></div>
				    	
				    	<div id="y5"></div>
				    	<div class="ggg"><b>50대</b> : ${id_no.get('50')}%</div>
					    <div class="clear"></div>
					    
					    <div id="y6"></div>
					    <div class="ggg"><b>60대 </b> : ${id_no.get('60')}%</div>
				    	<div class="clear"></div> 
  					</div>
	 			<div class="data_wrap">
			    
			    <div class="data">
			      <div class="bar level1" style="height: ${id_no.get('20')}%">20대:</div>
			    </div>
			    <div class="data">
			      <div class="bar level2" style="height: ${id_no.get('30')}%">30대:</div>
			    </div>
			    <div class="data">
			      <div class="bar level3" style="height: ${id_no.get('40')}%">40대:</div>
			    </div>
			    <div class="data">
			      <div class="bar level4" style="height: ${id_no.get('50')}%">50대:</div>
			    </div>
			    <div class="data">
			      <div class="bar level5" style="height: ${id_no.get('60')}%">60대 이상:</div>
			    </div>
			 </div>
		</div>
	</div>
</div>
<div class="clear"></div>

</div>
<div class="clear"></div>
<jsp:include page="../../base/footer.jsp" />

<script src=<c:url value="/js/base/adminDrop.js" />></script>
<script>
$(window).ready(function(){
    var i=1;
    var func1 = setInterval(function(){
        if(i<26){
            color1(i);
            i++;
        } else if(i<70){
            color2(i);
            i++;
        } else {
            clearInterval(func1);
        }
    },10);
    
    

    
});


function color1(i){
    $(".pie-chart1").css({
        "background":"conic-gradient(#8b22ff 0% "+i+"%, #ffffff "+i+"% 100%)"
        });
    $(".pie-chart2").css({
        "background":"conic-gradient(#8b22ff 0% "+i+"%, #ffffff "+i+"% 100%)"
        });
    
}
function color2(i){
    $(".pie-chart1").css({
        "background":"conic-gradient(#e79e07 0% ${id_no.get('여자') }%, #0988e6 0% ${id_no.get('남자') }%  )"
        });
    $(".pie-chart2").css({
        "background":"conic-gradient(#e79e07 0% ${id_no.get('여자') }%, #0988e6 0% ${id_no.get('남자') }%  )"
        });
}

function replay(){

    i=1;
    func1 = setInterval(function(){
        if(i<26){
            color1(i);
            i++;
        } else if(i<70){
            color2(i);
            i++;
        } else if(i<101){
            color3(i);
            i++;
        } else {
            clearInterval(func1);
        }
    },10);
}
</script>
</body>
</html>