<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<script>
	$(function(){
		$(".category-btn").click(function(){
			console.log("ddddddd");
			var template = $("#categorySelected").html();
			$("#result").empty();
			$("#result").append(template);
		});
	});
</script>

<script id="categorySelected" type="text/template">
	<div>
		<p class="f24 fBold">프로젝트를 간단하게 소개해주세요.</p>
		<p class="f16">나중에 수정 가능하니 편하게 적어주세요.</p>
	</div>

	<div class="yb bottomLine">
		<textarea placeholder="프로젝트 요약을 입력해주세요." class="w100p h140" style="resize: none; padding: 20px;"></textarea>
		<p class="f12">최소 10자 이상 입력해주세요 (<span>0/50</span>)</p>
	</div>
		
	<button class="yb btn">다음</button>
</script>

<section class="main-row topLine" style="background-image: url('${root}/image/insertBackground.jpg');
									background-repeat: no-repeat;
									background-position: center;
									background-size: cover;">

<div class="section-row" style="background-color: rgba( 255, 255, 255, 0.9 );">
	
	<div class="container-800" style="padding-top: 30px;">
	
		<div class="mb60">
		
			<p class="fRed fBold f16">
			<i class="fas fa-exclamation-circle"></i>
			작성 중인 프로젝트가 있습니다.
			</p>
		
			<button class="yb btn btn-hover w100p h80">
				<img class="w80 h100p" alt="" src="">
				<div class="btn-text">ㅇㅇ의 프로젝트</div>
				<div class="btn-progress w140 h100p">
					<div class="btn-text">기획중 - 8% 완료</div>
				</div>
			</button>
			
		</div>
	
		<div>
			<p class="f24 fBold">멋진 아이디어가 있으시군요!</p>
			<p class="f24 fBold">어떤 프로젝트를 계획 중이신가요?</p>
			<p class="f16">나중에 변경 가능하니 너무 걱정마세요.</p>
		</div>
	
	
		<div class="yb mb60">
			<ul>
			
				<c:forEach var="categoryDto" items="${categoryList}">
			
					<li>
						<button class="yb btn btn-hover btn-inline w120 category-btn">${categoryDto.categoryTheme}</button>
					</li>
				
				</c:forEach>
			
			</ul>
		</div>
		
		<div id="result"></div>
	
	</div>
	
	
	
</div>

</section>
</body>
</html>