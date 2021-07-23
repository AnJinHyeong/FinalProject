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
		
		$(".sponsorProject").on("click", function(){
			$("#projectSummarize").empty();
			var projectNo = $(this).find(".projectNo").text();
			$.ajax({
				url : "${pageContext.request.contextPath}/project/data/projectInformation",
				type : 'post',
				data : {
					"projectNo" : projectNo
				},
				success : function(resp) {
					var template = $("#projectSummarizeTemplate").html();
					
					template = template.replace("{{projectTitle}}", resp.projectTitle);
					template = template.replace("{{projectTargetAmount}}", resp.projectTargetAmount);
					template = template.replace("{{sumCurrentAmountByAll}}", resp.sumCurrentAmountByAll);
					template = template.replace("{{projectPercent}}", resp.projectPercent);
					template = template.replace("{{projectStartDateString}}", resp.projectStartDateString);
					template = template.replace("{{projectEndDateString}}", resp.projectEndDateString);
					template = template.replace("{{sumSponsorAmountByOne}}", resp.sumSponsorAmountByOne);
					
					
					$("#projectSummarize").append(template);
				}
			});
		});
		
	});
</script>

<script id="projectSummarizeTemplate" type="text/template">

	<div class="h500">

		<div class="h200">
		
			<pre class="wordBreak preWrap fs18 fBold mb10 h80">{{projectTitle}}</pre>

			<pre class="fs12 fBold mb30 taRight"> {{projectStartDateString}} ~ {{projectEndDateString}}</pre>
		
			<pre class="fs12 fBold">목표금액/달성액(%)</pre>

			<pre>{{projectTargetAmount}}/{{sumCurrentAmountByAll}}({{projectPercent}})</pre>
		</div>		

		<div class="bac220 w100p h360">

			<pre>{{sumSponsorAmountByOne}}</pre>
		</div>

	</div>
	
	<div class="h100">

		<button class="w100p project-btn btn3 project-btn-hover">상세 페이지로 이동</button>

	</div>

</script>

<section class="main-row topLine">

	<div class="container-1200 mt30 poRelative">
		<p class="fs34 pl20"><strong>후원 현황</strong></p>
	</div>
	
	<div class="mt30 bottomLine poRelative">
		<div class="w1200 h35" style="margin: 0 auto;">
			<ul class="project-main-ul">
				<li class="project-main-li main-li-on"><a href="#" class="main-li-a">진행중인 프로젝트</a></li>
				<li class="project-main-li"><a href="#" class="main-li-a">완료된 프로젝트</a></li>
			</ul>
		</div>
	</div>
	
	<div class="container-1400 dpFlex pl100 pr100">
	
		<div class="container-800 hMax600 mt30 mb30 scrollThin">
	
			<c:forEach var="sponsorVo" items="${sponsorProjectListByMemberNo}">
				
				<div class="projectInsert3 w100p pb30">
					<button class="btn btn-hover w100p h80 sponsorProject">
						<div class="project-main-img w80 h100p"></div>
						<div class="btn-text projectTitle">${sponsorVo.projectTitle}</div>
						<div class="dpNone projectNo">${sponsorVo.projectNo}</div>
					</button>
				</div>
				
			</c:forEach>
		
		</div>
		
		<div class="container-300 h600 mt30 mb30 boc200 bosSolid bow1 bora5 p30" id="projectSummarize">
		
		</div>
		
	</div>
	
</section>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
	
	
