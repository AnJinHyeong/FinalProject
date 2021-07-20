<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<html>
	<link rel="stylesheet" type="text/css" href="${root}/css/confirm.css">
		
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/confirm.js"></script>

	<div id ="payBorder">
<h2 id ="payTitle">결제정보입력</h2><br>
<div id = "payContent">
<form action="confirm" method="post" id = formAll onsubmit = "return confirm('결제 전, 금액을 다시 한번 확인하세요')">

<input type="hidden" name="partner_order_id" value = "펀딩 가맹점 식별번호" required>
<input type="hidden" name="partner_user_id" value = "${memberNo}"required>

		<!--  단일 품목이므로 이름은 fun_ding 포인트결제로 고정-->
	<input type="hidden" name="item_name" value = "fun_ding 포인트결제"required>
	
	<!--  단일 결제이므로 수량은 1로 고정-->
	<input type="hidden" name="quantity" value = 1>
	
	<p>현재 보유 포인트 : <strong>5000P</strong></p>
	<p>충전하실 포인트 유형을 선택해주세요 </p>
	<div >
	<input type = "radio" id = "10under" name ="radio" value = "trueUnder">	
	<label>소액 결제</label><br>
	<select id = "10underMoney" name="total_amount" required></select>
	</div>
	<input type = "radio" id = "10up"  name ="radio" value = "trueUp">	
		<label>고액 결제(10만~)</label><br>
	<input type="text" id = "10upMoney"name="total_amount" required>
	<p id = "amountResult"></p>
		<!--  면세 비율 설정, 사업주에 따라 다르게 설정하기-->
	<input type="hidden" name="tex_free_amount" value = "0" required>

<div id = "payForm" >
	<input type="submit" id = "form" value="결제하기" class = form style= 'cursor:pointer'>
	</div>
</form>
</div>
</div>

</html>   
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>