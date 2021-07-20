<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<script>
	
	//비동기 작업이 완료되면 calculationFlag를 1씩 증가
	var calculationFlag = 0;
	function calculateTotalPercent(){
		//calculation code
		if($("#projectDefault").text() == 100) var pd = 1;
		else var pd = 0;
		if($("#projectFunding").text() == 100) var pf = 1;
		else var pf = 0;
		if($("#projectGiftItem").text() == 100) var pgi = 1;
		else var pgi = 0;
		if($("#projectStory").text() == 100) var ps = 1;
		else var ps = 0;
		if($("#projectMember").text() == 100) var pm = 1;
		else var pm = 0;
		
		$("#total-project").text(20*(pd+pf+pgi+ps+pm));
	}
	
	$(function(){
		
		
		
		
		$.ajax({
			url :"${pageContext.request.contextPath}/project/data/${projectDto.projectNo}/getProject",
			type: "post",
			success : function(resp){
				//기본 정보 진행률
				var categoryNo;
				var projectTitle;
				var projectSummary;
				
				if(resp.categoryNo != 0) categoryNo = 1;
				else categoryNo = 0;
				if(resp.projectTitle == null || resp.projectTitle == "") projectTitle = 0;
				else projectTitle = 1; 
				if(resp.projectSummary == null || resp.projectSummary == "") projectSummary = 0;
				else projectSummary = 1; 
				
				//페이지 로딩 시 프로젝트 이미지가 있으면 화면에 송출
				$.ajax({
					url :"${pageContext.request.contextPath}/image/project/confirm/${projectDto.projectNo}",
					type: "post",
					success : function(resp){
						if(resp == 1){
							$.ajax({
								url :"${pageContext.request.contextPath}/image/project/getByProjectNo/${projectDto.projectNo}",
								type: "get",
								processData : false,
								contentType : false,
								success : function(resp){
									var url = "${pageContext.request.contextPath}/image/project/projectMainDownload/"+resp.imageNo;
									document.getElementById("projectMainImage").style.backgroundImage = "url("+url+")";
								}
								
							});	
							
							$("#projectDefault").text(25*(categoryNo+projectTitle+projectSummary+1));
							
						}
						else{
							
							$("#projectDefault").text(25*(categoryNo+projectTitle+projectSummary));
						}
						calculationFlag ++;
						if(calculationFlag == 5){
							setTimeout(calculateTotalPercent, 10);
						}
						
					}
					
				});
				
				
				
				//펀딩 정보 진행률
				var projectTargetAmount;
				var projectStartDate;
				var projectEndDate;
				
				if(resp.projectTargetAmount == 0 || resp.projectTargetAmount == "") projectTargetAmount = 0;
				else projectTargetAmount = 1;
				if(resp.projectStartDate == null || resp.projectStartDate == "") projectStartDate = 0;
				else projectStartDate = 1; 
				if(resp.projectEndDate == null || resp.projectEndDate == "") projectEndDate = 0;
				else projectEndDate = 1; 
				$("#projectFunding").text(33*(projectTargetAmount+projectStartDate+projectEndDate)+1);
				
				calculationFlag ++;
				if(calculationFlag == 5){
					setTimeout(calculateTotalPercent, 10);
				}
				
						
				//스토리 진행률
				var projectContent;
				
				if(resp.projectContent == null || resp.projectContent == ""){
					$("#projectStory").text(0);;
				}
				else {
					$("#projectStory").text(100);
				}
				calculationFlag ++;
				if(calculationFlag == 5){
					setTimeout(calculateTotalPercent, 10);
				}
				
				//창작자 정보
				var memberInfoNick;
				var memberInfoContent;
				
				if(resp.memberInfoNick == null || resp.memberInfoNick == "") memberInfoNick = 0;
				else memberInfoNick = 1;
				if(resp.memberInfoContent == null || resp.memberInfoContent == "") memberInfoContent = 0;
				else memberInfoContent = 1; 
				
				$("#projectMember").text(33*(memberInfoNick+memberInfoContent+1)+1);
				
				calculationFlag ++;
				if(calculationFlag == 5){
					setTimeout(calculateTotalPercent, 10);
				}
				
			}
			
		});
		
		
		$.ajax({
			url :"${pageContext.request.contextPath}/project/data/${projectDto.projectNo}/getItem",
			type: "post",
			success : function(resp){
				if(resp.length > 0 ){//아이템 o
					$("#projectGiftItem").text(50);
				
					$.ajax({
						url :"${pageContext.request.contextPath}/project/data/${projectDto.projectNo}/getGift",
						type: "Post",
						success : function(resp){
							if(resp.length > 0 ){ //선물 o
								$("#projectGiftItem").text(100);
								
							}
							else{
								$("#projectGiftItem").text(50);
							}
							
						}
					
					});	
				
				}
				else{//아이템 x
					$("#projectGiftItem").text(0);
				}
				calculationFlag ++;
				if(calculationFlag == 5){
					setTimeout(calculateTotalPercent, 10);
				}
			}
			
		});
		
	});
	
	
</script>

<section class="main-row topLine">
	<div class="section-project-row">
			
			<div class="project-main-div1">
				<button class="project-btn btn1 project-btn-hover">미리보기</button>
				<div style="text-decoration: none; height: 40px;">
					<button class="project-btn btn2">기획중·<span id="total-project">0</span>% 완료</button>
				</div>
				
			</div>
			
			<div class="project-main-div2">
				<div class="project-main-img" id="projectMainImage"></div>
				<div>
					<c:choose>
						<c:when test="${projectDto.projectTitle != null}">
							<p style="font-size: 35px;"><strong>${projectDto.projectTitle}</strong></p>
						</c:when>
						<c:otherwise>
							<p style="font-size: 35px;"><strong>프로젝트의 이름을 작성해주세요.</strong></p>
						</c:otherwise>
					</c:choose>
					
						<p style="font-size: 14px; line-height: 24px; letter-spacing: -0.015em; color: rgb(109, 109, 109);">
							<c:if test="${categoryDto2.categoryTheme != null}">
							${categoryDto2.categoryTheme} • 
							</c:if>
							${categoryDto.categoryTheme}
						<p>
				</div>
			</div>
		
			<div style="overflow-x: hidden; padding: 0px;">
				<c:choose>
					<c:when test="${projectDto.projectState == '3' || projectDto.projectState == 'X'}">
						<ul class="project-main-ul">
							<li class="project-main-li main-li-on"><a href="${pageContext.request.contextPath}/project/${projectDto.projectNo}/projectMain" class="main-li-a">프로젝트 기획</a></li>
							<li class="project-main-li"><a href="${pageContext.request.contextPath}/project/${projectDto.projectNo}/projectMainApproval" class="main-li-a ">승인심사 요청</a></li>
							<li class="project-main-li"><a href="#" class="main-li-a">커뮤니티</a></li>
							<li class="project-main-li"><a href="#" class="main-li-a">후원자 관리</a></li>
						</ul>
					</c:when>
					<c:otherwise>
						<ul class="project-main-ul">
							<li class="project-main-li main-li-on"><a href="${pageContext.request.contextPath}/project/${projectDto.projectNo}/projectMain" class="main-li-a">프로젝트 기획</a></li>
							<li class="project-main-li"><a href="${pageContext.request.contextPath}/project/${projectDto.projectNo}/projectMainApproval" class="main-li-a">승인심사 요청</a></li>
							<li class="project-main-li"><a href="#" class="main-li-a project-disable">커뮤니티<i class="fas fa-lock" style="margin-left: 5px; font-size: 12px;"></i></a></li>
							<li class="project-main-li"><a href="#" class="main-li-a project-disable">후원자 관리<i class="fas fa-lock" style="margin-left: 5px; font-size: 12px;"></i></a></li>
						</ul>
					</c:otherwise>
				</c:choose>
				
			</div>
	</div>
	
	<div class="topLine project-back-color" style="height: 650px;">
		
		<div class="section-project-row" style="padding: 25px 0 200px 0;" >
			<div style="width: 100%; text-align: right;">
				<button class="project-btn btn1 project-btn-hover" style="margin: 0;">심사기준</button>
			</div>
			
			
			<div style="width: 100%; display: flex; -webkit-box-pack: justify; justify-content: space-between; padding: 20px 0;">
				<a class="project-main-link" href="${root}/project/${projectNo}/projectMainDefault">
					<div style="margin: 0px 0px 70px;">
						<p class="fRed fBold f16"><i class="fas fa-pen"></i></p>
					</div>
					<p>
						<strong>기본정보</strong>
						<span class="project-main-span"><span id="projectDefault">0</span>% 작성완료</span>
					</p>
				</a>
				<a class="project-main-link" href="${root}/project/${projectNo}/projectMainFunding">
					<div style="margin: 0px 0px 70px;">
						<p class="fRed fBold f16"><i class="fas fa-money-check-alt"></i></p>
					</div>
					<p>
						<strong>펀딩 계획</strong>
						<span class="project-main-span"><span id="projectFunding">0</span>% 작성완료</span>
					</p>
				</a>
				<a class="project-main-link" href="${root}/project/${projectNo}/projectMainGift">
					<div style="margin: 0px 0px 70px;">
						<p class="fRed fBold f16"><i class="fas fa-gift"></i></i></p>
					</div>
					<p>
						<strong>선물 구성</strong>
						<span class="project-main-span"><span id="projectGiftItem">0</span>% 작성완료</span>
					</p>
				</a>
				<a class="project-main-link" href="${root}/project/${projectNo}/projectMainStory">
					<div style="margin: 0px 0px 70px;">
						<p class="fRed fBold f16"><i class="fas fa-book"></i></i></p>
					</div>
					<p>
						<strong>스토리</strong>
						<span class="project-main-span"><span id="projectStory">0</span>% 작성완료</span>
					</p>
				</a>
				<a class="project-main-link" href="${pageContext.request.contextPath}/project/${projectNo}/projectMainMember">
					<div style="margin: 0px 0px 70px;">
						<p class="fRed fBold f16"><i class="fas fa-smile"></i></i></p>
					</div>
					<p>
						<strong>창작자 정보</strong>
						<span class="project-main-span"><span id="projectMember">0</span>% 작성완료</span>
					</p>
				</a>
			</div>
			
		</div>
		
		
	</div>

</section>



</body>
</html>
