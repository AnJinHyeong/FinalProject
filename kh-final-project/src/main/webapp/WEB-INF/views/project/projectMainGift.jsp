<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<c:set var="projectNo" value="${projectNo}"></c:set>

<jsp:include page="/WEB-INF/views/project/projectHeader.jsp">
	<jsp:param value="${root}/project/${projectNo}/projectMainGift" name="division" />
</jsp:include>

<script>
	$(function() {
		var itemListHeight = $('#itemList').height();

		$("#itemListToggle").on("click", function() {
			$(this).siblings("i").toggleClass("rotate");
			$(this).siblings("i").toggleClass("reverse");
			$("#itemList").toggle('fast');
			$("#itemListAddBtn").toggle('fast');
			if (itemListHeight >= 229) {
				$("#scrollDown2").toggle('fast');
				$("#scrollUp2").toggle('fast');
			}
		});

		if ($("#giftCount").html() > 0) {
			$("#giftListNone").hide();
			$("#giftListBasic").show();
		} else {
			$("#giftListNone").show();
			$("#giftListBasic").hide();
		}
		;

		function itemSelectAjax(selectedItems) {
			if (selectedItems.length > 0) {
				$.ajax({
					url : "${pageContext.request.contextPath}/project/data/selectedItemList",
					type : 'get',
					data : {
						"selectedItems" : selectedItems
					},
					success : function(resp) {
						$("#search-result").empty();
						for (var i = 0; i < resp.length; i++) {
							var template = $("#list-item-template").html();
							template = template.replace("{{indexNo}}", i);
							template = template.replace("{{indexNo}}", i);
							template = template.replace("{{no}}", resp[i].itemNo);
							template = template.replace("{{name}}", resp[i].itemName);
							$("#search-result").append(template);
						}

						$(".itemDeselect").on("click", function() {
							var target = $(this).parent().siblings().find(".itemNo").val();
							console.log(target);
							$('input[value=' + target + ']').prop("checked", false);
							var selectedItems = [];
							$("input[name=selectedItemList]:checked").each(function(index, item) {
								selectedItems.push($(this).val());
							});
							itemSelectAjax(selectedItems);
						});
						
						$(".itemCountMinus").on("click", function(){
							var currentValue = $(this).siblings("input[type=number]").val();
							currentValue = Number(currentValue) - 1;
							if(currentValue < 1){
								currentValue = 1;
							}
							$(this).siblings("input[type=number]").val(currentValue);
						});
						
						$(".itemCountPlus").on("click", function(){
							var currentValue = $(this).siblings("input[type=number]").val();
							currentValue = Number(currentValue) + 1;
							if(currentValue > 1000){
								currentValue = 1000;
							}
							$(this).siblings("input[type=number]").val(currentValue);
						});
						
					},
					error : function() {
						$("#search-result").empty();
					},
					complete : function() {
						if ($("#search-result").height() == 300) {
							$("#scrollDown3").show();
							$("#scrollUp3").show();
						} else {
							$("#scrollDown3").hide();
							$("#scrollUp3").hide();
						}
					}
				});
			} else {
				$("#search-result").empty();
				$("#scrollDown3").hide();
				$("#scrollUp3").hide();
			}
		}
		;

		$("#itemSelectBtn").on("click", function() {
			var selectedItems = [];
			$("input[name=selectedItemList]:checked").each(function(index, item) {
				selectedItems.push($(this).val());
			});
			$("#itemListToggle").click();

			if (selectedItems.length > 0) {
				itemSelectAjax(selectedItems);
			} else {
				$("#search-result").empty();
				$("#scrollDown3").hide();
				$("#scrollUp3").hide();
			}

		});

		$(".scrollDown").on("click", function() {
			$(this).parents().siblings(".scrollBlind").animate({
				scrollTop : '+=200'
			}, 200);
		});
		$(".scrollUp").on("click", function() {
			$(this).parents().siblings(".scrollBlind").animate({
				scrollTop : '-=200'
			}, 200);
		});

		var giftListHeight = $('#giftList').height();
		if (giftListHeight < 790) {
			$("#scrollDown").hide();
			$("#scrollUp").hide();
		}

		$(".modalX").on("click", function() {
			$("input[name=giftNo]").val($(this).parents().siblings("#giftNo").html());
			$("#modal-target").text($(this).siblings("#giftPrice").html());
			$("#modal-target2").text($(this).parents().siblings("div").children("#giftSummary").html());
			$("#modal").toggle();
			$("#modalBackground").toggle();
			$('body').toggleClass('scrollOff');
		});

		$("#modalBackground").on("click", function() {
			$("#modal").hide();
			$("#modalBackground").hide();
		});

		$("input[name=giftPrice]").blur("input", function() {
			var giftPrice = $(this).val();
			var regexPw = /^[1-9][0-9]{0,8}/;
			if (regexPw.test(giftPrice) || (giftPrice == 0)) {
				$("#priceError").hide();
			} else {
				$(this).val("");
				$("#priceError").show();
			}
		});
		
		$("input[name=giftSummary]").on("input", function() {
			$("#textSizeSpan").text($(this).val().length);
			if ($(this).val().length > 50) {
				$("#textSize").css("color", "red");
				$("#textMax").show();
			} else if ($(this).val().length < 10 && $(this).val().length > 0) {
				$("#textSize").css("color", "red");
				$("#textMin").show();
			} else {
				$("#textSize").css("color", "black");
				$("#textMin").hide();
				$("#textMax").hide();
			}
		});

	});
</script>


<script id="list-item-template" type="text/template">

	<div class="boc230 bosSolid bow1 dpFlex dpFlexCenter mb10">
		<div class="w60p p20" style="word-break: break-all;">
    		<span class=".itemName">{{name}}</span>
		</div>
		<div class="w20p h40 dpFlex boc230 bosSolid bow1 ml30 mr20">
			<input class="itemNo" type="hidden" name="itemList[{{indexNo}}].itemNo" value="{{no}}">
			<button class="cursorPointer bosNone w30 h100p fBold fs12 itemCountMinus bacWhite" type="button">-</button>
			<input class="inputNumberNone taCenter inputFocusNone w50 h100p bosNone" type="number" name="itemList[{{indexNo}}].itemQuantity" value="1" min="1" max="1000">
			<button class="cursorPointer bosNone w30 h100p fBold fs12 itemCountPlus bacWhite" type="button">+</button>
		</div>
		<div class="w10p h40">
			<button type="button" class="project-gift-item-delete-btn w50 h100p itemDeselect boc230 bosSolid bow1 bacWhite fc120">삭제</button>
		</div>
    </div>
</script>


<section class="yb main-row topLine">

	<div class="bottomLine project-main-header4">
		<div class="container-1200 h35 mhCenter">
			<ul class="project-main-ul">
				<li class="project-main-li2"><a href="${root}/project/${projectNo}/projectMainGift" class="main-li-a2 on"> <i class="fas fa-gift mr5"></i>
						선물
				</a></li>
				<li class="project-main-li2"><a href="${root}/project/${projectNo}/projectMainGiftItem" class="main-li-a2"> <i class="fas fa-list mr5"></i>
						아이템
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

					<div id="giftList" class="project-giftList scrollBlind">

						<div id="giftListBasic" class="project-insert-gift-list float-container p30 h140">
							<div>
								<div class="mb10">
									<span class="left w260 fBold fs22">1000원+</span>
								</div>
								<div>
									<span class="left w260 fs14 fBold">선물을 선택하지 않고 밀어만 줍니다.</span>
								</div>
							</div>
						</div>

						<c:forEach var="giftDto" items="${giftList}">
							<div class="project-insert-gift-list p30">
								<div class="mb10 w100p float-container">
									<span id="giftPrice" class="left w260 fBold fs22">${giftDto.giftPrice}원+</span> <span class="yb modalX right"> <i class="fas fa-times"></i></span>
								</div>
								<div>
									<span id="giftSummary" class="w260 fs14 fBold">${giftDto.giftSummary}</span>
								</div>
								<div class="w100p fs12 p10">
									<ul style="list-style: none;">

										<c:forEach var="giftItemVo" items="${giftItemVoList}">
											<c:if test="${giftItemVo.giftNo == giftDto.giftNo}">
												<li>
													<div class="float-container w100p mb20">
														<span class="left w70p">${giftItemVo.itemName}</span> <span class="right w20p">x ${giftItemVo.itemCount}</span>
													</div>
												</li>
											</c:if>
										</c:forEach>

									</ul>
								</div>
								<span id="giftNo" class="yb hidden">${giftDto.giftNo}</span>
							</div>
						</c:forEach>
					</div>

					<div class="float-container">
						<button id="scrollUp" class="scrollUp left h20 w50p pRel m0 p0 btnNone project-background-white project-border-radius">
							<i class="fas fa-chevron-up pAbs pAbsCenter"></i>
						</button>
						<button id="scrollDown" class="scrollDown right h20 w50p pRel m0 p0 btnNone project-background-white project-border-radius">
							<i class="fas fa-chevron-down pAbs pAbsCenter"></i>
						</button>
					</div>

				</div>

				<div class="mt40 w700 right project-background-white project-border-radius">
					<!-- 					<form id="projectMainGiftInsertForm" -->
					<!-- 						action="projectMainGift" method="post"> -->
					<input type="hidden" value="${projectNo}" name="projectNo">
					<div class="p50">
						<div class="w100p mb30">
							<span class="fs16 fBold w100p" style="display: block;">선물 만들기</span>
						</div>

						<div class="w100p mt30">
							<pre class="fs12 w100p" style="white-space: pre-line; line-height: 20px">
								선물은 후원자에게 프로젝트의 가치를 전달하는 수단입니다.
								다양한 금액대로 여러 개의 선물을 만들어주세요.
								펀딩 성공률이 높아지고, 더 많은 후원 금액을 모금할 수 있어요.</pre>
							<c:choose>
								<c:when test="${itemCount == 0}">
									<pre class="fs12 w100p pt60 tac" style="white-space: pre-line; line-height: 20px">
								아직 선물을 구성할 아이템이 없네요.</pre>
									<div class="h30p pt20">
										<a href="${root}/project/${projectNo}/projectMainGiftItem"><button class="project-btn btn3 project-btn-hover w100p">아이템 생성하기</button></a>
									</div>
								</c:when>
								<c:otherwise>
									<div class="mt50">
										<p class="fBold fs12 mb20">선물 아이템</p>
										<p class="fs12">선물을 구성하는 아이템을 선택해 주세요.</p>
										<div class="project-insert-div3 mb0">
											<button id="itemListToggle" class="boc230 bosSolid bow1 bacWhite h40 taLeft w100p pl20 fc120">아이템을 선택해주세요.</button>
											<i class="itemListIcon yb fas fa-chevron-down reverse fc120"></i>
										</div>
									</div>

									<div id="itemList" class="topLine displayNone w100p project-gift-item-list scrollBlind pt20 mt20">
										<div>
											<ul>
												<c:forEach var="itemDto" items="${itemList}">

													<li>

														<div class="project-item-checkbox-wrap">
															<input type="checkbox" name="selectedItemList" id="${itemDto.itemNo}" value="${itemDto.itemNo}" class="project-item-checkbox">
															<label class="project-item-checkbox-label" for="${itemDto.itemNo}"> <span class="project-item-checkbox-text">${itemDto.itemName}</span></label>
														</div>

													</li>

												</c:forEach>
											</ul>
										</div>
									</div>

									<div class="float-container">
										<button id="scrollUp2" class="scrollUp displayNone left h20 w50p pRel m0 p0 btnNone project-background-white project-border-radius">
											<i class="fas fa-chevron-up pAbs pAbsCenter"></i>
										</button>
										<button id="scrollDown2" class="scrollDown displayNone right h20 w50p pRel m0 p0 btnNone project-background-white project-border-radius">
											<i class="fas fa-chevron-down pAbs pAbsCenter"></i>
										</button>
									</div>

									<div id="itemListAddBtn" class="h60 displayNone bottomLine">
										<div class="project-insert-div3">
											<button id="itemSelectBtn" class="project-btn btn3 project-btn-hover" style="margin-right: 0px">선택완료</button>
										</div>
									</div>

									<form action="projectMainGift" method="post">

										<div id="search-result" class="scrollBlind oyAuto hMax300 mt20"></div>
										<div class="float-container">
											<button type="button" id="scrollUp3"
												class="scrollUp displayNone left h20 w50p pRel m0 p0 btnNone project-background-white project-border-radius"
											>
												<i class="fas fa-chevron-up pAbs pAbsCenter"></i>
											</button>
											<button type="button" id="scrollDown3"
												class="scrollDown displayNone right h20 w50p pRel m0 p0 btnNone project-background-white project-border-radius"
											>
												<i class="fas fa-chevron-down pAbs pAbsCenter"></i>
											</button>
										</div>

										<div class="mt30">
											<p class="fBold fs12 mb20">선물 설명</p>
											<p class="fs12">선물에 대한 설명을 입력해주세요.</p>
											<div class="w100p h40 taRight mt20">
												<input type="text" class="inputFocusNone boc230 bosSolid bow1 h40 w100p pl20 fc120" name="giftSummary" autocomplete="off" placeholder="ex. 선물세트A, 배송비 포함" required>
											</div>
											<div class="float-container">
												<p id="textMin" class="fs12 pb10 pt10 left fRed displayNone">최소 10자 이상
													입력해주세요</p>
												<p id="textMax" class="fs12 pb10 pt10 left fRed displayNone">최대 50자 이하로
													입력해주세요</p>
												<p id="textSize" class="fs12 pb10 pt10 right">
													(<span id="textSizeSpan">0</span><span>/50</span>)
												</p>
											</div>
										</div>

										<div class="mt30">
											<p class="fBold fs12 mb20">최소 후원 금액</p>
											<p class="fs12">배송이 필요한 선물은 배송비를 포함해주세요.</p>
											<div class="project-insert-div3">
												<div class="displayFlex">
													<input type="text" class="inputFocusNone boc230 bosSolid bow1 h40 w95p taRight brNone pr10 fc120" name="giftPrice" autocomplete="off" placeholder="0" required><span class="blNone boc230 bosSolid bow1 w5p dpFlex dpFlexCenter fc120">원</span>
												</div>
												<span id="priceError" class="fs12 pt10 fRed displayNone taLeft">0 ~ 999999999 사이의 값을 입력해주세요.</span>
											</div>
										</div>

										<c:if test="${itemCount != 0}">
											<div class="project-insert-div3 mt50">
												<input class="project-btn btn3 project-btn-hover" style="margin-right: 0px" type="submit" value="등록">
											</div>
										</c:if>

									</form>

								</c:otherwise>
							</c:choose>

						</div>

					</div>
				</div>

			</div>

		</div>

	</div>

	<div id="modal" class="modal">

		<div class="modal-header float-container">
			<span class="modal-title left">아이템 삭제</span> <span class="modalX right"><i class="fas fa-times"></i></span>
		</div>

		<div class="modal-body">
			<pre>이 선물을 삭제하시겠습니까?</pre>
			<div class="project-border-normal project-border-radius p20 mt20 w100p">
				<pre id="modal-target" class="fBold mb10"></pre>
				<pre id="modal-target2" class="fs12 oneLine"></pre>
			</div>
		</div>

		<div class="modal-footer">
			<form action="projectMainGiftDelete" method="post">
				<input type="hidden" name="giftNo" value="">
				<button class="modal-btn">삭제</button>
			</form>
		</div>

	</div>

	<div id="modalBackground" class="yb modal-background float-container"></div>

</section>

</body>
</html>