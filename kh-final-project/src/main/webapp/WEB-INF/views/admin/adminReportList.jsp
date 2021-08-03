<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/template/adminSidebar.jsp"></jsp:include>

<script>

	$(function(){
		
		
		$(".admin-home-content-list").on("click", function(){
			var reportProjectNo = $(this).attr("id");
			
			$(".admin-home-content-list").removeClass("on");
			$(this).addClass("on");
			
			$.ajax({
				url : "${pageContext.request.contextPath}/project/data/adminProjectReportList2",
				type : "post",
				data : {
					reportProjectNo : reportProjectNo
				},
				success : function(resp){
					$("#reportSelectOne").empty();
					
					
					for(var i=0; i<resp.length; i++){
						var template = $("#reportSeelctOneContent").html();
	
						template = template.replace("{{reportNo}}", resp[i].reportNo);
						template = template.replace("{{reportProjectNo}}", resp[i].reportProjectNo);
						template = template.replace("{{reportContent}}", resp[i].reportContent);
						template = template.replace("{{memberNick}}", resp[i].memberNick);
						template = template.replace("{{reportDate}}", resp[i].reportDate);
						
						$("#reportSelectOne").append(template);
					}
					
					
					
				}
			});
			
		});

	});
		
</script>

 <script id="reportSeelctOneContent" type="text/template">
<div class="admin-home-content-list" style="text-align: center; width: 100%;">
	<span style="width: 5%;">{{reportNo}}</span> 
	<span style="width: 10%;">{{reportProjectNo}}</span> 
	<span style="width: 55%;">{{reportContent}}</span>
	<span style="width: 10%;">{{memberNick}}</span> 
	<span style="width: 20%;">{{reportDate}}</span>
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
					<p class="admin-home-content-p">신고 내역</p>
				</div>
				
				<div class="admin-home-content-list" style="text-align: center; width: 100%;">
					<span style="width: 5%;">신고 번호</span> 
					<span style="width: 10%;">프로젝트 번호</span> 
					<span style="width: 55%;">내용</span>
					<span style="width: 10%;">회원 닉네임</span> 
					<span style="width: 20%;">신고 일자</span>
				</div>
				
				<div id="reportSelectOne">
					
				</div>
			</div>
		</div>
		
	</section>
</body>
</html>