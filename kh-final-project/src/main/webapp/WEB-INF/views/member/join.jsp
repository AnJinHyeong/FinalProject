<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>

<html>
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
	<link rel="stylesheet" type="text/css" href="${root}/css/join.css">
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/join.js"></script>
<br><br>
<style>
.fas fa-envelope{
 color : black;
}
	.mainDiv{
		width:50%;
		min-height: 720px;
		padding:50px;
	}
	
.joinForm{
padding: 32px;
    border-radius: 5px;
    border: 2px solid rgb(228, 228, 228);
		width: 70%;
		margin-top : 20px;
		margin:0 auto;
		border-color:#E4E4E4;
	}
.radius-b{
    border: 1px solid rgb(230, 230, 230);
		height:50px;
		border-radius:4px;
	}
	.joinBtn{
		border-radius:5px;
		background: black;
		color:#fff;
		border:none;
		position:relative;
		height:50px;
		width:100%;
  		font-size:1.6em;
  		padding:0 2em;
  		cursor:pointer;
  		transition:800ms ease all;
  		outline:none;
	}
	.joinBtn:hover{
		background:#fff;
		color:red;
	}
	.joinBtn:before,.joinBtn:after{
	  	content:'';
	  	position:absolute;
	  	top:0;
	  	right:0;
	  	height:2px;
	  	width:0;
	  	background: #1AAB8A;
	 	transition:400ms ease all;
	}
	.joinBtn:after{
		right:inherit;
		top:inherit;
		left:0;
		bottom:0;
	}
	.joinBtn:hover:before,.joinBtn:hover:after{
		width:100%;
		transition:800ms ease all;
	}
</style>
<body>
	<div class = "container-800 mainDiv">
		<div class="joinForm">
		<div class = "row text-center">
			<h2>회원 가입</h2>
		</div>
		
		
		<form action = "memberInsert" id = "form" method = "post" class="join-form" >
			<div class = "row text-left">
				<label for = "memberId">아이디</label>
				<input type = "text" name="memberId" id = "memberId" required class = "form-input form-underline radius-b" placeholder = "8~20자 이내의 영문 소대문자, 숫자 조합가능">
				<div id = "idResult"></div>
				<div id = "checkId"></div>
				
			</div>
			<div class = "row text-left">
				<label for = "memberPw">비밀번호</label>
				<input type = "password" name="memberPw" id = "memberPw" required class = "form-input form-underline radius-b"
							placeholder = "8~16 영문 소대문자, 숫자, 특수문자(!@#$%^&*)조합 가능">

							
				<input type = "password" id = "memberPw2" required class = "form-input form-underline radius-b"
							placeholder = "비밀번호 재입력">
					<div id = "pwResult"></div>
					<div id = "pwResult2"></div>
										<div id = "pwResult3"></div>
			</div>
			
			<div class = "row text-left">
				<label for = "memberNick">닉네임</label>
				<input type = "text" name="memberNick" id = "memberNick" required class= "form-input form-underline radius-b"
							placeholder = "한 글자 이상 최대 열 글자, 단모음과 단자음 사용불가 ">
									<div id = "nickResult"></div>
			</div>

			
			<div class = "row text-left">
			<div>	<label for = "memberEmail">이메일</label></div>
				<input type = "email" name="memberEmail" id = "memberEmail" required class = "form-input form-underline radius-b"
							value = "${param.email}" placeholder = "인증번호를 받기 위한 메일 입력">
							<button id = "emailSend" disabled style="cursor: pointer;"><i class="fas fa-envelope"></i></button>
								<input type="hidden" name="email" value="${param.email}">
											
								<div id = "checkEmail"></div>

			</div>
			<div class = "row text-left">
				<label for = "authKey">인증번호</label>
				<input type = "text" name="no" id = "no" required disabled class = "form-input form-underline radius-b"
							placeholder = "이메일을 먼저 입력해주세요">
							<span id = emailCheckResult></span>
			</div> 
			
<!-- 			<div class = "row text-left">
				<label for = "memberIntroduce">자기소개</label>
				<input type="text" name = "memberIntroduce" class= "form-input form-underline radius-b"  placeholder = "(선택) 간단한 자기소개를 입력해주세요">
				
			</div> -->
			<div class = "row text-center">
			<input type = "submit" id= "submit" style= 'cursor:pointer' value = "가입" class = "joinBtn">
			</div>

		</form>
		</div>
		</div>

</body>
<br><br>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
</html>

