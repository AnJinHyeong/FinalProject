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
	<link rel="stylesheet" type="text/css" href="${root}/css/requestBoard.css">
	
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<script>
	$(function(){
		$.ajax({
			url :"${pageContext.request.contextPath}/header/getMemberHavePoint",
			type: "post",
			success : function(resp){
				$("#memberHavePoint").text(resp);
			}
		});
				
		$(".inputToggleBtn").on("click", function(e){
			if($(this).hasClass("off")){
				$(".inputToggleContainer,.inputToggleBtn,.inputToggleBtnX").toggleClass('on');
				$(".inputToggleContainer,.inputToggleBtn,.inputToggleBtnX").toggleClass('off');
				e.preventDefault();
			}
		});
		
		$(".inputToggleBtnX").on("click", function(e){
			if($(this).hasClass("on")){
				$(".inputToggleContainer,.inputToggleBtn,.inputToggleBtnX").toggleClass('on');
				$(".inputToggleContainer,.inputToggleBtn,.inputToggleBtnX").toggleClass('off');
				$("#headerSearchForm").find("input[name=keyword]").val("");
				e.preventDefault();
			}
		});
		
		$(".loginLogoutBtn").on("click", function(){
			$(".headerLoginLogout").toggle();
		});
		
		$(".projectBtn").on("click", function(){
			$(".headerProject").toggle();
		});
		
		$.ajax({
			url :"${pageContext.request.contextPath}/member/getMember",
			type: "post",
			success : function(resp){
				if(resp.memberGrade == "관리자"){
					$("#isNotAdmin").hide();
					$("#isAdmin").show();
				}
			}
		});
		
	});
	
	$("html").on("click", function(e){
		if($(".headerLoginLogout").css("display") == "block"){
			if(!$(e.target).hasClass("On")){
				$(".headerLoginLogout").toggle();
			}
		}
		
		if($(".headerProject").css("display") == "block"){
			if(!$(e.target).hasClass("On2")){
				$(".headerProject").toggle();
			}
		}
	});
</script>

</head>
<body class="align-column">

	<header class="main-row"> 
		<div class="header-row">
			<div class="header-left w120 h60">
				<div class="w120 taCenter h100p dpBlock p5">
					<button class="On2 projectBtn bosNone cursorPointer w50 bacInherit h30 mt5 header-icon-ani">
						<div class="On2 bacWhite w30 h30 mautoX">
							<div class="dpFlex On2">
								<i class="On2 fab fa-grav" style="padding: 1px; color: #707070;"></i>

								<i class="On2 fs12 fas fa-cloud" style="padding: 1px; color: #B5EAEA;"></i>
							</div>
							<div class="dpFlex On2">
								<i class="On2 fas fa-tablet-alt" style="padding: 1px; color: #FFCB77;"></i>

								<i class="On2 fas fa-music" style="padding: 1px; color: #F38BA0;"></i>
							</div>
						</div>
						<span class="On2 dpBlock fs12 h20 mt5 fBold">PROJECT</span>
					</button>
				</div>
				
				<div class="On2 headerProject dpNone poAbsolute w160 zi2 mt70">
					<ul class="On2 lsNone bacWhite p10 bora5 boc240 bosSolid bow1 w200 taLeft">
						<li><a href="${root}/project/projectList"style="padding-left: 5px;">전체 프로젝트 보기</a></li>
						<li><a href="${root}/project/projectInsert"style="padding-left: 5px;">프로젝트 올리기</a></li>
						<li><a href="${root}/requestBoard/requestBoard" style="padding-left: 5px;">자유 게시판</a></li>
					</ul>
				</div>
			</div>
			
			
			<div class="header-center">
				<a class="header-center-link" href="${root}/">FüN‿ding</a>
			</div>
			<div class="header-right">
			
				
				<form action="${root}/project/projectSearch" method="post" id="headerSearchForm">
					<div class="inputToggleContainer off">
						<input type="hidden" name="projectState" value="1">
						<input type="hidden" name="projectOrder" value="1">
						<input class="inputToggleText fs18 pl10" type="text" name="keyword" placeholder="검색어를 입력해주세요." autocomplete="off">
						<button class="inputToggleBtn off bacInherit zi1 cursorPointer"><i class="fas fa-search bacWhite"></i></button>
						<button class="inputToggleBtnX off bacInherit cursorPointer"><i class="fas fa-times"></i></button>
					</div>
				</form>
				
				
				<div class="w120 ml20 h100p">
					<c:choose>
						<c:when test="${isLogin}">
							<div class="w120 taCenter h100p dpBlock p5">
								<button class="On loginLogoutBtn bosNone cursorPointer w50 bacInherit h30 mt5 header-icon-ani"><i class="h100p fs30 On fas fa-user"></i></button>
								
								<div class="p0 m0" id="isNotAdmin">
									<a class="header-link dpBlock fs12 h20 mt5 header-icon-ani" href="${root}/pay/confirm">
									<span style="color: #ffd700;"><i class="fas fa-coins"></i></span>
									<span class="fBold" id="memberHavePoint"></span></a>
								</div>
								
								<div class="p0 m0 dpNone" id="isAdmin">
									<a class="header-link dpBlock fs12 h20 mt5 header-icon-ani" href="${root}/admin">
									<span class="fBold">ADMIN</span></a>
								</div>
								
							</div>
								
							<div class="headerLoginLogout dpNone poAbsolute w160 zi2 mt10" style="margin-left: -40px;">
								<ul class="On lsNone bacWhite p10 bora5 boc240 bosSolid bow1 taRight">
									<li><a href="${root}/member/myMsg">메세지</a></li>
									<li><a href="${root}/sponsor/sponsorList">후원현황</a></li>
									<li><a href="${root}/member/myProject">내 프로젝트</a></li>
									<li><a href="${root}/member/myLikeProject">좋아한 프로젝트</a></li>
									<li><a href="${root}/member/mySettings">내 정보 수정</a></li>
									<li><a href="${root}/member/logout">로그아웃</a></li>
								</ul>
							</div>
						</c:when>
						<c:otherwise>
							<div class="w120 taCenter h100p dpBlock p5 header-icon-ani">
								<button class="On loginLogoutBtn bosNone cursorPointer w50 bacInherit h30 mt5">
									<i class="h100p fs30 On far fa-user"></i>
									<span class="On dpBlock fs12 h20 mt5 fBold">LOGIN</span>
								</button>
							</div>
							
							<div class="headerLoginLogout dpNone poAbsolute w160 zi2 mt10" style="margin-left: -40px;">
								<ul class="On lsNone bacWhite p10 bora5 boc240 bosSolid bow1">
									<li><a href="${root}/member/login">로그인</a></li>
									<li><a href="#">회원가입</a></li>
								</ul>
							</div>
						</c:otherwise>
					</c:choose>
				</div>

			</div>
		</div>
		
	</header>
