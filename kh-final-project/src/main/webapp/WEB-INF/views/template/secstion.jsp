<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
	
	$(function(){
		
		$.ajax({
			url : "${pageContext.request.contextPath}/project/data/index/indexProjectMain",
			type : 'get',
			success : function(resp) {
				console.log(resp);
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
				console.log(resp);
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
					
					console.log(resp[i].projectPercent);
					
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
	<div class="section-event" style="background-color: #dcdcdc;">
		
		이벤트 구현 위치
		
	</div>
	
	<div class="section-project-rrr">
		
		<div class="section-project-row-div">
			<p class="section-project-minaP">주목할 만한 프로젝트</p>
			
			<div class="section-project-main" id="sectionProjectMain1">
			
			</div>
		</div>
		
		<div class="section-project-row-div">
			<p class="section-project-minaP">공개 예정 프로젝트</p>
			
			<div class="section-project-main">
			
				<div class="section-project-main2" id="sectionProjectMain2">
			
				</div>
			</div>
		</div>
		
		<div class="section-project-row-div">
			<p class="section-project-minaP">인기 추천 프로젝트</p>
			
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
		
		<div class="section-projectRequest-row-div">
			<p class="section-project-minaP">프로젝트 요청 게시판</p>
			인기 게시글
			목록
		</div>
		
	</div>
	
	
			
	
			
			
			
			
	
</div>