<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>

<jsp:include page="/WEB-INF/views/project/projectHeader.jsp">
	<jsp:param value="${root}/project/projectMainGift" name="division" />
</jsp:include>

<script>
	$(function(){
		$("#textMin").hide();
		$("#textMax").hide();
		
		$("input[name=itemName]").on("input", function(){
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
		
		if($("#itemCount").html() > 0){
			$("#itemListNone").hide();
		}
		else{
			$("#itemListNone").show();
		};
		
		$("#modal").hide();
		$("#modalBackground").hide();
		
		$(".modalOn").on("click", function(){
			$("#modal").show();
			$("#modalBackground").show();
		});
		
		$("#modalBackground").on("click", function(){
			$("#modal").hide();
			$("#modalBackground").hide();
		});
		
	});
</script>

<section class="main-row topLine">

	<div class="bottomLine project-main-header4" style="position: fixed;">
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

	<div class="project-back-color" style="height: 1900px;">

		<div class="section-row" style="padding-top: 10px;">

			<form action="projectMainGiftItem" method="post">
				<input type="hidden" value="${projectNo}" name="projectNo">

				<div class="project-insert-div" style="height: 300px;">
					<div class="project-insert-dl">
						<div class="project-insert-dt">
							내가 만든 아이템 (<span id="itemCount">${itemCount}</span>)
						</div>
						
						
						<div id="itemListNone" class="project-insert-item-div">
							<div>
								<p style="padding-left: 14px; margin-bottom: 5px;">만든 아이템이
									없습니다</p>
							</div>
						</div>
						
						<div class="project-itemList">
							<c:forEach var="itemDto" items="${itemList}">
									<div class="project-insert-item-list float-container">
										<span class="left w260">${itemDto.itemName}</span>
										<span class="modalOn right" style="cursor: pointer;">
										<i class="fas fa-times"></i></span>
									</div>
							</c:forEach>
						</div>
						
					</div>
					<div class="projcet-insert-div2">
						<div>
							<p class="project-insert-p">아이템 만들기</p>
							<input type="text" class="projcet-insert-input" name="itemName" autocomplete="off">
							<div class="float-container">
								<p id="textMin" class="f12 pb10 pt10 left fRed">최소 10자 이상 입력해주세요</p>
								<p id="textMax" class="f12 pb10 pt10 left fRed">최대 50자 이하로 입력해주세요</p>
								<p id="textSize" class="f12 pb10 pt10 right">(<span id="textSizeSpan">0</span><span>/50</span>)</p>
							</div>
						</div>
					</div>
					
				</div>

				<div class="project-insert-div3">
					<input class="project-btn btn3 project-btn-hover" type="submit"
						value="저장">
				</div>
				
				<div id="modal" class="yb modal float-container">
					<span>dddddddddddd</span>
					아이템 삭제
					이 아이템을 삭제하시겠습니까? 삭제하면 해당 아이템이 포함된 0개의 선물에서도 삭제됩니다.
				</div>
				
				<div id="modalBackground" class="yb modal-background float-container">
				</div>

			</form>

		</div>

	</div>

</section>

</body>
</html>