//join.jsp(회원가입js)

//이메일 인증번호 변수선언
var  code;
//var idComplete;
//var pwComplete;
//var pw2Complete;
//var nickComplete;
//var EmailComplete;;
//var noComplete;

// 아이디입력
$(function () {
	
	$('#memberId').blur('input', function (e) {
		var id = $(this).val();
		var regexId = /^[a-zA-Z0-9]{8,20}$/;
		
		//아이디 중복확인
		$.ajax({
			url: "../check/id",
			data:{
				memberId : id
			},
//	        async : false,
			type : "get",
			success:function(resp){
				if (resp==="N"){
					$('#checkId').css("color", "red");
						$("#checkId").text("이미 사용중인 아이디입니다");
						e.preventDefault();
					}
				
				else{
					$("#checkId").css("color", "black");
					$("#checkId").text('');
					idComplete = 1;
					
					//아이디 형식체크
					if (regexId.test(id)) {
						$('#idResult').css("color", "black");
						$('#idResult').text('');
						idComplete = 1;
					}			
					 else {
						$('#idResult').css("color", "red");
						$('#idResult').text('잘못된 형식의 아이디 입니다');
						e.preventDefault();
									
				}
				}
			}
			});
		});
		
	
	// 비밀번호 입력
	$('#memberPw').blur('input', function (e) {
		var pw = $(this).val();
		var regexPw = /^[a-zA-Z0-9!@#$%^&*]{8,16}$/;
		if (regexPw.test(pw)||(pw='')) {
			$('#pwResult').text('');
			pwComplete = 1;
		}else{
			$('#pwResult').css("color", "red")
			$('#pwResult').text('비밀번호 형식이 올바르지 않습니다');
			e.preventDefault();
		}
	});
	
// 비밀번호 재입력
	$('#memberPw2').blur('input', function (e) {
		var pw = $('#memberPw').val();
		var pw2 = $(this).val();
		if (pw == pw2) {
			$('#pwResult2').text('');
			pw2Complete = 1;
		} else {
			$('#pwResult2').css("color", "red")
			$('#pwResult2').text('비밀번호가 일치하지 않습니다');
			e.preventDefault();
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
	$('#memberNick').blur('input', function (e) {
		var nick = $(this).val();
		var regexNick = /^[가-힣a-zA-Z0-9!@#$%^&*]{1,10}$/;
		if (regexNick.test(nick)) {
			$('#nickResult').text('');
			nickComplete = 1;
			} 
		else {
			$('#nickResult')	.text('닉네임은 최소 한 글자 이상, 최대 열 글자 까지입니다');
			$('#nickResult').css("color", "red");
			e.preventDefault();
		}
	});

	
/*	('#emailSend').click(function (e) {  
        e.preventDefault();  
        var url = "../member/emailCheck";  
        window.open(url, "_blank");  
    });  */
	
	$('#memberEmail').blur('input', function (e) {
		
		var email = $(this).val();
		var emailRegExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/;
		
		//이메일 중복확인
		$.ajax({
			url: "../check/email",
			data:{
				memberEmail : email
			},
//	        async : false,
			type : "get",
			success:function(resp){
				if (resp==="NoEmail"){
					$('#checkEmail').css("color", "red");
						$("#checkEmail").text("이미 사용중인 이메일입니다")	;
						$("#emailSend").attr("disabled",true);
						e.preventDefault();
					}
				//이메일 형식체크
				else if (!emailRegExp.test(email)) {
					$('#checkEmail').css("color", "red");
					$("#checkEmail").text("잘못된 형식의 이메일입니다")	;
					$("#emailSend").attr("disabled",true);
					e.preventDefault();
					}			
					 else if(email==''){
						$("#checkEmail").css("color", "red")
						$("#checkEmail").text('이메일을 입력해주세요');	
						$("#emailSend").attr("disabled",true);
						e.preventDefault();
					 }
						else{
							$("#emailSend").css("cursor","pointer");
							$('.fas fa-envelope:before').css("content", "\f0e00");
							$("#emailSend").attr("disabled",false);
							$("#checkEmail").css("color", "black");
							$("#checkEmail").text('');
							emailComplete = 1;
				}

			}

			    ,error:function(request,status,error){
			        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			        }

			
			});
		});
		
	$("#emailSend").click(function(){
		 var email = $("#memberEmail").val();        // 입력한 이메일
		 window.alert("인증번호를 보냈습니다");
		 $("#no").attr("disabled",false);
		 $("#no").attr("placeholder","인증번호를 입력해주세요");
 
		 $.ajax({
			 type: "get",
			 url: "../check/emailKey?email=" + email,
		        success:function(data){
		            code = data;
		        }               
		 });
	});
	
	$("#no").blur(function(e){
	    
	    var inputCode = $("#no").val();        // 입력코드    
	    var emailCheckResult = $("#emailCheckResult");    // 비교 결과     
	    
	    if(inputCode == code){                            // 일치할 경우
			$("#emailCheckResult").css("color", "black");
	    	$("#emailCheckResult").text("인증번호가 일치합니다");  
			 $("#no").attr("disabled",false);
				noComplete = 1;
	    } else {                                            // 일치하지 않을 경우
			$("#emailCheckResult").css("color", "red");
	    	$("#emailCheckResult").text("인증번호를 다시 확인해주세요");
			e.preventDefault();
			$("#no").val('');
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
		var email =  $('#memberEmail').val();
		var regexEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/;
		var no = $('#no').val();

		if (!regexId.test(id)||!regexPw.test(pw)||!regexPw2.test(pw2)||!regexNick.test(nick)||!regexEmail.test(email)||no=="") {
			window.alert('입력이 잘못되었습니다');
			e.preventDefault();
		} 
		else if (pw != pw2) {
			window.alert('비빌번호가 일치하지 않습니다');
			e.preventDefault();
		} 
		
		else {
			 window.alert("가입이 완료되었습니다. 다시 로그인 해주시길 바랍니다.");
		}
	});
	
});

