<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>

<link rel="stylesheet" type="text/css" href="${root}/css/yongbo.css">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>

<style>
	html, body{
		background-color: rgba(180, 253, 11, 0.05);
	}
</style>

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<script>
	$(function(){
		
		var bodyWidth = $("body").width();
		var startEnd = (bodyWidth - 1200) / 2 - 30;
		var endStart = (bodyWidth - 1200) / 2 + 1200 + 30;
		
		for(var i = 0 ; i < 25 ; i++){
			var template = $("#footPrintTemplate").html();
			
			template = template.replace("{{left}}", Math.random() * startEnd);
			template = template.replace("{{top}}", Math.random() * 1200);
			template = template.replace("{{rotate}}", Math.random() * 360);
			
			$("#result").append(template);
		}
		
		for(var i = 0 ; i < 25 ; i++){
			var template = $("#footPrintTemplate").html();
			
			template = template.replace("{{left}}", Math.random() * startEnd + endStart);
			template = template.replace("{{top}}", Math.random() * 1200);
			template = template.replace("{{rotate}}", Math.random() * 360);
			
			$("#result").append(template);
		}
		
		for (var i = 0; i < mainBannerImageCount; i++) {
			var template = $("#RollingImageTemplate").html();
			template = template.replace("{{left}}", left + "px");

			var url = "${pageContext.request.contextPath}/image/project/projectMainDownload/693";
			template = template.replace("{{projectImage}}", url);

			$("#mainBannerContainer").append(template);
			left = left + width;
		}
		
	});
</script>

<script id="footPrintTemplate" type="text/template">
	<div style="position: fixed; left: {{left}}px; top: {{top}}px; transform: rotate({{rotate}}deg); font-size: 28px; color: #BCED36; z-index: 0">
		<i class="fas fa-paw"></i>
	</div>
</script>

<script id="RollingImageTemplate" type="text/template">
	<div class="mainBannerImage w100p h100p poAbsolute" style="left: {{left}};">
		<img class="w700 h100p rollingImage" src="{{projectImage}}">
	</div>
</script>

<div id="result">
	<div style="width: 1200px; height: 1000px; margin: 0 auto; background-color: white;">
		<i class="right fas fa-dog"></i>
		<button id="imagePreBtn">이전</button>
			<div id="mainBannerContainer" class="w700 h400 bocBlack bow1 bosSolid scrollNone poRelative">
				
			</div>
		<button id="imageNextBtn">다음</button>
	</div>
</div>


	