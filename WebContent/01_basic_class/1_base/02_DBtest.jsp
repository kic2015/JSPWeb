<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>
<%@ page errorPage="02_NormalErrorPage.jsp" %>

<%
	// 1. 드라이버 로딩
	Class.forName("oracle.jdbc.driver.OracleDriver");//OracleDriver클래스 찾아서 메모리에 로딩
	System.out.print("드라이버 로딩성공");//이러면 드라이브를 못찾는다는 500에러가 뜬다->ojdbc6.jar파일 넣어줘야한다(오라클설치경로에있음)
	// 2. 연결객체 얻어오기
	String url="jdbc:oracle:thin:@192.168.10.73:1521:xe";
	String user="SCOTT";
	String password="TIGER";
	Connection con = DriverManager.getConnection(url, user, password);//db와의 연결통로
	System.out.println("연결성공");
	// 3. sql 문장 만들기
	String sql ="SELECT * FROM emp";
	// 4. 전송 객체 얻어오기
/* 	Statement : 완벽한 sql문장전송
	PreparedStatement : 미완성된 sql문장
	CallStatement : PLSql의 function()/procedure() 호출 
	*/
	PreparedStatement ps =con.prepareStatement(sql);
	// 5. 전송
	/* executeQuery()(ResultSet형) : select
	   executeUpdate()(int형) : insert,update,delete
		*/
	ResultSet rs =ps.executeQuery();
	/* PreparedStatement 인경우에는 executeQuery 안됨
	 */   
	   
	   
%>


<!DOCTYPE html>
<html><head><title> 디비 테스트 </title>
</head>
<body>
 
<div align=center>
<table border=2 cellSpacing=3>

  <tr class="title">
    <td>사번</td>
    <td>사원명</td>
    <td>업무</td>
    <td>관리자사번</td>
    <td>입사일</td></tr>

	<% while(rs.next()) { %>
	  <tr>
		<td><%=rs.getString("empno") %></td>
		<td>
			<a href='02_DBView.jsp?sabun=<%=rs.getString(1) %>'>
			<%=rs.getString("ename") %>
			</a>
		</td>
		<td><%=rs.getString("job") %></td>
		<td><%=rs.getString("mgr") %></td>
		<td><%=rs.getString("hiredate") %></td>
	  </tr>
	<% } %>

</table>
<a href='/JSPWeb/01_basic_class/1_base/02_DBInsert.jsp'>emp테이블에 추가(입력)</a>
<a href='./02_DBInsert.jsp'>emp테이블에 추가(입력)</a>

</div>
</body>
</html>
