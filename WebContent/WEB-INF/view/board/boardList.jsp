<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="poly.dto.BoardDTO"%>
<%@ page import="java.util.List"%>
<%@ page import="static poly.util.CmmUtil.nvl"%>

<%
	List<BoardDTO> rList = (List<BoardDTO>) request.getAttribute("rList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 목록</title>
</head>
<body>
	<div style="margin: auto; width: 800px;">
	
		<table border="1" style="width: 100%">
		
			<thead>
				<tr>
					<th>글 번호</th>
					<th>제목</th>
					<th>게시일</th>
					<th>게시자</th>
				</tr>
			</thead>
			
			<tbody>
				<%
					for (BoardDTO e : rList) {
				%>
				<tr>
					<td><%=nvl(e.getPOST_NO())%></td>
					<td><a href="/board/boardDetail.do?no=<%=e.getPOST_NO()%>"><%=nvl(e.getPOST_TITLE())%></a></td>
					<td><%=nvl(e.getREG_DT())%></td>
					<td><%=nvl(e.getREG_ID())%></td>
				</tr>
				<%
					}
				%>
			</tbody>
			
		</table>
		
		
		<div style="width: 100%; text-align: right; margin-top: 5px;">
			<button onclick="location.href='/board/newPost.do'">새 글</button>
		</div>
		
	</div>
</body>
</html>