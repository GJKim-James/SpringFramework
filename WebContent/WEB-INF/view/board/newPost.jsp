<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="poly.dto.BoardDTO"%>
<%@ page import="java.util.List"%>

<%
	List<BoardDTO> rList = (List<BoardDTO>) request.getAttribute("rList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>새 글 등록</title>
</head>
<body>
	<div style="margin: auto; width: 800px;">
		<h1 style="text-align: center;">새 글 등록</h1>
		<form action="/board/doPost.do" method="post">
			<div>제목</div>
			<div>
				<input type="text" name="post_title" style="width: 800px;" required>
			</div>
			
			<br>
			
			<div>내용</div>
			<div>
				<textarea name="post_content" style="width: 800px; height: 500px;" required></textarea>
			</div>
			<div style="width: 800px; text-align: right; margin-top: 5px;">
				<input type="submit">
			</div>
		</form>
	</div>
</body>
</html>