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
		$("#itemListToggle").on("click", function() {
			$(this).siblings("i").toggleClass("rotate");
			$(this).siblings("i").toggleClass("reverse");
			$("#itemList").toggle('fast');
			$("#itemListAddBtn").toggle('fast');
		});

		if ($("#giftCount").html() > 0) {
			$("#giftListNone").hide();
		} else {
			$("#giftListNone").show();
		};
		
		$("#itemSelectBtn")
				.on(
						"click",
						function() {
							var selectedItems = [];
							$("input[name=selectedItemList]:checked").each(
									function(index, item) {
										selectedItems.push($(this).val());
									});
							$("#itemListToggle").click();

							$
									.ajax({
										url : "${pageContext.request.contextPath}/project/data/selectedItemList",
										type : 'GET',
										data : {
											"selectedItems" : selectedItems
										},
										success : function(resp) {
											console.log(resp);
											$("#search-result").empty();
											for (var i = 0 ; i < resp.length ; i++){
												var template = $("#list-item-template").html();
												template = template.replace("{{name}}", resp[i].itemName);
												$("#search-result").append(template);
											}
										}
									});

						});

		$("#scrollDown").on("click", function() {
			$(".scrollBlind").animate({
				scrollTop : '+=200'
			}, 200);
		});
		$("#scrollUp").on("click", function() {
			$(".scrollBlind").animate({
				scrollTop : '-=200'
			}, 200);
		});

		var giftListHeight = $('#giftList').height();
		if (giftListHeight < 400) {
			$("#scrollDown").hide();
			$("#scrollUp").hide();
		}
	});
</script>


<script id="list-item-template" type="text/template">
	<div class="float-container w100p project-border-normal mb20" style="min-height: 60px; vertical-align: middle;">
		<div class="w70p left p20" style="word-break: break-all;">
    		<span>{{name}}</span>
		</div>
		<div class="right w10p p20">
			<div class="project-border-normal w50 h30" style="background-color: blue; display: block;">
			</div>
		</div>
		<div class="right w20p p20">
			<div class="project-border-normal w100 h30" style="background-color: black; display: block;">
			</div>
		</div>
    </div>
</script>


<section class="yb main-row topLine">

	<div class="bottomLine project-main-header4">
		<div class="container-1200 h35 mhCenter">
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

	<div class="projectMainGiftAndItem1">

		<div class="section-row pt10">

			<div class="float-container mt100">
				<div class="projectMainGiftAndItemList left">

					<div class="project-insert-dt">
						내가 만든 선물 (<span id="giftCount">${giftCount}</span>)
					</div>

					<div id="giftListNone" class="project-insert-gift-item-div h200">
						<p>만든 선물이 없습니다</p>
					</div>

					<div id="giftList" class="project-itemList scrollBlind">
						<c:forEach var="giftDto" items="${giftList}">
							<div class="project-insert-item-list float-container">
								<span id="giftName" class="left w260">${giftDto.giftSummary}</span>
								<span id="giftNo" class="yb hidden">${giftDto.giftNo}</span> <span
									class="yb modalX right"> <i class="fas fa-times"></i></span>
							</div>
						</c:forEach>
					</div>

					<div class="float-container">
						<button id="scrollUp"
							class="left h20 w50p pRel m0 p0 btnNone project-background-white project-border-radius">
							<i class="fas fa-chevron-up pAbs pAbsCenter"></i>
						</button>
						<button id="scrollDown"
							class="right h20 w50p pRel m0 p0 btnNone project-background-white project-border-radius">
							<i class="fas fa-chevron-down pAbs pAbsCenter"></i>
						</button>
					</div>

				</div>

				<div
					class="mt40 w700 right project-background-white project-border-radius">
					<!-- 					<form id="projectMainGiftInsertForm" -->
					<!-- 						action="projectMainGift" method="post"> -->
					<input type="hidden" value="${projectNo}" name="projectNo">
					<div class="p50">
						<div class="w100p mb30">
							<span class="f16 fBold w100p" style="display: block;">선물
								만들기</span>
						</div>

						<div class="w100p mt30">
							<pre class="f12 w100p"
								style="white-space: pre-line; line-height: 20px">
								선물은 후원자에게 프로젝트의 가치를 전달하는 수단입니다.
								다양한 금액대로 여러 개의 선물을 만들어주세요.
								펀딩 성공률이 높아지고, 더 많은 후원 금액을 모금할 수 있어요.</pre>
							<c:choose>
								<c:when test="${itemCount == 0}">
									<pre class="f12 w100p pt60 tac"
										style="white-space: pre-line; line-height: 20px">
								아직 선물을 구성할 아이템이 없네요.</pre>
									<div class="h30p pt20">
										<a href="${root}/project/${projectNo}/projectMainGiftItem"><button
												class="project-btn btn3 project-btn-hover w100p">아이템
												생성하기</button></a>
									</div>
								</c:when>
								<c:otherwise>
									<div class="mt50">
										<p class="fBold f12 mb20">선물 아이템</p>
										<p class="f12">선물을 구성하는 아이템을 선택해 주세요.</p>
										<div class="project-insert-div3">
											<button id="itemListToggle" class="project-btn btn4 w100p">아이템을
												선택해주세요.</button>
											<i class="itemListIcon yb fas fa-chevron-down reverse"></i>
										</div>
									</div>

									<div id="itemList"
										class="topLine displayNone w100p project-gift-item-list scrollBlind pt20">
										<div>
											<ul>
												<c:forEach var="itemDto" items="${itemList}">

													<li>

														<div class="project-item-checkbox-wrap">
															<input type="checkbox" name="selectedItemList"
																id="${itemDto.itemNo}" value="${itemDto.itemNo}"
																class="project-item-checkbox"> <label
																class="project-item-checkbox-label"
																for="${itemDto.itemNo}"> <span
																class="project-item-checkbox-text">${itemDto.itemName}</span></label>
														</div>

													</li>

												</c:forEach>
											</ul>
										</div>
									</div>

									<div id="itemListAddBtn" class="h60 displayNone bottomLine">
										<div class="project-insert-div3">
											<button id="itemSelectBtn"
												class="project-btn btn3 project-btn-hover"
												style="margin-right: 0px">선택완료</button>
										</div>
									</div>

								</c:otherwise>
							</c:choose>

							<div id="search-result" class="scrollBlind"
								style="max-height: 400px; overflow-x: hidden"></div>

							<form action="projectMainGift" method="post">
							
<%-- 							<input type="hidden" name="projectNo" value="${projectNo}"> --%>
<%-- 							<input type="hidden" name="memberNo" value="${memberNo}"> --%>
							
								<div class="mt50">
									<p class="fBold f12 mb20">선물 설명</p>
									<p class="f12">선물에 대한 설명을 입력해주세요.</p>
									<div class="project-insert-div3">
										<input type="text" class="projcet-insert-input p20 w100p"
											name="giftSummary" autocomplete="off"
											placeholder="ex. 선물세트A, 배송비 포함">
									</div>
								</div>

								<div class="mt70">
									<p class="fBold f12 mb20">최소 후원 금액</p>
									<p class="f12">배송이 필요한 선물은 배송비를 포함해주세요.</p>
									<div class="project-insert-div3">
										<input type="text" class="projcet-insert-input p20 w100p"
											name="giftPrice" autocomplete="off" placeholder="금액을 입력해주세요.">
									</div>
								</div>

								<c:if test="${itemCount != 0}">
									<div class="project-insert-div3 mt50">
										<input class="project-btn btn3 project-btn-hover"
											style="margin-right: 0px" type="submit" value="등록">
									</div>
								</c:if>

							</form>

						</div>

					</div>
				</div>

			</div>

		</div>

	</div>

</section>

</body>
</html>