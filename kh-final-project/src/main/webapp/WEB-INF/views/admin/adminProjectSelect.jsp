<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/adminSidebar.jsp"></jsp:include>

<script>
		
	$(function(){
		
		//페이지 로딩 시 창작자 이미지가 있으면 화면에 송출
		$.ajax({
			url :"${pageContext.request.contextPath}/image/member/confirmMemberImage/${projectDto.projectNo}",
			type: "post",
			success : function(resp){
					
			}
		
		});
		
	});	
		
</script>

	<section>
		<div class="admin-home_content_area">
			<div class="admin-home_content100">
				<p class="admin-home-top-p">프로젝트 조회</p>
			</div>
		</div>
		<div class="admin-home_content_area">
			<div class="admin-home_content100" style="height: 85px; padding: 15px 0;">
				<div class="admin-project-div1">
					<p class="admin-home-content-p">조건 검색</p>
				</div>
				<div class="admin-project-div2">
					<select class="admin-project-div2-select1" name="searchType" required>
						<option >선택</option>
						<option value="project_no">번호</option>
						<option value="project_title">제목</option>
						<option value="project_content">내용</option>
						<option value="member_info_nick">닉네임</option>
					</select>
					<select class="admin-project-div2-select2" name="projectState" required>
						<option>선택</option>
						<option value="1">프로젝트 기획중 - 1</option>
						<option value="2">프로젝트 심사중 - 2</option>
						<option value="3">프로젝트 펀딩중 - 3</option>
						<option value="4">프로젝트 펀딩종료 - 4</option>
						<option value="x">프로젝트 중단 - x</option>
					</select>
					<input class="admin-project-div2-input" type="text" required name="keyword" autocomplete="off">
					<button class="admin-project-div2-btn"><i class="fas fa-search bacWhite"></i></button>
				</div>
			</div>
		</div>
		
		<div class="admin-home_content_area">
			<div class="admin-home_content100" style="min-height: 400px; max-height: 400px; padding: 15px 0;">
				<div style="width: 100%; border-bottom: 1px solid rgba(0,0,0,0.2); padding: 0 0 5px 5px;">
					<p class="admin-home-content-p">리스트</p>
				</div>
				<div class="admin-project-div2">
					<p></p>
						
				</div>
			</div>
		</div>
		
		<div class="admin-home_chart_area">
			<div class="admin-home_content100" style="min-height: 100%; padding: 15px 0;">
				<div style="width: 100%; border-bottom: 1px solid rgba(0,0,0,0.2); padding: 0 0 5px 5px;">
					<p class="admin-home-content-p">상세 페이지</p>
				</div>
			</div>
		</div>
	</section>
</body>
</html>