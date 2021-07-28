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
		
		var mainBannerImageCount = ${mainBannerImageCount};
		var width = 700;
		var left = -width;
		var maxLeft = (mainBannerImageCount - 2) * width;
		
		var currentNo = 1;
		
		$("#imageNextBtn").on("click", function(){
			$(this).prop("disabled", true);
			var that = $(this);
			$(".mainBannerImage").each(function(index, item){
				if($(this).css("left") == "-" + width + "px"){
					$(this).css("left", maxLeft + "px");
				}
				else{
					$(this).animate({"left": (Number($(this).css("left").split("px")[0]) - width) + "px"}, 300, "swing", function(){
						that.prop("disabled", false);
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
					$("#mainBannerTextContainer").animate({"background-color": resp.bannerBackgroundColor, 
															"color": resp.bannerColor}, 300);
				}
			});
			
		});
		
		$("#imagePreBtn").on("click", function(){
			$(this).prop("disabled", true);
			var that = $(this);
			$(".mainBannerImage").each(function(index, item){
				if($(this).css("left") == maxLeft + "px"){
					$(this).css("left", "-" + width + "px");
				}
				else if($(this).css("left") == "0px"){
					$(this).animate({"left": (Number($(this).css("left").split("px")[0]) + width) + "px"}, 300, "swing", function(){
						that.prop("disabled", false);
					});
				}
				else{
					$(this).animate({"left": (Number($(this).css("left").split("px")[0]) + width) + "px"}, 300, "swing", function(){
						that.prop("disabled", false);
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
					$("#mainBannerTextContainer").animate({"background-color": resp.bannerBackgroundColor, 
															"color": resp.bannerColor}, 300);
				}
			});
			
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

<div class="section-row">

	<a href="${root}/banner/bannerInsert">배너 등록</a>

	<div class="dpFlex dpFlexXCenter mt20 mb20">
		<div id="mainBannerContainer" class="dpInlineBlock w700 h400 scrollNone poRelative">
			<c:forEach var="imageDto" items="${mainBannerImageList}" varStatus="status">
				<div class="mainBannerImage w100p h100p poAbsolute" style="left: ${(status.index - 1) * 700}px;">
					<img class="w700 h100p rollingImage" src="${pageContext.request.contextPath}/image/downloadImageMainBanner/${imageDto.imageNo}">
				</div>
			</c:forEach>
		</div>
		<div id="mainBannerTextContainer" class="dpInlineBlock w400 h400 scrollNone pl30 pr30 pt100" style="background-color: ${startBannerDto.bannerBackgroundColor}; color: ${startBannerDto.bannerColor}">
		
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
			<a href="#" class="section-project-minaP">인기 추천 프로젝트<i class="fc150 ml10 fas fa-angle-right"></i></a>
			
			<div class="section-project-main">
				<div class="section-project-mainDiv">
					dd
				</div>
				<div class="section-project-mainDiv">
					dd
				</div>
				<div class="section-project-mainDiv">
					dd
				</div>
				<div class="section-project-mainDiv">
					dd
				</div>
				<div class="section-project-mainDiv">
					dd
				</div>
				<div class="section-project-mainDiv">
					dd
				</div>
				<div class="section-project-mainDiv">
					dd
				</div>
				<div class="section-project-mainDiv">
					dd
				</div>
			</div>
		</div>
		
		<div class="section-projectRequest-row-div" style="height: 400px;">
			<p class="section-project-minaP" >프로젝트 소통 게시판</p>
			
			<div style="display: flex; justify-content: center; 1200px; height: 300px;">
				<div style="width: 45%; height: 300px; border: 1px solid #dcdcdc; border-radius: 8px; margin: 20px 0; padding: 20px;">
					<strong class="font-20"><span class="font-20 red"><i class="fas fa-heart"></i></span> 인기 TOP5 게시글</strong>
					<p class="request-p font-14"><span class="request-top5-i" style="color: #ff9e9e;"><i class="fas fa-crown"></i>.</span> 저는 이거 추천해요!!</p>
					<p class="request-p font-14"><span class="request-top5-i" style="color: #ff9e9e;">2.</span> 이런건 어떤가요</p>
					<p class="request-p font-14"><span class="request-top5-i" style="color: #ff9e9e;">3.</span> 으엑</p>
					<p class="request-p font-14"><span class="request-top5-i" style="color: #ff9e9e;">4.</span> 꼭 한번 읽어주세요</p>
					<p class="request-p font-14"><span class="request-top5-i" style="color: #ff9e9e;">5.</span> 펀딩 화이팅ㅇ!!</p>
					<p style="text-align: right;"><span class="font-12 red-hover-cursor">더 보기 <i class="fas fa-angle-double-right"></i></span></p>
				</div>
			
				<div style="width: 45%; height: 300px; border: 1px solid #dcdcdc; border-radius: 8px; margin: 20px 0; padding: 20px;">
					<strong class="font-20"><span class="font-20 red"><i class="fas fa-comment-alt"></i></span> 사람들이 많이 찾은 게시글</strong>
					<p class="request-p font-14"><span class="request-top5-i" style="color: #ff9e9e;"><i class="fas fa-crown"></i>.</span> 저는 이거 추천해요!!</p>
					<p class="request-p font-14"><span class="request-top5-i" style="color: #ff9e9e;">2.</span> 이런건 어떤가요</p>
					<p class="request-p font-14"><span class="request-top5-i" style="color: #ff9e9e;">3.</span> 으엑</p>
					<p class="request-p font-14"><span class="request-top5-i" style="color: #ff9e9e;">4.</span> 꼭 한번 읽어주세요</p>
					<p class="request-p font-14"><span class="request-top5-i" style="color: #ff9e9e;">5.</span> 펀딩 화이팅ㅇ!!</p>
					<p style="text-align: right;"><span class="font-12 red-hover-cursor">더 보기 <i class="fas fa-angle-double-right"></i></span></p>
				</div>
				
			</div>
		</div>
		
	</div>
	
	
			
	
			
			
			
			
	
</div>