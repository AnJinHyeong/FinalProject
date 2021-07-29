<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FüN‿ding - ADMIN</title>

	<link rel="stylesheet" type="text/css" href="${root}/css/admin.css">

	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

</head>
<body>
	<aside class="adminAside">
		<span class="title">FüN‿ding</span>
		<span class="title2">ADMIN</span>
		
		<div class="adminAsideList">
			<ul>
				<li>
					<span>회원</span>
					<ul>
						<li><span>회원삭제</span></li>
						<li><span>회원정보</span></li>
					</ul>
				</li>
				<li>
					<span>배너</span>
					<ul>
						<li><span>배너정보</span></li>
					</ul>
				</li>
			</ul>
		</div>
	</aside>
	<header>
	</header>
	<section>
	</section>
	<footer>
	</footer>
</body>
</html>