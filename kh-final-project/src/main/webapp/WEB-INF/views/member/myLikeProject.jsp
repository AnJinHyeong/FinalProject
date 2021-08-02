<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="root" value="${pageContext.request.contextPath}"></c:set>

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
			<p class="fs34 pl20"><strong>내가 좋아하는 프로젝트</strong></p>
		</div>
	</div>
	
	<div class="container-1200" style="margin: 0 auto; height: 700px;">
	
		<div class="container-1200 hMax600 mt30 mb30 scrollThin">
	
			<c:forEach var="likeList" items="${likeList}">
				
				<div class="projectInsert3 w100p pb30">
					<button class="btn btn-hover w100p h80 myLikeProject" id="${likeList.projectNo}">
						<c:choose>
							<c:when test="${likeList.imageNo == 0}">
								<div class="project-main-img w80 h100p"></div>
							</c:when>
							<c:otherwise>
								<div class="project-main-img w80 h100p"
									style="background-image: url('${root}/image/project/projectMainDownload/${likeList.imageNo}');"></div>
							</c:otherwise>
						</c:choose>
						<div class="btn-text projectTitle">${likeList.projectTitle}</div>
						<div class="dpNone projectNo">${likeList.projectNo}</div>
					</button>
				</div>
				
			</c:forEach>
		
		</div>
		
	</div>
	
</section>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
	
	
