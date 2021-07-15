<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이 페이지 메뉴화면</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet" type="text/css" href="${root}/css/template.css">
<link rel="stylesheet" type="text/css" href="${root}/css/common.css">
<style>
	.myPageTitle{
		margin-top: 15px;
		margin-bottom: 5px;
		margin-left: 550px;
		font-size : 1.5em;
		font-family: Georgia, "Times New Roman", monospace;
	}
	.returnBtn{
		margin-top: 10px;
		margin-bottom: 10px;
		margin-right: 50px;
		font-size : 2em;
		font-family: Georgia, "Times New Roman", monospace;
	}
	.mainBack{
		margin-top: 15px;
		margin-bottom: 10px;
	}
	.mainBody{
		margin-top: 50px;
		padding-left: 150px;
		padding-right:150px;
		margin-bottom:50px;
	}
	.firstBody{
		margin-bottom:40px;
	}
	.secondBody{
		margin-top:30px;
	}
	.subTitle{
		font-size: 2em;
		font-family: Georgia, "Times New Roman", sans-serif;
		font-weight: 900;
		margin-bottom: 7px;
	}
	.lastBody{
		padding-left: 150px;
		padding-right:150px;
		margin-top: 50px;
		font-family: Georgia, "Times New Roman", sans-serif;
		font-weight: 900;
	}
</style>
</head>
<body>
	<header>
		<div class="float-container">
			<div class="myPageTitle left">내 정보</div>
			<div class="right mainBack"><a class="returnBtn" href="${root}/">×</a></div>
			<div class="after"></div>
		</div>
		<hr>
	</header>
	<section class="mainBody">
		<div class="firstBody">
			<a href="#">
				<img src="http://via.placeholder.com/50x50"><span>&nbsp;&nbsp;<%=(String)request.getSession().getAttribute("memberNick")%>&nbsp;&nbsp; > </span>
			</a>
		</div>
		<hr>
		<div class="secondBody">
			<div class="subTitle">알림</div>
			<div class="subTitle">메세지</div>
			<div class="subTitle">후원현황</div>
			<div class="subTitle">좋아한프로젝트</div>
			<div class="subTitle"><a href="${pageContext.request.contextPath}/member/myProject">내가만든프로젝트</a></div>
			<div class="subTitle">내 정보 수정</div>
		
		</div>
			
		<hr>
		
		
	
	</section>
	<footer class="lastBody">
		<div class="subTitle">
			<a  href="${root}/member/logout" >로그아웃</a>
		</div>
	</footer>
</body>
</html>