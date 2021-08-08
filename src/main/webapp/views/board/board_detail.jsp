<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 상세 페이지</title>
</head>
<body>
	<div>
		<jsp:include page="../base/header.jsp"/>
	</div>
<div class="content_wrapper">
<h1>게시판 상세 페이지</h1>
<table border="">
<%-- 	<tr>
		<td>번호</td>
		<td>${mainData.no }</td>
	</tr> --%>
	<tr>
		<td>제목</td>
		<td>${mainData.title }</td>
	</tr>
	<tr>
		<td>작성자</td>
		<td>${mainData.pname }</td>
	</tr>
	<tr>
		<td>작성일</td>
		<td>${mainData.reg_date }</td>
	</tr>
	<tr>
		<td>조회수</td>
		<td>${mainData.cnt }</td>
	</tr>
	<tr>
		<td>내용</td>
		<td>${mainData.contentBr }</td>
	</tr>
	<tr>
		<td colspan="2" align="right">
		<a href="all_list">목록으로</a>
		<a href="deleteReg?no=${mainData.no }">삭제</a>
		<a href="board_modifyForm?no=${mainData.no }">수정</a>
		</td>
	</tr>
</table>
</div>

</body>
</html>