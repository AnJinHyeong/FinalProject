<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<style>
	
	.loginForm{
		width: 80%;
		margin-top : 20px;
		margin:0 auto;
		border:1px groove #E4E4E4;
		padding:40px;
		border-radius:10px;
		border-color:#E4E4E4;
	
	}
	.hrClass{
		size : 1px;
		
	}

	.loginBtn{
		border-radius:5px;
		background:red;
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
	.loginBtn:hover{
		background:#fff;
		color:red;
	}
	.loginBtn:before,.loginBtn:after{
	  	content:'';
	  	position:absolute;
	  	top:0;
	  	right:0;
	  	height:2px;
	  	width:0;
	  	background: #1AAB8A;
	 	transition:400ms ease all;
	}
	.loginBtn:after{
		right:inherit;
		top:inherit;
		left:0;
		bottom:0;
	}
	.loginBtn:hover:before,.loginBtn:hover:after{
		width:100%;
		transition:800ms ease all;
	}
	.mainDiv{
		width:50%;
		min-height: 600px;
		padding:50px;
	}
	.subDiv{
		padding: 20px;

	}
	.radius-b{
		height:60px;
		border-radius:5px;
	}
	.titleDiv{
		padding-bottom:20px;
	}
	a:hover{
		color:green;
	}
	

</style>
<hr class="hrClass">
<div class="container-800 mainDiv">
	<div class="loginForm">
		<div class="text-left titleDiv">
			<h1>로그인</h1>
		</div>

		<form action="login" method="post">
			
			<div class="row text-left">
				<div class="row text-left">
					<input type="text" name="memberId" required class="form-input form-underline radius-b" placeholder="아이디 입력">
				
				
				</div>
				<div>
					<input type="password" name="memberPw" required class="form-input form-underline radius-b" placeholder="비밀번호 입력">
				
				</div>
				<div>
					<c:if test="${param.error != null}">
					<div class="row">
						<h5 class="error">정보가 일치하지 않습니다</h5>
					</div>
					</c:if>
				
				</div>
			
			</div>
			<button type="submit" class="loginBtn">로그인</button>
			
			<div class="row">
			
				<div class="text-center subDiv">
					<span>아직 Fun_ding 계정이 없으신가요? <br>	<a href="${pageContext.request.contextPath}/member/join">가입하기</a></span>
					
				</div>
				<hr>
				<div class="text-center subDiv">
					<div><a href="#">아이디를 잊으셨나요?</a></div>
					
					<div><a href="#">비밀번호를 잊으셨나요?</a></div>
				</div>
			
			</div>
		</form>
		
	</div>
	
</div>



<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>