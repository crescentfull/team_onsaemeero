<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글</title>
</head>
<body>
${mainData.no}

<div style="border: 1px solid; width: 600px; padding: 5px">
	<label for="content">comment</label>
    <form name="commentInsertForm">
    	<div  class="input-group">
	        <input type="hidden" name="b_no" value="${mainData.no}">
	        작성자: <input type="text" name="writer" size="20" maxlength="20" value="#"> <br/>
	        <textarea id="content" class="form-control" name="content" rows="3" cols="60" maxlength="500" placeholder="댓글을 달아주세요."></textarea>
	        <span class="input-group-btn">
	        	<button class="btn btn-default" type="button" name="commentInsertBtn">등록</button>
	        </span>
        </div>
    </form>
</div>
<div class="container">
        <div class="commentList"></div>
</div>


<!-- 댓글 -->
    <div class="container">
        <label for="content">comment</label>
        <form name="commentInsertForm">
            <div class="input-group">
               <input type="hidden" name="b_no" value="${mainData.b_no}"/>
               <input type="text" class="form-control" id="content" name="content" placeholder="내용을 입력하세요.">
               <span class="input-group-btn">
                    <button class="btn btn-default" type="button" name="commentInsertBtn">등록</button>
               </span>
              </div>
        </form>
    </div>
    
    <div class="container">
        <div class="commentList"></div>
    </div>

<script src="../js/jquery-3.6.0.min.js">
<%@ include file="commentS.jsp" %>
</script>
</body>
</html>