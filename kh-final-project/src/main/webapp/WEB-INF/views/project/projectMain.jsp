<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<section class="main-row topLine">
	<div class="section-project-row">
			
			<div style="height: 90px; text-align: right; padding: 25px 0; display: flex; -webkit-box-pack: end; justify-content: flex-end;">
				<button class="project-btn btn1">미리보기</button>
				<div style="text-decoration: none; height: 40px;">
					<button class="project-btn btn2">기획중·43% 완료</button>
				</div>
				
			</div>
			
			<div style="height: 180px; text-align: left; padding: 10px 10px; display: flex; -webkit-box-pack: end; margin: 20px 0;  ">
				<img src="${pageContext.request.contextPath}/image/insertBackground.jpg" style="width: 250px; height: 160px;">
				<div>
					<p style="font-size: 35px; padding: 20px 20px 0 20px;">OO의 프로젝트</p>
					<br>
					<p style="font-size: 18px; padding: 0 20px; color: #c8c8c8;">카테고리<p>
				</div>
			</div>
		
			<div style="height: 60px;">
				<ul class="project-main-ul">
					<li class="project-main-li">프로젝트 기획</li>
					<li class="project-main-li">승인심사 요청</li>
					<li class="project-main-li">대시보드</li>
					<li class="project-main-li">서베이</li>
					<li class="project-main-li">후원자 관리</li>
					<li class="project-main-li">모금액 명세</li>
				</ul>
			</div>
	</div>
	
	<div class="topLine" style="background-color: rgb(248,248,248); height: 580px;">
		
		<div class="section-row" style="background-color: rgb(248,248,248); padding: 25px 0 200px 0;" >
			<div style="width: 100%; text-align: right;">
				<button class="project-btn btn1">심사기준</button>
			</div>
			
			<div style="width: 100%; display: flex; -webkit-box-pack: justify; justify-content: space-between; padding: 40px 0;">
				<a class="project-main-link">1</a>
				<a class="project-main-link">2</a>
				<a class="project-main-link">3</a>
				<a class="project-main-link">4</a>
				<a class="project-main-link">5</a>
				<a class="project-main-link">6</a>
			</div>
			
			
		</div>
		
		
	</div>

</section>



</body>
</html>