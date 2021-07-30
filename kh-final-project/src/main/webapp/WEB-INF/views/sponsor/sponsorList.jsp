<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="sponsorVoList" value="${sponsorStartedProjectListByMemberNo}"></c:set>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<script>
	$(function() {

		function replaceProjectSummarizeTemplate(resp) {
			var template = $("#projectSummarizeTemplate").html();

			template = template.replace("{{projectTitle}}", resp.projectTitle);
			template = template.replace("{{projectTargetAmount}}", resp.projectTargetAmount);
			template = template.replace("{{sumCurrentAmountByAll}}", resp.sumCurrentAmountByAll);
			template = template.replace("{{projectPercent}}", resp.projectPercent);
			template = template.replace("{{projectStartDateString}}", resp.projectStartDate);
			template = template.replace("{{projectEndDateString}}", resp.projectEndDate);
			template = template.replace("{{sumSponsorAmountByOne}}", resp.sumSponsorAmountByOne);

			if (resp.projectPercent < 100) {
				template = template.replace("{{gaugePercent}}", resp.projectPercent);
				template = template.replace("{{gaugePercentColor}}", "255, 0, 0");
			} else {
				template = template.replace("{{gaugePercent}}", 100);
				template = template.replace("{{gaugePercentColor}}", "0, 255, 0");
			}

			$("#projectSummarize").append(template);
		}

		function replaceSponsorListTemplate(index, resp) {
			if (index == 0) {
				for (var i = 0; i < resp.length; i++) {
					var template = $("#sponsorListTemplate").html();
					if (resp[i].giftSummary != null) {
						template = template.replace("{{giftSummary}}", resp[i].giftSummary);
					} else {
						template = template.replace("{{giftSummary}}", " - ");
					}
					template = template.replace("{{sponsorAmount}}", resp[i].sponsorAmount);
					template = template.replace("{{sponsorDate}}", resp[i].sponsorDate);
					template = template.replace("{{sponsorNo}}", resp[i].sponsorNo);
					$("#projectSummarize").find(".sponsorList").append(template);
				}
			} else if (index == 1) {
				for (var i = 0; i < resp.length; i++) {
					var template = $("#sponsorFinishedListTemplate").html();
					if (resp[i].giftSummary != null) {
						template = template.replace("{{giftSummary}}", resp[i].giftSummary);
					} else {
						template = template.replace("{{giftSummary}}", " - ");
					}
					template = template.replace("{{sponsorAmount}}", resp[i].sponsorAmount);
					template = template.replace("{{sponsorDate}}", resp[i].sponsorDate);
					$("#projectSummarize").find(".sponsorList").append(template);
				}
			} else {
				for (var i = 0; i < resp.length; i++) {
					var template = $("#sponsorCanceledListTemplate").html();
					if (resp[i].giftSummary != null) {
						template = template.replace("{{giftSummary}}", resp[i].giftSummary);
					} else {
						template = template.replace("{{giftSummary}}", " - ");
					}
					template = template.replace("{{sponsorAmount}}", resp[i].sponsorAmount);
					$("#projectSummarize").find(".sponsorList").append(template);
				}
			}
			
			$(".sponsorCancel").on("click", function(){
				$(".ybModal").show();
				$(".ybModalBackground").show();
				$("#modalContent1").html($(this).parent().siblings(".targetSponsor").children(".targetGiftSummary").html());
				$("#modalContent2").html($(this).parent().siblings(".targetSponsor").children(".targetSponsorAmount").html());
				$("#modalContent3").html($(this).parent().siblings(".targetSponsor").children(".targetSponsorDate").html());
				$("input[name=sponsorNo]").val($(this).parent().siblings(".targetSponsor").children(".targetSponsorNo").html());
			});
			
			$(".ybModalBackground").on("click", function(){
				$(".ybModal").hide();
				$(".ybModalBackground").hide();
			});
			
			$(".ybModalX").on("click", function(){
				$(".ybModal").toggle();
				$(".ybModalBackground").toggle();
			});
			
		}

		$(".project-main-li").on("click", function() {
			$(".project-main-li").removeClass("main-li-on");
			$(this).addClass("main-li-on");
			$("#projectSummarize").empty();
			var that = $(this);
			$.ajax({
				url : "${pageContext.request.contextPath}/sponsor/data/sponsorVoList/" + $(this).index(),
				type : 'post',
				success : function(resp) {
					$("#sponsorVoList").empty();
					for (var i = 0; i < resp.length; i++) {
						var template = $("#sponsorVoListTemplate").html();
						template = template.replace("{{projectTitle}}", resp[i].projectTitle);
						template = template.replace("{{projectNo}}", resp[i].projectNo);
						$("#sponsorVoList").append(template);
					}

					$(".sponsorProject").on("click", function() {
						$("#projectSummarize").empty();
						var projectNo = $(this).find(".projectNo").text();
						
						$.ajax({
							url : "${pageContext.request.contextPath}/project/data/projectInformation",
							type : 'post',
							data : {
								"projectNo" : projectNo
							},
							success : function(resp) {

								replaceProjectSummarizeTemplate(resp);
								
								$("#moveToProjectDetailBtn").on("click", function(){
									url = "${pageContext.request.contextPath}/projectBoard/" + projectNo
									$(location).attr('href',url);
								});
								
								$.ajax({
									url : "${pageContext.request.contextPath}/project/data/sponsorListByProjectNo/" + that.index(),
									type : 'post',
									data : {
										"projectNo" : projectNo
									},
									success : function(resp) {

										replaceSponsorListTemplate(that.index(), resp);

									}
								});
							}
						});
					});

				}
			});
		});

		$(".sponsorProject").on("click", function() {
			$("#projectSummarize").empty();
			var projectNo = $(this).find(".projectNo").text();
			var that = $(this);
			$.ajax({
				url : "${pageContext.request.contextPath}/project/data/projectInformation",
				type : 'post',
				data : {
					"projectNo" : projectNo
				},
				success : function(resp) {
					
					replaceProjectSummarizeTemplate(resp);
					$("#moveToProjectDetailBtn").on("click", function(){
						url = "${pageContext.request.contextPath}/projectBoard/" + projectNo
						$(location).attr('href',url);
					});
					
					$.ajax({
						url : "${pageContext.request.contextPath}/project/data/sponsorListByProjectNo/" + that.index(),
						type : 'post',
						data : {
							"projectNo" : projectNo
						},
						success : function(resp) {

							replaceSponsorListTemplate(that.index(), resp);

						}
					});
				}
			});
		});

	});
</script>

<script id="projectSummarizeTemplate" type="text/template">

	<div class="h500">

		<div class="h200">
		
			<pre class="wordBreak preWrap fs18 fBold h80">{{projectTitle}}</pre>

			<pre class="fs12 fBold mb30 taRight"> {{projectStartDateString}} ~ {{projectEndDateString}}</pre>
		
			<pre class="fs12 fBold mb10">달성액 / 목표금액 (%)</pre>

			<div class="boc240 bosSolid bow1 w100p h30 poRelative">
				<div class="poAbsolute h100p" style="background-color: rgba({{gaugePercentColor}}, 0.05); width: {{gaugePercent}}%"></div>
				<pre class="poAbsolute fs12 fBold poAbsoluteLeftCenter" style="padding-left:5px;">{{sumCurrentAmountByAll}} / {{projectTargetAmount}}</pre>
				<pre class="poAbsolute fs12 fBold poAbsoluteRightCenter" style="padding-right:5px;">({{projectPercent}}%)</pre>
			</div>

		</div>		

		<div class="bac250 boc220 bosSolid bow1 w100p h270 p20">
			<pre class="fs12 fBold mb10">내 후원금액</pre>
			<pre class="fs12 fBold mb10 ml10">{{sumSponsorAmountByOne}}원</pre>
			<div class="w100p h170 bacWhite boc220 bosSolid bow1 sponsorList p10 scrollThin">
				
			</div>
		</div>

	</div>
	
	<div class="h100">
		<button id="moveToProjectDetailBtn" class="w100p project-btn btn3 project-btn-hover">상세 페이지로 이동</button>
	</div>

</script>

<script id="sponsorVoListTemplate" type="text/template">

	<div class="projectInsert3 w100p pb30">
		<button class="btn btn-hover w100p h80 sponsorProject">
			<div class="project-main-img w80 h100p"></div>
			<div class="btn-text projectTitle">{{projectTitle}}</div>
			<div class="dpNone projectNo">{{projectNo}}</div>
		</button>
	</div>

</script>

<script id="sponsorListTemplate" type="text/template">
	
	<div class="h70 dpFlex dpFlexCenter bac250 boc220 bosSolid bow1 mb10">
		<div class="w70p ml10 targetSponsor">
			<pre class="fs8 fBold mb5 oneLine targetGiftSummary">선택한 선물 : {{giftSummary}}</pre>
			<pre class="fs8 fBold mb5 oneLine targetSponsorAmount">후원액 : {{sponsorAmount}}</pre>
			<pre class="fs8 fBold mb5 targetSponsorDate">후원일자 : {{sponsorDate}}</pre>
			<pre class="dpNone targetSponsorNo">{{sponsorNo}}</pre>
		</div>
		<div class="w30p">
			<button class="sponsorCancel h40 w40 project-btn btn3 project-btn-hover fs8 fBold mb5">후원 취소</button>
		</div>
	</div>

</script>

<script id="sponsorFinishedListTemplate" type="text/template">
	
	<div class="h70 dpFlex dpFlexCenter bac250 boc220 bosSolid bow1 mb10">
		<div class="w100p ml10">
			<pre class="fs8 fBold mb5 oneLine">선택한 선물 : {{giftSummary}}</pre>
			<pre class="fs8 fBold mb5 oneLine">후원액 : {{sponsorAmount}}</pre>
			<pre class="fs8 fBold mb5">후원일자 : {{sponsorDate}}</pre>
		</div>
	</div>

</script>

<script id="sponsorCanceledListTemplate" type="text/template">
	
	<div class="h70 dpFlex dpFlexCenter bac250 boc220 bosSolid bow1 mb10">
		<div class="w100p ml10">
			<pre class="fs8 fBold mb5 oneLine">선택한 선물 : {{giftSummary}}</pre>
			<pre class="fs8 fBold mb5 oneLine">후원액 : {{sponsorAmount}}</pre>
			<pre class="fs8 fBold mb5 oneLine">후원 취소 되었습니다.</pre>
		</div>
	</div>

</script>

<section class="main-row topLine">

	<div class="container-1200 mt30 poRelative">
		<p class="fs34 pl20">
			<strong>후원 현황</strong>
		</p>
	</div>

	<div class="mt30 bottomLine poRelative">
		<div class="w1200 h35" style="margin: 0 auto;">
			<ul class="project-main-ul">
				<li class="project-main-li main-li-on"><a class="main-li-a cursorPointer">진행중인 프로젝트</a></li>
				<li class="project-main-li"><a class="main-li-a cursorPointer">완료된 프로젝트</a></li>
				<li class="project-main-li"><a class="main-li-a cursorPointer">후원 취소한 프로젝트</a></li>
			</ul>
		</div>
	</div>

	<div class="container-1400 dpFlex pl100 pr100">

		<div class="container-800 hMax600 mt30 mb30 scrollThin">

			<div id="sponsorVoList">
				<c:forEach var="sponsorVo" items="${sponsorStartedProjectListByMemberNo}">

					<div class="projectInsert3 w100p pb30">
						<button class="btn btn-hover w100p h80 sponsorProject">
							<div class="project-main-img w80 h100p"></div>
							<div class="btn-text projectTitle">${sponsorVo.projectTitle}</div>
							<div class="dpNone projectNo">${sponsorVo.projectNo}</div>
						</button>
					</div>

				</c:forEach>
			</div>

		</div>

		<div class="container-300 h600 mt30 mb30 boc200 bosSolid bow1 bora5 p30" id="projectSummarize"></div>

	</div>

	<div class="ybModal w400 h420 bora5 p20 taCenter">
		<div class="float-container">
			<div class="left"></div>
			<div class="right ybModalX"><i class="fas fa-times"></i></div>
		</div>
		
		<div class="taCenter h80">
			<pre class="fBold fs24 mb10">후원을 취소하시겠습니까?</pre>
			<pre class="fRed fs12"><i class="fas fa-exclamation-circle"></i> 무분별한 후원 취소는 이용에 제재를 받을 수 있습니다.</pre>
		</div>
		
		<div id="modalContent" class="w300 mautoX bac250 h200 bora10 boc240 bosSolid bow1 p20 taLeft scrollThin">
			<pre id="modalContent1" class="fs14 fBold mb10"></pre>
			<pre id="modalContent2" class="fs14 fBold mb10"></pre>
			<pre id="modalContent3" class="fs14 fBold mb10"></pre>
		</div>
		
		<div class="taCenter h60 mt20">
			<form action="sponsorCancel" method="post">
				<input type="hidden" name="sponsorNo" value="">
				<input type="submit" id="sponsorCancelBtn" class="project-btn btn1 project-btn-hover w300 p0 m0" value="후원 취소">
			</form>
		</div>
	</div>

	<div class="ybModalBackground"></div>

</section>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>


