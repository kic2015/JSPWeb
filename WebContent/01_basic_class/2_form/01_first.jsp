<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title> 로그인창 </title>
</head>
<body>
<!-- id로 찾는경우 :css,js,jquery에서 사용할때 많이쓴다 
name은 서버측에 보낼때 사용 -->
<h3>로그인 확인하기 </h3> 
<form action="01_second.jsp" method="post">
사용자: <input name='User' id='User' class='User' type='text'><br/>
비밀번호: <input name='Pass' type='password'><br/>
<input type='submit' value='login'> 
</form>

</body>
</html>