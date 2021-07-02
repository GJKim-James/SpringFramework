<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="poly.dto.EmpDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="static poly.util.CmmUtil.nvl" %>

<% List<EmpDTO> rList = (List<EmpDTO>)request.getAttribute("rList"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1">
		<thead>
			<tr>
				<th>사번(EMPNO)</th>
				<th>사원이름(ENAME)</th>
				<th>직책(JOB)</th>
				<th>매니저(MGR)</th>
				<th>고용일(HIREDATE)</th>
				<th>월급(SAL)</th>
				<th>보너스(COMM)</th>
				<th>부서번호(DEPTNO)</th>
			</tr>
		</thead>
		<tbody>
			<% for (EmpDTO e : rList) { %>
			<tr>
				<td><%=nvl(e.getEmpno()) %></td>
				<td><%=nvl(e.getEname()) %></td>
				<td><%=nvl(e.getJob()) %></td>
				<td><%=nvl(e.getMgr()) %></td>
				<td><%=nvl(e.getHiredate()) %></td>
				<td><%=nvl(e.getSal()) %></td>
				<td><%=nvl(e.getComm()) %></td>
				<td><%=nvl(e.getDeptno()) %></td>
			</tr>
			<% } %>
		</tbody>
	</table>
</body>
</html>