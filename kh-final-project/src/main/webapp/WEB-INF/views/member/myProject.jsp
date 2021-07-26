<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<c:set var="isProject" value="${not empty projectNo}"></c:set>
<style>
	.section-setting{
		width:90%;
		min-height:1000px;
		margin: 0 auto;
	}

</style>

<section class="section-setting">
	<hr>
	<div style="font-size:40px; margin-top:50px; margin-bottom:70px;color:#3D3D3D;"><strong>내가 만든 프로젝트</strong></div>
	<hr>
	<c:choose>
		<c:when test="${isProject}">
			<div>현재 작성중인 프로젝트가 없습니다.</div>
		</c:when>
		<c:otherwise>
			<div style="font-size:20px;margin-top:20px; margin-bottom:20px;">작성 중</div>
			<div style="border:solid 1px #3d3d3d;">
				<c:forEach var="projectDto" items="${projectDto}">
					<div class="float-container" style="border-bottom:solid 1px #3d3d3d; padding:20px;">
						<div class="left" style="margin-right:20px;">이미지</div>
						<div class="left">${projectDto.projectNo}</div>
						<div class="left"><strong>${projectDto.projectTitle}</strong></div>
						<div class="left"><a href="${pageContext.request.contextPath}/project/${projectDto.projectNo}/projectMain">수정</a></div>
						<div class="left"><a href="#">삭제</a></div>
						<div></div>
					</div>
				</c:forEach>
			</div>	
		</c:otherwise>
	</c:choose>


</section>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
