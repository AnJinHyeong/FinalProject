<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>

<jsp:include page="/WEB-INF/views/project/projectHeader.jsp">
	<jsp:param value="${root}/project/${projectNo}/projectMainStory" name="division" />
</jsp:include>

<script src="http://code.jquery.com/jquery-3.6.0.js"></script>

<script>
	$(function(){
		$("#inputArea").on("click", function(){
			$("#inputAreaText").focus();
			console.log("DDD");
		});
		
		$("#inputAreaText").blur("input", function(){
			$("input[name=projectContent]").val($(this).text());
		});
		
		$("#inputAreaText").on("input", function() {
			$("#textSizeSpan").text($(this).text().length);
			if ($(this).val().length > 50) {
				$("#textSize").css("color", "red");
				$("#textMax").show();
			} else {
				$("#textSize").css("color", "black");
				$("#textMax").hide();
			}
		});

		$("#projectMainGiftInsertForm").on("submit", function(e) {
			if ($("input[name=giftSummary]").val().length > 50) {
				$("input[name=giftSummary]").focus();
				e.preventDefault();
			}
			var giftPrice = $("input[name=giftPrice]").val();
			var regexPw = /^[1-9][0-9]{0,8}$/;
			if(!regexPw.test(giftPrice) || giftPrice == 0){
				$("input[name=giftPrice]").focus();
				e.preventDefault();
			}
		});
		
		$("#addImageBtn").on("click",function(){
			$("#addImage").click();
		});
	});	
</script>

<section class="main-row topLine" style="background-color: #f8f8f8;">

	<div class="project-back-color" style="height: 1600px;">

		<div class="section-row" style="padding-top: 10px;">

			<div class="project-insert-div h130">
				<div class="w100p">
					<div class="project-insert-dt">
						프로젝트 스토리 <span class="project-insert-font">*</span>
					</div>
					<div class="project-insert-dd mb30">
						<p>프로젝트를 소개하고, 창작자의 시선에서 준비하는 과정에서 후원자에게 들려주고 싶었던 이야기를 진솔하게 전달해주세요.</p>
					</div>
					<button id="addImageBtn">사진 추가</button>
					<input id="addImage" type="file">
					<div class="w100p h400 bacWhite scrollThin p30" id="inputArea">
						<div id="inputAreaText" class="inputFocusNone" contenteditable="true">
							{{<img alt="" src="" width="200px" height="100px">}}
						</div>
					</div>
					<div class="float-container">
						<p id="textSize" class="fs12 pb10 pt10 right">
							(<span id="textSizeSpan">0</span><span>/4000</span>)
						</p>
					</div>
					<input type="text" name="projectContent">
					<div class="project-insert-div3">
						<input class="project-btn btn3 project-btn-hover mr0" type="submit" value="저장">
					</div>
				</div>
			</div>

		</div>

	</div>

</section>

</body>
</html>