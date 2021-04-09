<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.beans.*" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 회원가입  </title>
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	$('#log').click(function() {//입력버튼을 눌렀을때
		var param = {
			id : $('#id').val(),
			password  : $('#password').val(),
			repassword  : $('#repassword').val(),
			name : $('#name').val(),
			tel : $('#tel').val(),
			addr : $('#addr').val()
		}
		
		$.ajax({
			type : 'post', 
			data : param,
			url  : 'InsertMember.jsp',
			success : function(result){
				if(result.trim() =='1'){
					alert('입력성공')
					//성공하면 화면 초기화
					$('#id').val('');
					$('#password').val('');
					$('#repassword').val('');
					$('#name').val('');
				}else{
					alert('입력실패');						
				}
			},
			dataType : 'text'
		})
	})
	
	$('input[name="check"]').click(function () {
          $.ajax({
            method: 'get',
            url: 'CheckId.jsp',
            data: {
              userId: $('input[name="id"]').val()
            },
            success: function (result) {
            	if(result.trim() == 'YES'){
					$('#idmessage').text('이미 사용중이다');
					$('#idmessage').show();					
				}else{
					$('#idmessage').text('사용 가능한 id');
					$('#idmessage').show();					
				}
            }
          })
        })
})	
</script>
</head>
<body>

<h1>회원가입서 작성하기</h1>
 
	<form action="InsertMember.jsp" method="post" name="frm">
		<table>
			<tr>
				<td width="100">
				<font color="blue">아이디</font>
				</td>
				<td width="100">
				<input type="text" name="id">
				<input type="button" name="check" value="중복확인"><br/>
				<div id="idmessage" style="display: none;"></div>
				</td>
			</tr>
			<tr>
				<td width="100">
				<font color="blue">비밀번호</font>
				</td>
				<td width="100">
				<input type="password" name="password"/><br/>
				</td>
			</tr>
			<tr>
				<td width="100">
				<font color="blue">비밀번호학인</font>
				</td>
				<td width="100">
				<input type="password" name="repassword"/><br/>
				</td>
			</tr>
			<tr>
				<td width="100">
				<font color="blue">이름</font>
				</td>
				<td width="100">
				<input type="text" name="name"/><br/>
				</td>
			</tr>
			<tr>
				<td width="100">
				<font color="blue">전화번호</font>
				</td>
				<td>
				<input type="text" size="15" name="tel"/>
				<br/>
				</td>
			</tr>
			<tr>
				<td width="100">
				<font color="blue">주소</font>
				</td>
				<td>
				<input type="text" size="50" name="addr"/><br/>
				</td>
			</tr>
			<tr>
				<td width="100">
				 <!--로그인 버튼-->
				 <input type="submit" id="log" value="회원가입">
				</td>
				<td width="100">
				<input type="reset" name="cancel" value="취소"><br/>
				</td>
			</tr>
		</table>
	</form>



 </body>
</html>
    