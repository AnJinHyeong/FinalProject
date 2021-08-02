<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

 

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="isProject" value="${empty projectDto}"></c:set>



<c:set var="root" value="${pageContext.request.contextPath}"></c:set>

 

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<style>

.right:hover{

	background-color:#6d6d6d;

}

</style>



 


 

 

 

 

 

 

 

 

 

 

<section class="main-row topLine">

 

	<div class="container-1200 mt30 poRelative">

		<p class="fs34 pl20">

			<strong>내가 만든 프로젝트</strong>

		</p>

	</div> 

 

	<div class="mt30 bottomLine poRelative">

		<div class="w1200 h35" style="margin: 0 auto;">

			<ul class="project-main-ul">

				<li class="project-main-li main-li-on"><a class="main-li-a cursorPointer" href="${pageContext.request.contextPath}/member/myProject">작성중인 프로젝트</a></li>

				<li class="project-main-li"><a class="main-li-a cursorPointer " href="${pageContext.request.contextPath}/member/myProject2">진행된 프로젝트</a></li>

			</ul>

		</div>

	</div> 

 

	<div class="container-1400 dpFlex pl100 pr100 abc">

 

		<div class="container-800 hMax600 mt30 mb30 scrollThin">

 

		<c:choose>

			<c:when test="${isProject}">
				<div style="min-height:600px;">
				<div class="w100p pb30">현재 진행중인 프로젝트가 없습니다.</div>

				<div class="w100p pb30"><a href="${pageContext.request.contextPath}/project/projectInsert">프로젝트 작성하러 가기</a></div>
				</div>

			</c:when>

		<c:otherwise>

			<div style="font-size:20px;margin-top:20px; margin-bottom:20px;">작성 중</div>

			<div style="projectInsert3 w100p pb30;">

				<c:forEach var="projectDto" items="${projectDto}">

					<div class="float-container" style="border-bottom:solid 1px #3d3d3d; padding:20px;">

					

						<div class="left" class="project-main-img w80 h100p">이미지</div>

						<div class="left projectNo" style="margin-left:10px;">${projectDto.memberNo}</div>

						<div class="left projectNo" style="margin-left:10px;">${projectDto.projectNo}</div>

						<div class="left btn-text projectTitle" style="margin-left:10px;"><strong>${projectDto.projectTitle}</strong></div>

						<div class="right" style="border:solid 1px gray; padding : 10px; margin-left:10px;"><a href="#"><strong>삭제</strong></a></div>

						<div class="right" style="border:solid 1px gray; padding : 10px; "><a href="${pageContext.request.contextPath}/project/${projectDto.projectNo}/projectMain"><strong>수정</strong></a></div>

						<div></div>   

					</div> 

				</c:forEach>

			</div>	

		</c:otherwise>

		</c:choose>

		</div>

		 

	</div>

 

 

		

		

		

	

		

 

	

 

</section>

 

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>