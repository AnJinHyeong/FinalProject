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
				<c:choose>
					<c:when test="${projectDto.projectState == '1' || projectDto.projectState == '2'}">
						<a href="${pageContext.request.contextPath}/projectBoard/${projectDto.projectNo}"><button class="project-btn btn1 project-btn-hover" id="projectBoard">미리보기</button></a>
					</c:when>
					<c:otherwise>
						<a href="${pageContext.request.contextPath}/projectBoard/${projectDto.projectNo}"><button class="project-btn btn1 project-btn-hover" id="projectBoard">프로젝트 확인</button></a>
					</c:otherwise>
				</c:choose>
				<div style="text-decoration: none; height: 40px;">
					<c:choose>
						<c:when test="${projectDto.projectState == '1'}">
							<button class="project-btn btn2">기획중·<span id="progress"></span>% 완료</button>
						</c:when>
						<c:when test="${projectDto.projectState == '2'}">
							<button class="project-btn btn2">프로젝트 심사중</button>
						</c:when>
						<c:when test="${projectDto.projectState == '3'}">
							<button class="project-btn btn2">프로젝트 펀딩</button>
						</c:when>
						<c:when test="${projectDto.projectState == '4'}">
							<button class="project-btn btn2">프로젝트 펀딩종료</button>
						</c:when>
						<c:otherwise>
							<button class="project-btn btn2">프로젝트 중단</button>
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
					<c:when test="${projectDto.projectState == '3' || projectDto.projectState == 'X' || projectDto.projectState == '4'}">
						<ul class="project-main-ul">
							<li class="project-main-li"><a href="${pageContext.request.contextPath}/project/${projectDto.projectNo}/projectMain" class="main-li-a">프로젝트 기획</a></li>
							<li class="project-main-li"><a href="${pageContext.request.contextPath}/project/${projectDto.projectNo}/projectMainApproval" class="main-li-a ">승인심사 요청</a></li>
							<li class="project-main-li main-li-on"><a href="${pageContext.request.contextPath}/project/${projectDto.projectNo}/projectMainCommunity" class="main-li-a">커뮤니티</a></li>
							<li class="project-main-li"><a href="${pageContext.request.contextPath}/project/${projectDto.projectNo}/projectMainSponsor" class="main-li-a">후원자 관리</a></li>
						</ul>
					</c:when>
					<c:otherwise>
						<ul class="project-main-ul">
							<li class="project-main-li"><a href="${pageContext.request.contextPath}/project/${projectDto.projectNo}/projectMain" class="main-li-a">프로젝트 기획</a></li>
							<li class="project-main-li"><a href="${pageContext.request.contextPath}/project/${projectDto.projectNo}/projectMainApproval" class="main-li-a">승인심사 요청</a></li>
							<li class="project-main-li main-li-on"><a href="${pageContext.request.contextPath}/project/${projectDto.projectNo}/projectMainCommunity" class="main-li-a project-disable">커뮤니티<i class="fas fa-lock" style="margin-left: 5px; font-size: 12px;"></i></a></li>
							<li class="project-main-li"><a href="${pageContext.request.contextPath}/project/${projectDto.projectNo}/projectMainSponsor" class="main-li-a project-disable">후원자 관리<i class="fas fa-lock" style="margin-left: 5px; font-size: 12px;"></i></a></li>
						</ul>
					</c:otherwise>
				</c:choose>
				
			</div>
	</div>
	
	<div class="topLine project-back-color" style="height: 800px;">
		
		<div class="section-project-row">
		
			<div class="" style=" height: 20px; width: 1200px; padding-top: 50px; text-align: left; font-weight: bold; font-size: 30px;">
				프로젝트 커뮤니티 관리
			</div>
		
			<div class="project-community-div">
				<!-- 커뮤니티 내용들 -->
				<div class="project-community-row1 scrollThin">
					<c:forEach var="communityList" items="${communityList}">
						<div class="project-board-community-row">
							<div class="project-board-community-row100" style="padding: 10px;">
								<div style="width: 100%; height: 30px; display: flex;">
									<c:choose>
										<c:when test="${projectDto.memberNo == communityList.memberNo}">
											<span style="font-weight: bold; font-size: 18px;  width: 15%;">${projectDto.memberInfoNick}</span>
										</c:when>
										<c:otherwise>
											<span style="font-weight: bold; font-size: 18px;  width: 15%;">${communityList.memberNick}</span>
										</c:otherwise>
									</c:choose>
									<div style="text-align: right; width: 85%">
										<a href="${pageContext.request.contextPath}/project/${projectDto.projectNo}/projectCommunityDelete?projectCommunityNo=${communityList.projectCommunityNo}"><span class="font-12 red"><i class="fas fa-times"></i></span></a>
									</div>
								</div>
							</div>
							
							<div class="project-board-community-row100" style="padding: 10px; height: 50px; font-size: 15px;">
								${communityList.projectCommunityContent}
							</div>
						</div>
					</c:forEach>
				</div>
				
				<!-- 등록 수정 -->
				<div class="project-community-row2">
					<div style="width: 100%; height: 50px; margin: 10px 0 0 10px; font-weight: bold; font-size: 20px;">
						커뮤니티 글 등록
					</div>
					<div style="width: 100%; height: 200px;">
						<form action="projectMainCommunity" method="post">
							<div class="project-board-community-row-form">
								<div class="project-board-community-row100">
									<div style="width: 100%; height: 30px;">
	<!-- 									<img class="project-board-community-memberImage" id="myMemberImage"> -->
										<span>${projectDto.memberInfoNick}</span>
									</div>
								</div>
								<div class="project-board-community-row100"> 
									<textarea class="project-board-community-text" name="projectCommunityContent"></textarea>
								</div>
								<div class="project-board-community-row100" style="text-align: right;">
									<button class="project-board-community-btn">등록</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		
		
	</div>

</section>



</body>
</html>