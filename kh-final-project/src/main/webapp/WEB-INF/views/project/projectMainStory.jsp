<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>

<jsp:include page="/WEB-INF/views/project/projectHeader.jsp">
	<jsp:param value="${root}/project/${projectNo}/projectMainStory" name="division" />
</jsp:include>

<script src="http://code.jquery.com/jquery-3.6.0.js"></script>

<script>
	$(function() {
		// 페이지 이동시 경고
		var checkUnload = false;
		$("#inputArea").one("input", function(){
			checkUnload = true;
			console.log("ddd");
		});	
		
		var ImagesStarted = [];
		$("input[type=file]").each(function(index, item) {
			ImagesStarted.push($(this).attr("name"));
		});

		$(window).on("beforeunload", function() {
			if (checkUnload) {

				var beforeUnloadTargetUrl;
				var beforeUnloadTargetData;
				if (ImagesStarted.length == 0) {
					beforeUnloadTargetUrl = "${pageContext.request.contextPath}/image/project/deleteFileAll/story/${projectNo}"
					beforeUnloadTargetData = {};
				} else {
					beforeUnloadTargetUrl = "${pageContext.request.contextPath}/image/project/deleteFileList/story/${projectNo}"
					beforeUnloadTargetData = {
						fileNoList : ImagesStarted
					};
				}
				$.ajax({
					url : beforeUnloadTargetUrl,
					type : "get",
					data : beforeUnloadTargetData,
					success : function() {
					}
				});

				return "이 페이지를 벗어나면 작성된 내용은 저장되지 않습니다.";
			} else {
				return;
			}
		});

		var i;
		if (ImagesStarted.length == 0) {
			i = 0;
		} else {
			i = Math.max.apply(null, ImagesStarted) + 1;
		}

		$("#addImageBtn").on("click", function() {
			checkUnload = true;
			var addFileInputTemplate = $("#addFileInputTemplate").html();
			var addFileImageTemplate = $("#addFileImageTemplate").html();
			addFileInputTemplate = addFileInputTemplate.replace("{{i}}", i);
			addFileImageTemplate = addFileImageTemplate.replace("{{iImage}}", i);
			$("#hiddenFileInput").append(addFileInputTemplate);
			$("#inputArea").append(addFileImageTemplate);
			$("input[name=" + i + "]").click();
			i = i + 1;

			$(".projectStoryFile").on("input", function() {
				var files = this.files;
				var filesLength = this.files.length > 0;
				var files0 = this.files[0];

				if (files && filesLength) {
					var fd = new FormData();
					fd.append("f", files0);
					fd.append("fileNo", i - 1);
					var that = this;
					
					$.ajax({
						url : "${pageContext.request.contextPath}/image/project/upload/story/${projectNo}",
						type : "post",
						processData : false,
						contentType : false,
						data : fd,
						success : function(resp) {
							var url = "${pageContext.request.contextPath}/image/project/download/story/" + resp.imageSaveName;
							$("img[name=" + $(that).attr("name") + "]").attr("src", url);
						},
						error : function(resp) {
							window.alert("업로드 실패!");
						},
						complete: function(){
							$("img[name=" + $(that).attr("name") + "]").on("click", function(){
								$(that).click();
							})
						}
					});
				}
			});

		});

		$("#inputStory").on("click", function(e) {
			var ImagesBeforeSave = [];
			$("#hiddenFileInput").empty();
			$("#inputArea").find("img").each(function(index, item) {
				ImagesBeforeSave.push($(this).attr("name"));
				var addFileInputTemplate = $("#addFileInputTemplate").html();
				addFileInputTemplate = addFileInputTemplate.replace("{{i}}", $(this).attr("name"));
				$("#hiddenFileInput").append(addFileInputTemplate);
			});
			$("textarea[name=projectContent]").val($("#inputArea").html());
			$("textarea[name=projectContentFile]").val($("#hiddenFileInput").html());
			var inputStoryTargetUrl;
			var inputStoryTargetData;
			if (ImagesBeforeSave.length == 0) {
				inputStoryTargetUrl = "${pageContext.request.contextPath}/image/project/deleteFileAll/story/${projectNo}"
				inputStoryTargetData = {};
			} else {
				inputStoryTargetUrl = "${pageContext.request.contextPath}/image/project/deleteFileList/story/${projectNo}"
				inputStoryTargetData = {
					fileNoList : ImagesBeforeSave
				};
			}
			$.ajax({
				url : inputStoryTargetUrl,
				type : "get",
				data : inputStoryTargetData,
				success : function() {
				}
			});
			checkUnload = false;
		});

		if ($("#inputArea").html().length > 15) {
			$("#progress").text(100);
		}

		$("#inputArea").find("img").on("click", function(){
			$("input[name=" + $(this).attr("name") + "]").click();
		});
		
		$("input[type=file]").on("input", function(){
			var fileNo = $(this).attr("name");
			var files = this.files;
			var filesLength = this.files.length > 0;
			var files0 = this.files[0];

			if (files && filesLength) {
				var fd = new FormData();
				fd.append("f", files0);
				fd.append("fileNo", fileNo);
				var that = this;
				
				$.ajax({
					url : "${pageContext.request.contextPath}/image/project/upload/story/${projectNo}",
					type : "post",
					processData : false,
					contentType : false,
					data : fd,
					success : function(resp) {
						var url = "${pageContext.request.contextPath}/image/project/download/story/" + resp.imageSaveName;
						$("img[name=" + $(that).attr("name") + "]").attr("src", url);
					},
					error : function(resp) {
						window.alert("이미지 변경 실패!");
					}
				});
			}
		});

	});
</script>


<script id="addFileInputTemplate" type="text/template">
	<input type="file" name="{{i}}" class="projectStoryFile">
</script>

<script id="addFileImageTemplate" type="text/template">
	<img name="{{iImage}}" class="w700" style="margin: 0 50px;">
</script>


<section class="main-row topLine" style="background-color: #f8f8f8;">

	<div class="project-back-color" style="height: 900px;">

		<div class="section-row" style="padding-top: 10px; min-height: 900px;">

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

						<div class="w100p h500 bacWhite scrollThin inputFocusNone" style="padding: 50px 200px;" id="inputArea" contenteditable="true">
							${projectDto.projectContent}
						</div>
						<div class="mt10 ml10">
							<span class="fs12 fRed"><i class="fas fa-exclamation-circle"></i> 이미지를 복사/붙여넣기 할 경우 사진 변경이 원활하지 않을 수 있습니다. 사진 추가 버튼으로 사진을 추가해주세요.</span>
						</div>
						<div id="hiddenFileInput" class="dpNone">
							${projectDto.projectContentFile}
						</div>
						<textarea name="projectContent" class="w100p h200 dpNone"></textarea>
						<textarea name="projectContentFile" class="w100p h200 dpNone"></textarea>
						
						<c:if test="${projectDto.projectState != '2'}">
							<div class="project-insert-div3">
								<input id="inputStory" class="project-btn btn3 project-btn-hover mr0" type="submit" value="저장">
							</div>
						</c:if>

					</form>

				</div>
			</div>

		</div>

	</div>

</section>

</body>
</html>