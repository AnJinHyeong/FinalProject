<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<c:set var="isLogin" value="${not empty memberNo}"></c:set>
<c:set var="division" value="${param.division}"></c:set>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>FUN‿ding - 즐거움의 시작</title>
	<link rel="stylesheet" type="text/css" href="${root}/css/template.css">
	<link rel="stylesheet" type="text/css" href="${root}/css/common.css">
	<link rel="stylesheet" type="text/css" href="${root}/css/project.css">
	
	<link rel="stylesheet" type="text/css" href="${root}/css/yb.css">
	<link rel="stylesheet" type="text/css" href="${root}/css/yongbo.css">
	
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>

	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<style>
	</style>
	
	<script>
		$(function(){
			var projectBtnList = $(".project-main-li");
			projectBtnList.each(function(index, item){
				if($(this).find(".main-li-a").attr("href") == "${division}"){
					$(this).addClass("main-li-on");
				}
			});
		});
	</script>

</head>
<body class="align-column">

	<header class="main-row" style="height: 200px;">
		
		
		<div class="project-main-header">
			<div class="project-main-header-in">
				<a href="${root}/project/${projectNo}/projectMain"><img src="${pageContext.request.contextPath}/image/back.svg" width="25" height="25"></a>
				<div>
					<button class="project-btn btn1 project-btn-hover">미리보기</button>
					<button style="text-decoration: none;" class="project-btn btn2 font-12">기획중· <span id="progress" class="font-12">0</span> % 완료</button>
				</div>
			</div>
		</div>
		
		<div class="project-main-header2">
			<div class="header2-in">
				<p style="font-size: 35px; padding-left: 20px;"><strong>프로젝트 기획</strong></p>
			</div>
		</div>
		
		<div class="project-main-header3 bottomLine">
			<div style="width: 1200px; margin: 0 auto; height: 35px;">
				<ul class="project-main-ul">
					<li class="project-main-li"><a href="${root}/project/${projectNo}/projectMainDefault" class="main-li-a">기본정보</a></li>
					<li class="project-main-li"><a href="${root}/project/${projectNo}/projectMainFunding" class="main-li-a">펀딩 계획</a></li>
					<li class="project-main-li"><a href="${root}/project/${projectNo}/projectMainGift" class="main-li-a">선물 구성</a></li>
					<li class="project-main-li"><a href="${root}/project/${projectNo}/projectMainStory" class="main-li-a">스토리</a></li>
					<li class="project-main-li"><a href="${root}/project/${projectNo}/projectMainMember" class="main-li-a">창작자 정보</a></li>
				</ul>
			</div>
		</div>
		
	</header>