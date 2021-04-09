<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%  //--------------------------- 값 지정
	pageContext.setAttribute("name", "KIM");
	request.setAttribute("name", "SEUNGMIN");
	session.setAttribute("name", "DOKDO");
	application.setAttribute("name", "KOREA");
	//application.log("FirstPage.jsp : " + pageContext.getAttribute("name") + "님 접속");
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 첫번째 페이지 </title>
</head>
<body>

하나의 페이지 속성 : <%= pageContext.getAttribute("name") %> <br>
하나의 요청 속성 :	 <%= request.getAttribute("name") %> <br>
하나의 세션 속성 :	 <%= session.getAttribute("name") %> <br>
하나의 어플리케이션 속성 : <%= application.getAttribute("name") %> <br>

<!-- forward와 a href 차이  -->
<!-- first페이지와 second페이지를 창 2개띄워놓고 각각 실행해보면 차이를 알 수 있다 -->

<!-- 페이지 forward 이동된다면  -->
<jsp:forward page="SecondPage.jsp"/>
<!-- 이러면 pageContext(해당페이지에 저장된값)와 request(해당페이지요청)는 값을 가져올때 firstpage 상단에 지정된값을 요청으로 가져오니까 secondpage로 갈 경우 해당 지정된값이 없으므로 null이 된다 	
	그리고 세션(session)은 firstpage에서 실행을했을때 바로 서버에 값이 저장이 되버리니까 -->

<!-- <a href='SecondPage.jsp'>다음페이지</a> -->
<!-- 다음페이지에 이동하면 세션과 어플리케이션값만 가져오고 나머지는 가져오지 못한다. 
	pageContext- 해당페이지에서 값을가져오는것이므로 페이지가 변경되니까 못가져오는것
	
-->
			

</body>
</html>