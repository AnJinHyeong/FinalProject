<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>

<jsp:include page="/WEB-INF/views/project/projectHeader.jsp">
	<jsp:param value="${root}/project/projectMainDefault" name="division"/>
</jsp:include>

<section class="main-row topLine">
	
	<div class="project-back-color" style="height: 1900px;">
		
		<div class="section-row" style=" padding-top: 10px;">
			
			<form action="?" method="post">
			
			<div class="project-insert-div" style="height: 130px;">
				<dl class="project-insert-dl">
					<dt class="project-insert-dt">
						프로젝트 카테고리 <span class="project-insert-font">*</span>
					</dt> 
					<dd class="project-insert-dd">
						<p>프로젝트 성격과 가장 일치하는 카테고리를 선택해주세요. 적합하지 않을 경우 운영자에 의해 조정될 수 있습니다.</p>
					</dd>
				</dl>
				<div class="projcet-insert-div2">
					<div>
						<p class="project-insert-p">카테고리</p>
						<select class="project-insert-select">
							<option>게임</option>
						</select>
					</div>
					<div>
						<p class="project-insert-p">세부 카테고리</p>
						<select class="project-insert-select">
							<option class="font-gray">세부 카테고리를 선택해주세요.</option>
							<option>게임</option>
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
						<input type="text" name="projectTile" class="projcet-insert-input" value="${projectDto.projectTitle}">
					</div>
				</div>
			</div>
			
			<hr>
			
			<div class="project-insert-div" style="height: 500px;">
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
						<textarea class="project-insert-text" rows="1" name="projectContent"></textarea>
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