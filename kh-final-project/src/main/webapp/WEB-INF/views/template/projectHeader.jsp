<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<c:set var="isLogin" value="${not empty memberNo}"></c:set>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>FüN_ding - 즐거움의 시작</title>
	<link rel="stylesheet" type="text/css" href="${root}/css/template.css">
	<link rel="stylesheet" type="text/css" href="${root}/css/common.css">
	<link rel="stylesheet" type="text/css" href="${root}/css/project.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>

	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<style>
	</style>

</head>
<body class="align-column">

	<header class="main-row" style="height: 200px;">
		
		
		<div class="project-main-header">
			<div class="project-main-header-in">
				<a href="${root}/project/projectMain"><img src="${pageContext.request.contextPath}/image/back.svg" width="25" height="25"></a>
				<div>
					<button class="project-btn btn1 project-btn-hover">미리보기</button>
					<button style="text-decoration: none;" class="project-btn btn2">기획중·43% 완료</button>
				</div>
			</div>
		</div>
		
		<div class="project-main-header2">
			<div class="header2-in">
				<p style="font-size: 35px; padding-left: 20px;"><strong>프로젝트 기획</strong></p>
			</div>
		</div>
		

		