<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<c:set var="isLogin" value="${not empty memberNo}"></c:set>
<c:set var="projectNo" value="${workingProject.projectNo}"></c:set>

<jsp:include page="/WEB-INF/views/template/header.jsp"/>

<style>
	html, body{
		height: 100%;
	}
</style>

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<script>
	$(function(){
		$("#result").hide();
		$("#textMin").hide();
		$("#textMax").hide();
		
		$(".category-btn").click(function(){
			$(".category-btn").removeClass("btn-clicked");
			
			$("#categoryInsertCancel").click();
			$("#result").show();
			
	        $(this).addClass("btn-clicked");
	        
	        $("input[name=categoryTheme]").val($(this).text());
		});
		
		$("textarea[name=projectSummary]").on("input", function(){
			$("#textSizeSpan").text($(this).val().length);
			if($(this).val().length > 50){
				$("#textSize").css("color", "red");
				$("#textMax").show();
			}
			else if($(this).val().length < 10 && $(this).val().length > 0){
				$("#textSize").css("color", "red");
				$("#textMin").show();
			}
			else{
				$("#textSize").css("color", "black");
				$("#textMin").hide();
				$("#textMax").hide();
			}
		});
		
		$("#categoryInsertText").hide();
		$("#categoryInsertCancel").hide();
		
		$("#categoryInsert").click(function(){
			$(".category-btn").removeClass("btn-clicked");
			$(this).hide();
			$("#categoryInsertText").show();
			$("#categoryInsertCancel").show();
			$("#result").hide();
		});
		
		$("#categoryInsertCancel").click(function(){
			$(this).hide();
			$("#categoryInsertText").hide();
			$("#categoryInsert").show();
			$("#categoryInsertText").val("");
			$("#categoryInsertText").css("background-color", "white");
			$("#result").hide();
		});
		
		$("#categoryInsertText").on("input", function(){
			if($(this).val().length == 0){
				$(this).css("background-color", "white");
				$("#result").hide();
			}
			else{
				$(this).css("font-weight", "bold");
				$(this).css("background-color", "rgb(235, 232, 163)");
				$("#result").show();
				$("input[name=categoryTheme]").val($(this).val());
			}
		});
		
		$("#projectInsertForm").on("submit", function(e){
			if($("textarea[name=projectSummary]").val().length < 10 || $("textarea[name=projectSummary]").val().length > 50){
				$("textarea[name=projectSummary]").focus();
				e.preventDefault();
			}
		});
		
		$("#workingProject").on("click", function(){
			location.href="${root}/project/${projectDto.projectNo}/projectMain";
		});
		
		
    
	});
</script>

<script id="categorySelected" type="text/template">
	
</script>

<section class="yb projectInsert main-row topLine section-background-image"
style="background-image: url('${root}/image/insertBackground.jpg');">

	<div class="projectInsert1 section-row section-opacity">

		<div class="projectInsert2 container-800 pt20">
			
			<c:if test="${projectDto.projectNo != null}">
				<div class="projectInsert3 mb30">
					<p class="fRed fBold f16 pb10">
						<i class="fas fa-exclamation-circle"></i> 작성 중인 프로젝트가 있습니다.
					</p>
						
					<button class="btn btn-hover w100p h80" id="workingProject">
						<div class="project-main-img w80 h100p"></div>
						<c:choose>
							<c:when test="${projectDto.projectTitle != null}">
								<div class="btn-text">${projectDto.projectTitle}</div>
							</c:when>
							<c:otherwise>
								<div class="btn-text">프로젝트 명이 설정되지 않았습니다.</div>
							</c:otherwise>
						</c:choose>
						<div class="btn-progress w140 h100p">
							<div class="btn-text">기획중 - 8% 완료</div>
						</div>
					</button>
				</div>
			</c:if>


			<div>
				<p class="f24 fBold pb10">멋진 아이디어가 있으시군요!</p>
				<p class="f24 fBold pb10">어떤 프로젝트를 계획 중이신가요?</p>
				<p class="f16 pb20">나중에 변경 가능하니 너무 걱정마세요.</p>
			</div>


			<div class="projectInsert3 mb30" style="width: 806px;">
				<ul id="categoryList" class="scrollThin">

					<c:forEach var="categoryDto" items="${categoryApproveList}">

						<li>
							<button class="btn btn-hover btn-inline w120 category-btn">${categoryDto.categoryTheme}</button>
						</li>

					</c:forEach>
					
						<li>
							<button id="categoryInsert" class="btn btn-insert btn-hover btn-inline w120">카테고리 추가</button>
							<input id="categoryInsertText" type="text" class="btn btn-inline w120">
						</li>
						
						<li>
							<button id="categoryInsertCancel"class="btn btn-insert btn-hover btn-inline w120">취소</button>
						</li>

				</ul>
			</div>
			

			<div id="result">
				<div>
					<p class="f24 fBold pb10">프로젝트를 간단하게 소개해주세요.</p>
					<p class="f16 pb20">나중에 수정 가능하니 편하게 적어주세요.</p>
				</div>
				
				<form id="projectInsertForm" action="projectInsert" method="post">
				
					<div class="bottomLine mb10">
						<textarea name="projectSummary" placeholder="프로젝트 요약을 입력해주세요." class="w100p h120 textarea-fix project-normal-border" required></textarea>
						<div class="float-container">
							<p id="textMin" class="f12 pb10 pt10 left fRed">최소 10자 이상 입력해주세요</p>
							<p id="textMax" class="f12 pb10 pt10 left fRed">최대 50자 이하로 입력해주세요</p>
							<p id="textSize" class="f12 pb10 pt10 right">(<span id="textSizeSpan">0</span><span>/50</span>)</p>
						</div>
					</div>
				
					<div class="projectInsert4 float-container">

						<input type="hidden" value="${memberNo}" name="memberNo">
						<input type="hidden" value="" name="categoryTheme">
					
						<input class="btn btn-insert btn-hover right" type="submit" value="프로젝트 생성하기">
					</div>
				
				</form>
				
			</div>

		</div>

	</div>

</section>

</body>
</html>