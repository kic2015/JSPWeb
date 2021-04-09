<%@ page contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8"%>
<%@ page import="info.InfoBean" %>
<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="bean" class='info.InfoBean'>
	<jsp:setProperty name="bean" property="*"/><!--property에 *를 넣어주면 일일이 property를 직접 지정해주지않아도 알아서 지정한다  -->
<%-- 	<jsp:setProperty name="bean" property="id"/>		 --%>
</jsp:useBean>
<!DOCTYPE html>
<html>
<body>
	<h2>  당신의 신상명세서 확인 </h2>
	이   름  : <jsp:getProperty name="bean" property="name"  /><br/><%-- <%=bean.getName() %> --%>
	주민번호 : <jsp:getProperty name="bean" property="id"  	 /><br/>
	성  별   : <jsp:getProperty name="bean" property="gender" /><br/>  
	맞습니까????
</body>
</html>