<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>

<html>
	<link rel="stylesheet" type="text/css" href="${root}/css/join.css">
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/join.js"></script>
<br><br>
<body>
	<div class = "container joinBorder">
		<div class = "row text-center">
			<h2>회원 가입 완료!</h2>
		</div>
		
	</div>
</body>
<br><br>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
</html>

