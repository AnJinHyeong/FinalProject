<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<script>
	
	$(function(){
		
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
				}
			}
			
		});
		
		$.ajax({
			url : "${pageContext.request.contextPath}/project/data/progress",
			type : 'post',
			data : {
				"projectNo" : "${projectDto.projectNo}"
			},
			success : function(resp) {
				$("#progress").text(resp);
			}
		});
		
		
	});
	

</script>

<section class="main-row topLine">
	<div class="section-project-row">
			
			<div class="project-main-div1">
				<a href="${pageContext.request.contextPath}/projectBoard/${projectDto.projectNo}"><button class="project-btn btn1 project-btn-hover" id="projectBoard">미리보기</button></a>
				<div style="text-decoration: none; height: 40px;">
					<c:choose>
						<c:when test="${projectDto.projectState == '1'}">
							<button class="project-btn btn2">기획중·<span id="progress"></span>% 완료</button>
						</c:when>
						<c:when test="${projectDto.projectState == '2'}">
							<button class="project-btn btn2">프로젝트 심사중</button>
						</c:when>
						<c:otherwise>
							<button class="project-btn btn2">기획중·43% 완료</button>
						</c:otherwise>
					</c:choose>
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
							<li class="project-main-li"><a href="${pageContext.request.contextPath}/project/${projectDto.projectNo}/projectMain" class="main-li-a">프로젝트 기획</a></li>
							<li class="project-main-li main-li-on"><a href="${pageContext.request.contextPath}/project/${projectDto.projectNo}/projectMainApproval" class="main-li-a ">승인심사 요청</a></li>
							<li class="project-main-li"><a href="#" class="main-li-a">커뮤니티</a></li>
							<li class="project-main-li"><a href="#" class="main-li-a">후원자 관리</a></li>
						</ul>
					</c:when>
					<c:otherwise>
						<ul class="project-main-ul">
							<li class="project-main-li"><a href="${pageContext.request.contextPath}/project/${projectDto.projectNo}/projectMain" class="main-li-a">프로젝트 기획</a></li>
							<li class="project-main-li main-li-on"><a href="${pageContext.request.contextPath}/project/${projectDto.projectNo}/projectMainApproval" class="main-li-a">승인심사 요청</a></li>
							<li class="project-main-li"><a href="#" class="main-li-a project-disable">커뮤니티<i class="fas fa-lock" style="margin-left: 5px; font-size: 12px;"></i></a></li>
							<li class="project-main-li"><a href="#" class="main-li-a project-disable">후원자 관리<i class="fas fa-lock" style="margin-left: 5px; font-size: 12px;"></i></a></li>
						</ul>
					</c:otherwise>
				</c:choose>
				
			</div>
	</div>
	
	<div class="topLine project-back-color" style="height: 650px;">
		
		<div class="section-project-row">
			
			<div class="project-approval-div">
				
				<c:choose>
					<c:when test="${projectDto.projectState == '1'}">
						<form action="projectMainApproval" method="post">
							<div class="project-approval-div-d" style="text-align: center;">
								<button class="project-approval-btn"><span style="font-size: 13px;">승인심사 요청</span></button>	
								<p class="font-12" style="margin-top: 10px; color: #F86453;"><i class="fas fa-exclamation-circle"></i> 승인 심사 요청 후 요청 취소가 가능합니다.</p>
								<p class="font-12" style="margin-top: 10px; color: #F86453;">승인 심사 요청시 프로젝트 수정이 불가능 합니다.</p>
							</div>
						</form>
					</c:when>
					<c:when test="${projectDto.projectState == '2'}">
						<form action="projectMainApprovalCancel" method="post">
							<div class="project-approval-div-d" style="text-align: center;">
								<button class="project-approval-btn2"><span style="font-size: 13px;">승인심사 요청취소</span></button>	
								<p class="font-12" style="margin-top: 10px; color: #F86453;"><i class="fas fa-exclamation-circle"></i> 현재 프로젝트는 심사 요청 상태 입니다.</p>
								<p class="font-12" style="margin-top: 10px; color: #F86453;">승인 심사 요청시 프로젝트 등록,수정이 불가능 합니다.</p>
							</div>
						</form>
					</c:when>
					<c:otherwise>
						
					</c:otherwise>
				</c:choose>
				
			
				<div class="project-approval-div-d">
					<p style="color: #ea5454; font-size: 15px;"><i class="fas fa-chart-pie"></i> 승인 심사 요청</p>
					<p class="project-approval-top-p">프로젝트를 등록하기 위해서 관리자의 심사를 받아야합니다.</p>
					<p class="project-approval-i"><i class="fas fa-check-circle"></i><span class="project-approval-font-span">프로젝트 기획을 완성해주세요.</span></p>
					<p class="project-approval-i"><i class="fas fa-check-circle"></i><span class="project-approval-font-span">승인 심사는 최대 15일 이상 소요됩니다.</span></p>
					<p class="project-approval-i"><i class="fas fa-check-circle"></i><span class="project-approval-font-span">심사 기준을 준수하면 보다 빠른 프로젝트 승인이 가능합니다.</span></p>
					<p class="project-approval-i"><i class="fas fa-check-circle"></i><span class="project-approval-font-span">부적절한 프로젝트는 프로젝트 진행 중 중단될 수 있습니다.</span></p>
					<p class="project-approval-i"><i class="fas fa-check-circle"></i><span class="project-approval-font-span">프로젝트 심사 통과 후 프로젝트 시작 예정일에 프로젝트가 공개 됩니다.</span></p>
				</div>
				
			</div>
			
		</div>
		
		
	</div>

</section>



</body>
</html>