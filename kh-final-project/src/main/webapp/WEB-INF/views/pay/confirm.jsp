  
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h1>결제 정보 입력</h1>

<form action="confirm" method="post">
	partner_order_id : <input type="text" name="partner_order_id" required>
	<br><br>
	partner_user_id : <input type="text" name="partner_user_id" required>
	<br><br>
		<!--  단일 품목이므로 이름은 fun_ding 포인트결제로 고정-->
	<input type="hidden" name="item_name" value = "fun_ding 포인트결제"required>
	<br><br>
	<!--  단일 결제이므로 수량은 1로 고정-->
	<input type="hidden" name="quantity" value = 1>
	<br><br>
	충전하실 포인트를 입력해주세요 : <input type="text" name="total_amount" required>
	<br><br>
	<input type="submit" value="결제하기">
</form>   