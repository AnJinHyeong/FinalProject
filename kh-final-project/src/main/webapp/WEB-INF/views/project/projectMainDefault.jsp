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
		$("select[name=categoryNo]").val(${projectDto.categoryNo});
	
		
		$(document).ready(function() {
			$.ajax({
				url:"${pageContext.request.contextPath}/project/data/categoryApproveCheck",
				type: "post",
				data:{
					categoryNo:$("select[name=categoryNo]").val()
				},
				success:function(resp){
					if(resp === "Y"){
						$("select[name=categoryNo] + p").text("");
					}
					else{
						$("select[name=categoryNo] + p").text("* 현재 카테고리는 심사중입니다.");
					}
				}
				
			});
	    });
		
		$(".project-insert-select").on("input",function(){
			
			$.ajax({
				url:"${pageContext.request.contextPath}/project/data/categoryApproveCheck",
				type: "post",
				data:{
					categoryNo:$("select[name=categoryNo]").val()
				},
				success:function(resp){
					if(resp === "Y"){
						$("select[name=categoryNo] + p").text("");
					}
					else{
						$("select[name=categoryNo] + p").text("* 현재 카테고리는 심사중입니다.");
					}
				}
				
			});
		});
		
		var textSize = $("textarea[name=projectSummary]").val().length;
		
		$(document).ready(function(){
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
		}); 
		
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
		
		$("#projectMainDefault").on("submit", function(e){
			if($("textarea[name=projectSummary]").val().length < 10 || $("textarea[name=projectSummary]").val().length > 50){
				$("textarea[name=projectSummary]").focus();
				e.preventDefault();
			}
			
		});
		
		
	});
	
	
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
						<p style="color: rgb(248, 100, 83); font-size: 12px;"><i class="fas fa-exclamation-circle"></i> 심사 중인 카테고리는 심사가 끝나기 전 변경 시 목록에서 지워집니다.</p>
					</dd>
				</dl>
				<div class="projcet-insert-div2">
					<div>
						<p class="project-insert-p">카테고리</p>
						<select class="project-insert-select select1" name="categoryNo">
							<c:forEach var="categoryDto" items="${categoryDto}">
								<option value="${categoryDto.categoryNo}" data-approve="${categoryDto.categoryApprove}">${categoryDto.categoryTheme}</option>
							</c:forEach>
						</select>
						<p class="project-insert-font font-on" style="font-size: 12px; margin-top: 5px;"> </p>
					</div>
					<div style="display: ;">
						<p class="project-insert-p">세부 카테고리<em class="project-insert-p-em">(선택사항)</em></p>
						<select class="project-insert-select">
							<option class="font-gray"></option>
							<option class="font-gray">RPG</option>
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
						<textarea class="project-insert-text" rows="1" name="projectSummary" required>${projectDto.projectSummary}</textarea>
						<div>
							<p id="textMin" class="f12 pb10 pt10 left fRed">최소 10자 이상 입력해주세요</p>
							<p id="textMax" class="f12 pb10 pt10 left fRed">최대 50자 이하로 입력해주세요</p>
							<p id="textSize" class="f12 pb10 pt10 right">(<span id="textSizeSpan">0</span><span>/50</span>)</p>
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
							<input class="project-insert-file" type="file" name="" >
						</div>
					</div>
				</div>
			</div>
			
			
			<div class="project-insert-div3">
				<input class="project-btn btn3 project-btn-hover" type="submit" value="저장">
			</div>
			
			</form>
			
		</div>
		
		
		
	</div>

</section>



</body>
</html>