<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<script src="<%=request.getContextPath()%>/js/searchJs.js"></script>

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
					keyword : "${keyword}",
					projectState : "${projectState}",
					projectOrder : "${projectOrder}"
				},
				success : function(resp) {
					if(functionIndex != null){
						projectCount = resp.length;
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
						
						if(resp[i].projectPercent < 25){
							template = template.replace("{{icon}}", "fa-battery-empty");
							template = template.replace("{{iconColor}}", "#ffadad");
						}
						else if(resp[i].projectPercent < 50 && resp[i].projectPercent >= 25){
							template = template.replace("{{icon}}", "fa-battery-quarter");
							template = template.replace("{{iconColor}}", "#ffdb72");
						}
						else if(resp[i].projectPercent < 75 && resp[i].projectPercent >= 50){
							template = template.replace("{{icon}}", "fa-battery-half");
							template = template.replace("{{iconColor}}", "#aaffb8");
						}
						else if(resp[i].projectPercent < 100 && resp[i].projectPercent >= 75){
							template = template.replace("{{icon}}", "fa-battery-three-quarters");
							template = template.replace("{{iconColor}}", "#84ff84");
						}
						else if(resp[i].projectPercent >= 100){
							template = template.replace("{{icon}}", "fa-battery-full");
							template = template.replace("{{iconColor}}", "#00ff2e");
						}
						
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
		
		var projectOrderTextValue = ${projectOrder};
		var projectStateTextValue = ${projectState};
		$("#projectOrderText").text($("#projectOrderSelectBox").find("li[value=" + projectOrderTextValue + "]").text());
		$("#projectStateText").text($("#projectStateSelectBox").find("li[value=" + projectStateTextValue + "]").text());
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
			<p style="font-size: 13px; text-align: left; padding: 0 20px; color: #ff6060;">{{projectPercent}}%달성 <i class="fas {{icon}}" style="margin-left: 5px; font-size: 12px; color: {{iconColor}}"></i></p>
		</div>
	</div>
</script>

<div class="main-row topLine">

	<div class="bottomLine">
		<div class="mautoX w1200 pt20 pb20 poRelative">
			
			<jsp:include page="/WEB-INF/views/template/searchDiv.jsp"></jsp:include>
			
			<form action="${root}/project/projectSearch" method="post" id="searchForm">
				<input type="hidden" name="projectState" value="${projectState}">
				<input type="hidden" name="projectOrder" value="${projectOrder}">
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