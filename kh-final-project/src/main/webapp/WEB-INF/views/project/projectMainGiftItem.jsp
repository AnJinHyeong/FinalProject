<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>

<jsp:include page="/WEB-INF/views/project/projectHeader.jsp">
	<jsp:param value="${root}/project/${projectNo}/projectMainGift"
		name="division" />
</jsp:include>

<script>
	$(function() {
		$("#textMin").hide();
		$("#textMax").hide();

		$("input[name=itemName]").on("input", function() {
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

		if ($("#itemCount").html() > 0) {
			$("#itemListNone").hide();
		} else {
			$("#itemListNone").show();
		};

		$(".modalX").on("click", function() {
			$("input[name=itemNo]").val($(this).siblings("#itemNo").html());
			$("#modal-target").text($(this).siblings("#itemName").html());
			$("#modal").toggle();
			$("#modalBackground").toggle();
			$('body').toggleClass('scrollOff');
		});

		$("#modalBackground").on("click", function() {
			$("#modal").hide();
			$("#modalBackground").hide();
		});

		$("#projectMainGiftItemInsertForm").on(
				"submit",
				function(e) {
					if ($("input[name=itemName]").val().length < 10
							|| $("input[name=itemName]").val().length > 50) {
						$("input[name=itemName]").focus();
						e.preventDefault();
					}
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

		var itemListHeight = $('#itemList').height();
		if (itemListHeight < 400) {
			$("#scrollDown").hide();
			$("#scrollUp").hide();
		}

	});
</script>

<section class="yb main-row topLine">

	<div class="bottomLine project-main-header4">
		<div class="container-1200 h35 mCenter">
			<ul class="project-main-ul">
				<li class="project-main-li2"><a
					href="${root}/project/${projectNo}/projectMainGift"
					class="main-li-a2"> <i class="fas fa-gift mr5"></i>선물
				</a></li>
				<li class="project-main-li2"><a
					href="${root}/project/${projectNo}/projectMainGiftItem"
					class="main-li-a2 on"> <i class="fas fa-list mr5"></i>아이템
				</a></li>
			</ul>
		</div>
	</div>

	<div class="projectMainGiftAndItem1">

		<div class="section-row pt10">

			<div class="float-container mt100">
				<div class="projectMainGiftAndItemList left">

					<div class="project-insert-dt">
						내가 만든 아이템 (<span id="itemCount">${itemCount}</span>)
					</div>

					<div id="itemListNone" class="project-insert-gift-item-div h200">
						<p>만든 아이템이 없습니다</p>
					</div>

					<div id="itemList" class="project-itemList scrollBlind">
						<c:forEach var="itemDto" items="${itemList}">
							<div class="project-insert-item-list float-container">
								<span id="itemName" class="left w280 fBold">${itemDto.itemName}</span>
								<span id="itemNo" class="yb hidden">${itemDto.itemNo}</span> <span
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
					class="mt40 w700 h400 right project-background-white project-border-radius">
					<form id="projectMainGiftItemInsertForm"
						action="projectMainGiftItem" method="post">
						<input type="hidden" value="${projectNo}" name="projectNo">
						<div class="p50">
							<div class="w100p mb30">
								<span class="f16 fBold w100p" style="display: block;">아이템
									만들기</span>
							</div>

							<div class="w100p mt30 pb20">
								<pre class="f12 w100p"
									style="white-space: pre-line; line-height: 20px">
								아이템은 선물에 포함되는 구성 품목을 말합니다.
								특별한 물건부터 의미있는 경험까지 선물을 구성할 아이템을 만들어 보세요.</pre>
							</div>

							<div class="w100p mt30">
								<span class="f12 fBold w100p mb20" style="display: block;">아이템
									이름</span> <input type="text" class="projcet-insert-input p20 w100p"
									name="itemName" autocomplete="off" placeholder="아이템 이름을 입력해주세요.">
							</div>
							<div class="float-container">
								<p id="textMin" class="f12 pb10 pt10 left fRed">최소 10자 이상
									입력해주세요</p>
								<p id="textMax" class="f12 pb10 pt10 left fRed">최대 50자 이하로
									입력해주세요</p>
								<p id="textSize" class="f12 pb10 pt10 right">
									(<span id="textSizeSpan">0</span><span>/50</span>)
								</p>
							</div>
							<div class="project-insert-div3">
								<input class="project-btn btn3 project-btn-hover"
									style="margin-right: 0px" type="submit" value="등록">
							</div>
						</div>
					</form>
				</div>

			</div>

			<div id="modal" class="modal">

				<div class="modal-header float-container">
					<span class="modal-title left">아이템 삭제</span> <span
						class="modalX right"><i class="fas fa-times"></i></span>
				</div>

				<div class="modal-body">
					<pre id="modal-target"></pre>
					<pre>이 아이템을 삭제하시겠습니까?</pre>
					<pre>삭제하면 해당 아이템이 포함된 0개의 선물에서도 삭제됩니다.</pre>
				</div>

				<div class="modal-footer">
					<form action="projectMainGiftItemDelete" method="post">
						<input type="hidden" name="itemNo" value="">
						<button class="modal-btn">삭제</button>
					</form>
				</div>

			</div>

			<div id="modalBackground" class="yb modal-background float-container">
			</div>

		</div>

	</div>

</section>

</body>
</html>