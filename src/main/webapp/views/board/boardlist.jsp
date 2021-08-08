<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="<c:url value="/css/board/board.css"/>" />
<title>게시판 목록</title>
</head>
<style>

</style>
<body>
	<div>
		<jsp:include page="../base/header.jsp"/>
	</div>

	<div class="boardlist">
		<ul>
			<li><a id="notice" href="notice_list">공지사항</a></li>
			<li><a id="adminNotice" href="adminNotice_list">관리자공지사항</a></li>
			<li><a id="review" href="review_list">후기</a></li>
			<li><a id="faq" href="faq_list">자주묻는질문</a></li>
			<li><a id="qna" href="qna_list">1:1 문의</a></li>
		</ul>
	</div>
	
<div class="content_wrapper">


</div>

	<div id="footer">
		<jsp:include page="../base/footer.jsp"/>
	</div>
</body>
<script>
function kind(){
	var kind = document.getElementById("kind");
	
	

	var notice = document.getElementById("notice");
	var adminNotice = document.getElementById("adminNotice");
	var review = document.getElementById("review");
	var faq = document.getElementById("faq");
	var qna = document.getElementById("qna");
	

	adminNotice.style.display='none';
	
	qna.style.display='none';
	
	if(kind.value==="3" || kind.value==="4"){
		
		qna.style.display='block';
	}else if(kind.value==="1"){
		adminNotice.style.display='block';
		
		qna.style.display='block';
	}else if(kind.value=="2"){
		adminNotice.style.display='block';
		
		qna.style.display='block';
}
}
kind();

</script>
</html>