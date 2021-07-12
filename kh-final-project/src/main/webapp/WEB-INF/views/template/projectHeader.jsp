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
	<link rel="stylesheet" type="text/css" href="${root}/css/project.css">
	
<style>

</style>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

</head>
<body class="align-column">

	<header class="main-row"> 
		<div class="section-project-row">
			<div class="project-main-header">
				<div class="project-main-header-in">
					<a href="${root}/project/projectMain" style="width: 25; height: 25;"><img alt="" src="${pageContext.request.contextPath}/image/back.svg" width="25" height="25"></a>
					<div class="">
						<button class="project-btn btn1">미리보기</button>
						<button style="text-decoration: none; " class="project-btn btn2">기획중·43% 완료</button>
					</div>
				</div>
			</div>
			
			
			<div class="project-main-div2" style="margin-top: 130px;">
				<div>
					<p style="font-size: 35px;"><strong>프로젝트 기획</strong></p>
				</div>
			</div>
		
			<div style="overflow-x: hidden; padding: 0px;">
				<ul class="project-main-ul">
					<li class="project-main-li main-li-on"><a href="#" class="main-li-a">기본정보</a></li>
					<li class="project-main-li"><a href="#" class="main-li-a">펀딩 계획</a></li>
					<li class="project-main-li"><a href="#" class="main-li-a">선물 구성</a></li>
					<li class="project-main-li"><a href="#" class="main-li-a">스토리</a></li>
					<li class="project-main-li"><a href="#" class="main-li-a">창작자 정보</a></li>
					<li class="project-main-li"><a href="#" class="main-li-a">신뢰와 안전</a></li>
				</ul>
			</div>
	</div>
	</header>
	
