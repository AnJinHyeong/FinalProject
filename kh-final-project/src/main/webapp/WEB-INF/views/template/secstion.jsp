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
	<div class="section-event" style="background-color: #dcdcdc;">
		
		이벤트 구현 위치
		
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