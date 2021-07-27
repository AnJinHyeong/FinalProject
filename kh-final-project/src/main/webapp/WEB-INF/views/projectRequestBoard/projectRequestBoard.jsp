<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<script>
	$(function(){
		
		$(".project-main-li").on("click", function(){
			$(".project-main-li").removeClass("main-li-on");
			$(this).addClass("main-li-on");
		});
		
		$(".myLikeProject").on("click",function(){
			console.log("클릭");
			var projectNo = $(this).attr("id");
			location.href="${pageContext.request.contextPath}/projectBoard/"+projectNo+"";
		});
		
		
	});
</script>

<script id="projectSummarizeTemplate" type="text/template">


</script>

<section class="main-row topLine">

	<div class="mt30 poRelative bottomLine">
		<div style="width: 1200px; margin: 20px auto;">
			<p class="fs34 pl20"><strong>프로젝트 요청 게시판</strong></p>
		</div>
	</div>
	
	<div class="container-1200" style="margin: 0 auto; height: 700px; display: flex; flex-wrap: wrap;">
	
		<div class="container-700 hMax600 mt30 mb30 scrollThin" style="border: 1px solid #dcdcdc;">
			
		
		</div>
		
		<div class="container-400 hMax600 mt30 mb30" style="border: 1px solid #dcdcdc;">
		
			<div >
			
			</div>
			
		</div>
	</div>
	
</section>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
	
	
