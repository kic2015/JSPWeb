<%@ page language="java" import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<%
String driver="oracle.jdbc.driver.OracleDriver";
String user="SCOTT";
String pass="TIGER";
String dbURL="jdbc:oracle:thin:@localhost:1521:xe";

	System.out.println(request.getParameter("userId"));//값 들어오는지 체크
	
	Class.forName(driver);
	Connection connection=DriverManager.getConnection(dbURL,user,pass);
	
	String sql = "select * from memberTest where id='" + request.getParameter("userId")+"'";
	System.out.println(sql);//sql문 확인 
	Statement stmt = connection.createStatement();
	ResultSet rs = stmt.executeQuery(sql);		

	String result="NO";
	if (rs.next()){		
		result = "YES";
	}		
	out.print(result);
%>