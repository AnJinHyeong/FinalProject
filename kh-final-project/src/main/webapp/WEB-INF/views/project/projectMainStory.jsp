<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>

<jsp:include page="/WEB-INF/views/project/projectHeader.jsp">
	<jsp:param value="${root}/project/${projectNo}/projectMainStory" name="division" />
</jsp:include>

<script src="http://code.jquery.com/jquery-3.6.0.js"></script>

<script>
	$(function() {
		var i = 0;
		
		$("#addImageBtn").on("click", function() {
			var template = $("#addFileTemplate").html();
			template = template.replace("{{i}}", i);
			$("#inputArea").append(template);
			$("input[name=" + i + "]").click();
			i = i + 1;

			$(".projectStoryFile").on("input", function() {
				var files = this.files;
				var filesLength = this.files.length > 0;
				var files0 = this.files[0];

				if (files && filesLength) {
					var fd = new FormData();
					fd.append("f", files0);
					var that = this;

					$.ajax({
						url : "${pageContext.request.contextPath}/image/project/upload/story/${projectNo}",
						type : "post",
						processData : false,
						contentType : false,
						data : fd,
						success : function(resp) {
							var url = "${pageContext.request.contextPath}/image/project/download/story/" + resp.imageNo;
							$(that).siblings("img").attr("src", url);
							$(that).siblings("img").on("click", function(){
								$(that).click();
							});
						},
						error : function(resp) {
							window.alert("업로드 실패!");
						}
					});
				}
			});
		});

		$("#inputArea").blur("input", function() {
			$("textarea[name=projectContent]").val($("#inputArea").html());
		});

		if(("#inputArea").text() != null && ("#inputArea").text() != ""){
			$("#progress").text(100);
		} else{
			$("#progress").text(0);
		}
		
	});
</script>


<script id="addFileTemplate" type="text/template">
	<div>
		<input type="file" name="{{i}}" class="mt10 mb10 projectStoryFile w100p dpNone" style="margin-left:200px;">
		<img class="w700" style="margin: 50px 100px;">
	</div>
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
					<button id="addImageBtn" class="project-btn btn3 project-btn-hover mb20">사진 추가</button>

					<form action="projectMainStory" method="post">

						<div class="w100p h500 bacWhite scrollThin" style="padding: 50px 150px;" id="inputArea" contenteditable="true">
							${projectDto.projectContent}
						</div>
						
						<textarea name="projectContent" class="w100p h200 dpNone"></textarea>

						<div class="project-insert-div3">
							<input id="inputStory" class="project-btn btn3 project-btn-hover mr0" type="submit" value="저장">
						</div>

					</form>

				</div>
			</div>

		</div>

	</div>

</section>

</body>
</html>