<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>



<section class="main-row topLine">

	<div style="margin: 0 auto; width: 1200px; height: 500px;">
		<span>내가 만든 프로젝트</span>
		
		<c:forEach var="projectDto" items="${projectDto}">
			<div>
				<p>${projectDto.projectNo}</p>
				<p>${projectDto.projectTitle}</p>
				<a href="${pageContext.request.contextPath}/project/${projectDto.projectNo}/projectMain">수정</a>
			</div>
		
		</c:forEach>
	
	</div>


</section>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
