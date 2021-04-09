<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1.드라이버 로딩
	Class.forName("oracle.jdbc.driver.OracleDriver");
	//2. 연결객체 얻어오기
	String url="jdbc:oracle:thin:@192.168.10.73:1521:xe";
	String user="SCOTT";
	String password="TIGER";
	Connection con = DriverManager.getConnection(url, user, password);
	//3. sql문장
	String sql="INSERT INTO emp(EMPNO,ENAME,SAL,DEPTNO) VALUES(seq_emp_empno.nextval,?,?,?)";
	//4. 전송객체 얻어오기
	PreparedStatement ps =con.prepareStatement(sql);
	ps.setString(1, "홍길동");
	ps.setInt(2, 10000);
	ps.setInt(3, 20);
	
	//5. 전송하기
	ps.executeUpdate();
	//6. 닫기
	ps.close();
	con.close();
	/* 시퀀스 생성
		create sequence 시퀀스명(내맘대로);
	    시퀀스 번호를 1000부터 시작하고 증가할때마다 100씩 증가한다
	    create sequence 시퀀스명(내맘대로)
	    start with 1000 //1000부터 시작
	    increment by 100; //100단위로 증가
	*/
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h4>입력완료</h4>
	<a href='/JSPWeb/01_basic_class/1_base/02_DBtest.jsp'>목록보기</a><br/>
	<a href='./02_DBtest.jsp'>목록보기</a>
	
</body>
</html>