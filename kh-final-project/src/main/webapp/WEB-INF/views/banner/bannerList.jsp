<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="root" value="${pageContext.request.contextPath}"></c:set>

<c:forEach var="bannerVo" items="${bannerList}">
	<div>
		${bannerVo}
		<form action="${root}/banner/bannerDelete">
			<input type="text" name="bannerNo" value="${bannerVo.bannerNo}">
			<input type="text" name="bannerImageNo" value="${bannerVo.bannerImageNo}">
			<input type="submit" value="삭제">
		</form>
	</div>
	<br>
</c:forEach>