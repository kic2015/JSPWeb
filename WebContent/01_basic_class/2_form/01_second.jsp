<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");//데이터를 보내기전에 우선 한글처리
	String user = request.getParameter("User");//리퀘스트는 클라이언트->서버로 갈때 (받아올때)
	String password =request.getParameter("Pass");//해당 파라미터 값들은 form에서 name명이다
%> 
<!--get방식은 url에 붙여서 보내는방식 (주소에 데이터형태가 다 보여진다 -보안취약,소규모데이터)
	post방식은 form에 숨겨서 보내는방식(주소에 숨겨져있기때문에 보안에 강하고 대용량 데이터를 보낼수 있다.)
  -->   
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 폼의 입력값 처리 </title>
</head>
<body>
	<h2>폼의 입력값 넘겨받아 처리</h2>
	입력한 아이디 : <%= user %> <br/>
	입력한 패스워드 :  <%=password %><br/>
</body>
</html>