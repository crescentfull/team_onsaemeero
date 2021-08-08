<%@page import="aaa.vo.UserVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>온새미로/회원조회</title>
<link rel="stylesheet" type="text/css" href="<c:url value="/css/admin1/userSch.css"/>" />
<link rel="stylesheet" type="text/css" href="<c:url value="/css/base/admin.css"/>" />

<style>

td.td-page a{
	text-decoration:none;
	color:black;
	padding:30px;
}
td.td-page a {
	
	color: black;
	font-size:20px;
	padding:30px;
	text-align:center;
	
}
td.td-page{
	height:60px;
}
td.td-page a:hover{
	
	font-weight:bold;
	transition:0.2s;
}
td#td-now{
	text-align:center;
}
td.red{
	color:red;
}
a.selbb{
	font-weight:bold;
}
</style>
</head>
<body>
<c:set value="${useynb }" var="ynb" />
<%	
	int index =0;
	int cnt=0;
	
	String cntStr = (String) request.getAttribute("cnt");
	

	if(cntStr == null){
		cntStr = "1";
	}
	
	cnt = Integer.parseInt(cntStr);
		
		
		
	index = (int)Math.ceil((double) cnt / 10); // 총 갯수 40개면은 4개가 나오고 41개 5개나와요 
	
	

%>	
	
		<jsp:include page="../../base/header.jsp" />
	
	<div class="content_wrapper">

		<jsp:include page="../../base/adminDrop.jsp" />

		<div id="user-sch">
		<h2 id="title" align=center>회원조회</h2>	
			<form id="form1" method="get" >
				<c:set value="${useynb }" var="ynb" />
				
				<input type="radio" name="useynb" value="y" style="width:20px;height:20px"
				<c:if test="${ynb eq 'y' || ynb == null}">
					checked="checked"
				</c:if> ><span class="kkk">회원</span>
				
				<input type="radio" name="useynb" value="n" style="width:20px;height:20px"
				<c:if test="${ynb eq 'n'}">
					checked="checked"
				</c:if>><span class="kkk">탈퇴회원</span>
				
				<input type="radio" name="useynb" value="b" style="width:20px;height:20px"
				<c:if test="${ynb eq 'b'}">
					checked="checked"
				</c:if> ><span class="kkk">블랙리스트</span>
				
				<input type="radio" name="useynb" value="a" style="width:20px;height:20px"
				<c:if test="${ynb eq 'a'}">
					checked="checked"
				</c:if> ><span class="kkk">관리자등록</span>
				
				<p><input type="text" id="search" name="name"  placeholder="아이디나 이름을 검색해주세요." value=${name }>
				<button id="btn-sch">검색</button></p>
			</form>

			<div id="div-tb">
				<table id="tb-sch" border="">
					<tr id="tit">
						<th>아이디</th>
						<th>이름</th>
						<th>이메일</th>
						<th>핸드폰</th>
						<th>가입일</th>
						<c:if test="${ynb eq 'b' }"><th>블랙사유</th></c:if>
						
						<c:choose>
							<c:when test="${ynb eq 'a' }">
								<th id="th-black">관리자등록</th>
							</c:when>
							
							<c:when test="${ynb eq 'n' }">
								<th>탈퇴복구</th>
							</c:when>
						
							<c:otherwise>
								<th id="th-black">블랙리스트</th>
							</c:otherwise>
						</c:choose>
		
						<c:if test="${ynb eq 'a' }">
							<th>관리자반려</th>
						</c:if>
					</tr>
					
					<c:set value="${xxx }" var="x" />


					<c:choose >
						<c:when test="${x == 0 }">
							<tr>
								<td id="td-sch-none" align="center"<c:if test="${ynb eq 'b' || ynb eq 'a' }">colspan="7"</c:if>colspan = 6>
									검색결과가 없습니다.
								</td>
							</tr>
						</c:when>
						
						<c:otherwise>

							<c:forEach items="${rstlist }" var="rst">
								<tr>
									<td>${rst.id}</td>
									<td>${rst.name}</td>
									<td>${rst.email}</td>
									<td>${rst.phone}</td>
									
									<td>${rst.regtimeX}</td>
									<c:if test='${ynb eq "b" }'>
										<td class="red">${rst.content }</td>
									</c:if>
									
									<c:set value="${rst.useynb }" var="yynnbb" />	
									
									<c:choose>
										
										<c:when test="${ynb eq 'y' }">
											<c:choose>
												<c:when test="${yynnbb eq 'y' }">
													<td>
														<button class="btn-cxl" type="button" onclick="openBlackContent('${rst.id}')">
															등록
														</button>
													</td>
												</c:when>
												
												<c:when test="${yynnbb eq 'n' }">
												</c:when>
												
												<c:otherwise>
													<td class="black">블랙리스트</td>
												</c:otherwise>
											</c:choose>
										</c:when>
									
									<c:when test="${ynb eq 'n' }">
									
										<c:choose>
											<c:when test="${yynnbb eq 'n' }">
												<td>
													<button class="btn-cxl" type="button" onclick="backupId('${rst.id}')">
														복구
													</button>
												</td>
											</c:when>
										</c:choose>
									</c:when>
									
									<c:when test="${ynb eq 'b' }">	
										<td>
											<button class="btn-cxl" type="button" onclick="location.href='/admin1/user/recoverBlack?id=${rst.id}'">
												복구
											</button>
										</td>	
									</c:when>
									
									<c:when test="${ynb eq 'a' }">	
										<td>
											<button class="btn-cxl" type="button" onclick="location.href='/admin1/user/adminReg?id=${rst.id}'">
												관리자등록
											</button>
										</td>
										<td>
											<button class="btn-cxl" type="button" onclick="location.href='/admin1/user/adminReturn?id=${rst.id}'">
												반려
											</button>
										</td>		
									</c:when>
								</c:choose>
							</tr>
						</c:forEach>
							
					</c:otherwise>
				</c:choose>	
					
						
				<%	

					int start = 0;
					int pi=0;
					
						if(request.getParameter("pageIndex")!=null){
							pi = Integer.parseInt(request.getParameter("pageIndex"));
						}else {
							pi=1;
						}
					
						if(pi>=1 && pi<=5){
							start = 1;
						}else {
							if(pi%5==0){
								start = pi - 4;
							}else {
								start = (pi/5) * 5 + 1;
							}
						}
					
						int end = start+4; // 글끝번호 1 2 3 4 5  1 시작 5 끝
					
						if(index<=end){
							end = index;
						}
					
						String ynb = (String)pageContext.getAttribute("ynb");
						if(ynb.equals("y")){
							
						
					%>
					<tr>
						<td class="td-page" colspan="6">
						<% 
						if(start!=1){
							%>
								<a class="bb" href="/admin1/user/search?pageIndex=<%=start-1 %>&&name=${name}">◀</a>
							<% 
							}
									int pageBlock = 5;
									
									for(int i=start; i <= end; i++){
										if(pi == i){		
							%>			
										<a class="selbb">[<%=i%>]</a>
							<% 			
										}else{
											
							%>
										<a class="bb" href="/admin1/user/search?pageIndex=<%=i%>&&name=${name}"><%=(i)%></a>
							<%					
										}
									}
							%>		
							<%
									if(start+4 < index){
							%>
									<a class="bb" href="/admin1/user/search?pageIndex=<%=start+5 %>&&name=${name}">▶</a>
							<%
									}
							%>
						</td>
					</tr>
					<tr><td  colspan="6" id="td-now" align="center"><%=pi %>/<%=index %> page</td></tr>	
					<%
					}else if(ynb.equals("b")){	
					%>
					<tr>
						<td class="td-page" colspan="7">
						<% 
						if(start!=1){
							%>
								<a href="/admin1/user/search?useynb=b&&pageIndex=<%=start-1 %>">◀</a>
							<% 
							}
									int pageBlock = 5;
									
									for(int i=start; i <= end; i++){
										if(pi == i){		
							%>			
										<a class="selbb">[<%=i%>]</a>
							<% 			
										}else{
											
							%>
										<a class="bb" href="/admin1/user/search?useynb=b&&pageIndex=<%=i%>&&name=${name}"><%=(i)%></a>
							<%					
										}
									}
							%>		
							<%
									if(start+4 < index){
							%>
									<a href="/admin1/user/search?useynb=b&&pageIndex=<%=start+5 %>">▶</a>
							<%
									}
							%>
						</td>
					</tr>
					<tr><td colspan="7" id="td-now" align="center"><%=pi %>/<%=index %> page</td></tr>	
					<%
					}else if(ynb.equals("a")){	
					%>
					<tr>
						<td class="td-page" colspan="7">
						<% 
						if(start!=1){
							%>
								<a href="/admin1/user/search?useynb=a&&pageIndex=<%=start-1 %>">◀</a>
							<% 
							}
									int pageBlock = 5;
									
									for(int i=start; i <= end; i++){
										if(pi == i){		
							%>			
										<a class="selbb">[<%=i%>]</a>
							<% 			
										}else{
											
							%>
										<a class="bb" href="/admin1/user/search?useynb=a&&pageIndex=<%=i%>&&name=${name}"><%=(i)%></a>
							<%					
										}
									}
							%>		
							<%
									if(start+4 < index){
							%>
									<a href="/admin1/user/search?useynb=a&&pageIndex=<%=start+5 %>">▶</a>
							<%
									}
							%>
						</td>
					</tr>
					<tr><td colspan="7" id="td-now" align="center"><%=pi %>/<%=index %> page</td></tr>	
					<%
					}else if(ynb.equals("n")){	
						%>
						<tr>
							<td class="td-page" colspan="6">
							<% 
							if(start!=1){
								%>
									<a href="/admin1/user/search?useynb=n&&pageIndex=<%=start-1 %>">◀</a>
								<% 
								}
										int pageBlock = 5;
										
										for(int i=start; i <= end; i++){
											if(pi == i){		
								%>			
											<a class="selbb">[<%=i%>]</a>
								<% 			
											}else{
												
								%>
											<a class="bb" href="/admin1/user/search?useynb=n&&pageIndex=<%=i%>&&name=${name}"><%=(i)%></a>
								<%					
											}
										}
								%>		
								<%
										if(start+4 < index){
								%>
										<a href="/admin1/user/search?useynb=n&&pageIndex=<%=start+5 %>">▶</a>
								<%
										}
								%>
							</td>
						</tr>
						<tr><td colspan="6" id="td-now" align="center"><%=pi %>/<%=index %> page</td></tr>	
						<%
						}
						%>
			</table>
			
			
		</div>
	</div>
	</div>
	<div class="clear">
	<jsp:include page="../../base/footer.jsp" />
		</div>
<script src=<c:url value="/js/admin1/userSch.js" />></script>
<script src=<c:url value="/js/base/adminDrop.js" />></script>
</body>
</html>