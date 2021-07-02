<%@ page import="static poly.util.CmmUtil.nvl" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% String name = nvl((String)request.getAttribute("name")); %>
<% String name2 = nvl((String)request.getParameter("name2")); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	안녕하세요, <%=name %> <%=name2 %> 님!
</body>
</html>