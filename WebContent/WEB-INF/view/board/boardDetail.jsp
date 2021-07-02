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
<title>게시판 내용 보기</title>
</head>
<body>
	<div style="margin: auto; width: 800px;">
		<h1 style="text-align: center;">게시판 내용 보기</h1>
		
		<hr>
		
		<div style="text-align: right;"><b>작성자 :</b> <%=nvl(rDTO.getREG_ID())%></div>
		<br>
		
		<div><b>제목 :</b> <%=nvl(rDTO.getPOST_TITLE())%></div>
		<br>

		<div><b>내용 :</b> <%=nvl(rDTO.getPOST_CONTENT())%></div>

		<hr>
		
		<div style="float: left; margin-top: 5px;">
			<button onclick="location.href='/board/boardList.do'">목록으로</button>
		</div>
		
		<div style="float: right; margin-top: 5px;">
			<button onclick="location.href='/board/deletePost.do?no=<%=rDTO.getPOST_NO()%>'">삭제하기</button>
			<button onclick="location.href='/board/editPost.do?no=<%=rDTO.getPOST_NO()%>'">수정하기</button>
		</div>
	</div>
</body>
</html>