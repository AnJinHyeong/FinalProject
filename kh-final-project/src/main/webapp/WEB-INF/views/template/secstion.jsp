<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="root" value="${pageContext.request.contextPath}"></c:set>

<script>
	
	$(function(){
		
		$.ajax({
			url : "${pageContext.request.contextPath}/project/data/index/indexProjectMain",
			type : 'get',
			success : function(resp) {
				$("#sectionProjectMain1").empty();
				for(var i=0; i < resp.length; i++){
					var template = $("#projectMaindiv").html();
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
		
		
		$.ajax({
			url : "${pageContext.request.contextPath}/project/data/index/indexProjectMain2",
			type : 'get',
			success : function(resp) {
				$("#sectionProjectMain2").empty();
				for(var i=0; i < resp.length; i++){
					var template = $("#projectMaindiv").html();
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
					
					
					$("#sectionProjectMain2").append(template);
					
				}
				
				$(".section-project-image").on("click",function(){
					var projectNo = $(this).attr("id");
					location.href="${pageContext.request.contextPath}/projectBoard/"+projectNo+"";
				});
			}
			
		});
		
		$.ajax({
			url : "${pageContext.request.contextPath}/project/data/index/indexProjectMain3",
			type : 'get',
			success : function(resp) {
				$("#sectionProjectMain3").empty();
				for(var i=0; i < resp.length; i++){
					var template = $("#projectMaindiv").html();
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
					
					
					$("#sectionProjectMain3").append(template);
					
				}
				
				$(".section-project-image").on("click",function(){
					var projectNo = $(this).attr("id");
					location.href="${pageContext.request.contextPath}/projectBoard/"+projectNo+"";
				});
			}
			
		});
		
		
		
		$.ajax({
			url :"${pageContext.request.contextPath}/request/requestLikeList",
			type: "post",
			success : function(resp){
				$("#requestLikeList").empty();

				var listTop = $("#requestLikeListST").html();
				$("#requestLikeList").append(listTop);
				
				var template = $("#requestList1").html();
				template = template.replace("{{requestTitle}}", resp[0].requestTitle);
				template = template.replace("{{requestNo}}", resp[0].requestNo);
				$("#requestLikeList").append(template);
				
				for(var i=1; i < resp.length; i++){
					var template = $("#requestList").html();
					template = template.replace("{{requestTitle}}", resp[i].requestTitle);
					template = template.replace("{{requestNo}}", resp[i].requestNo);
					template = template.replace("{{i}}", i+1);
					$("#requestLikeList").append(template);
				}
			}
		
		});
		
		$.ajax({
			url :"${pageContext.request.contextPath}/request/requestViewList",
			type: "post",
			success : function(resp){
				$("#requestViewList").empty();

				var listTop = $("#requestViewListST").html();
				$("#requestViewList").append(listTop);
				
				var template = $("#requestList1").html();
				template = template.replace("{{requestTitle}}", resp[0].requestTitle);
				template = template.replace("{{requestNo}}", resp[0].requestNo);
				$("#requestViewList").append(template);
				
				for(var i=1; i < resp.length; i++){
					var template = $("#requestList").html();
					template = template.replace("{{requestTitle}}", resp[i].requestTitle);
					template = template.replace("{{requestNo}}", resp[i].requestNo);
					template = template.replace("{{i}}", i+1);
					$("#requestViewList").append(template);
				}
			}
		
		});
		
		var mainBannerImageCount = ${mainBannerImageCount};
		var width = 800;
		var left = -width;
		var maxLeft = (mainBannerImageCount - 2) * width;
    
		var currentNo = 1;
		
		var playRolling;
		
		var startPlayRolling = setTimeout(function() {
			imageRollingNext($("#imageNextBtn"));
		}, 4000);
		
		$("#imageNextBtn, #imagePreBtn").one("click", function() {
			clearTimeout(startPlayRolling);
		});
		
		function imageRollingNext(btn){
			btn.prop("disabled", true);
			
			clearInterval(playRolling);
			playRolling = setInterval(function() {
				imageRollingNext($("#imageNextBtn"));
			}, 4000);
			
			$(".mainBannerImage").each(function(index, item){
				if($(this).css("left") == "-" + width + "px"){
					$(this).css("left", maxLeft + "px");
				}
				else{
					$(this).stop().animate({"left": (Number($(this).css("left").split("px")[0]) - width) + "px"}, 300, "swing", function(){
						btn.prop("disabled", false);
					});
				}
			});
			
			currentNo = currentNo + 1;
			if (currentNo > mainBannerImageCount){
				currentNo = 1;
			}
			$("#mainBannerImageCurrentNo").text(currentNo);
			
			$.ajax({
				url : "${pageContext.request.contextPath}/banner/data/getBannerByIndexNo",
				type : 'post',
				data : {
					indexNo :  currentNo
				},
				success : function(resp) {
					$("#mainBannerTitle").text(resp.bannerTitle);
					$("#mainBannerContent").text(resp.bannerContent);
					$("#mainBannerTextContainer").stop().animate({"background-color": resp.bannerBackgroundColor, 
															"color": resp.bannerColor}, 300);
				}
			});
		}
		
		$("#imageNextBtn").on("click", function(){
			imageRollingNext($(this));
		});
		
		
		function imageRollingPre(btn){
			btn.prop("disabled", true);
			
			clearInterval(playRolling);
			playRolling = setInterval(function() {
				imageRollingNext($("#imageNextBtn"));
			}, 3000);
			
			$(".mainBannerImage").each(function(index, item){
				if($(this).css("left") == maxLeft + "px"){
					$(this).css("left", "-" + width + "px");
				}
				else{
					$(this).stop().animate({"left": (Number($(this).css("left").split("px")[0]) + width) + "px"}, 300, "swing", function(){
						btn.prop("disabled", false);
					});
				}
			});
			
			currentNo = currentNo - 1;
			if(currentNo < 1){
				currentNo = mainBannerImageCount;
			}
			$("#mainBannerImageCurrentNo").text(currentNo);
			
			$.ajax({
				url : "${pageContext.request.contextPath}/banner/data/getBannerByIndexNo",
				type : 'post',
				data : {
					indexNo :  currentNo
				},
				success : function(resp) {
					$("#mainBannerTitle").text(resp.bannerTitle);
					$("#mainBannerContent").text(resp.bannerContent);
					$("#mainBannerTextContainer").stop().animate({"background-color": resp.bannerBackgroundColor, 
															"color": resp.bannerColor}, 300);
				}
			});
		}
		
		$("#imagePreBtn").on("click", function(){
			imageRollingPre($(this));
		});
		
		$(".mainBannerImage").each(function(index, item){
			if($(this).css("left") == maxLeft + "px"){
				$(this).css("left", "-" + width + "px");
			}
			else{
				$(this).css("left", (Number($(this).css("left").split("px")[0]) + width) + "px");
			}
		});
		
	});
	

</script>

<script id="projectMaindiv" type="text/template">
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

<script id="requestLikeListST" type="text/template">
	<strong class="font-20"><span class="font-20 red"><i class="fas fa-heart"></i></span> 인기 TOP5 게시글</strong>
</script>

<script id="requestViewListST" type="text/template">
	<strong class="font-20"><span class="font-20 red"><i class="fas fa-comment-alt"></i></span> 사람들이 많이 찾은 게시글</strong>
</script>

<script id="requestList1" type="text/template">
	<p class="request-p font-14"><span class="request-top5-i" style="color: #ff9e9e;"><i class="fas fa-crown"></i>.</span><a href="${pageContext.request.contextPath}/requestBoard/requestBoardContent/{{requestNo}}"> {{requestTitle}}</a></p>
</script>

<script id="requestList" type="text/template">
	<p class="request-p font-14"><span class="request-top5-i" style="color: #ff9e9e;">{{i}}.</span><a href="${pageContext.request.contextPath}/requestBoard/requestBoardContent/{{requestNo}}"> {{requestTitle}}</a></p>
</script>

<div class="section-row">

<%-- 	<a href="${root}/deleteLocalFileNotInDB">로컬 파일 정리</a> --%>
<%-- 	<a href="${root}/givePointByFinishedProject">종료프로젝트 포인트 지급</a> --%>
	
	<div class="dpFlex dpFlexXCenter mt20 mb20 boc220 bow1 bosSolid">
		<div id="mainBannerContainer" class="dpInlineBlock w800 h450 scrollNone poRelative">
			<c:forEach var="imageDto" items="${mainBannerImageList}" varStatus="status">
				<div class="mainBannerImage w100p h100p poAbsolute" style="left: ${(status.index - 1) * 800}px;">
					<img class="w800 h100p rollingImage" src="${pageContext.request.contextPath}/image/downloadImageMainBanner/${imageDto.imageNo}">
				</div>
			</c:forEach>
		</div>
		<div id="mainBannerTextContainer" class="dpInlineBlock w400 h450 scrollNone pl30 pr30 pt100" style="background-color: ${startBannerDto.bannerBackgroundColor}; color: ${startBannerDto.bannerColor}">
		
			<div class="mb20 h80">
				<span id="mainBannerTitle" class="fs30 fBold">${startBannerDto.bannerTitle}</span>
			</div>
			<div class="mb50 h80">
				<span id="mainBannerContent" class="fs12">${startBannerDto.bannerContent}</span>
			</div>
			
			<div class="taCenter fcWhite bora30 dpFlex dpFlexCenter dpFlexXCenter p5" style="background-color: rgba(0, 0, 0, 0.3); margin: 0 120px;">
				<button id="imagePreBtn" class="bacInitial w20 h20 fBold bosNone"><i class="fWhite fs18 fas fa-chevron-left"></i></button>
				<div class="taCenter dpFlex h30 w40 dpFlexCenter dpFlexXCenter">
					<span class="fs14 fBold fWhite"><span id="mainBannerImageCurrentNo">1</span>/${mainBannerImageCount}</span>
				</div>
				<button id="imageNextBtn" class="bacInitial w20 h20 fBold bosNone"><i class="fWhite fs18 fas fa-chevron-right"></i></button>
			</div>
			
		</div>
	</div>
	
	<div class="section-project-rrr">
		
		<div class="section-project-row-div">
			<form action="${root}/project/projectSearch" method="post">
				<input type="hidden" name="projectState" value="2">
				<input type="hidden" name="projectOrder" value="1">
				<button class="right bosNone bacInherit cursorPointer">			
					<span class="section-project-minaP">주목할 만한 프로젝트<i class="fc150 ml10 fas fa-angle-right"></i></span>
				</button>
			</form>
			
			<div class="section-project-main" id="sectionProjectMain1">
			
			</div>
		</div>
		
		<div class="section-project-row-div">
			<form action="${root}/project/projectSearch" method="post">
				<input type="hidden" name="projectState" value="3">
				<input type="hidden" name="projectOrder" value="1">
				<button class="right bosNone bacInherit cursorPointer">			
					<span class="section-project-minaP">공개 예정 프로젝트<i class="fc150 ml10 fas fa-angle-right"></i></span>
				</button>
			</form>
			
			<div class="section-project-main" id="sectionProjectMain2">
			
			</div>
		</div>
		
		<div class="section-project-row-div">
			<form action="${root}/project/projectSearch" method="post">
				<input type="hidden" name="projectState" value="2">
				<input type="hidden" name="projectOrder" value="3">
				<button class="right bosNone bacInherit cursorPointer">			
					<span class="section-project-minaP">인기 추천 프로젝트<i class="fc150 ml10 fas fa-angle-right"></i></span>
				</button>
			</form>
			
			<div class="section-project-main" id="sectionProjectMain3">

			</div>
		</div>
		
		<div class="section-projectRequest-row-div" style="height: 400px;">
			<a href="${pageContext.request.contextPath}/requestBoard/requestBoard"><p class="section-project-minaP" >프로젝트 소통 게시판 <i class="fc150 ml10 fas fa-angle-right"></i></p></a>
			
			<div style="display: flex; justify-content: center; 1200px; height: 300px;">
				<div style="width: 45%; height: 300px; border: 1px solid #dcdcdc; border-radius: 8px; margin: 10px 0; padding: 20px; margin-right: 20px;" id="requestLikeList">
				</div>
			
				<div style="width: 45%; height: 300px; border: 1px solid #dcdcdc; border-radius: 8px; margin: 10px 0; padding: 20px;" id="requestViewList">
				</div>
				
			</div>
		</div>
		
	</div>
	
	
			
	
			
			
			
			
	
</div>