<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    <jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
    <c:set var="root" value="${pageContext.request.contextPath}"></c:set>
    	<link rel="stylesheet" type="text/css" href="${root}/css/resultSuccess.css">
<html>

    <div style = "height: 900px;" id = All>
    <div id = border>
<h2>결제가 취소되었습니다</h2><br>

<br>
<button id = "button" onclick = "location.href = '../'">홈으로 돌아가기</button>
</div>
</div>

</html>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>