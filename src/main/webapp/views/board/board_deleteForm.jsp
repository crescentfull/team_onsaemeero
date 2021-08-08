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
<h1>게시글 삭제</h1>
	<form action="deleteReg">
		<input type="hidden" name="no" value="${boardVO.no }"/>
		<input type="hidden" name="kind" value="${boardVO.kind }"/>
			<table border="">

				<tr>
					<td>암호</td>
					<td><input type="text" name="pw" /></td>
				</tr>

				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="삭제"/>
						<a href="board_detail?no=${boardVO.no }">뒤로</a>
					</td>
				</tr>
			</table>
		</form>
		</div>
</body>
</html>