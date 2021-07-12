<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<jsp:include page="/WEB-INF/views/template/projectHeader.jsp"></jsp:include>

		<div class="project-main-header3 bottomLine">
			<div style="width: 1200px; margin: 0 auto; height: 35px;">
				<ul class="project-main-ul">
					<li class="project-main-li"><a href="${pageContext.request.contextPath}/project/projectMainDefault" class="main-li-a">기본정보</a></li>
					<li class="project-main-li main-li-on"><a href="${pageContext.request.contextPath}/project/projectMainFunding" class="main-li-a">펀딩 계획</a></li>
					<li class="project-main-li"><a href="#" class="main-li-a">선물 구성</a></li>
					<li class="project-main-li"><a href="#" class="main-li-a">스토리</a></li>
					<li class="project-main-li"><a href="#" class="main-li-a">창작자 정보</a></li>
					<li class="project-main-li"><a href="#" class="main-li-a">신뢰와 안전</a></li>
				</ul>
			</div>
		</div>
		
	</header>

<section class="main-row topLine">
	
	<div class="project-back-color" style="height: 1900px;">
		
		<div class="section-row" style=" padding-top: 10px;">
			
			<form action="?" method="post">
			
				<div class="project-insert-div" style="height: 300px;">
					<dl class="project-insert-dl">
						<dt class="project-insert-dt">
							목표 금액 <span class="project-insert-font">*</span>
						</dt> 
						<dd class="project-insert-dd">
							<p>프로젝트를 완수하기 위해 필요한 금액을 설정해주세요.</p>
						</dd>
						<div class="project-insert-funding-div">
							<div style="color: rgb(248, 100, 83); margin-bottom: 10px;">
								<i class="fas fa-exclamation-circle"></i> 목표 금액 설정 시 꼭 알아두세요!
							</div>
							<div>
								<p style="padding-left: 14px; margin-bottom: 5px;">종료일까지 목표금액을 달성하지 못하면 후원자 결제가 진행되지 않습니다.</p>
								<p style="padding-left: 14px; margin-bottom: 5px;">종료 전 후원 취소를 대비해 10% 이상 초과 달성을 목표로 해주세요.</p>
								<p style="padding-left: 14px; margin-bottom: 5px;">제작비, 선물 배송비, 인건비, 예비 비용 등을 함께 고려해주세요.</p>
							</div>
						</div>
					</dl>
					<div class="projcet-insert-div2">
						<div>
							<p class="project-insert-p">목표 금액</p>
							<input type="text" class="projcet-insert-input">
						</div>
					</div>
				</div>
				
				<hr>
				
				<div class="project-insert-div" style="height: 500px;">
					<dl class="project-insert-dl">
						<dt class="project-insert-dt">
							펀딩 일정 <span class="project-insert-font">*</span>
						</dt> 
						<dd class="project-insert-dd">
							<p>설정한 일시가 되면 펀딩이 자동 시작됩니다. 펀딩 시작 전까지 날짜를 변경할 수 있고, 즉시 펀딩을 시작할 수도 있습니다.</p>
						</dd>
					</dl>
					<div class="projcet-insert-div2">
						<div>
							<ul style="margin: 0; padding: 0;">
								<li style="padding: 0px 0px 38px 18px;color: rgb(158, 158, 158);" class="lili">
									<div style="width: 630px;">
										<p class="project-insert-p">시작일</p>
										<div class="projcet-insert-div2">
											<input type="date" class="project-insert-input">
										</div>
									</div>
								</li>
								<li style="padding: 0px 0px 38px 18px;color: rgb(158, 158, 158);" class="lili">
									<div>
										1
									</div>
								</li>
								<li style="padding: 0px 0px 38px 18px;color: rgb(158, 158, 158);" class="lili">
									<div>
										1
									</div>
								</li>
								<li style="padding: 0px 0px 38px 18px;color: rgb(158, 158, 158);" class="lili">
									<div> 
										1
									</div>
								</li>
								
							</ul>
						</div>
					</div>
				</div>
				
				<div class="project-insert-div3">
					<input class="project-btn btn3 project-btn-hover" type="submit" value="저장">
				</div>
			
			</form>
			
		</div>
		
		
		
	</div>

</section>



</body>
</html>