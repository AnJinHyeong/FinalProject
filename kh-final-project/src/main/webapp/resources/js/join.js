//join.jsp(회원가입js)

// 아이디입력
$(function () {
	$('#memberId').blur('input', function () {
		var id = $(this).val();
		var regexId = /^[a-zA-Z0-9]{8,20}$/;
		if (regexId.test(id)) {
			$('#idResult').css("color", "black")
			$('#idResult').text('');
		}			
		 else {
			$('#idResult').css("color", "red")
			$('#idResult').text('잘못된 형식의 아이디 입니다');
			return false;
		}
		
//아이디중복 확인		
		$.ajax({
			url: "${pageContext.request.contextPath}/idCheck",
			data:{
				memberId : id	
				},
				success:function(resp){
					if(resp === "Y"){
						$("#idResult").next().text("사용가능한 아이디입니다")
					}
					else if (resp==="N"){
						$("#idResult").next().text("이미 사용중인 아이디입니다")
						
					}
				}
			
		})
		
	});
	
	// 비밀번호 입력
	$('#memberPw').blur('input', function () {
		var pw = $(this).val();
		var regexPw = /^[a-zA-Z0-9!@#$%^&*]{8,16}$/;
		if (regexPw.test(pw)||(pw='')) {
			$('#pwResult').text('');
		}else{
			$('#pwResult').css("color", "red")
			$('#pwResult').text('비밀번호 형식이 올바르지 않습니다');
			return false;
		}
	});
	
// 비밀번호 재입력
	$('#memberPw2').blur('input', function () {
		var pw = $('#memberPw').val();
		var pw2 = $(this).val();
		if (pw == pw2) {
			$('#pwResult2').text('');
		} else {
			$('#pwResult2').css("color", "red")
			$('#pwResult2').text('비밀번호가 일치하지 않습니다');
			return false;
		}
	});
	
	//비밀번호를 입력하지 않고, 비밀번호재입력칸을 입력했을때
	$('#memberPw2').blur('input', function () {
		var pw = $('#memberPw').val();
		var pw2 = $(this).val();
		if (pw == '') {
			pw2 = $(this).val('');
			$('#memberPw').focus();
			$('#pwResult3').text('먼저 비밀번호를 입력해주세요');
			$('#pwResult3').css("color", "red")
		}
		if(pw=true){
			$('#pwResult3').text('');
		}
	});
	
	// 닉네임 입력
	$('#memberNick').blur('input', function () {
		var nick = $(this).val();
		var regexNick = /^[가-힣a-zA-Z0-9!@#$%^&*]{1,10}$/;
		if (regexNick.test(nick)) {
			$('#nickResult').text('');
		} else {
			$('#nickResult')	.text('닉네임은 최소 한 글자 이상, 최대 열 글자 까지입니다');
			$('#nickResult').css("color", "red")
		}
	});

	
	$('.join-form').on('submit', function (e) {
		var id = $('#memberId').val();
		var regexId = /^[a-zA-Z0-9]{8,20}$/;
		var pw = $('#memberPw').val();
		var regexPw = /^[a-zA-Z0-9!@#$%^&*]{8,16}$/;
		var pw2 = $('#memberPw2').val();
		var regexPw2 = /^[a-zA-Z0-9!@#$%^&*]{8,16}$/;
		var nick = $('#memberNick').val();
		var regexNick = /^[가-힣a-zA-Z0-9!@#$%^&*]{1,10}$/;

		if (!regexId.test(id) || !regexPw.test(pw) || !regexPw2.test(pw2) || !regexNick.test(nick)) {
			e.preventDefault();
			window.alert('형식이 잘못되었습니다.');
		} else if (pw != pw2) {
			e.preventDefault();
			window.alert('비빌번호가 일치하지 않습니다.');
		} else {
		}
	});
	
	
});
