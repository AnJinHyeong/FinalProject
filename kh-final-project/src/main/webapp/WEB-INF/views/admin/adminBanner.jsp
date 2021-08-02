<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>

<jsp:include page="/WEB-INF/views/template/adminSidebar.jsp"></jsp:include>

<script>
	$(function(){
		$(".deleteBanner").on("click", function(e){
			var deleteOk = confirm("배너를 지우시겠습니까?");
			if(!deleteOk){
				e.preventDefault();
			}
		});
		
		$(".target").on("click", function(){
			var src = "${pageContext.request.contextPath}/image/downloadImageMainBanner/";
			var targetImageNo = $(this).children(".imageNo").text();
			src = src + targetImageNo;
			$("#targetImage").attr("src", src);
			$("#mainBannerTitle").text($(this).children(".bannerTitle").text());
			$("#mainBannerContent").text($(this).children(".bannerContent").text());
			$("#mainBannerTextContainer").css("background-color", $(this).children(".bannerBackgroundColor").text());
			$("#mainBannerTextContainer").css("color", $(this).children(".bannerColor").text());
		});
		
		$(".admin-home-content-list").on("click", function(){
			$(".admin-home-content-list").removeClass("on");
			$(this).addClass("on");
		});
		
		$(".admin-home-content-list").children().on("click", function(){
			$(".admin-home-content-list").removeClass("on");
			$(this).addClass("on");
		});
		
	});
</script>

	<section>
		<div class="admin-home_content_area">
			<div class="admin-home_content100">
				<p class="admin-home-top-p">배너 관리</p>
			</div>
		</div>
		
		<div class="admin-home_content_area" style="height: 450px;">
			<div class="admin-home_content100" style="border: none; padding: 10px;">
				<div style="width: 100%; border-bottom: 1px solid rgba(0,0,0,0.2); padding: 0 0 5px 5px;">
					<p class="admin-home-content-p">배너 목록</p>
				</div>
				<div class="admin-project-div2" style="display: block;">
				
					<div class="admin-home-content-list">
						<span style="width: 6%;">배너번호</span>
						<span style="width: 24%;">배너타이틀</span>
						<span style="width: 40%;">배너내용</span>
						<span style="width: 8%;">배너배경색</span>
						<span style="width: 8%;">배너글씨색</span>
						<span style="width: 10%;">배너이미지번호</span>
						<span style="width: 4%;">삭제</span>
					</div>
					
					<div class="admin-home-content-list-div" style="height: 250px;">
						<c:forEach var="bannerVo" items="${bannerList}">
							<div class="admin-home-content-list target">
								<span class="bannerNo" style="width: 6%;">${bannerVo.bannerNo}</span>
								<span class="bannerTitle" style="width: 24%;">${bannerVo.bannerTitle}</span>
								<span class="bannerContent" style="width: 40%;">${bannerVo.bannerContent}</span>
								<span class="bannerBackgroundColor" style="width: 8%;">${bannerVo.bannerBackgroundColor}</span>
								<span class="bannerColor" style="width: 8%;">${bannerVo.bannerColor}</span>
								<span class="imageNo" style="width: 10%;">${bannerVo.bannerImageNo}</span>
								<div style="width: 4%;">
									<form action="${root}/banner/bannerDelete">
										<input type="hidden" name="bannerNo" value="${bannerVo.bannerNo}">
										<input type="hidden" name="bannerImageNo" value="${bannerVo.bannerImageNo}">
										<input class="deleteBanner admin-btn" type="submit" value="삭제">
									</form>
								</div>
							</div>
						</c:forEach>
					</div>
					
					<div class="admin-home-content-list">
						<div id="insertBannerForm" style="width: 100%; height: 60px;" class="admin-home-content-list-div">
							<form action="${root}/banner/bannerInsert" method="post" enctype="multipart/form-data" style="display: flex;">
								<span style="width: 6%;">배너 등록</span>
								<input class="admin-inputBox" style="width: 24%; margin-right: 20px; height: 30px;" type="text" name="bannerTitle" placeholder="배너타이틀" required
								autocomplete="off">
								<input class="admin-inputBox" style="width: 40%; margin-right: 20px; height: 30px;" type="text" name="bannerContent" placeholder="배너내용" required 
								autocomplete="off">
								<input style="width: 8%; margin-right: 20px; height: 30px;" type="color" name="bannerBackgroundColor" value="#ffffff" required>
								<select class="admin-inputBox" style="width: 8%; margin-right: 20px; height: 30px;" name="bannerColor">
									<option value="#000000">검정
									<option value="#ffffff">흰색
								</select>
								<input style="width: 10%; margin-right: 20px; height: 30px;" type="file" name="bannerImage" required>
								<input style="width: 4%; margin-right: 20px; height: 30px;" type="submit" value="등록" class="admin-btn">
							</form>
						</div>
					</div>
					
				</div>
			</div>
		</div>
		
		<div class="admin-home_content_area" style="height: 400px;">
			<div class="admin-home_content100" style="border: none; padding: 10px;">
				
				<div style="width: 100%; border-bottom: 1px solid rgba(0,0,0,0.2); padding: 0 0 5px 5px; margin-bottom: 10px;">
					<p class="admin-home-content-p">배너 상세 보기</p>
				</div>
				<div class="admin-project-div2" style="display: flex; justify-content: center;">
				
					<div style="width:800px; height: 450px;">
						<img id="targetImage" style="width: 100%; height: 100%; object-fit:cover;">
					</div>
					
					<div id="mainBannerTextContainer" style="width:400px; height: 450px; padding-top: 100px; padding-left: 30px; padding-right: 30px; border: 1px solid rgb(220, 220, 220); text-align: left;">
						
						<div class="mb20 h80">
							<span id="mainBannerTitle" style="font-size: 30px; font-weight: bold"></span>
						</div>
						<div class="mb50 h80">
							<span id="mainBannerContent" style="font-size: 12px;"></span>
						</div>
						
					</div>
					
				</div>
				
			</div>
		</div>
		
	</section>
</body>
</html>