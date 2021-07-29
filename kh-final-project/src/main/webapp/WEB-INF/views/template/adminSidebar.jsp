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
		<div class="admin-logo"><a href="#">FüN‿ding</a></div>
		<ul>
			<li class="admin-aside-top_menu"><span class="">회원</span>
				<ul class="admin-aside-side_menus">
					<li><a href="#">회원</a></li>
					<li><a href="#">회원</a></li>
				</ul>
			</li>
			<li class="admin-aside-top_menu"><span class=""></span>
				<ul class="admin-aside-side_menus">
					<li><a href="#">메인 페이지</a></li>
				</ul>
			</li>
		</ul>
	</aside>
	