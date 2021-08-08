<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>
</head>
<body>
	<div>
		<jsp:include page="../base/header.jsp"/>
	</div>
<div class="content_wrapper">
<h1>게시글 수정</h1>
	<form action="modifyReg">
	<input type="hidden" name="no" value="${mainData.no }"/>
	<input type="hidden" name="kind" value="${mainData.kind }"/>
	<input type="hidden" name="pw" value="${userdata.pw }"/>
			<table border="">
				<tr>
					<td>제목</td>
					<td><input type="text" name="title" value="${mainData.title }" /></td>
				</tr>
				<tr>
					<td>작성자</td>
					<td><input type="text" name="pname" value="${mainData.pname }" readonly /></td>
				</tr>
				<tr>
					<td>암호</td>
					<td><input type="text" name="pw" /></td>
				</tr>
				<tr>
					<td>내용</td>
					<td><textarea name="content" cols="30" rows="10">${mainData.content }</textarea></td>
				</tr>

				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="수정"/>
						<a href="board_detail?no=${mainData.no }">뒤로</a>
					</td>
				</tr>
			</table>
		</form>
</div>
</body>
</html>