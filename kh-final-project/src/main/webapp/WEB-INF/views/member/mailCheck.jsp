<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%-- <jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include> --%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>

<html>
	<link rel="stylesheet" type="text/css" href="${root}/css/modal.css">
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/join.js"></script>
<br><br>
<script>

</script>
<style>
.radius-b{
		margin-top:30px;
		margin-bottom:50px;
		height:60px;
		border-radius:5px;
	}
	.sendBtn{
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
	.sendBtn:hover{
		background:#fff;
		color:red;
	}
	.sendBtn:before,.sendBtn:after{
	  	content:'';
	  	position:absolute;
	  	top:0;
	  	right:0;
	  	height:2px;
	  	width:0;
	  	background: #1AAB8A;
	 	transition:400ms ease all;
	}
	.sendBtn:after{
		right:inherit;
		top:inherit;
		left:0;
		bottom:0;
	}
	.sendBtn:hover:before,.sendBtn:hover:after{
		width:100%;
		transition:800ms ease all;
	}
</style>
<body>
	<div class = "container joinBorder modal" style="min-height:500px;">
		<div class = "row text-center modalContent">
		<div class = modalTitle>
			<h1>이메일 인증</h1>
		</div>
		
		<form action = "emailCheck" method = "post">
			<input type="text" name="email" class="form-input form-underline radius-b" placeholder="인증할 메일 입력" required>
			<input type="submit" class="sendBtn" value="인증 요청" id = "form" onclick='call_parent()'>
		</form>
		
	</div>
	</div>
</body>
<br><br>
<%-- <jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include> --%>
</html>

