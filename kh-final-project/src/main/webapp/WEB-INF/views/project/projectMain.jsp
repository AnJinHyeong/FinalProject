<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<section class="main-row topLine">
	<div class="section-project-row">
			
			<div class="project-main-div1">
				<button class="project-btn btn1">미리보기</button>
				<div style="text-decoration: none; height: 40px;">
					<button class="project-btn btn2">기획중·43% 완료</button>
				</div>
				
			</div>
			
			<div class="project-main-div2">
				<div class="project-main-img"></div>
				<div>
					<p style="font-size: 35px;"><strong>OO의 프로젝트</strong></p>
					<p style="font-size: 14px; line-height: 24px; letter-spacing: -0.015em; color: rgb(109, 109, 109);">카테고리<p>
				</div>
			</div>
		
			<div style="overflow-x: hidden; padding: 0px;">
				<ul class="project-main-ul">
					<li class="project-main-li main-li-on"><a href="#" class="main-li-a">프로젝트 기획</a></li>
					<li class="project-main-li"><a href="#" class="main-li-a">승인심사 요청</a></li>
					<li class="project-main-li"><a href="#" class="main-li-a">대시보드</a></li>
					<li class="project-main-li"><a href="#" class="main-li-a">서베이</a></li>
					<li class="project-main-li"><a href="#" class="main-li-a">후원자 관리</a></li>
					<li class="project-main-li"><a href="#" class="main-li-a">모금액 명세</a></li>
				</ul>
			</div>
	</div>
	
	<div class="topLine project-back-color" style="height: 620px;">
		
		<div class="section-row" style="padding: 25px 0 200px 0;" >
			<div style="width: 100%; text-align: right;">
				<button class="project-btn btn1" style="margin: 0;">심사기준</button>
			</div>
			
			
			<div style="width: 100%; display: flex; -webkit-box-pack: justify; justify-content: space-between; padding: 20px 0;">
				<a class="project-main-link" href="projectMainDefault">
					<div style="margin: 0px 0px 70px;">
						<img src="${pageContext.request.contextPath}/image/pen.svg" width="20" height="20">
					</div>
					<p>
						<strong>기본정보</strong>
						<span class="project-main-span">71% 작성완료</span>
					</p>
				</a>
				<a class="project-main-link" href="#">
					<div style="margin: 0px 0px 70px;">
						<img src="${pageContext.request.contextPath}/image/money.svg" width="20" height="20">
					</div>
					<p>
						<strong>펀딩 계획</strong>
						<span class="project-main-span">0% 작성완료</span>
					</p>
				</a>
				<a class="project-main-link" href="#">
					<div style="margin: 0px 0px 70px;">
						<img src="${pageContext.request.contextPath}/image/gift.svg" width="20" height="20">
					</div>
					<p>
						<strong>선물 구성</strong>
						<span class="project-main-span">0% 작성완료</span>
					</p>
				</a>
				<a class="project-main-link" href="#">
					<div style="margin: 0px 0px 70px;">
						<img src="${pageContext.request.contextPath}/image/book.svg" width="20" height="20">
					</div>
					<p>
						<strong>스토리</strong>
						<span class="project-main-span">10% 작성완료</span>
					</p>
				</a>
				<a class="project-main-link" href="#">
					<div style="margin: 0px 0px 70px;">
						<img src="${pageContext.request.contextPath}/image/originator.svg" width="20" height="20">
					</div>
					<p>
						<strong>창작자 정보</strong>
						<span class="project-main-span">10% 작성완료</span>
					</p>
				</a>
				<a class="project-main-link" href="#">
					<div style="margin: 0px 0px 70px;">
						<img src="${pageContext.request.contextPath}/image/security.svg" width="20" height="20">
					</div>
					<p>
						<strong>신뢰와 안전</strong>
						<span class="project-main-span">20% 작성완료</span>
					</p>
				</a>
			</div>
			
		</div>
		
		
	</div>

</section>



</body>
</html>