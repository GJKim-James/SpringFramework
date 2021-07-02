<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="poly.dto.BoardDTO"%>
<%@ page import="static poly.util.CmmUtil.nvl"%>

<%
	BoardDTO rDTO = (BoardDTO) request.getAttribute("rDTO");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 내용 수정하기</title>
</head>
<body>
	<div style="margin: auto; width: 800px;">
		<h1 style="text-align: center;">게시판 내용 수정하기</h1>
		<form action="/board/doEditPost.do" method="post">
			<div>제목</div>
			<div>
				<input type="text" value="<%=nvl(rDTO.getPOST_TITLE()) %>" name="post_title" style="width: 800px;" required>
			</div>

			<br>

			<div>내용</div>
			<div>
				<textarea name="post_content" style="width: 800px; height: 500px;" required><%=nvl(rDTO.getPOST_CONTENT()) %></textarea>
			</div>
			<input type="hidden" name="post_no" value="<%=nvl(rDTO.getPOST_NO()) %>">
			
			<div style="width: 800px; text-align: right; margin-top: 5px;">
				<input type="submit" value="수정 완료">
			</div>
		</form>
	</div>
</body>
</html>