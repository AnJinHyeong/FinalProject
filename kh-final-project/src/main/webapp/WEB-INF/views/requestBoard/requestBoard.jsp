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
		
		//위에 태그 변경시 div 변경
		$("#projectRequestDiv2").hide();
		
		$("#main-li-1").on("click", function(){
			$("#projectRequestDiv1").show();
			$("#projectRequestDiv2").hide();
		});
		
		$("#main-li-2").on("click", function(){
			$("#projectRequestDiv1").hide();
			$("#projectRequestDiv2").show();
		});
		
		
		
	});
</script>

<script id="requestDiv-contentDiv" type="text/template">
	<div class="topLine bottomLine request-div">
		<span class="font-12" style="text-align: center; width: 5%;">1</span>
		<span class="font-12" style="text-align: center; width: 10%;">카테고리</span>
		<span class="font-12" style="text-align: left; width: 75%;">글 제목</span>
		<span class="font-12 red" style="text-align: right; width: 5%;"><i class='far fa-heart'></i></span>
		<span class="font-12" style="text-align: right; width: 5%;" class="font-12"><i class="far fa-comment"></i></span>
	</div>
</script>

<section class="main-row topLine">
	<div>
		<div class="mt30 poRelative">
			<div style="width: 1200px; margin: 20px auto;">
				<p class="fs34 pl20"><strong>자유 게시판</strong></p>
			</div>
		</div>
		
		<div class="mt30 bottomLine poRelative">
			<div class="w1200 h35" style="margin: 0 auto;">
				<ul class="project-main-ul">
					<li class="project-main-li main-li-on" id="main-li-1"><a class="main-li-a cursorPointer">소통 공간</a></li>
					<li class="project-main-li" id="main-li-2"><a class="main-li-a cursorPointer">글 쓰기</a></li>
				</ul>
			</div>
		</div>
	</div>
	
	<div class="backimage">
		<div class="container-1200" style="margin: 0 auto; height: 700px; display: flex; flex-wrap: wrap;" id="projectRequestDiv1">
		
			<div class="container-700 hMax650 mt30 mb30 scrollThin" id="requestDiv">
				<c:forEach var="request" items="${request}">
					<a href="${pageContext.request.contextPath}/requestBoard/requestBoardContent/${request.requestNo}">
						<div class="topLine bottomLine request-div">
							<span class="font-12" style="text-align: center; width: 5%;">${request.requestNo}</span>
							<span class="font-12" style="text-align: center; width: 10%;">${request.categoryTheme}</span>
							<span class="font-12" style="text-align: left; width: 75%;">${request.requestTitle}</span>
							<span class="font-12 red" style="text-align: right; width: 5%;"><i class='far fa-heart'></i></span>
							<span class="font-12" style="text-align: right; width: 5%;" class="font-12"><i class="far fa-comment"></i></span>
						</div>
					</a>
				</c:forEach>
			</div>
			
			<div class="container-400 hMax600 mt30 mb30">
			
				<div style="width: 100%; height: 300px; border: 1px solid #dcdcdc; border-radius: 8px; margin: 20px 0; padding: 20px;">
					<strong class="font-20"><span class="font-20 red"><i class="fas fa-heart"></i></span> 인기 TOP5 게시글</strong>
					<p class="request-p font-14"><span class="request-top5-i" style="color: #ff9e9e;"><i class="fas fa-crown"></i>.</span> 저는 이거 추천해요!!</p>
					<p class="request-p font-14"><span class="request-top5-i" style="color: #ff9e9e;">2.</span> 이런건 어떤가요</p>
					<p class="request-p font-14"><span class="request-top5-i" style="color: #ff9e9e;">3.</span> 으엑</p>
					<p class="request-p font-14"><span class="request-top5-i" style="color: #ff9e9e;">4.</span> 꼭 한번 읽어주세요</p>
					<p class="request-p font-14"><span class="request-top5-i" style="color: #ff9e9e;">5.</span> 펀딩 화이팅ㅇ!!</p>
				</div>
			
				<div style="width: 100%; height: 300px; border: 1px solid #dcdcdc; border-radius: 8px; margin: 20px 0; padding: 20px;">
					<strong class="font-20"><span class="font-20 red"><i class="fas fa-comment-alt"></i></span> 사람들이 많이 찾은 게시글</strong>
					<p class="request-p font-14"><span class="request-top5-i" style="color: #ff9e9e;"><i class="fas fa-crown"></i>.</span> 저는 이거 추천해요!!</p>
					<p class="request-p font-14"><span class="request-top5-i" style="color: #ff9e9e;">2.</span> 이런건 어떤가요</p>
					<p class="request-p font-14"><span class="request-top5-i" style="color: #ff9e9e;">3.</span> 으엑</p>
					<p class="request-p font-14"><span class="request-top5-i" style="color: #ff9e9e;">4.</span> 꼭 한번 읽어주세요</p>
					<p class="request-p font-14"><span class="request-top5-i" style="color: #ff9e9e;">5.</span> 펀딩 화이팅ㅇ!!</p>
				</div>
				
			</div>
		</div>
		
		<div class="container-1200" style="margin: 0 auto; height: 700px;" id="projectRequestDiv2">
			<c:choose>
				<c:when test="${not empty memberNo}">
					<div class="container-1200 h700 mt30 mb30" style="border: 1px solid #dcdcdc; border-radius: 8px;">
						<div style="height: 100%; width: 100%;">
							<p style="padding-left: 20px; font-size: 25px; font-weight: bold; width: 1100px; margin: 20px auto; border-bottom: 1px solid red; padding-bottom: 5px;">게시글 등록</p>
						
							<form action="requestInsert" method="post">
								<div class="request-insert-div">
									<dl class="request-insert-dl">
										<dt class="request-insert-dt">
											제목
										</dt> 
									</dl>
									<div class="request-insert-div2">
										<div>
											<input type="text" required autocomplete="off" name="requestTitle" style="width: 620px; height: 40px; border: 1px solid rgb(240, 240, 240);">
										</div>
									</div>
								</div>
								
								
								<div class="request-insert-div">
									<dl class="request-insert-dl">
										<dt class="request-insert-dt">
											게시글 카테고리
										</dt> 
									</dl>
									<div class="request-insert-div2">
										<div>
											<p class="request-insert-p">카테고리</p>
											<select class="request-insert-select" id="parentsCategory" name="requestCategoryNo">
												<option>선택해주세요.</option>
												<c:forEach var="category" items="${category}">
													<option value="${category.categoryNo}">${category.categoryTheme}</option>
												</c:forEach>
											</select>
											<p class="project-insert-font font-on" style="font-size: 12px; margin-top: 5px;"> </p>
										</div>
									</div>
								</div>
								
								<div class="request-insert-div" style="margin-bottom: 100px;">
									<dl class="request-insert-dl">
										<dt class="request-insert-dt">
											내용
										</dt> 
									</dl>
									<div class="request-insert-div2">
										<div>
											<p class="project-insert-p">요약 내용</p>
											<textarea class="project-insert-text" rows="1" name="requestContent" required autocomplete="off" style="height: 150px;"></textarea>
										</div>
									</div>
								</div>
								
								<div class="project-insert-div3" style="width: 1100px; margin: 0 0 0 40px; padding-top: 20px;">
									<input class="request-btn" type="submit" value="저장">
								</div>
							</form>					
						</div>
					</div>
				</c:when>
				<c:otherwise>
					<div class="container-1200 h700 mt30 mb30" style="border: 1px solid #dcdcdc; border-radius: 8px;">
						<div style="height: 100px; width: 400px; margin: 300px auto; text-align: center;">
							<strong style="font-size: 25px; width: 100%;">로그인 후 이용이 가능합니다.</strong>
							<a href="${pageContext.request.contextPath}/member/login"><button class="request-btn" style="width: 90%; height: 50px; margin: 20px 0 0 0;">로그인</button></a>
						</div>
					</div>
				</c:otherwise>
			</c:choose>
				
		</div>
	</div>
</section>

</body>
</html>
	
