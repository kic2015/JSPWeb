//09_myform.js (09_form.jsp에서 호출)
$(function(){
	//버튼이 클릭했을때
	$('button').click(function(){
		if($('#empno').val().length==0){
			alert('please1')
			return;			
		}
		if($('#ename').val().length==0){
			alert('please2')
			return;
		}
		if($('#job').val().length==0){
			alert('please3')
			return;
		}

		//유효성 검사 마치면 서버전송
		$('form').submit
	})
	
})
