<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="temp.*" %>
<%@ page import="basic.dto.EmpDTO" %>
<%@ page import="basic.dao.EmpDAO" %>
<%
	EmpDTO dto = new EmpDTO();
	dto.setEmpno(Integer.parseInt(request.getParameter("empno")));
	dto.setEname(request.getParameter("ename"));
	dto.setDeptno(Integer.parseInt(request.getParameter("deptno")));
	dto.setJob(request.getParameter("job"));
	dto.setSal(Integer.parseInt(request.getParameter("sal")));

//이전화면에서 사용자 입력값 얻어오기

	String empno = request.getParameter("empno");		
	String ename =request.getParameter("ename");
	String deptno =request.getParameter("deptno");
	String job =request.getParameter("job");
	String sal =request.getParameter("sal");

	EmpDAO dao =EmpDAO.getInstance();
	dao.insert(dto);
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 사원등록 </title>
</head>
<body>
	 성공적으로 입력되었지 DB에서 확인합니다.<br/>
	 <!--얻어온 사용자 입력값 확인 출력  -->
	 <%= empno %><br/>
	 <%= ename %><br/>
	 <%= deptno %><br/>
	 <%= job %><br/>
	 <%= sal %><br/>
	 
</body>
</html>