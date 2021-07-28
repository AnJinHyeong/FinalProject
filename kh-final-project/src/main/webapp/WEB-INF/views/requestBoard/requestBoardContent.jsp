<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<script>
	$(function(){
		
		
	});
</script>


<section class="main-row topLine">

	<div class="mt30 poRelative">
		<div style="width: 1200px; margin: 20px auto;">
			<p class="fs34 pl20"><strong>자유 게시판</strong></p>
		</div>
	</div>
	
	<div class="mt30 bottomLine poRelative">
		<div class="w1200 h35" style="margin: 0 auto;">
			<ul class="project-main-ul">
				<li class="project-main-li"><a class="main-li-a cursorPointer" href="${pageContext.request.contextPath}/requestBoard/requestBoard">소통 공간</a></li>
				<li class="project-main-li main-li-on"><a class="main-li-a cursorPointer">${requestNo}번 게시글</a></li>
			</ul>
		</div>
	</div>
	
	<div class="container-1200" style="margin: 0 auto; height: 700px; display: flex; flex-wrap: wrap;" id="projectRequestDiv1">
		
		<div class="container-1000 hMax500 mt30 mb30" style="border: 1px solid #dcdcdc; border-radius: 8px; padding: 20px;">
			
			<div style="height: 10px;  padding-left: 10px;">
				<p class="font-20">${request.requestTitle} <span class="font-12 red"><i class='far fa-heart'></i></span></p>
			</div>
			<div style="margin: 20px 0; border-bottom: 1px solid red; padding-left: 10px; color: #ededed;">
				 <p class="font-12">${request.categoryTheme}</p>
			</div>
			
			<div>
				${request.requestContent}
			</div>
			
			<div>
				
			</div>
			
		</div>
		
	</div>
	
</section>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
	
	
