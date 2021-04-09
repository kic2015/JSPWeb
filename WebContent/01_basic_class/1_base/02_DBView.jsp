<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
/* 	int sabun = 7369; */
	int sabun = Integer.parseInt(request.getParameter("sabun"));
	//jdbc 셋팅하고 7369번을 가진 사원 정보 얻어오기
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	//2. 연결객체 얻어오기
	String url="jdbc:oracle:thin:@192.168.10.73:1521:xe";
	String user="SCOTT";
	String password="TIGER";
	Connection con = DriverManager.getConnection(url, user, password);
	//3. sql문장
	String sql="SELECT * FROM emp WHERE EMPNO=?";
	//4. 전송객체 얻어오기
	PreparedStatement ps =con.prepareStatement(sql);
/* 	ps.setString(1, "CLERK");*/
	ps.setInt(1, sabun); 
	
	//5. 전송하기
	ResultSet rs =ps.executeQuery();
	
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>	
</head>
<body>
<table>
	  <% if(rs.next()) { %> <!--값이 하나일때는 if  -->
	  <tr>
		<td><%=rs.getString("empno") %></td>
		<td><%=rs.getString("ename") %></td>
		<td><%=rs.getString("job") %></td>
		<td><%=rs.getString("mgr") %></td>
		<td><%=rs.getString("hiredate") %></td>
	  </tr>
	<% } %>
</table>
</body>
</html>