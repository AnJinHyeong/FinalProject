<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<c:set var="isLogin" value="${not empty memberNo}"></c:set>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FüN‿ding - ADMIN</title>
    <link rel="stylesheet" type="text/css" href="${root}/css/template.css">
    <link rel="stylesheet" type="text/css" href="${root}/css/adminPage.css">
    
</head>
<body>
	<aside>
		<div class="admin-logo" style="padding-bottom: 5px;"><a href="${root}/admin">FüN‿ding</a></div>
		<div class="admin-logo" style="padding: 0 0 30px 0;">ADMIN</div>
		<ul>
			<li class="admin-aside-top_menu"><span class="admin-aside-main-span">회원</span>
				<ul class="admin-asidze-side_menus">
					<li><a href="${root}/admin/adminMemberSearchAll">회원 관리</a></li>
					<li><a href="${root}/admin/adminPaySearchAll">회원 결제 관리</a></li>
				</ul>
			</li>
			<li class="admin-aside-top_menu"><span class="admin-aside-main-span">프로젝트</span>
				<ul class="admin-aside-side_menus">
					<li><a href="#">카테고리 심사</a></li>
					<li><a href="${root}/admin/adminProjectSelect">프로젝트 조회/심사</a></li>
				</ul>
			</li>
			<li class="admin-aside-top_menu"><span class="admin-aside-main-span">문의함</span>
				<ul class="admin-aside-side_menus">
					<li><a href="#">관리자 문의</a></li>
				</ul>
			</li>
			<li class="admin-aside-top_menu"><span class="admin-aside-main-span">배너</span>
				<ul class="admin-aside-side_menus">
					<li><a href="${root}/admin/adminBanner">배너 관리 </a></li>
				</ul>
			</li>
			<li class="admin-aside-top_menu"><span class="admin-aside-main-span">자유 게시판</span>
				<ul class="admin-aside-side_menus">
					<li><a href="#">게시글 조회/관리</a></li>
				</ul>
			</li>
			<li class="admin-aside-top_menu" style="margin-top: 100px;"><span class=""></span>
				<ul class="admin-aside-side_menus">
					<li><a href="${root}/" style="color: #fff;">메인 페이지</a></li>
				</ul>
			</li>
		</ul>
	</aside>
	