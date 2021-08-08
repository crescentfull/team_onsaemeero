<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	for(int r=0;r<2;r++){
		for(int i=0;i<5;i++){
			
			if(r==0){
				out.println("알영");
			}else if(r==1){
				out.println("알일");
			}
		}
	}
	String bf="001211";
	SimpleDateFormat bfsdf = new SimpleDateFormat("yyMMdd");
	SimpleDateFormat newDtFormat = new SimpleDateFormat("yyyy-MM-dd");
	Date formatDate = bfsdf.parse(bf);
	String strNewDtFormat = newDtFormat.format(formatDate);

	out.println("나와줘" + strNewDtFormat);
	
	
	Date date = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd");
	String aaa = sdf.format(date);
	out.println(aaa);
%>
</body>
</html>