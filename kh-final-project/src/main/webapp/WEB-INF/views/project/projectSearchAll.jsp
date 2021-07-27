<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<script>
	$(function(){
		
		var projectCountInRow = 4;
		var rowCount = 3;
		var count = rowCount * projectCountInRow;
		var strNum = 0;
		var endNum = strNum + count;
		var projectCount;
		
		function getSomeProject(strNum, endNum, functionIndex){
			$.ajax({
				url : "${pageContext.request.contextPath}/project/data/projectSearchAll",
				type : 'post',
				data : {
					keyword : "${keyword}"
				},
				success : function(resp) {
					if(functionIndex != null){
						projectCount = resp.length;
						console.log(projectCount);
					}
					for(var i = strNum ; i < endNum ; i++){
						var template = $("#projectSearchListTemplate").html();
						template = template.replace("{{categoryTheme}}", resp[i].categoryTheme);
						template = template.replace("{{memberInfoNick}}", resp[i].memberInfoNick);
						template = template.replace("{{projectTitle}}", resp[i].projectTitle);
						template = template.replace("{{projectPercent}}", resp[i].projectPercent);
						template = template.replace("{{projectNo}}", resp[i].projectNo);
						
						var url = "${pageContext.request.contextPath}/image/project/projectMainDownload/"+resp[i].imageNo;
						template = template.replace("{{projectImage}}", url);
						
						$("#sectionProjectMain1").append(template);
					}
					
					$(".section-project-image").on("click",function(){
						var projectNo = $(this).attr("id");
						location.href="${pageContext.request.contextPath}/projectBoard/"+projectNo+"";
					});
				}
			});
		}
		
		getSomeProject(strNum, endNum, 1);
		
		var maxHeight = 0;
		
		$(window).on("scroll", function(e){
			var currentScroll = $(this).scrollTop();
			console.log(currentScroll);
			if(maxHeight < currentScroll){
				maxHeight = maxHeight + (300 * rowCount);
				strNum = strNum + count;
				endNum = endNum + count;
				if(endNum > projectCount){
					endNum = projectCount;
				}
				getSomeProject(strNum, endNum);
				if(endNum == projectCount){
					$(window).off("scroll");
				}
			}
		});
	});
</script>

<script id="projectSearchListTemplate" type="text/template">
	<div class="section-project-mainDiv">
		<div class="section-project-image-div">
			<img src="{{projectImage}}" class="section-project-image" id="{{projectNo}}">
		</div>
		<p style="padding: 0 20px 10px 20px; text-align: left; font-size: 13px; color: #d1d1d1;">{{categoryTheme}} | {{memberInfoNick}}</p>
		<div style="width: 100%; height: 50px;">
			<p style="font-size: 15px; text-align: left; padding: 0 20px; padding-bottom: 10px; height: 35px;">{{projectTitle}}</p>
			<p style="font-size: 13px; text-align: left; padding: 0 20px; color: #ff6060;">{{projectPercent}}%달성</p>
		</div>
	</div>
</script>

<div class="main-row topLine">

	<div class="bottomLine">
		<div class="mautoX w1200 pt20 pb20 poRelative">
			<form action="${root}/project/projectSearch" method="post" id="searchForm">
				<input class="h60 w1200 fs18 pl10 boc220 bosSolid bow1" type="text" name="keyword" 
					placeholder="검색어를 입력해주세요." autocomplete="off" value="${keyword}">
				<button class="cursorPointer bosNone bacInherit fs30 poAbsolute h60" style="right: 15px;">
					<i class="fas fa-search bacWhite"></i>
				</button>
			</form>
		</div>
	</div>

	<div class="section-row">

		<div class="section-project-rrr">

			<div class="section-project-search-row-div">
				<p class="mb20 project-search-p"><span>${projectSearchCount}</span>개의 프로젝트가 있습니다.</p>
				<c:if test="${projectSearchCount > 0}">
					<div class="section-project-main-search" id="sectionProjectMain1"></div>
				</c:if>
			</div>

		</div>
		
		
		
	</div>

</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>