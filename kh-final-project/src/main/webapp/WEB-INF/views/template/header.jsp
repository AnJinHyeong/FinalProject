<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<c:set var="isLogin" value="${not empty memberNo}"></c:set>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FUN_ding</title>
	<link rel="stylesheet" type="text/css" href="${root}/css/template.css">
	<link rel="stylesheet" type="text/css" href="${root}/css/common.css">
<%-- 	<link rel="stylesheet" type="text/css" href="${root}/css/test.css"> --%>
	
<style>

</style>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>


</head>
<body class="align-column">

	<header class="main-row"> 
		<div class="header-row">
			<div class="header-left">
				<a class="header-a" href="#">프로젝트 둘러보기</a>
				<a class="header-a" href="${root}/project/projectInsert">프로젝트 올리기</a>
			</div>
			<div class="header-center">
				<a style="font-size: 30px;" href="${root}/">FUN_ding</a>
			</div>
			<div class="header-right">
				<img src="image/search.svg" width="20" height="20">
				<c:choose>
					<c:when test="${isLogin}">
						<a class="header-link" href="#" style="width: 95px; text-align: center;">로그아웃</a>
						<a class="header-link" href="#" style="margin: 0 10px;">5000p</a>
						<img src="image/user-in.svg" width="25" height="25">
					</c:when>
					<c:otherwise>
						<a class="header-link" href="#" style="width: 120px; margin: 0 35px;">로그인/회원가입</a>
						<img src="image/user-out.svg" width="25" height="25" >
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</header>
	
	<section class="main-row">
		