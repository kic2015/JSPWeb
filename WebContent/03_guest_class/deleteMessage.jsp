<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id"); //넘겨오는 파라미터를 받는다

%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 방명록 삭제 </title>
</head>
<body>
	메세지를 삭제하려면 암호를 입력하세요. <br/><br/>
	<form action="deleteConfirm.jsp" method="post">
		<input type ="hidden" name='id' value='<%= id %>'><!-- 위에서 선언한 id값을 value에 넣기  -->
		암호 : <input type="password" name="password" />
		<input type="submit" value="메시지 삭제"/>
	</form>
</body>
</html>