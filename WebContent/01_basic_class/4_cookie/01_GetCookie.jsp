<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<html>
<head><title>쿠키</title></head>
<body>	

<h1>Cookie 정보 알아내기</h1>

<h4>다음은 클라이언트 브라우저의 쿠키에서 얻어온 값 : </h4><br><br>

<%	
	// 1. 클라이언트로부터 Cookie를 얻어옴 
	Cookie[] ck = request.getCookies();//쿠키는 여러개(ies 복수형태)니까 배열형태로 담아서 갖고와야함
	for(Cookie c :ck){
		if(c.getName().equals("yourId")){
			out.print(c.getValue()+"님 접속중<br/>");
		}	
	}
	// 2. 쿠키 이름 중에 "yourid"가 있다면 그 쿠키의 값을 출력
	
%>

<br><a href="01_ChangeCookie.jsp"> 쿠키값 변경 </a><br/>
<br><a href="01_RemoveCookie.jsp"> 쿠키제거 </a>

</body></html>
