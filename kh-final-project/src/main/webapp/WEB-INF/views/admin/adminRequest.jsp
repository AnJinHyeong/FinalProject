<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/template/adminSidebar.jsp"></jsp:include>

<script>
		
	$(function(){
		
		$("#search-btn").on("click",function(){
			
			$.ajax({
				url :"${pageContext.request.contextPath}/request/requestAdminSearch",
				type: "post",
				data:{
					searchType:$("select[name=searchType]").val(),
					requestOrderBy:$("select[name=requestOrderBy]").val(),
					keyword:$("input[name=keyword]").val()
				},
				success : function(resp){
					
					$("#requestSearchDiv").empty();
					
					for(var i=0; i < resp.length; i++){
						var template = $("#searchContent").html();
						
						template = template.replace("{{requestNo}}", resp[i].requestNo);
						template = template.replace("{{requestNo}}", resp[i].requestNo);
						template = template.replace("{{categoryTheme}}", resp[i].categoryTheme);
						template = template.replace("{{requestTitle}}", resp[i].requestTitle);
						template = template.replace("{{requestLikeCount}}", resp[i].requestLikeCount);
						template = template.replace("{{requestReplyCount}}", resp[i].requestReplyCount);
						template = template.replace("{{requestNo}}", resp[i].requestNo);
						template = template.replace("{{requestNo}}", resp[i].requestNo);
						
						$("#requestSearchDiv").append(template);
					}
					
					//프로젝트 페이지 이동
					$(".requestPage").on("click",function(){
						var requestNo = $(this).attr("id");
						location.href="${pageContext.request.contextPath}/requestBoard/requestBoardContent/"+requestNo+"";
					});
					
					//게시글 삭제
					$(".requestDelete").on("click",function(){
						var requestNo = $(this).attr("id");
						$.ajax({
							url :"${pageContext.request.contextPath}/request/adminDeleteRequest",
							type: "get",
							data:{
								requestNo:requestNo
							},
							success : function(resp){
								window.alert("게시글이 삭제 되었습니다.");
							}
						});
					});
					
					//div 클릭시 프로젝트 상세 정보 조회
					$(".div-select").on("click",function(){
						var requestNo = $(this).attr("id");
						
						$(".div-select").removeClass("on");
						$(this).addClass("on");
						
						$.ajax({
							url :"${pageContext.request.contextPath}/request/adminRequestSelectOne",
							type: "post",
							data:{
								requestNo:requestNo
							},
							success : function(resp){
								
								$("#requestSelectOne").empty();
								
								var template = $("#requestSeelctOneContent").html();
								
								template = template.replace("{{requestNo}}", resp.requestNo);
								template = template.replace("{{memberNick}}", resp.memberNick);
								template = template.replace("{{requestLikeCount}}", resp.requestLikeCount);
								template = template.replace("{{requestReplyCount}}", resp.requestReplyCount);
								template = template.replace("{{requestView}}", resp.requestView);
								template = template.replace("{{requestDate}}", resp.requestDate);
								
								template = template.replace("{{categoryTheme}}", resp.categoryTheme);
								template = template.replace("{{requestTitle}}", resp.requestTitle);

								template = template.replace("{{requestContent}}", resp.requestContent);
								
								$("#requestSelectOne").append(template);
							}
							
						});
						
						$.ajax({
							url :"${pageContext.request.contextPath}/request/adminReplyList",
							type: "post",
							data:{
								requestNo:requestNo
							},
							success : function(resp){
								console.log(resp);
								$("#requestSelectOneReply").empty();
								
								for(var i=0; i < resp.length; i++){
									var template = $("#requestSeelctOneReplyContent").html();
									
									template = template.replace("{{memberNick}}", resp[i].memberNick);
									template = template.replace("{{requestReplyContent}}", resp[i].requestReplyContent);
									
									$("#requestSelectOneReply").append(template);
								}
							}
							
						});
						
						
					});
					
					
				}
			
			});
			
		});
		
		
		
	});	
	
</script>

<script id="searchContent" type="text/template">
<div class="admin-home-content-list div-select" style="text-align: center;" id="{{requestNo}}">
	<span style="width: 5%;">{{requestNo}}</span>	
	<span style="width: 10%;">{{categoryTheme}}</span>	
	<span style="width: 45%;">{{requestTitle}}</span>
	<span style="width: 10%; color: rgb(248, 100, 83); ;"><i class='far fa-heart'></i> {{requestLikeCount}}</span>
	<span style="width: 10%;"><i class="far fa-comment"></i> {{requestReplyCount}}</span>
	<span style="width: 10%;"><button class="admin-btn requestDelete" style="width: 50px;" id="{{requestNo}}">삭제</button></span>
	<span style="width: 10%;"><button class="admin-btn requestPage" style="width: 70px;" id="{{requestNo}}">게시글이동</button></span>
</div>
</script>

<script id="requestSeelctOneContent" type="text/template">
<div style="width: 100%; height:310px; border-bottom: 1px solid rgba(0,0,0,0.2); padding: 10px; ">
	<div style="height: 100%; width: 100%; display: flex;">
		<div style="order: 1; height: 100%; width: 100%;">
			<span class="admin-project-select-p">&lt; {{requestNo}} &gt;</span>
			<span class="admin-project-select-p"><i class="fas fa-user"></i> {{memberNick}}</span>
			<span class="admin-project-select-p"><i class="fas fa-heart"></i> {{requestLikeCount}}</span>
			<span class="admin-project-select-p"><i class="fas fa-comment"></i> {{requestReplyCount}}</span>
			<span class="admin-project-select-p"><i class="far fa-eye"></i> {{requestView}}</span>
			<span class="admin-project-select-p"><i class="far fa-calendar-alt"></i> {{requestDate}}</span>
								
			<p class="admin-project-select-p">{{categoryTheme}}</p>
			<p class="admin-project-select-p">타이틀 : {{requestTitle}}</p>
								
			<div class="topLine" style="padding: 10px 0; margin: 5px 0;">
				<p class="admin-project-select-p">내용</p>
				{{requestContent}}
			</div>
		</div>
	</div>
</div>
</script>

<script id="requestSeelctOneReplyContent" type="text/template">
	<div class="admin-home-content-list-div" style="width: 100%; height: 70px; margin:5px auto; ">
		<div class="admin-home-content-list" style="display: block;">
			<p style="width:100%; margin-bottom: 5px;">{{memberNick}}</p>	
			<pre class="overflow_nowrap" style="height: 20px; width: 100%;">{{requestReplyContent}}</pre>
		</div>
	</div>
</script>

	<section>
		<div class="admin-home_content_area">
			<div class="admin-home_content100">
				<p class="admin-home-top-p">자유게시판 관리</p>
			</div>
		</div>
		<div class="admin-home_content_area">
			<div class="admin-home_content100" style="height: 85px; padding: 15px 0;">
				<div class="admin-project-div1">
					<p class="admin-home-content-p">조건 검색</p>
				</div>
				<div class="admin-project-div2">
					<select class="admin-project-div2-select1" name="searchType" style="width: 10%;">
						<option value="null">선택</option>
						<option value="request_no">번호</option>
						<option value="request_title">제목</option>
						<option value="request_content">내용</option>
					</select>
					<select class="admin-project-div2-select2" name="requestOrderBy" style="width: 10%;">
						<option value="null">선택</option>
						<option value="request_no">번호순</option>
						<option value="request_like_count">인기순</option>
						<option value="request_view">조회순</option>
						<option value="request_reply_count">댓글많은순</option>
						<option value="request_date">작성순</option>
					</select>
					<input class="admin-project-div2-input" type="text" name="keyword" autocomplete="off">
					<button class="admin-project-div2-btn" id="search-btn"><i class="fas fa-search bacWhite"></i></button>
				</div>
			</div>
		</div>
		
		<div class="admin-home_content_area">
			<div class="admin-home_content100" style="height:420px; padding: 15px 0;">
				<div style="width: 100%; border-bottom: 1px solid rgba(0,0,0,0.2); padding: 0 0 5px 5px;">
					<p class="admin-home-content-p">리스트</p>
				</div>
				<div class="admin-project-div2"  style="display: inline;">
					<div class="admin-home-content-list" style="text-align: center; width: 99%;">
						<span style="width: 5%;">번호</span>
						<span style="width: 10%;">카테고리</span>
						<span style="width: 45%;">타이틀</span>
						<span style="width: 10%;">좋아요</span>
						<span style="width: 10%;">댓글</span>
						<span style="width: 10%;">삭제</span>
						<span style="width: 10%;">게시글보기</span>
					</div>
					
					<div class="admin-home-content-list-div" style="height: 300px;" id="requestSearchDiv">
						
					</div>
					
				</div>
			</div>
		</div>
		
		
		<div class="admin-home_content_area">
			<div class="admin-home_content100" style="min-height: 1000px; padding: 15px 0;">
				<div style="width: 100%; border-bottom: 1px solid rgba(0,0,0,0.2); padding: 0 0 5px 5px;">
					<p class="admin-home-content-p">게시글 상세보기</p>
				</div>
				
				<div id="requestSelectOne">
					
				</div>
				<div>
					<p class="admin-home-content-p" style="padding: 5px; border-bottom: 1px solid rgba(0,0,0,0.2); margin-top: 5px;">댓글</p>
					<div class="admin-project-div2"  style="display: inline; text-align: left; width:100%; height: 500px; padding: 10px;" id="requestSelectOneReply">
					</div>
				</div>
			</div>
		</div>
		
	</section>
</body>
</html>