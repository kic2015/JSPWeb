<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

	//# 1."id"로 저장된 세션값을 얻어온다.
	Object obj = session.getAttribute("id");//무조건 object형으로 넘어감,LoginService.jsp에서 setattribute로 설정해줬으니 여기서는 get
	//# 2. 값이 null이라면 LoginForm.jsp로 페이지 이동
	if(obj == null){//id값이 null이거나 비어져있다면 로그인폼페이지로 다시보낸다
		response.sendRedirect("LoginForm.jsp");
		return;		
	}
	//# 3. null이 아니라면 String 형변환하여 변수에 지정
	String user = (String)obj;
	
%>
    
<!DOCTYPE html>
<html>
<head>
<title> 우리 페이지 </title>
</head>
<body>

	<h2> 이 페이지는 로그인을 하셔야만 볼 수 있는 페이지 입니다 </h2><br/><br/><br/>
	<%= user %>	님, 로그인 중입니다.

</body>
</html>