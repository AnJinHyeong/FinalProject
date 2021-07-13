<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>

<jsp:include page="/WEB-INF/views/project/projectHeader.jsp">
	<jsp:param value="${root}/project/projectMainFunding" name="division"/>
</jsp:include>

<section class="main-row topLine">
	
	<div class="project-back-color" style="min-height: 1050px;">
		
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
								<p class="project-funding-p">종료일까지 목표금액을 달성하지 못하면 후원자 결제가 진행되지 않습니다.</p>
								<p class="project-funding-p">종료 전 후원 취소를 대비해 10% 이상 초과 달성을 목표로 해주세요.</p>
								<p class="project-funding-p">제작비, 선물 배송비, 인건비, 예비 비용 등을 함께 고려해주세요.</p>
							</div>
						</div>
					</dl>
					<div class="projcet-insert-div2">
						<div style="width: 630px;">
							<p class="project-insert-p">목표 금액</p>
							<div class="project-funding-money-div">
								<span class="project-funding-money-span">
									<input type="text" class="projcet-insert-input" name="projectTargetAmount" style="text-align: inherit; border: none;"><p style="padding-left: 3px;">원</p>
								</span>
							</div>
						</div>
					</div>
				</div>
				
				<hr>
				
				<div class="project-insert-div" style="height: 320px;">
					<dl class="project-insert-dl">
						<dt class="project-insert-dt">
							펀딩 일정 <span class="project-insert-font">*</span>
						</dt> 
						<dd class="project-insert-dd">
							<p>설정한 일시가 되면 펀딩이 자동 시작됩니다. 펀딩 시작 전까지 날짜를 변경할 수 있고, 즉시 펀딩을 시작할 수도 있습니다.</p>
						</dd>
					</dl>
					<div class="projcet-insert-div2">
						<div style="width: 630px;">
							<ul style="margin: 0; padding: 0;">
								<li class="project-funding-li">
									<div style="width: 630px;">
										<p class="project-insert-p">시작일</p>
										<div class="projcet-insert-div2">
											<input type="date" class="projcet-insert-input" name="projectStartDate">
										</div>
									</div>
								</li>
								<li class="project-funding-li">
									<div style="width: 630px;">
										<p class="project-insert-p">종료일</p>
										<div class="projcet-insert-div2">
											<input type="date" class="projcet-insert-input" name="projectEndDate">
										</div>
									</div>
								</li>
								<li class="project-funding-li">
									<div style="width: 630px;">
										<p class="project-insert-p">후원자 결제 종료</p>
									</div>
								</li>
								<li class="project-funding-li">
									<div style="width: 630px;">
										<p class="project-insert-p">정산일</p>
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