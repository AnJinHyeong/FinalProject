
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="isProject" value="${empty projectDto}"></c:set>
<c:set var="sponsorVoList" value="${sponsorStartedProjectListByMemberNo}"></c:set>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<style>
.right:hover{
	background-color: #e8e8e8; 
}
</style>

<script>
	$(function(){
		$(".projectListBtn").on("click", function(){
			var projectNo = $(this).find(".projectNo").text();
			$(location).attr('href', "${pageContext.request.contextPath}/project/"+ projectNo +"/projectMain");
		});
		
		$(".projectDeleteBtn").on("click", function(){
			var projectNo = $(this).siblings(".projectListBtn").find(".projectNo").text();
			$(location).attr('href', "${pageContext.request.contextPath}/project/projectDelete/" + projectNo);
		});
	});
</script>

<section class="main-row topLine">

	<div class="container-1200 mt30 poRelative">
		<p class="fs34 pl20">
			<strong>내가 만든 프로젝트</strong>
		</p>
	</div> 

	<div class="mt30 bottomLine poRelative">
		<div class="w1200 h35" style="margin: 0 auto;">
			<ul class="project-main-ul">
				<li class="project-main-li"><a class="main-li-a cursorPointer" href="${pageContext.request.contextPath}/member/myProject">작성중인 프로젝트</a></li>
				<li class="project-main-li main-li-on"><a class="main-li-a cursorPointer" href="${pageContext.request.contextPath}/member/myProject2">진행된 프로젝트</a></li>
			</ul>
		</div>
	</div>  

	<div class="container-1200 dpFlex abc" style="min-height: 673px;">

		<div class="container-1200 hMax600 mt30 mb30 scrollThin">

		<c:choose>
			<c:when  test="${isProject}">
				<div class="w100p pb30">종료된 프로젝트가 없습니다.</div>
				<div class="w100p pb30"><a href="${pageContext.request.contextPath}/project/projectInsert">프로젝트 작성하러 가기</a></div>
			</c:when>
		<c:otherwise>
		
			<div style="projectInsert3 w100p pb30;">
				<c:forEach var="projectDto" items="${projectDto}">
				
					<div class="projectInsert3 w100p pb30 dpFlex dpFlexCenter">
						<button class="btn btn-hover w95p h80 projectListBtn">
							<c:choose>
								<c:when test="${projectDto.imageNo == 0}">
									<div class="project-main-img w80 h100p"></div>
								</c:when>
								<c:otherwise>
									<div class="project-main-img w80 h100p"
										style="background-image: url('${root}/image/project/projectMainDownload/${projectDto.imageNo}');"></div>
								</c:otherwise>
							</c:choose>
							<div class="btn-text projectTitle">${projectDto.projectTitle}</div>
							<div class="dpNone projectNo">${projectDto.projectNo}</div>
						</button>
						<button class="btn btn-hover w5p h40 projectDeleteBtn mr10 ml10">
							<div class="btn-text projectTitle">삭제</div>
						</button>
					</div>
				
				</c:forEach>
			</div>
			
		</c:otherwise>
		</c:choose>
		</div>
		 
	</div>


</section>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>