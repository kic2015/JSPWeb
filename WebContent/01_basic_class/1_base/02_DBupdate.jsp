<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
/* 
	emp 테이블에서 사원명이 홍길동인 사원의 정보를 수정
	 -업무(job) :IT
	 -매니저(mgr) :8899
	 -입사일(hiredate) :오늘날짜(ex.sysdate이용)
 */

 	//1.드라이버 로딩
	Class.forName("oracle.jdbc.driver.OracleDriver");
	//2. 연결객체 얻어오기
	String url="jdbc:oracle:thin:@192.168.10.73:1521:xe";
	String user="SCOTT";
	String password="TIGER";
	Connection con = DriverManager.getConnection(url, user, password);
	//3. sql문장
	String sql="UPDATE emp SET JOB=?,MGR=?,HIREDATE=SYSDATE WHERE ENAME='SMITH'";
	//4. 전송객체 얻어오기
	PreparedStatement ps =con.prepareStatement(sql);
	ps.setString(1, "CLERK");
	ps.setInt(2, 7902);
	
	//5. 전송하기
	ResultSet rs =ps.executeQuery();
	//6. 닫기
	ps.close();
	con.close();
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>02_DBupdate.jsp</title>
</head>
<body>
업데이트 성공
</body>
</html>