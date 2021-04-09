<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 방명록 </title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	//'메시지 남기기' 버튼을 클릭했을때 
	//id와 name이 없을때는 input[해당타입]
	$('input[type="button"]').click(function(){
		//유효성검사 
		$('form').submit();//form을 전송해준다(submit)
			var param = {
				guestName : $('#guestName').val(),
				password  : $('#password').val(),
				message  : $('#message').val()
			}
			
			$.ajax({
				type : 'post', 
				data : param,
				url  : 'saveMessage.jsp',
				success : function(result){
					if(result.trim() =='1'){
						alert('성공')
					}else{
						alert('실패');						
					}
				},
				dataType : 'text'
			})
		})	
});
</script>
</head>

<body>

	<form action="saveMessage.jsp" name="frm" method="post">
		이름 : <input type="text" name="guestName" required /><br/><br/>
		암호 : <input type="password" name="password" required /><br/><br/>
		메세지 : <textarea name="message" rows="3" cols="30" required></textarea><br/><br/>
		<input type="button" value="메세지 남기기">
	</form>
</body>
</html>