<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%! String name; %>    

<%
	String msg;
	name = "홍길동";
	msg = "안녕하세요";
%>
<!-- jsp에서 작성가능한것들
	빠지는순서	jsp 주석 ->java주석->html 주석 
	주의 :주석을 쓸때 html주석은 많이 사용하지 않는다 왜냐하면 화면에 보여줄때 html은 주석도 같이 html처럼 변환하는 과정을 거침
	그래서 속도가 느려짐
 -->
<!-- 
	QuizNumber.jsp 이해하기 -주석달기
  -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index.jsp</title>
</head>
<body>
한주를 잘 보냅시다<br/>
<%= name %>님, <%=msg %>!!
</body>
</html>