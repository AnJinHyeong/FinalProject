
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<style>
	.mainDiv{
		width:50%;
		min-height: 600px;
		padding:50px;
	}
	.pwForm{
		width: 80%;
		margin-top : 20px;
		margin:0 auto;
		border:1px groove #E4E4E4;
		padding:40px;
		border-radius:10px;
		border-color:#E4E4E4;
	
	}
		.idBtn{
		border-radius:5px;
		background:red;
		color:#fff;
		border:none;
		position:relative;
		height:50px;
		width:100%;
  		font-size:1.2em;
  		padding:0 2em;
  		cursor:pointer;
  		transition:800ms ease all;
  		outline:none;
	}
	.idBtn:hover{
		background:#fff;
		color:red;
	}
	.idBtn:before,.idBtn:after{
	  	content:'';
	  	position:absolute;
	  	top:0;
	  	right:0;
	  	height:2px;
	  	width:0;
	  	background: #1AAB8A;
	 	transition:400ms ease all;
	}
	.idBtn:after{
		right:inherit;
		top:inherit;
		left:0;
		bottom:0;
	}
	.idBtn:hover:before,.idBtn:hover:after{
		width:100%;
		transition:800ms ease all;
	}
	.titleDiv{
		padding-bottom:20px;
	}
	.titleP{
		color:#d5d5d5;
		font-size:0.7em;
	}
</style>
<div class="container-800 mainDiv">
	<div class="pwForm">
		<div class="text-left titleDiv">
			<h1>아이디 찾기</h1>
		</div>
	<form action="getId" method="post">
		<div>이메일 주소</div>
		<input type="text" name="memberEmail" required class="form-input form-underline radius-b" placeholder="가입하신 이메일 입력해주세요.">
		<br><br>
		<button type="submit" class="idBtn">아이디 찾기</button>
			
		
	
	</form>
	
	</div>
</div>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>