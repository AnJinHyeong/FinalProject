<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
	<link rel="stylesheet" type="text/css" href="${root}/css/yongbo.css">
	<link rel="stylesheet" type="text/css" href="${root}/css/confirm.css">
	
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<script>

	 function inputNumberFormat(obj) {
  	     obj.value = comma(uncomma(obj.value));
  	 }

  	 function comma(str) {
  	     str = String(str);
  	     return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
  	 }

  	 function uncomma(str) {
  	     str = String(str);
  	     return str.replace(/[^\d]+/g, '');
  	 }
  	 
</script>
		
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/confirm.js"></script>
	
	<section class="main-row topLine">
	
		<div class="container-1200 mt30 poRelative">
		<p class="fs34 pl20"><strong>결제 기능</strong></p>
	</div>
	
	<div class="mt30 bottomLine poRelative">
		<div class="w1200 h35" style="margin: 0 auto;">
			<ul class="project-main-ul">
				<li class="project-main-li main-li-on"><a href="#" class="main-li-a">결제 및 조회 </a></li>
			</ul>
		</div>
	</div>
	
	
<div id = "payAll">	

	<div id ="payBorder">
	<div id ="payTitle"><h2>결제 입력</h2></div>
<div id = "payContent">

<form action="confirm" method="post" id = formAll onsubmit = "return confirm('결제 전에 한번더 확인해주세요')">

	<input type="hidden" name="partner_order_id" value = "펀딩 가맹점 식별번호" required>
	<input type="hidden" name="partner_user_id" value = "${memberNo}"required>

		<!--  단일 품목이므로 이름은 fun_ding 포인트결제로 고정-->
	<input type="hidden" name="item_name" value = "fun_ding 포인트결제"required>
	
	<!--  단일 결제이므로 수량은 1로 고정-->
	<input type="hidden" name="quantity" value = 1>
	
	<p class = moneyText><strong></strong></p>
	<p class = moneyText>충전하실 포인트 유형을 선택해주세요 </p>
	<div class = radioBorder>
	<input type = "radio" id = "10under" name ="radio" value = "trueUnder">	
	<label class = moneyText>소액 결제</label>
	<select id = "10underMoney" name="total_amount"></select>
	</div>
	<div class = radioBorder>
	<input type = "radio" id = "10up"  name ="radio" value = "trueUp">	
		<label class = moneyText>고액 결제(10만~)</label>
	<input type="text" id = "10upMoney" name="total_amount" >
	<p id = "error"></p>
		</div>
		<!--  면세 비율 설정, 사업주에 따라 다르게 설정하기-->
	<input type="hidden" name="tex_free_amount" value = "0" required>
	
	<div id = "payForm" >
	<input type="submit" name = "form" id = "form" value="결제하기" class = form style= 'cursor:pointer' onsubmit="return false">
	</div>
	
</form>

</div>
</div>
</div>

<div id = "nomalAll" style="margin-bottom: 60px;">	
<br>
<div class = nomalBorder> 
	<span id ="nomalTitle">결제 조회</span>
	<button id = "nomalButton" onclick="location.href='../pay/history'" >조회</button>
</div>
</div>
</section>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>