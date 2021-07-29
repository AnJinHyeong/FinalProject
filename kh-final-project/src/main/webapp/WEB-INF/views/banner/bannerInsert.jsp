<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="root" value="${pageContext.request.contextPath}"></c:set>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<script>
	$(function(){
		$("input[type=file]").on("input", function(){
// 			console.log($(this).val());
		});
	});
</script>

</head>
<body>

	<form action="${root}/banner/bannerInsert" method="post" enctype="multipart/form-data">
		<input type="text" name="bannerTitle" placeholder="타이틀">
		<input type="text" name="bannerContent" placeholder="내용">
		<input type="color" name="bannerBackgroundColor" value="#ffffff">
		<input type="color" name="bannerColor" value="#000000">
		<input type="file" name="bannerImage">
		<input type="submit" value="등록">
	</form>

</body>
</html>