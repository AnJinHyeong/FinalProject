<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>

<jsp:include page="/WEB-INF/views/project/projectHeader.jsp">
	<jsp:param value="${root}/project/${projectNo}/projectMainDefault" name="division"/>
</jsp:include>


<script src="http://code.jquery.com/jquery-3.6.0.js"></script>
<script>

	$(function(){
		
		//로딩시 프로젝트 번호를 포함한 카테고리 조회
		$.ajax({
			url:"${pageContext.request.contextPath}/category/data/userCustomList",
			type: "post",
			data:{
				categoryNo:${projectDto.categoryNo}
			},
			success:function(resp){
				$("#parentsCategory").empty();
				for(var i=0; i < resp.length; i++){
					var template = $("#category-option").html();
					template = template.replace("{{categoryNo}}", resp[i].categoryNo);
					template = template.replace("{{categoryTheme}}", resp[i].categoryTheme);
					$("#parentsCategory").append(template);
					if(resp[i].categoryApprove){
						$("select[name=categoryNo] + p").text("");
						document.getElementById("childCategory-div").style.display = "";
					}
					else{
						$("select[name=categoryNo] + p").text("* 현재 카테고리는 심사중입니다.");
						document.getElementById("childCategory-div").style.display = "none";
					}
					if(${category.categorySuper == 0}){
						$("#parentsCategory").val(${category.categoryNo});
					}
					else{
						$("#parentsCategory").val(${category.categorySuper});
						$("#childCategory").val(${category.categoryNo});
					}
				}
			}
			
		});
		
		
		if(${category.categorySuper != 0}){
			$.ajax({
				url:"${pageContext.request.contextPath}/category/data/childCategory",
				type: "post",
				data:{
					categoryNo:${category.categorySuper}
				},
				success:function(resp){
					$("#childCategory").empty();
					var option = $("#option").html();
					$("#childCategory").append(option);
					for(var i=0; i < resp.length; i++){
						var template = $("#category-option").html();
						template = template.replace("{{categoryNo}}", resp[i].categoryNo);
						template = template.replace("{{categoryTheme}}", resp[i].categoryTheme);
						$("#childCategory").append(template);
					}
					if(${category.categorySuper == 0}){
						$("#parentsCategory").val(${category.categoryNo});
					}
					else{
						$("#parentsCategory").val(${category.categorySuper});
						$("#childCategory").val(${category.categoryNo});
					}
				}
				
			});
		}
		else{
			$.ajax({
				url:"${pageContext.request.contextPath}/category/data/childCategory",
				type: "post",
				data:{
					categoryNo:${category.categoryNo}
				},
				success:function(resp){
					$("#childCategory").empty();
					var option = $("#option").html();
					$("#childCategory").append(option);
					for(var i=0; i < resp.length; i++){
						var template = $("#category-option").html();
						template = template.replace("{{categoryNo}}", resp[i].categoryNo);
						template = template.replace("{{categoryTheme}}", resp[i].categoryTheme);
						$("#childCategory").append(template);
					}
					if(${category.categorySuper == 0}){
						$("#parentsCategory").val(${category.categoryNo});
					}
					else{
						$("#parentsCategory").val(${category.categorySuper});
						$("#childCategory").val(${category.categoryNo});
					}
				}
				
			});
		}
		
		
		
		//
		$("#parentsCategory").on("input",function(){
			
			$.ajax({
				url:"${pageContext.request.contextPath}/category/data/categoryApproveCheck",
				type: "post",
				data:{
					categoryNo:$("#parentsCategory").val()
				},
				success:function(resp){
					if(resp == 'Y'){
						$("select[name=categoryNo] + p").text("");
						document.getElementById("childCategory-div").style.display = "";
					}
					else{
						$("select[name=categoryNo] + p").text("* 현재 카테고리는 심사중입니다.");
						document.getElementById("childCategory-div").style.display = "none";
					}
				}
				
			});
			
			
			
			$.ajax({
				url:"${pageContext.request.contextPath}/category/data/childCategory",
				type: "post",
				data:{
					categoryNo:$("#parentsCategory").val()
				},
				success:function(resp){
					$("#childCategory").empty();
					var option = $("#option").html();
					$("#childCategory").append(option);
					for(var i=0; i < resp.length; i++){
						var template = $("#category-option").html();
						template = template.replace("{{categoryNo}}", resp[i].categoryNo);
						template = template.replace("{{categoryTheme}}", resp[i].categoryTheme);
						$("#childCategory").append(template);
					}
				}
				
			});
		
			
		});
		
		$("#parentsCategory").on("input",function(){
			$("#parentsCategory").attr("name", "categoryNo");
			$("#childCategory").attr("name", "");
		});
		
		$("#childCategory").on("input",function(){
			if($("#childCategory").val() != null && $("#childCategory").val() != ""){
				$("#parentsCategory").attr("name", "");
				$("#childCategory").attr("name", "categoryNo");
			}
			else{
				$("#parentsCategory").attr("name", "categoryNo");
				$("#childCategory").attr("name", "");
			}
		});
		
		
		
		//요약 내용 JS
		var textSize = $("textarea[name=projectSummary]").val().length;
		$("#textSizeSpan").text(textSize);
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
		
		$("textarea[name=projectSummary").on("input", function(){
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
		
		
		
		//페이지 로딩 시 프로젝트 이미지가 있으면 화면에 송출
		$.ajax({
			url :"${pageContext.request.contextPath}/image/project/confirm/${projectDto.projectNo}",
			type: "post",
			success : function(resp){
				if(resp == 1){
					$.ajax({
						url :"${pageContext.request.contextPath}/image/project/getByProjectNo/${projectDto.projectNo}",
						type: "get",
						processData : false,
						contentType : false,
						success : function(resp){
							var url = "${pageContext.request.contextPath}/image/project/projectMainDownload/"+resp.imageNo;
							$("#preview").attr("src",url);
							
							//진행률 계산
							if($("input[name=projectTitle]").val() == null || $("input[name=projectTitle]").val() ==""){
								var pt = 0;
							}
							else{
								var pt = 1;
							}
							
							if($("#projectSummary-text").text() == null || $("#projectSummary-text").text() ==""){
								var ps = 0;
							}
							else{
								var ps = 1;
							}
							
							$("#progress").text(25*(2+pt+ps));
							
						}
					
					});				
				}
				else{
					//진행률 계산
					if($("input[name=projectTitle]").val() == null || $("input[name=projectTitle]").val() ==""){
						var pt = 0;
					}
					else{
						var pt = 1;
					}
					
					if($("#projectSummary-text").text() == null || $("#projectSummary-text").text() ==""){
						var ps = 0;
					}
					else{
						var ps = 1;
					}
					
					$("#progress").text(25*(1+pt+ps));
				}
			}
		
		});
		
		
		//프로젝트 사진 등록 후 보여주기
		$("#projectImage").on("input",function(){
			var files = this.files;
			var filesLength = this.files.length > 0;
			var files0 = this.files[0];
			$.ajax({
				url :"${pageContext.request.contextPath}/image/project/confirm/${projectDto.projectNo}",
				type: "post",
				success : function(resp){
					if(resp == 1){//등록된 이미지가 있을경우 지우고 다시 등록
						//이미지 삭제
						$.ajax({
							url :"${pageContext.request.contextPath}/image/project/delete/${projectDto.projectNo}",
							type: "post",
							success : function(resp){
							}
						});

						if(files && filesLength){//파일 저장소 존재 및 0번 위치에 파일 존재
							console.log("파일이 선택되었습니다");
						
//			 				jquery ajax에서 파일 업로드를 하려면 formData 객체가 필요
							var fd = new FormData();
							console.log(fd);
//			 				fd.append(이름,데이터또는 파일);
							fd.append("f",files0);
							
							var that = this;//$("input[name=f]")
							
//			 				(주의) 반드시 ajax file upload에서는 다음 두 가지 설정을 해야 한다.
//			 				1. processData : false 설정
//			 				2. contentType : false 설정
//			 				3. type : "post" 설정
							$.ajax({
								url :"${pageContext.request.contextPath}/image/project/upload/${projectDto.projectNo}",
								type: "post",
								processData : false,
								contentType : false,
								data: fd,
								success : function(resp){
									$("#preview").empty();
									var url = "${pageContext.request.contextPath}/image/project/projectMainDownload/"+resp.imageNo;
									$("#preview").attr("src",url);
								},
								error :function(resp){
									window.alert("업로드 실패!");
								}
							
							});
							
						}
					
					}
					else{//등록된 이미지가 없을 경우 등록
						if(files && filesLength){//파일 저장소 존재 및 0번 위치에 파일 존재
							console.log("파일이 선택되었습니다");
						
//			 				jquery ajax에서 파일 업로드를 하려면 formData 객체가 필요
							var fd = new FormData();
							console.log(fd);
//			 				fd.append(이름,데이터또는 파일);
							fd.append("f",files0);
							
							var that = this;//$("input[name=f]")
							
//			 				(주의) 반드시 ajax file upload에서는 다음 두 가지 설정을 해야 한다.
//			 				1. processData : false 설정
//			 				2. contentType : false 설정
//			 				3. type : "post" 설정
							$.ajax({
								url :"${pageContext.request.contextPath}/image/project/upload/${projectDto.projectNo}",
								type: "post",
								processData : false,
								contentType : false,
								data: fd,
								success : function(resp){
									var url = "${pageContext.request.contextPath}/image/project/projectMainDownload/"+resp.imageNo;
									$("#preview").attr("src",url);
								},
								error :function(resp){
									window.alert("업로드 실패!");
								}
							
							});
							
						}
					}
						
				}
			
			});
			
		});
		
		
		
		//form JS
		$("#projectMainDefault").on("submit", function(e){
			if($("textarea[name=projectSummary]").val().length < 10 || $("textarea[name=projectSummary]").val().length > 50){
				$("textarea[name=projectSummary]").focus();
				e.preventDefault();
			}
			
		});
		
		
	});
	
	
</script>

<script id="option" type="text/template">
	<option value="">세부 카테고리를 선택해주세요</option>
</script>

<script id="category-option" type="text/template">
	<option value="{{categoryNo}}">{{categoryTheme}}</option>
</script>



<section class="main-row topLine" style="background-color: #f8f8f8;">
	
	<div class="project-back-color" style="height: 1600px;">
		
		<div class="section-row" style=" padding-top: 10px;">
			
			<form id="projectMainDefault" action="projectMainDefault" method="post">
			
			<div class="project-insert-div" style="height: 130px;">
				<dl class="project-insert-dl">
					<dt class="project-insert-dt">
						프로젝트 카테고리 <span class="project-insert-font">*</span>
					</dt> 
					<dd class="project-insert-dd">
						<p>프로젝트 성격과 가장 일치하는 카테고리를 선택해주세요. 적합하지 않을 경우 운영자에 의해 조정될 수 있습니다.</p>
						<br>
						<p class="font-12 red"><i class="fas fa-exclamation-circle"></i> 심사 중인 카테고리는 심사가 끝나기 전 변경 시 목록에서 지워집니다.</p>
					</dd>
				</dl>
				<div class="projcet-insert-div2">
					<div id="parentsCategory-div">
						<p class="project-insert-p">카테고리</p>
						<select class="project-insert-select select1" id="parentsCategory" name="categoryNo">
						</select>
						<p class="project-insert-font font-on" style="font-size: 12px; margin-top: 5px;"> </p>
					</div>
					<div id="childCategory-div">
						<p class="project-insert-p">세부 카테고리<em class="project-insert-p-em">(선택사항)</em></p>
						<select class="project-insert-select-2" id="childCategory">
						</select>
					</div>
				</div>
			</div>
			
			<hr>
			
			<div class="project-insert-div" style="height: 130px;">
				<dl class="project-insert-dl">
					<dt class="project-insert-dt">
						프로젝트 제목 <span class="project-insert-font">*</span>
					</dt> 
					<dd class="project-insert-dd">
						<p>프로젝트의 주제, 창작물의 특징이 드러나는 멋진 제목을 붙여주세요.</p>
					</dd>
				</dl>
				<div class="projcet-insert-div2">
					<div>
						<p class="project-insert-p">제목</p>
						<input type="text" name="projectTitle" class="projcet-insert-input" value="${projectDto.projectTitle}">
					</div>
				</div>
			</div>
			
			<hr>
			
			<div class="project-insert-div" style="height: 200px;">
				<dl class="project-insert-dl">
					<dt class="project-insert-dt">
						프로젝트 요약 <span class="project-insert-font">*</span>
					</dt> 
					<dd class="project-insert-dd">
						<p>후원자 분들이 프로젝트를 빠르게 이해할 수 있도록 명확하고 간략하게 소개해주세요.</p>
					</dd>
				</dl>
				<div class="projcet-insert-div2">
					<div>
						<p class="project-insert-p">요약 내용</p>
						<textarea class="project-insert-text" rows="1" id="projectSummary-text" name="projectSummary" required>${projectDto.projectSummary}</textarea>
						<div>
							<p id="textMin" class="f12 pb10 pt10 left fRed font-12">최소 10자 이상 입력해주세요</p>
							<p id="textMax" class="f12 pb10 pt10 left fRed font-12">최대 50자 이하로 입력해주세요</p>
							<p id="textSize" class="f12 pb10 pt10 right font-12">(<span id="textSizeSpan" class="font-12">0</span><span class="font-12">/50</span>)</p>
						</div>
					</div>
				</div>
			</div>
			
			<hr>
			
			<div class="project-insert-div" style="height: 400px;">
				<dl class="project-insert-dl">
					<dt class="project-insert-dt">
						프로젝트 대표 이미지 <span class="project-insert-font">*</span>
					</dt> 
					<dd class="project-insert-dd">
						<p>후원자들이 프로젝트의 내용을 쉽게 파악하고 좋은 인상을 받을 수 있도록 이미지 가이드라인을 따라주세요.</p>
					</dd>
				</dl>
				<div class="projcet-insert-div2">
					<div>
						<p class="project-insert-p">이미지 첨부</p>
						<div class="project-insert-file-div">
							<input class="project-insert-file" type="file" id="projectImage">
							<img id="preview" width="200" height="200">
						</div>
					</div>
				</div>
			</div>
			
			
			<c:if test="${projectDto.projectState != '2'}">
				<div class="project-insert-div3">
					<input class="project-btn btn3 project-btn-hover" type="submit" value="저장">
				</div>
			</c:if>
			
			</form>
			
		</div>
		
		
		
	</div>

</section>



</body>
</html>