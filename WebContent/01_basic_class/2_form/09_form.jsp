<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>회원 가입</title>
<!-- 외부 CSS 연결 -->
<link href='09_myform.css' type='text/css' rel='stylesheet'>
<!-- 외부 jquery 연결 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="09_myform.js" type="text/javascript">
</script>
</head>

<body>
<form  action="09_server.jsp" method="post">
<fieldset>
<legend>기본정보</legend>
<ol>
  <li>
    <label for="empno">사번</label>
    <input id="empno" name="empno" type="text" required>
  </li>
  <li>
    <label for="ename">사원명</label>
    <input id="ename" name="ename" type="text"  required>
  </li>
  <li>
    <label for="deptno">부서번호</label>
<!--     <input id="deptno" name="deptno" type="text" required> -->
	<select name="deptno">
		<option value="10">10</option>
	    <option value="20">20</option>
   		<option value="30">30</option>
  	  	<option value="40">40</option>
	</select>
  </li>  
 </ol>
</fieldset>

<fieldset>
<legend>추가정보</legend>
<ol>
  <li>
    <label for="job">업무</label> 
    <input id="job" name="job" type="text">
  </li>
  <li>
    <label for="sal">월급</label>
    <input id="sal" name="sal" type="range" min="1000" max="10000">
  </li>
</ol>
</fieldset>
<fieldset>
  <button type="submit"> 제출 </button> 
</fieldset>
</form>
</body>
</html>
