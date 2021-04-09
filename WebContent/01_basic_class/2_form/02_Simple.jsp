<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//이전화면에서 사용자 입력값 얻어오기
	request.setCharacterEncoding("UTF-8");
	String name="";
	if(request.getParameter("name")!=null){
		name = request.getParameter("name");		
	}
	String gender =request.getParameter("gender");
	String occupation =request.getParameter("occupation");
	String[] hobby =request.getParameterValues("hobby");
	
	
 %>    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 얻어온 입력값을 화면에 출력하기 -->
	이름 : <%= name %> <br/>
	성별 : <%= gender %><br/>
	직업 : <%= occupation %><br/>
	취미 : 
	<% if(hobby!=null){ %>
	<% for(String s:hobby){ %>
			  <%=s%>
		<%}%>
	<%}%>		
</body>
</html>