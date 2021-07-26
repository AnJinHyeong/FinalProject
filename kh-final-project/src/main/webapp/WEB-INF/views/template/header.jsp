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
	<link rel="stylesheet" type="text/css" href="${root}/css/yongbo.css">
	<link rel="stylesheet" type="text/css" href="${root}/css/projectBoard.css">
	<link rel="stylesheet" type="text/css" href="${root}/css/templateSection.css">
	
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>

<style>

	.menu_1{

		text-align: right;

	}

	.sub_1{

		position:absolute;

		width:100px;

	}

</style>

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
$(document).ready(function(){

	

	$('#top_menu .sub_1').hide();

 

	$('.menu_1').click(function(){

		if($('#top_menu .sub_1').is(':visible')==false){

			

			$('.sub_1').slideDown();

			

		}else if($('#top_menu .sub_1').is(':visible')==true){

			

			$('.sub_1').hide();

		}

 

	});

	

});

	$(function(){
		$.ajax({
			url :"${pageContext.request.contextPath}/header/getMemberHavePoint",
			type: "post",
			success : function(resp){
				$("#memberHavePoint").text(resp);
			}
		});
	});
</script>

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
						<a class="header-link" href="${root}/pay/confirm" style="margin: 0 10px;"><span id="memberHavePoint"></span>p</a>
						<ul id="top_menu" style="list-style:none;"> 

							<li>

								<a><img src="${root}/image/user-in.svg"  class="menu_1" width="118" height="25"  style="padding-right:100px;"></a>

									<ul class="sub_1" style="list-style:none; padding-left:0px;">

										<li style="margin-right:-100px; text-align:left; width:118px; height:25px"><a href="${root}/member/myMsg">메세지</a></li>

										<li style="margin-right:-100px; text-align:left; width:118px; height:25px"><a href="#">후원현황</a></li>

										<li style="margin-right:-100px; text-align:left; width:118px; height:25px"><a href="#">내 프로젝트</a></li>

										<li style="margin-right:-100px; text-align:left; width:118px; height:25px"><a href="#">좋아한 프로젝트</a></li>

										<li style="margin-right:-100px; text-align:left; width:118px; height:25px"><a href="${root}/member/mySettings">내 정보 수정</a></li>

										<li style="margin-right:-100px; text-align:left; width:118px; height:25px"><a href="${root}/member/logout">로그아웃</a></li>

									</ul>

							</li>

						</ul>

						
					</c:when>
					<c:otherwise>
						<a class="header-link" href="${root}/member/login" style="width: 120px; margin: 0 35px;">로그인/회원가입</a>
						<a href="#"><img src="${root}/image/user-out.svg" width="25" height="25" ></a>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		
		<div>
		
		</div>
	</header>
