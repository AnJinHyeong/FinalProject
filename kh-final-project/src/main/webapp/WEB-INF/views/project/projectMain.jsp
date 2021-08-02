<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<script>

	$(function() {

		$.ajax({
			url : "${pageContext.request.contextPath}/project/data/${projectDto.projectNo}/getProject",
			type : "post",
			success : function(resp) {
				//기본 정보 진행률
				var categoryNo;
				var projectTitle;
				var projectSummary;

				if (resp.categoryNo != 0)
					categoryNo = 1;
				else
					categoryNo = 0;
				if (resp.projectTitle == null || resp.projectTitle == "")
					projectTitle = 0;
				else
					projectTitle = 1;
				if (resp.projectSummary == null || resp.projectSummary == "")
					projectSummary = 0;
				else
					projectSummary = 1;

				//페이지 로딩 시 프로젝트 이미지가 있으면 화면에 송출
				$.ajax({
					url : "${pageContext.request.contextPath}/image/project/confirm/${projectDto.projectNo}",
					type : "post",
					success : function(resp) {
						if (resp == 1) {
							$.ajax({
								url : "${pageContext.request.contextPath}/image/project/getByProjectNo/${projectDto.projectNo}",
								type : "get",
								processData : false,
								contentType : false,
								success : function(resp) {
									var url = "${pageContext.request.contextPath}/image/project/projectMainDownload/" + resp.imageNo;
									document.getElementById("projectMainImage").style.backgroundImage = "url(" + url + ")";
								}

							});

							$("#projectDefault").text(25 * (categoryNo + projectTitle + projectSummary + 1));

						} else {

							$("#projectDefault").text(25 * (categoryNo + projectTitle + projectSummary));
						}
					}

				});

				//펀딩 정보 진행률
				var projectTargetAmount;
				var projectStartDate;
				var projectEndDate;

				if (resp.projectTargetAmount == 0 || resp.projectTargetAmount == "")
					projectTargetAmount = 0;
				else
					projectTargetAmount = 1;
				if (resp.projectStartDate == null || resp.projectStartDate == "")
					projectStartDate = 0;
				else
					projectStartDate = 1;
				if (resp.projectEndDate == null || resp.projectEndDate == "")
					projectEndDate = 0;
				else
					projectEndDate = 1;
				$("#projectFunding").text((34 * projectTargetAmount) + (33 * (projectStartDate + projectEndDate)));

				//스토리 진행률
				var projectContent;

				if (resp.projectContent == null || resp.projectContent == "") {
					$("#projectStory").text(0);
					;
				} else {
					$("#projectStory").text(100);
				}

				//창작자 정보
				var memberInfoNick;
				var memberInfoContent;

				if (resp.memberInfoNick == null || resp.memberInfoNick == "")
					memberInfoNick = 0;
				else
					memberInfoNick = 1;
				if (resp.memberInfoContent == null || resp.memberInfoContent == "")
					memberInfoContent = 0;
				else
					memberInfoContent = 1;

				$("#projectMember").text(33 * (memberInfoNick + memberInfoContent + 1) + 1);

			}

		});

		$.ajax({
			url : "${pageContext.request.contextPath}/project/data/${projectDto.projectNo}/getItem",
			type : "post",
			success : function(resp) {
				if (resp.length > 0) {//아이템 o
					$("#projectGiftItem").text(50);

					$.ajax({
						url : "${pageContext.request.contextPath}/project/data/${projectDto.projectNo}/getGift",
						type : "Post",
						success : function(resp) {
							if (resp.length > 0) { //선물 o
								$("#projectGiftItem").text(100);

							} else {
								$("#projectGiftItem").text(50);
							}

						}

					});

				} else {//아이템 x
					$("#projectGiftItem").text(0);
				}
			}

		});

		$("#examineModalBtn, #modalBackground, #examineXBtn, #examineCheckBtn").on("click", function() {
			$("#examineModal").toggle();
			$("#modalBackground").toggle();
			$('body').toggleClass('scrollNone');
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
						<button class="project-btn btn2">종료된 프로젝트</button>
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
						<p style="font-size: 35px;">
							<strong>${projectDto.projectTitle}</strong>
						</p>
					</c:when>
					<c:otherwise>
						<p style="font-size: 35px;">
							<strong>프로젝트의 이름을 작성해주세요.</strong>
						</p>
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
						<li class="project-main-li main-li-on"><a href="${pageContext.request.contextPath}/project/${projectDto.projectNo}/projectMain" class="main-li-a">프로젝트 기획</a></li>
						<li class="project-main-li"><a href="${pageContext.request.contextPath}/project/${projectDto.projectNo}/projectMainApproval" class="main-li-a ">승인심사 요청</a></li>
						<li class="project-main-li"><a href="${pageContext.request.contextPath}/project/${projectDto.projectNo}/projectMainCommunity" class="main-li-a">커뮤니티</a></li>
						<li class="project-main-li"><a href="${pageContext.request.contextPath}/project/${projectDto.projectNo}/projectMainSponsor" class="main-li-a">후원자 관리</a></li>
					</ul>
				</c:when>
				<c:otherwise>
					<ul class="project-main-ul">
						<li class="project-main-li main-li-on"><a href="${pageContext.request.contextPath}/project/${projectDto.projectNo}/projectMain" class="main-li-a">프로젝트 기획</a></li>
						<li class="project-main-li"><a href="${pageContext.request.contextPath}/project/${projectDto.projectNo}/projectMainApproval" class="main-li-a">승인심사 요청</a></li>
						<li class="project-main-li"><a href="${pageContext.request.contextPath}/project/${projectDto.projectNo}/projectMainCommunity" class="main-li-a project-disable">커뮤니티<i class="fas fa-lock" style="margin-left: 5px; font-size: 12px;"></i></a></li>
						<li class="project-main-li"><a href="${pageContext.request.contextPath}/project/${projectDto.projectNo}/projectMainSponsor" class="main-li-a project-disable">후원자 관리<i class="fas fa-lock" style="margin-left: 5px; font-size: 12px;"></i></a></li>
					</ul>
				</c:otherwise>
			</c:choose>

		</div>
	</div>

	<div class="topLine project-back-color" style="height: 650px;">

		<div class="section-project-row" style="padding: 25px 0 200px 0;">
			<div style="width: 100%; text-align: right;">
				<button id="examineModalBtn" class="project-btn btn1 project-btn-hover" style="margin: 0;">심사기준</button>
			</div>


			<div style="width: 100%; display: flex; -webkit-box-pack: justify; justify-content: space-between; padding: 20px 0;">
				<a class="project-main-link" href="${root}/project/${projectNo}/projectMainDefault">
					<div style="margin: 0px 0px 70px;">
						<p class="fRed fBold f16">
							<i class="fas fa-pen"></i>
						</p>
					</div>
					<p>
						<strong>기본정보</strong> <span class="project-main-span"><span id="projectDefault">0</span>% 작성완료</span>
					</p>
				</a> <a class="project-main-link" href="${root}/project/${projectNo}/projectMainFunding">
					<div style="margin: 0px 0px 70px;">
						<p class="fRed fBold f16">
							<i class="fas fa-money-check-alt"></i>
						</p>
					</div>
					<p>
						<strong>펀딩 계획</strong> <span class="project-main-span"><span id="projectFunding">0</span>% 작성완료</span>
					</p>
				</a> <a class="project-main-link" href="${root}/project/${projectNo}/projectMainGift">
					<div style="margin: 0px 0px 70px;">
						<p class="fRed fBold f16">
							<i class="fas fa-gift"></i></i>
						</p>
					</div>
					<p>
						<strong>선물 구성</strong> <span class="project-main-span"><span id="projectGiftItem">0</span>% 작성완료</span>
					</p>
				</a> <a class="project-main-link" href="${root}/project/${projectNo}/projectMainStory">
					<div style="margin: 0px 0px 70px;">
						<p class="fRed fBold f16">
							<i class="fas fa-book"></i></i>
						</p>
					</div>
					<p>
						<strong>스토리</strong> <span class="project-main-span"><span id="projectStory">0</span>% 작성완료</span>
					</p>
				</a> <a class="project-main-link" href="${pageContext.request.contextPath}/project/${projectNo}/projectMainMember">
					<div style="margin: 0px 0px 70px;">
						<p class="fRed fBold f16">
							<i class="fas fa-smile"></i></i>
						</p>
					</div>
					<p>
						<strong>창작자 정보</strong> <span class="project-main-span"><span id="projectMember">0</span>% 작성완료</span>
					</p>
				</a>
			</div>

		</div>


	</div>

	<div id="examineModal" class="ybModal h800 w1000 p30 bora10">

		<div class="float-container h5p">
			<span id="examineXBtn" class="ybModalX right"><i class="fas fa-times"></i></span>
		</div>

		<div class="taCenter h15p">
			<pre class="fBold fs24 mb10">Fun_ding의 프로젝트 심사기준을 확인해주세요.</pre>
			<pre>심사 기준을 준수하면 보다 빠른 프로젝트 승인이 가능합니다.</pre>
		</div>

		<div class="float-container h70p pb50">
			<div class="left w40p bac250 h100p bora10 ml60 boc240 bosSolid bow1 taCenter p40">
				<div class="fGreen fs24 mb10">
					<i class="fas fa-check-circle"></i>
				</div>
				<pre class="fs18 mb40">승인 가능 프로젝트</pre>
				<div class="taLeft ybUl">
					<ul class="small">
						<li>기존에 없던 새로운 시도</li>
						<li>기존에 없던 작품, 제품, 디지털 콘텐츠, 활동, 행사</li>
						<li>창작자의 이전 제품 및 콘텐츠는 새로운 선물에 부수적으로 제공 가능</li>
					</ul>
				</div>
			</div>
			<div class="right w40p bac250 h100p bora10 mr60 boc240 bosSolid bow1 taCenter p40">
				<div class="fRed fs24 mb10">
					<i class="fas fa-times-circle"></i>
				</div>
				<pre class="fs18 mb40">반려 대상 프로젝트</pre>
				<div class="taLeft ybUl">
					<ul class="small">
						<li>기존 상품· 콘텐츠의 판매 및 홍보</li>
						<li>제3자에 후원금 또는 물품 기부</li>
						<li>시중에 판매 및 유통되었던 제품·콘텐츠 제공</li>
						<li>현금, 주식, 지분, 복권, 사이버머니, 상품권 등 수익성 상품 제공</li>
						<li>추첨을 통해서만 제공되는 선물</li>
						<li>성인용 제품·콘텐츠, 무기, 군용장비, 라이터 등 위험 품목</li>
					</ul>
				</div>
			</div>
		</div>

		<div class="taCenter h10p">
			<button id="examineCheckBtn" class="project-btn btn1 project-btn-hover w50p">확인</button>
		</div>
	</div>

	<div id="modalBackground" class="ybModalBackground"></div>

</section>



</body>
</html>