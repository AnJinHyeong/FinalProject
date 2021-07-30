<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="root" value="${pageContext.request.contextPath}"></c:set>

<script>
	
	$(function(){
		var mainBannerImageCount = ${mainBannerImageCount};
		var width = 700;
		var left = -width;
		var maxLeft = (mainBannerImageCount - 2) * width;
    
		var currentNo = 1;
		
		var playRolling;
		
		
		
		
		
		var startPlayRolling = setTimeout(function() {
			imageRollingNext($("#imageNextBtn"));
		}, 3000);
		
		$("#imageNextBtn, #imagePreBtn").one("click", function() {
			clearTimeout(startPlayRolling);
		});
		
		function imageRollingNext(btn){
			btn.prop("disabled", true);
			
			clearInterval(playRolling);
			playRolling = setInterval(function() {
				imageRollingNext($("#imageNextBtn"));
			}, 3000);
			
			$(".mainBannerImage").each(function(index, item){
				if($(this).css("left") == "-" + width + "px"){
					$(this).css("left", maxLeft + "px");
				}
				else{
					$(this).animate({"left": (Number($(this).css("left").split("px")[0]) - width) + "px"}, 300, "swing", function(){
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
					$("#mainBannerTextContainer").animate({"background-color": resp.bannerBackgroundColor, 
															"color": resp.bannerColor}, 300);
				}
			});
		}
		
		$("#imageNextBtn").on("click", function(){
			imageRollingNext($(this))
		});
		
		
		function imageRollingPre(btn){
			btn.prop("disabled", true);
			var that = btn;
			
			clearInterval(playRolling);
			playRolling = setInterval(function() {
				imageRollingNext($("#imageNextBtn"));
			}, 3000);
			
			$(".mainBannerImage").each(function(index, item){
				if($(this).css("left") == maxLeft + "px"){
					$(this).css("left", "-" + width + "px");
				}
				else{
					$(this).animate({"left": (Number($(this).css("left").split("px")[0]) + width) + "px"}, 300, "swing", function(){
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
					$("#mainBannerTextContainer").animate({"background-color": resp.bannerBackgroundColor, 
															"color": resp.bannerColor}, 300);
				}
			});
		}
		
		$("#imagePreBtn").on("click", function(){
			imageRollingPre($(this))
		});
		
</script>

