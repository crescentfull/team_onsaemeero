<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="<c:url value="/css/board/board.css"/>" />
<title>자주묻는질문 상세 페이지</title>
</head>
<body>

				<!-- 헤더 -->
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
	
	<!-- 본문 -->
<div class="content_wrapper">
		<div class="board_detail">
		<h3>${mainData.title }</h3>

<input type="hidden" name="kind" value="${main.kind }"/>
<table class="boarddetail">
	<tr>
		<td class="head">제목</td>
		<td>${mainData.title }</td>
	</tr>
	<tr>
		<td class="head">작성자</td>
		<td>${mainData.pname }</td>
	</tr>
	<tr>
		<td class="head">작성일</td>
		<td>${mainData.reg_dateStr }</td>
	</tr>
	<tr>
		<td class="head">조회수</td>
		<td>${mainData.cnt }</td>
	</tr>
	<tr class="contents">
		<td class="head">내용</td>
		<td>${mainData.contentBr }</td>
	</tr>
	<tr>
		<td class="list" colspan="2">
		<a href="faq_list">목록</a>
		<a id="del" href="deleteReg?no=${mainData.no }&kind=${mainData.kind }">삭제</a>
		<a id="edit" href="faq_modifyForm?no=${mainData.no }">수정</a>
		</td>
	</tr>
</table>
</div>
</div>
	<!-- 푸터 -->
	<div id="footer">
		<jsp:include page="../base/footer.jsp"/>
	</div>
	
<script src="<c:url value="/js/board/boardlist.js"/>"></script>
<script>
function hide(){
	var kind = document.getElementById("kind");
	var del = document.getElementById("del");
	var edit = document.getElementById("edit");
	
	del.style.display='none';
	edit.style.display='none';

	if(kind.value=="1"){
		del.style.display='block';
		edit.style.display='block';
	}
}
hide();

</script>
</body>
</html>