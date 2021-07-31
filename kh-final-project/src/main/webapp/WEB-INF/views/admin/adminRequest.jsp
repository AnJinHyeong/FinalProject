<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/template/adminSidebar.jsp"></jsp:include>

<script>
		
	$(function(){
		
		$("#search-btn").on("click",function(){
			
			$.ajax({
				url :"${pageContext.request.contextPath}/project/data/projectAdminSearch",
				type: "post",
				data:{
					searchType:$("select[name=searchType]").val(),
					projectState:$("select[name=projectState]").val(),
					keyword:$("input[name=keyword]").val()
				},
				success : function(resp){
					
					$("#projectSearchDiv").empty();
					
					for(var i=0; i < resp.length; i++){
						var template = $("#searchContent").html();
						template = template.replace("{{projectNo}}", resp[i].projectNo);
						template = template.replace("{{projectNo}}", resp[i].projectNo);
						template = template.replace("{{categoryTheme}}", resp[i].categoryTheme);
						template = template.replace("{{projectTitle}}", resp[i].projectTitle);
						template = template.replace("{{projectTargetAmount}}", resp[i].projectTargetAmount);
						template = template.replace("{{projectPercent}}", resp[i].projectPercent);
						template = template.replace("{{projectState}}", resp[i].projectState);
						template = template.replace("{{projectNo}}", resp[i].projectNo);
						template = template.replace("{{projectNo}}", resp[i].projectNo);
						template = template.replace("{{projectNo}}", resp[i].projectNo);
						template = template.replace("{{projectNo}}", resp[i].projectNo);
						$("#projectSearchDiv").append(template);

					}
					
					//프로젝트 페이지 이동
					$(".projectPage").on("click",function(){
						var projectNo = $(this).attr("id");
						location.href="${pageContext.request.contextPath}/projectBoard/"+projectNo+"";
					});
					
					//프로젝트 상태 변경
					$(".updateBtnX").on("click",function(){
						var projectNo = $(this).attr("id");
						$.ajax({
							url :"${pageContext.request.contextPath}/project/data/adminProjectStateX",
							type: "get",
							data:{
								projectNo:projectNo
							},
							success : function(resp){
								window.alert("프로젝트 상태가 'X'로 변경되었습니다.");
							}
						});
					});
					
					$(".updateBtn3").on("click",function(){
						var projectNo = $(this).attr("id");
						$.ajax({
							url :"${pageContext.request.contextPath}/project/data/adminProjectState3",
							type: "get",
							data:{
								projectNo:projectNo
							},
							success : function(resp){
								window.alert("프로젝트 상태가 '3'으로 변경되었습니다.");
							}
						});
					});
					
					$(".updateBtn1").on("click",function(){
						var projectNo = $(this).attr("id");
						$.ajax({
							url :"${pageContext.request.contextPath}/project/data/adminProjectState1",
							type: "get",
							data:{
								projectNo:projectNo
							},
							success : function(resp){
								window.alert("프로젝트 상태가 '1'으로 변경되었습니다.");
							}
						});
					});
					
					//div 클릭시 프로젝트 상세 정보 조회
					$(".div-select").on("click",function(){
						var projectNo = $(this).attr("id");
						
						$(".div-select").removeClass("on");
						$(this).addClass("on");
						
						console.log(projectNo);
						
						$.ajax({
							url :"${pageContext.request.contextPath}/project/data/projectAdminSelectOne",
							type: "post",
							data:{
								projectNo:projectNo
							},
							success : function(resp){
								
								$("#projectSelectOne").empty();
								
								var template = $("#projectSeelctOneContent").html();
								
								template = template.replace("{{projectNo}}", resp.projectNo);
								template = template.replace("{{memberNick}}", resp.memberNick);
								template = template.replace("{{projectLikeCount}}", resp.projectLikeCount);
								template = template.replace("{{projectState}}", resp.projectState);
								
								template = template.replace("{{categoryTheme}}", resp.categoryTheme);
								template = template.replace("{{projectTitle}}", resp.projectTitle);
								template = template.replace("{{projectTargetAmount}}", resp.projectTargetAmount);
								template = template.replace("{{projectPercent}}", resp.projectPercent);
								template = template.replace("{{projectSummary}}", resp.projectSummary);
								template = template.replace("{{memberInfoNick}}", resp.memberInfoNick);
								template = template.replace("{{memberInfoContent}}", resp.memberInfoContent);
								
								
								template = template.replace("{{projectRegistDate}}", resp.projectRegistDate);
								template = template.replace("{{projectStartDate}}", resp.projectStartDate);
								template = template.replace("{{projectEndDate}}", resp.projectEndDate);
								
								if(resp.projectStopCaues != null){
									template = template.replace("{{projectStopCaues}}", resp.projectStopCaues);
								}
								else{
									template = template.replace("{{projectStopCaues}}", "");
								}
								
								if(resp.projectAmountGive != null){
									template = template.replace("{{projectAmountGive}}", "지급완료");
								}
								else{
									template = template.replace("{{projectAmountGive}}", "미지급");
								}
								
								var url = "${pageContext.request.contextPath}/image/project/projectMainDownload/"+resp.imageNo;
								template = template.replace("{{projectImage}}", url);
								
								template = template.replace("{{projectContent}}", resp.projectContent);
								
								$("#projectSelectOne").append(template);
							}
							
						});
						
						
						
					});
				}
			
			});
			
		});
		
		
		
	});	
	
</script>

<script id="searchContent" type="text/template">
<div class="admin-home-content-list div-select" style="text-align: center;" id="{{projectNo}}">
	<span style="width: 5%;">{{projectNo}}</span>	
	<span style="width: 10%;">{{categoryTheme}}</span>	
	<span style="width: 45%;">{{projectTitle}}</span>
	<span style="width: 10%;">{{projectTargetAmount}}원</span>
	<span style="width: 10%;">{{projectPercent}}%</span>
	<span style="width: 5%;">{{projectState}}</span>
	<span style="width: 5%;">
		<button class="admin-btn updateBtnX" id="{{projectNo}}" style="width: 30px;" >중단</button>
	</span>
	<span style="width: 10%;">
		<button class="admin-btn updateBtn3" id="{{projectNo}}" style="width: 30px; margin-right:5px;" >승인</button>
		<button class="admin-btn updateBtn1" id="{{projectNo}}" style="width: 30px;" >탈락</button>
	</span>
	<span style="width: 10%;"><button class="admin-btn projectPage" style="width: 70px;" id="{{projectNo}}">페이지 이동</button></span>
</div>
</script>

<script id="projectSeelctOneContent" type="text/template">
<div style="width: 100%; height:310px; border-bottom: 1px solid rgba(0,0,0,0.2); padding: 10px; ">
	<div style="height: 100%; width: 100%; display: flex;">
		<div style="order: 1; height: 100%; width: 80%;">
			<span class="admin-project-select-p">&lt; {{projectNo}} &gt;</span>
			<span class="admin-project-select-p"><i class="fas fa-user"></i> {{memberNick}}</span>
			<span class="admin-project-select-p"><i class="fas fa-heart"></i> {{projectLikeCount}}</span>
			<span class="admin-project-select-p">상태 : {{projectState}}</span>
								
			<p class="admin-project-select-p">{{categoryTheme}}</p>
			<p class="admin-project-select-p">타이틀 : {{projectTitle}}</p>
			<p class="admin-project-select-p">목표금액 : {{projectTargetAmount}}</p>
			<p class="admin-project-select-p">목표 달성률 : {{projectPercent}}%</p>
			<p class="admin-project-select-p">프로젝트 소개 : {{projectSummary}}</p>
			<p class="admin-project-select-p">프로젝트 창작자 닉네임 : {{memberInfoNick}}</p>
			<p class="admin-project-select-p">프로젝트 창작자 소개 : {{memberInfoContent}}</p>
								
			<div class="bottomLine topLine" style="padding: 10px 0; margin: 5px 0;">
				<p class="admin-project-select-p">프로젝트 생성일자 : {{projectRegistDate}}</p>
				<p class="admin-project-select-p">프로젝트 펀딩 시작일자 : {{projectStartDate}}</p>
				<p class="admin-project-select-p">프로젝트 종료 시작일자 : {{projectEndDate}}</p>
			</div>
								
			<p class="admin-project-select-p">프로젝트 중단사유 : {{projectStopCaues}}</p>
			<p class="admin-project-select-p">프로젝트 프로젝트 포인트 지급상황 : {{projectAmountGive}}</p>
		</div>

		<div style="order: 2; height: 100%; width: 20%;">
			<p class="admin-project-select-p">대표이미지</p>
			<img src="{{projectImage}}" style="padding: 5px; width: 100%; height: 250px;"> 
		</div>
	</div>
</div>

<div class="admin-project-div2"  style="display: inline; text-align: left; width:100%; height: 500px; padding: 10px;">
	<p class="admin-project-select-p">프로젝트 스토리</p>
	<div class="admin-home-content-list-div" style="width: 700px; height: 500px; margin:0 auto;">
		{{projectContent}}
	</div>
</div>
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
					<select class="admin-project-div2-select1" name="searchType">
						<option value="null">선택</option>
						<option value="project_no">번호</option>
						<option value="project_title">타이틀</option>
						<option value="project_content">내용</option>
						<option value="member_info_nick">닉네임</option>
					</select>
					<select class="admin-project-div2-select2" name="projectState">
						<option value="null">선택</option>
						<option value="1">프로젝트 기획중 - 1</option>
						<option value="2">프로젝트 심사중 - 2</option>
						<option value="3">프로젝트 펀딩중 - 3</option>
						<option value="4">프로젝트 펀딩종료 - 4</option>
						<option value="X">프로젝트 중단 - x</option>
					</select>
					<input class="admin-project-div2-input" type="text" name="keyword" autocomplete="off">
					<button class="admin-project-div2-btn" id="search-btn"><i class="fas fa-search bacWhite"></i></button>
				</div>
			</div>
		</div>
		
		<div class="admin-home_content_area">
			<div class="admin-home_content100" style="min-height: 400px; max-height: 400px; padding: 15px 0;">
				<div style="width: 100%; border-bottom: 1px solid rgba(0,0,0,0.2); padding: 0 0 5px 5px;">
					<p class="admin-home-content-p">리스트</p>
				</div>
				<div class="admin-project-div2"  style="display: inline;">
					<div class="admin-home-content-list" style="text-align: center; width: 99%;">
						<span style="width: 5%;">번호</span>
						<span style="width: 10%;">카테고리</span>
						<span style="width: 45%;">타이틀</span>
						<span style="width: 10%;">목표금액</span>
						<span style="width: 10%;">달성률</span>
						<span style="width: 5%;">상태</span>
						<span style="width: 5%;">중단</span>
						<span style="width: 10%;">승인심사</span>
						<span style="width: 10%;">페이지이동</span>
					</div>
					
					<div class="admin-home-content-list-div" style="height: 300px;" id="projectSearchDiv">
						
					</div>
					
				</div>
			</div>
		</div>
		
		
		<div class="admin-home_content_area">
			<div class="admin-home_content100" style="min-height: 1000px; padding: 15px 0;">
				<div style="width: 100%; border-bottom: 1px solid rgba(0,0,0,0.2); padding: 0 0 5px 5px;">
					<p class="admin-home-content-p">프로젝트 상세 정보</p>
				</div>
				
				<div id="projectSelectOne">
					
				</div>
			</div>
		</div>
		
	</section>
</body>
</html>