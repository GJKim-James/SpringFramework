<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1><mark>김광진</mark></h1>
	<hr>
	
	<!-- HTML 안에서 Java 코드 사용하기 -->
	<% out.print("와! JSP 아시는구나!!"); %>
	
	<hr>
	
	<% for(int i=0; i<5; i++) { %>
		<p><%=i+1 %>번째 줄입니다.</p>
	<% } %>
</body>
</html>