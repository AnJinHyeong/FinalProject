<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>

<html>
	<link rel="stylesheet" type="text/css" href="${root}/css/join.css">
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/join.js"></script>

<body>
<section class="main-row topLine">
<div class="container">
	<a href= "<%=request.getContextPath()%>/index.jsp" >
	<img src="<%=request.getContextPath()%>/image/example.png" class = inline-block>
	</a>
</div>
		
	<div class = "container joinBorder">
		<div class = "row text-center">
			<h2>회원 가입</h2>
		</div>
		
		<form action = "join.kh" id = "form" method = "post" class="join-form">
			<div class = "row text-left">
				<label for = "memberId">아이디</label>
				<input type = "text" name="memberId" id = "memberId" required class = "form-input form-input-underline2" placeholder = "8~20자 이내의 영문 소대문자, 숫자 조합가능">
					<span class = "fail">아이디 형식이 올바르지 않습니다</span>
					<span class = "success">올바른 형식의 아이디입니다</span>
			</div>
			<div class = "row text-left">
				<label for = "memberPw">비밀번호</label>
				<input type = "password" name="memberPw" id = "memberPw" required class = "form-input form-input-underline2"
							placeholder = "8~16자 이내의 영문 소대문자, 숫자, 특수문자(!@#$%^&*)조합 가능">
							
				<input type = "password" id = "memberPw2" required class = "form-input form-input-underline2 padding-t"
							placeholder = "비밀번호 재입력">
					<div class = "fail failPw">비밀번호 형식이 올바르지 않습니다</div>
			 	   <div class = "success successPw">올바른 형식의 비밀번호입니다</div>
					<div class = "fail failPw2">비밀번호와 재입력하신 비밀번호가 다릅니다</div>
					<div class = "success successPw2">일치하는 비밀번호입니다</div>
					<div class = "fail firstPw">비밀번호를 먼저 입력해주세요</div>
			</div>
			
			<div class = "row text-left">
				<label for = "memberNick">닉네임</label>
				<input type = "text" name="memberNick" id = "memberNick" required class= "form-input form-input-underline2"
							placeholder = "한 글자 이상, 형식 제한 없음 ">
							<span class = "fail">닉네임은 최소 한 글자 이상, 최대 열 글자 까지입니다</span>
							<span class = "success">멋진 닉네임입니다.</span>
			</div>
			
				<div class = "row text-left">
				<label for = "memberEmail">이메일</label>
				<input type = "email" name="memberEmail" id = "memberEmail" required class = "form-input form-input-underline2"
							placeholder = "자주 사용하는 이메일">
			</div>
			
			<div class = "row text-left">
				<label for = "memberIntroduce">자기소개</label>
				<input type="text" id = "memberIntroduce" class= "form-input form-input-underline2">
				
			</div>
			<div class = "row text-center">
			<input type = "submit" id= "submit" style= 'cursor:pointer' value = "가입" class = "form-btn form-btn-normal ">
			</div>
		</form>
	</div>
</section>
</body>
</html>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>