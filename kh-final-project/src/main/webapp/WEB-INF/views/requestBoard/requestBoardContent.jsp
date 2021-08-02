<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<script>
	$(function(){
		
		if(${not empty memberNo}){
			$.ajax({
				url : "${pageContext.request.contextPath}/member/memberSelect",
				type : 'post',
				success : function(resp) {
					$("#memberNick").text(resp.memberNick);
					$("input[name=requestReplyMemberNo]").text(resp.memberNo);
				}
				
			});
		}
		
		if(!${not empty memberNo}){
			$("#requestLikeIcon").addClass('far');
			
			$("#requestLikeBtn").on("click",function(){
				window.alert("로그인 후 이용이 가능합니다.");
			});
		}
		
		//좋아요 기능
		if(${not empty memberNo}){
			$.ajax({
				url :"${pageContext.request.contextPath}/requestLike/requestLikeConfirm/${requestNo}",
				type: "post",
				success : function(resp){
					if(resp == 1){
						$("#requestLikeIcon").addClass('fas');
					}
					else{
						$("#requestLikeIcon").addClass('far');
					}
				}
			
			});
		}
		
		
		$("#requestLikeBtn").on("click",function(){
			
			$.ajax({
				url :"${pageContext.request.contextPath}/requestLike/requestLikeConfirm/${requestNo}",
				type: "post",
				success : function(resp){
					if(resp == 1){
						$.ajax({
							url :"${pageContext.request.contextPath}/requestLike/requestLikeDelete/${requestNo}",
							type: "get",
							success : function(resp){
								
							}
						
						});
						$("#requestLikeIcon").addClass('far');
						$("#requestLikeIcon").removeClass('fas');
						$("#likeCount").text(Number($("#likeCount").text()) - 1);
					}
					else{
						$.ajax({
							url :"${pageContext.request.contextPath}/requestLike/requestLikeAdd/${requestNo}",
							type: "get",
							success : function(resp){
								
							}
						
						});
						$("#requestLikeIcon").addClass('fas');
						$("#requestLikeIcon").removeClass('far');
						$("#likeCount").text(Number($("#likeCount").text()) + 1);
					}
				}
			
			});
			
			
		});
		
		$('#editIcon').hover(function() {
			  $("#editI").removeClass('fas');
			  $("#editI").removeClass('fa-pencil-alt');
			  $("#editI").text("수정");
			}, function(){
				$("#editI").addClass('fas');
				$("#editI").addClass('fa-pencil-alt');
				$("#editI").text("");
			});
		
		
		
		
		
	});
</script>


<section class="main-row topLine">

	<div class="mt30 poRelative">
		<div style="width: 1200px; margin: 20px auto;">
			<p class="fs34 pl20"><strong>자유 게시판</strong></p>
		</div>
	</div>
	
	<div class="mt30 bottomLine poRelative">
		<div class="w1200 h35" style="margin: 0 auto;">
			<ul class="project-main-ul">
				<li class="project-main-li"><a class="main-li-a cursorPointer" href="${pageContext.request.contextPath}/requestBoard/requestBoard">소통 공간</a></li>
				<li class="project-main-li main-li-on"><a class="main-li-a cursorPointer">${requestNo}번 게시글</a></li>
			</ul>
		</div>
	</div>
	
	<div class="container-1200" style="margin: 0 auto; height: 700px; display: flex; flex-wrap: wrap;" id="projectRequestDiv1">
		
		<div class="container-1000 hMin300 mt30 mb10" style="border: 1px solid #dcdcdc; border-radius: 8px; padding: 20px;">
			
			<div style="padding-left: 10px;" class="float-container">
				<p class="font-20 left" style="width: 95%;">${request.requestTitle} 
					<span class="font-20 red request-Like-Btn" id="requestLikeBtn"><i class=' fa-heart' id="requestLikeIcon"></i> <span style="font-size: 14px;" id="likeCount">${request.requestLikeCount}</span></span>
				</p>
				<c:if test="${memberNo == request.requestMemberNo}">
					<p class="right" style="width: 5%; text-align: right;">
						<a id="editIcon" class="red" style="font-size: 14px;" href="${pageContext.request.contextPath}/requestBoard/requestBoardEdit/${request.requestNo}"><i id="editI" class="fas fa-pencil-alt"></i></a>
						<a class="font-20 red" href="${pageContext.request.contextPath}/requestBoard/requestDelete/${request.requestNo}">x</a>
					</p>
				</c:if>
			</div>
			<div class="float-container" style="margin: 10px 0; border-bottom: 1px solid red; padding: 10px 0 10px 10px; color: #7c7c7c;">
				 <span class="font-12 left">${request.categoryTheme}</span>
				 <span class="font-12 right" style="color: black">조회수:${request.requestView} ${request.requestDate}</span>
			</div>
			
			<div >
				<pre class="overflow_nowrap">${request.requestContent}</pre>
			</div>
			
			<div>
				
			</div>
			
		</div>
		
		<c:choose>
			<c:when test="${not empty memberNo}">
				<div class="container-1000 hMax120 mt10 mb10" style="border: 1px solid #dcdcdc; border-radius: 8px; padding: 10px;">
					<form action="requestInsertReply" method="post">
						<input type="hidden" value="${request.requestNo}" name="requestNo">
						<input type="hidden" value="" name="requestReplyMemberNo">
						
						<div style="padding-bottom: 5px;">
							<p id="memberNick"></p>
						</div>
						<div>
							<textarea class="project-insert-text" rows="1" name="requestReplyContent" required autocomplete="off" style="height: 50px; width: 100%;"></textarea>
						</div>
						<div class="text-right">
							<button class="request-btn" style="width: 50px; height: 20px; margin: 0;">등록</button>
						</div>
					</form>
				</div>
			</c:when>
			<c:otherwise>
				<div class="container-1000 hMax120 mt10 mb10" style="border: 1px solid #dcdcdc; border-radius: 8px; padding: 50px 10px;">
					<p style="text-align: center; height: 20px; align-items: center;">로그인 후 댓글 기능을 이용해 보세요.</p>
				</div>
			</c:otherwise>
		</c:choose>
		
		<div style="border-bottom: 1px solid #dcdcdc; width: 1000px; padding-left: 10px; margin: 10px auto 0 auto; height: 20px;"> 
			<p>댓글 (${replyCount})</p>
		</div>
		
		<c:if test="${replyCount != 0}">
			<div class="container-1000 mt10 mb10" style="border: 1px solid #dcdcdc; border-radius: 8px; padding: 10px;">
				<c:forEach var="replyList" items="${replyList}">
					<div class="container-950 mt10 mb10" style="border: 1px solid #dcdcdc; border-radius: 8px; padding: 10px;">
						<div class="float-container" style="padding-bottom: 5px;">
							<p class="left">${replyList.memberNick}</p>
							<c:if test="${not empty memberNo}">
								<c:if test="${memberNo == replyList.requestReplyMemberNo}">
									<a class="right"  href="${pageContext.request.contextPath}/requestBoard/replyDelete/${replyList.requestReplyNo}/${replyList.requestReplyPkNo}"><pstyle="font-weight: bold; font-size: 14px;"><i class="fas fa-times"></i></p></a>
								</c:if>
							</c:if>
						</div>
						<div>
							<pre class="overflow_nowrap" style="height: 50px; width: 100%;">${replyList.requestReplyContent}</pre>
						</div>
					</div>
				</c:forEach>
			</div>
		</c:if>
		
	</div>
	
</section>

</body>
</html>
	
