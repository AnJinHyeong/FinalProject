<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<script>
	
	$(function(){
		
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
							document.getElementById("projectMainImage").style.backgroundImage = "url("+url+")";
						}
					
					});				
				}
			}
			
		});
		
		$.ajax({
			url : "${pageContext.request.contextPath}/project/data/progress",
			type : 'post',
			data : {
				"projectNo" : "${projectDto.projectNo}"
			},
			success : function(resp) {
				$("#progress").text(resp);
			}
		});
		
		
		$(".sponsorListDivOne").on("click",function(){
			var sponsorNo = $(this).attr("id");
			console.log(sponsorNo);
			$.ajax({
				url : "${pageContext.request.contextPath}/project/data/getSponsorSelect",
				type : 'post',
				data :{
					sponsorNo:sponsorNo
				},
				success : function(resp) {
					console.log(resp);
					$("#sponsorDiv").empty();
					
					var template = $("#sponsorDivContent").html();
					template = template.replace("{{memberNick}}", resp.memberNick);
					template = template.replace("{{memberEmail}}", resp.memberEmail);
					template = template.replace("{{memberAddress}}", resp.memberAddress);
					
					if(resp.giftNo != null){
						template = template.replace("{{giftNo}}", resp.giftNo);
						template = template.replace("{{giftSummary}}", resp.giftSummary);
					}
					else{
						template = template.replace("{{giftNo}}", "없음");
						template = template.replace("{{giftSummary}}", "없음");
					}
					
					template = template.replace("{{sponsorAmount}}", resp.sponsorAmount);
					
					
					$("#sponsorDiv").append(template);
				}
			});
		});
		
		var projectNo = ${projectDto.projectNo};
		
		$.ajax({
			url : "${pageContext.request.contextPath}/project/data/projectInformation",
			type : 'post',
			data : {
				"projectNo" : projectNo
			},
			success : function(resp) {
				if (resp.projectPercent < 100) {
					
					$("#projectGaugeBackground").css("background-color", "rgba(255, 0, 0, 0.05)");
					$("#projectGaugeBackground").css("width", resp.projectPercent + "%");
					
				} else {
					$("#projectGaugeBackground").css("background-color", "rgba(0, 255, 0, 0.05)");
					$("#projectGaugeBackground").css("width", "100%");
				}
				$("#projectGaugePercent").text("(" + resp.projectPercent + "%)");
				$("#projectGaugeAmount").text(resp.sumCurrentAmountByAll + " / " + resp.projectTargetAmount);
			}
		});
		
		
	});
	

</script>

<script id="sponsorDivContent" type="text/template">
	<div style="width: 100%; height: 40px; margin: 10px 0; font-weight: bold; font-size: 20px; background-color: #fff; border: 1px solid #dcdcdc; border-radius: 8px; padding: 7px 5px;">
		후원 정보 상세 보기
	</div>
	<div style="width: 100%; height: 440px; background-color: #fff; border: 1px solid #dedede; border-radius: 5px; padding: 20px; margin: 10px 0;">
		<div style="height: 50%; width: 100%;">
			<p style="font-size: 25px; font-weight: bold; margin-bottom: 10px;">회원 정보</p>
			<p style="font-size: 16px; font-weight: bold;"><span class="font-12 red"><i class="far fa-smile"></i></span> 회원 닉네임 </p>
			<p style="font-size: 16px; margin-bottom: 10px; padding-left: 10px;">{{memberNick}}</p>
			<p style="font-size: 16px; font-weight: bold;"><span class="font-12 red"><i class="fas fa-envelope"></i></span> 회원 이메일</p>
			<p style="font-size: 16px; margin-bottom: 10px; padding-left: 10px;">{{memberEmail}}</p>
			<p style="font-size: 16px; font-weight: bold;"><span class="font-12 red"><i class="fas fa-map-marked-alt"></i></span> 회원 주소</p>
			<p style="font-size: 16px; margin-bottom: 10px; padding-left: 10px;">{{memberAddress}}</p>
	</div>
	<div style="height: 50%; width: 100%;">
			<p style="font-size: 25px; font-weight: bold; margin-bottom: 10px;">후원 아이템 정보</p>
			<p style="font-size: 16px; margin-bottom: 10px; font-weight: bold;"><span class="font-12 red"><i class="fas fa-gifts"></i></span> 선물번호 {{giftNo}}</p>
			<p style="font-size: 16px; font-weight: bold;"><span class="font-12 red"><i class="fas fa-gift"></i></span> 선물 설명 </p>
			<p style="font-size: 16px; margin-bottom: 10px; padding-left: 10px;">{{giftSummary}}</p>
	</div>
	</div>
	<div style="width: 100%; height: 60px; background-color: #fff; border: 1px solid #dedede; border-radius: 5px; padding: 10px 20px 10px 10px;">
		<div style="height: 100%; width: 100%; font-size: 20px; font-weight: bold; text-align: right; padding: 5px;">
			 후원 금액 : <span style="font-size: 16px; color: #5d5d5d;">{{sponsorAmount}}</span><span style="color: #ffd700; font-size: 16px;"> <i class="fas fa-coins"></i></span>
		</div>
	</div>

</script> 

<section class="main-row topLine">
	<div class="section-project-row">
			<div class="project-main-div1">
			
				<div class="boc240 bosSolid bow1 w200 h40 poRelative mr20">
					<div id="projectGaugeBackground" class="poAbsolute h100p dpFlex"></div>
					<pre id="projectGaugeAmount" class="poAbsolute fs12 fBold poAbsoluteLeftCenter" style="padding-left:5px;"></pre>
					<pre id="projectGaugePercent" class="poAbsolute fs12 fBold poAbsoluteRightCenter" style="padding-right:5px;"></pre>
				</div>
			
				<c:choose>
					<c:when test="${projectDto.projectState == '1' || projectDto.projectState == '2'}">
						<a href="${pageContext.request.contextPath}/projectBoard/${projectDto.projectNo}"><button class="project-btn btn1 project-btn-hover" id="projectBoard">미리보기</button></a>
					</c:when>
					<c:otherwise>
						<a href="${pageContext.request.contextPath}/projectBoard/${projectDto.projectNo}"><button class="project-btn btn1 project-btn-hover" id="projectBoard">프로젝트 확인</button></a>
					</c:otherwise>
				</c:choose>
				<div style="text-decoration: none; height: 40px;">
					<c:choose>
						<c:when test="${projectDto.projectState == '1'}">
							<button class="project-btn btn2">기획중·<span id="progress"></span>% 완료</button>
						</c:when>
						<c:when test="${projectDto.projectState == '2'}">
							<button class="project-btn btn2">프로젝트 심사중</button>
						</c:when>
						<c:when test="${projectDto.projectState == '3'}">
							<button class="project-btn btn2">프로젝트 펀딩</button>
						</c:when>
						<c:when test="${projectDto.projectState == '4'}">
							<button class="project-btn btn2">프로젝트 펀딩종료</button>
						</c:when>
						<c:otherwise>
							<button class="project-btn btn2">프로젝트 중단</button>
						</c:otherwise>
					</c:choose>
				</div>
				
			</div>
			
			<div class="project-main-div2">
				<div class="project-main-img" id="projectMainImage"></div>
				<div>
					<c:choose>
						<c:when test="${projectDto.projectTitle != null}">
							<p style="font-size: 35px;"><strong>${projectDto.projectTitle}</strong></p>
						</c:when>
						<c:otherwise>
							<p style="font-size: 35px;"><strong>프로젝트의 이름을 작성해주세요.</strong></p>
						</c:otherwise>
					</c:choose>
					
						<p style="font-size: 14px; line-height: 24px; letter-spacing: -0.015em; color: rgb(109, 109, 109);">
							<c:if test="${categoryDto2.categoryTheme != null}">
							${categoryDto2.categoryTheme} • 
							</c:if>
							${categoryDto.categoryTheme}
						<p>
				</div>
			</div>
		
			<div style="overflow-x: hidden; padding: 0px;">
				<c:choose>
					<c:when test="${projectDto.projectState == '3' || projectDto.projectState == 'X' || projectDto.projectState == '4'}">
						<ul class="project-main-ul">
							<li class="project-main-li"><a href="${pageContext.request.contextPath}/project/${projectDto.projectNo}/projectMain" class="main-li-a">프로젝트 기획</a></li>
							<li class="project-main-li"><a href="${pageContext.request.contextPath}/project/${projectDto.projectNo}/projectMainApproval" class="main-li-a ">승인심사 요청</a></li>
							<li class="project-main-li"><a href="${pageContext.request.contextPath}/project/${projectDto.projectNo}/projectMainCommunity" class="main-li-a">커뮤니티</a></li>
							<li class="project-main-li main-li-on"><a href="${pageContext.request.contextPath}/project/${projectDto.projectNo}/projectMainSponsor" class="main-li-a">후원자 관리</a></li>
						</ul>
					</c:when>
					<c:otherwise>
						<ul class="project-main-ul">
							<li class="project-main-li"><a href="${pageContext.request.contextPath}/project/${projectDto.projectNo}/projectMain" class="main-li-a">프로젝트 기획</a></li>
							<li class="project-main-li"><a href="${pageContext.request.contextPath}/project/${projectDto.projectNo}/projectMainApproval" class="main-li-a">승인심사 요청</a></li>
							<li class="project-main-li"><a href="${pageContext.request.contextPath}/project/${projectDto.projectNo}/projectMainCommunity" class="main-li-a project-disable">커뮤니티<i class="fas fa-lock" style="margin-left: 5px; font-size: 12px;"></i></a></li>
							<li class="project-main-li main-li-on"><a href="${pageContext.request.contextPath}/project/${projectDto.projectNo}/projectMainSponsor" class="main-li-a project-disable">후원자 관리<i class="fas fa-lock" style="margin-left: 5px; font-size: 12px;"></i></a></li>
						</ul>
					</c:otherwise>
				</c:choose>
			</div>
	</div>
	
	<div class="topLine project-back-color" style="height: 800px;">
		
		<div class="section-project-row">
		
			<div class="" style=" height: 20px; width: 1200px; padding-top: 50px; text-align: left; font-weight: bold; font-size: 30px;">
				프로젝트 후원자 관리
			</div>
			
		
			<div class="project-community-div">
				<div class="project-community-row1 scrollThin" id="sponsorListDiv">
					<div class="topLine bottomLine sponsor-div-top">
						<span class="font-12" style="text-align: center; width: 10%;">후원 번호</span>
						<span class="font-12 overflow" style="text-align: left; width: 20%;"></span>
						<span class="font-12 " style="text-align: center; width: 35%;">후원 금액</span>
						<span class="font-12" style="text-align: center; width: 35%;">후원 일자</span>
					</div>
					<c:forEach var="sponsorList" items="${sponsorList}">
						<div class="topLine bottomLine sponsor-div sponsorListDivOne" id="${sponsorList.sponsorNo}">
							<span class="font-12" style="text-align: center; width: 5%;">${sponsorList.sponsorNo}</span>
							<span class="font-12 overflow" style="text-align: left; width: 20%;"></span>
							<span class="font-12 " style="text-align: center; width: 45%;">${sponsorList.sponsorAmount}원</span>
							<span class="font-12" style="text-align: center; width: 30%;"><fmt:formatDate value="${sponsorList.sponsorDate}" pattern="yyyy-MM-dd [E] a hh:mm:ss"/></span>
						</div>
					</c:forEach>
				</div>
				
				<!-- 등록 수정 -->
				<div class="project-community-row1" style="width: 550px;" id="sponsorDiv">
					
				</div>
			</div>
		</div>
		
		
	</div>

</section>



</body>
</html>