<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<div class="div-line"></div>

<div class="section-row">
	
	<c:forEach var="categoryDto" items="${categoryList}">
		${categoryDto.categoryTheme}
	</c:forEach>
	
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>