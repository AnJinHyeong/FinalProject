<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<c:set var="isLogin" value="${not empty memberNo}"></c:set>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FüN‿ding - 즐거움의 시작</title>
	<link rel="stylesheet" type="text/css" href="${root}/css/template.css">
	<link rel="stylesheet" type="text/css" href="${root}/css/common.css">
	<link rel="stylesheet" type="text/css" href="${root}/css/project.css">
	<link rel="stylesheet" type="text/css" href="${root}/css/yb.css">
	<link rel="stylesheet" type="text/css" href="${root}/css/w_h_m_p_f.css">
	
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
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
				<a class="header-center-link" href="${root}/">FüN‿ding</a>
			</div>
			<div class="header-right">
				<img src="${root}/image/search.svg" width="20" height="20">
				<c:choose>
					<c:when test="${isLogin}">
						<a class="header-link" href="${root}/member/logout" style="width: 95px; text-align: center;">로그아웃</a>
						<a class="header-link" href="#" style="margin: 0 10px;">5000p</a>
						<a href="${root}/member/myPage"><img src="${root}/image/user-in.svg" width="25" height="25"></a>
					</c:when>
					<c:otherwise>
						<a class="header-link" href="${root}/member/login" style="width: 120px; margin: 0 35px;">로그인/회원가입</a>
						<a href="${root}/member/myPage"><img src="${root}/image/user-out.svg" width="25" height="25" ></a>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		
		<div>
		
		</div>
	</header>
