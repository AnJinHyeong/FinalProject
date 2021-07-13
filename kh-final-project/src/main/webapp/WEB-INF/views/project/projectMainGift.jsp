<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<c:set var="projectNo" value="${projectNo}"></c:set>

<jsp:include page="/WEB-INF/views/project/projectHeader.jsp">
	<jsp:param value="${root}/project/${projectNo}/projectMainGift"
		name="division" />
</jsp:include>

<script>
	$(function() {
		$("#itemListToggle").on("click", function(){
			$(this).siblings("i").toggleClass("rotate");
			$(this).siblings("i").toggleClass("reverse");
			$("#itemList").toggle('fast');
			$("#itemListAddBtn").toggle('fast');
		});
		
		$("#itemSelectBtn").on("click", function(){
			$("input[name=selectedItemList]:checked").each(function(index, item){
				console.log($(this));
			});
			$("#itemListToggle").click();
		});
	});
</script>

<section class="main-row topLine">

	<div class="bottomLine project-main-header4" style="position: fixed;">
		<div class="container-1200 h35 mCenter">
			<ul class="project-main-ul">
				<li class="project-main-li2"><a
					href="${root}/project/${projectNo}/projectMainGift"
					class="main-li-a2 on"> <i class="fas fa-gift mr5"></i> 선물
				</a></li>
				<li class="project-main-li2"><a
					href="${root}/project/${projectNo}/projectMainGiftItem"
					class="main-li-a2"> <i class="fas fa-list mr5"></i> 아이템
				</a></li>
			</ul>
		</div>
	</div>

	<div class="project-back-color" style="height: 1900px;">

		<div class="section-row" style="padding-top: 10px;">

			<div class="project-insert-div" style="height: 300px;">
				<div class="project-insert-dl">

					<div class="project-insert-dt">
						내가 만든 선물 (<span id="giftCount">${giftCount}33</span>)
					</div>

					<div id="giftListNone" class="project-insert-gift-item-div h200">
						<p>만든 선물이 없습니다</p>
					</div>

				</div>

				<div class="projcet-insert-div2">
					<div>
						<p class="project-insert-p">선물 만들기</p>

						<c:choose>
							<c:when test="${itemCount == 0}">
								<div id="giftListNone" class="project-insert-gift-item-div w620">
									<div class="h70p">
										<pre>선물은 후원자에게 프로젝트의 가치를 전달하는 수단입니다.
												다양한 금액대로 여러 개의 선물을 만들어주세요.
												펀딩 성공률이 높아지고, 더 많은 후원 금액을 모금할 수 있어요.
												아직 선물을 구성할 아이템이 없네요.</pre>
									</div>
									<div class="h30p">
										<a href="${root}/project/${projectNo}/projectMainGiftItem"><button
												class="project-btn btn3 project-btn-hover">아이템 생성하기</button></a>
									</div>
								</div>
							</c:when>
							<c:otherwise>
								<div id="giftList" class="project-insert-gift-div w620">
									<div class="h100 bottomLine">
										<pre>선물은 후원자에게 프로젝트의 가치를 전달하는 수단입니다.
												다양한 금액대로 여러 개의 선물을 만들어주세요.
												펀딩 성공률이 높아지고, 더 많은 후원 금액을 모금할 수 있어요.</pre>
									</div>
									<div class="mh160 bottomLine">
										<p class="fBold f16">선물 아이템</p>
										<p>선물을 구성하는 아이템을 선택해 주세요</p>
										<div class="project-insert-div3">
											<button id="itemListToggle" class="project-btn btn4 w100p">아이템을
												선택해주세요</button>
											<i class="itemListIcon yb fas fa-chevron-down reverse"></i>
										</div>
										
										
										<div id="itemList" class="project-gift-item-list displayNone w100p h300">
											<div>
												<ul>
													<c:forEach var="itemDto" items="${itemList}">
														
														<li>
														
															<div class="project-item-checkbox-wrap bottomLine">
																<input type="checkbox" name="selectedItemList" id="${itemDto.itemName}" class="project-item-checkbox">
																<label class="project-item-checkbox-label" for="${itemDto.itemName}">
																<span class="project-item-checkbox-text">${itemDto.itemName}</span></label>
															</div>
														
														</li>
														
													</c:forEach>
												</ul>
											</div>
										</div>
										<div id="itemListAddBtn" class="h60 displayNone">
											<div class="project-insert-div3">
												<button id="itemSelectBtn" class="project-btn btn3 project-btn-hover"
													style="margin-right: 0px">선택완료</button>
											</div>
										</div>
										
									</div>
									<div class="h300">dd</div>
								</div>

								<div class="project-insert-div3">
									<input class="project-btn btn3 project-btn-hover"
										style="margin-right: 0px" type="submit" value="등록">
								</div>
							</c:otherwise>
						</c:choose>

					</div>
				</div>

			</div>

		</div>

	</div>

</section>

</body>
</html>