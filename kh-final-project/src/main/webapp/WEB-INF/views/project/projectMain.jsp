<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<section class="main-row topLine">
	<div class="section-project-row">
			
			<div class="project-main-div1">
				<button class="project-btn btn1 project-btn-hover">미리보기</button>
				<div style="text-decoration: none; height: 40px;">
					<button class="project-btn btn2">기획중·43% 완료</button>
				</div>
				
			</div>
			
			<div class="project-main-div2">
				<div class="project-main-img"></div>
				<div>
					<p style="font-size: 35px;"><strong>${ProjectDto.projectNo}의 프로젝트</strong></p>
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
	
	<div class="topLine project-back-color" style="height: 650px;">
		
		<div class="section-project-row" style="padding: 25px 0 200px 0;" >
			<div style="width: 100%; text-align: right;">
				<button class="project-btn btn1 project-btn-hover" style="margin: 0;">심사기준</button>
			</div>
			
			
			<div style="width: 100%; display: flex; -webkit-box-pack: justify; justify-content: space-between; padding: 20px 0;">
				<a class="project-main-link" href="projectMainDefault?projectNo=${ProjectDto.projectNo}">
					<div style="margin: 0px 0px 70px;">
						<p class="fRed fBold f16"><i class="fas fa-pen"></i></p>
					</div>
					<p>
						<strong>기본정보</strong>
						<span class="project-main-span">71% 작성완료</span>
					</p>
				</a>
				<a class="project-main-link" href="#">
					<div style="margin: 0px 0px 70px;">
						<p class="fRed fBold f16"><i class="fas fa-money-check-alt"></i></p>
					</div>
					<p>
						<strong>펀딩 계획</strong>
						<span class="project-main-span">0% 작성완료</span>
					</p>
				</a>
				<a class="project-main-link" href="projectMainGift">
					<div style="margin: 0px 0px 70px;">
						<p class="fRed fBold f16"><i class="fas fa-gift"></i></i></p>
					</div>
					<p>
						<strong>선물 구성</strong>
						<span class="project-main-span">0% 작성완료</span>
					</p>
				</a>
				<a class="project-main-link" href="#">
					<div style="margin: 0px 0px 70px;">
						<p class="fRed fBold f16"><i class="fas fa-book"></i></i></p>
					</div>
					<p>
						<strong>스토리</strong>
						<span class="project-main-span">10% 작성완료</span>
					</p>
				</a>
				<a class="project-main-link" href="#">
					<div style="margin: 0px 0px 70px;">
						<p class="fRed fBold f16"><i class="fas fa-smile"></i></i></p>
					</div>
					<p>
						<strong>창작자 정보</strong>
						<span class="project-main-span">10% 작성완료</span>
					</p>
				</a>
				<a class="project-main-link" href="#">
					<div style="margin: 0px 0px 70px;">
						<p class="fRed fBold f16"><i class="fas fa-shield-alt"></i></i></p>
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