<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/template/adminSidebar.jsp"></jsp:include>

<script>

	$(function(){
		
		
		$(".admin-home-content-list").not(".target").on("click", function(){
			var idNo = $(this).attr("id");
			
			$.ajax({
				url : "${pageContext.request.contextPath}/member/data/adminMsgSelectOne",
				type : "post",
				data : {
					msgNo : idNo
				},
				success : function(resp){
					$("#msgSelectOne").empty();
					
					var template = $("#msgSeelctOneContent").html();
					
					template = template.replace("{{msgNo}}", resp.msgNo);
					template = template.replace("{{msgTitle}}", resp.msgTitle);
					template = template.replace("{{msgDate}}", resp.msgDate);
					template = template.replace("{{senderNick}}", resp.senderNick);
					template = template.replace("{{receiverNick}}", resp.receiverNick);
					template = template.replace("{{msgContent}}", resp.msgContent);
					
					$("#msgSelectOne").append(template);
				}
			});
			
		});

	});
		
</script>

 <script id="msgSeelctOneContent" type="text/template">
<div style="width: 100%; height:310px; border-bottom: 1px solid rgba(0,0,0,0.2); padding: 10px; ">
	<div style="height: 100%; width: 100%; display: flex;">
		<div style="order: 1; height: 100%; width: 100%;">
			<span class="admin-project-select-p">&lt; {{msgNo}} &gt;</span>
			<span class="admin-project-select-p">{{msgTitle}}</span>
			<span class="admin-project-select-p"><i class="far fa-calendar-alt"></i> {{msgDate}}</span>
								
			<p class="admin-project-select-p">보낸 사람 : {{senderNick}}</p>
			<p class="admin-project-select-p">받는 사람 : {{receiverNick}}</p>
			<p class="admin-project-select-p" style="border-bottom: 1px solid rgba(0,0,0,0.2); margin:5px 0;">내용</p>
			<p class="admin-project-select-p">{{msgContent}}</p>
		</div>
	</div>
</div>
</script> 

	<section>
		<div class="admin-home_content_area">
			<div class="admin-home_content100">
				<p class="admin-home-top-p">신고 관리</p>
			</div>
		</div>
		
		<div class="admin-home_content_area">
			<div class="admin-home_content100" style="height:420px; padding: 15px 0;">
				<div style="width: 100%; border-bottom: 1px solid rgba(0,0,0,0.2); padding: 0 0 5px 5px;">
					<p class="admin-home-content-p">리스트</p>
				</div>
				<div class="admin-project-div2"  style="display: inline;">
					<div class="admin-home-content-list target" style="text-align: center; width: 99%;">
						<span style="width: 15%;">프로젝트번호</span>
						<span style="width: 70%;">신고내용</span>
						<span style="width: 15%;">신고횟수</span>
					</div>
					
					<div class="admin-home-content-list-div" style="height: 300px;" id="projectSearchDiv">
						<c:forEach var="adminProjectReportList1" items="${adminProjectReportList1}">
							<div class="admin-home-content-list" style="text-align: center; width: 100%;" id="${adminProjectReportList1.reportProjectNo}">
								<span style="width: 15%;">${adminProjectReportList1.reportProjectNo}</span> 
								<span style="width: 70%;">${adminProjectReportList1.projectTitle}</span> 
								<span style="width: 15%;">${adminProjectReportList1.reportCount}</span>
							</div>
						</c:forEach>
					</div>
					
				</div>
			</div>
		</div>
		
		
		<div class="admin-home_content_area">
			<div class="admin-home_content100" style="min-height: 4000px; padding: 15px 0;">
				<div style="width: 100%; border-bottom: 1px solid rgba(0,0,0,0.2); padding: 0 0 5px 5px;">
					<p class="admin-home-content-p">문의 내용</p>
				</div>
				
				<div id="msgSelectOne">
					
				</div>
			</div>
		</div>
		
	</section>
</body>
</html>