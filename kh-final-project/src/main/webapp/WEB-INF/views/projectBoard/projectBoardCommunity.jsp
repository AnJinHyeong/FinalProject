<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<script>
		
	$(function(){
		
		//페이지 로딩 시 창작자 이미지가 있으면 화면에 송출
		$.ajax({
			url :"${pageContext.request.contextPath}/image/member/confirmMemberImage/${projectDto.projectNo}",
			type: "post",
			success : function(resp){
				if(resp == 1){
					$.ajax({
						url :"${pageContext.request.contextPath}/image/member/getByMemberNoImage/${projectDto.projectNo}",
						type: "get",
						processData : false,
						contentType : false,
						success : function(resp){
							var url = "${pageContext.request.contextPath}/image/member/memberDownload/"+resp.imageNo;
							$("#memberImage").attr("src",url);
							$("#memberImage2").attr("src",url);
						}
						
					});				
				}
				else{
					$("#memberImage").attr("src","${pageContext.request.contextPath}/image/memberImageNull.png");
					$("#memberImage2").attr("src","${pageContext.request.contextPath}/image/memberImageNull.png");
				}
			}
		
		});
		
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
							$("#projectMainImage").attr("src",url);
						}

					});


				}
				else{
					$("#projectMainImage").attr("src","${pageContext.request.contextPath}/image/projectImageNull.png");
				}
			}
		});
		

		//좋아요 기능
		if(!${not empty memberNo}){
			$("#projectLikeBtnI").addClass('far');
			
			$("#projectLikeBtn").on("click",function(){
				window.alert("로그인 후 이용이 가능합니다.");
			});
		}
		
		if(${not empty memberNo}){
			$.ajax({
				url :"${pageContext.request.contextPath}/projectLike/${projectDto.projectNo}/projectLikeConfirm",
				type: "post",
				success : function(resp){
					if(resp == 1){
						$("#projectLikeBtnI").addClass('fas');
					}
					else{
						$("#projectLikeBtnI").addClass('far');
					}
				}
			
			});
		}
		
		
		$("#projectLikeBtn").on("click",function(){
			
			$.ajax({
				url :"${pageContext.request.contextPath}/projectLike/${projectDto.projectNo}/projectLikeConfirm",
				type: "post",
				success : function(resp){
					if(resp == 1){
						$.ajax({
							url :"${pageContext.request.contextPath}/projectLike/${projectDto.projectNo}/projectLikeDelete",
							type: "get",
							success : function(resp){
								
							}
						
						});
						$("#projectLikeBtnI").addClass('far');
						$("#projectLikeBtnI").removeClass('fas');
					}
					else{
						$.ajax({
							url :"${pageContext.request.contextPath}/projectLike/${projectDto.projectNo}/projectLikeAdd",
							type: "get",
							success : function(resp){
								
							}
						
						});
						$("#projectLikeBtnI").addClass('fas');
						$("#projectLikeBtnI").removeClass('far');
					}
				}
			
			});
			
			
		});
		
		

		//신고하기
		if(!${not empty memberNo}){
			$("#report").on("click",function(){
				window.alert("로그인 후 이용이 가능합니다.");
			});
		}
		
		$("#report2").hide();
	    
		$('#report').hover(function() {
		  $("#report1").hide();
		  $("#report2").show();
		  
		}, function(){
			$("#report1").show();
			$("#report2").hide();
		});
		
		const modal = document.querySelector('.report-modal'); 
		const btnOpenPopup = document.querySelector('#report'); 
		btnOpenPopup.addEventListener('click', () => { modal.style.display = 'block'; });
		
		$("#modal-cancel").on("click",function(){
			$(".report-modal").hide();
		});
		
		//펀딩 기간 계산
		var today = new Date();
		var dd = today.getDate();
		var mm = today.getMonth()+1; //January is 0 so need to add 1 to make it 1!
		var yyyy = today.getFullYear();
		if(dd<10){
		  dd='0'+dd
		} 
		if(mm<10){
		  mm='0'+mm
		} 
		today = yyyy+'-'+mm+'-'+dd;
		
		var startday = $(".projectStartDate").val();
		var endday = $(".projectEndDate").val();
		
		var sdd = today;//오늘날짜
		var startday = startday;//펀딩시작날짜
		var endday = endday;//펀딩끝날짜
	   	var ar1 = sdd.split('-');
	   	var ar2 = startday.split('-');
	   	var ar3 = endday.split('-');
	   	var da1 = new Date(ar1[0], ar1[1], ar1[2]);
   		var da2 = new Date(ar2[0], ar2[1], ar2[2]);
   		var da3 = new Date(ar3[0], ar3[1], ar3[2]);
   		
   		var dif = da1 >= da2;//펀딩 시작전
	   	var dif2 = da3 - da1;//펀딩 종료일까지 일수 계산
	   	var dif3 = da3 <= da1;//펀딩 종료 시점
	   	
		if(dif == false){
			$("#day-open1").hide();
			$("#day-open2").show();
			$("#day-open3").hide();
			$("#project-board-content").hide();
			$("#project-board-mid").hide();
		}
		else if(dif3 == true){
			$("#day-open1").hide();
			$("#day-open2").hide();
			$("#day-open3").show();
			$("#project-board-content").hide();
			$("#project-board-mid").hide();
		}
		else{
			$("#day-open1").show();
			$("#day-open2").hide();
			$("#day-open3").hide();
			$("#project-board-content").show();
			$("#project-board-mid").show();
		}
		
		var dif2 = da3 - da1;
	   	var cDay = 24 * 60 * 60 * 1000;// 시 * 분 * 초 * 밀리세컨
	   	var cMonth = cDay * 30;// 월 만듬
	   	var cYear = cMonth * 12; // 년 만듬
	 	if(startday && endday){
		    $("#funding-date").text(parseInt(dif2/cDay)+" 일");
	 	}

	});
		
	function showMsg() {

		window.open("${root}/member/${projectNo}/msgWrite","a","width=600, height=430, left=400, top=100 ,status=no,toolbar=no");

	} 
</script>

<script id="likeTemplate" type="text/template">
<div class="project-board-community-row">
	<div class="project-board-community-row100" style="padding: 10px;">
		<div style="width: 100%; height: 30px;">
			<span style="font-weight: bold; font-size: 18px;">{{memberNick}}</span>
		</div>
	</div>
	<div class="project-board-community-row100" style="padding: 10px; height: 50px; font-size: 15px;">
		{{projectCommunityContent}}
	</div>
	<div class="project-board-community-row100 topLine" style="padding: 0 10px; height: 30px; text-align: right; line-height: 2;"> 
		
	</div>
</div>
</script>


<section class="main-row topLine">
	<input type="hidden" value="${projectDto.projectStartDate}" id="projectStartDate" class="projectStartDate">
	<input type="hidden" value="${projectDto.projectEndDate}" id="projectEndDate" class="projectEndDate">
	

	<div class="project-board-top bottomLine">
		<div class="project-board-div">
			<div class="project-board-flex-div">
				<div class="project-board-flex-div1">
					<div class="project-board-flex-div1-div">
						<span class="project-board-div1-span"><a>${categoryDto.categoryTheme}</a></span>
						
						<c:choose>
							<c:when test="${projectDto.projectTitle != null}">
								<h1 class="project-board-div1-h1">${projectDto.projectTitle}</h1>
							</c:when>
							<c:otherwise>
								<h1 class="project-board-div1-h1">프로젝트 이름을 작성해주세요.</h1>
							</c:otherwise>
						</c:choose>
						
						
						<div class="project-board-div1-member">
							<div style="width: 30px; height: 30px; margin-right: 10px;">
								<img class="project-board-memberImage" id="memberImage">
							</div>
							
							<c:choose>
								<c:when test="${projectDto.memberInfoNick != null}">
									<p>${projectDto.memberInfoNick}</p>
								</c:when>
								<c:otherwise>
									<p>창작자 닉네임</p>
								</c:otherwise>
							</c:choose>
							
						</div>
						
					</div>
				</div>
				
				<div class="project-board-flex-div2">
					<img id="projectMainImage" class="project-board-mainImage">
				</div>
				
				
				
				<div class="projext-board-flex-div3" id="day-open1">
					<div class="project-board-div3-div">
						<div style="margin: 0px 0px 1.75rem; letter-spacing: 0.5px;padding-bottom: 15px; border-bottom: 1px solid #ff6666;">
							<div style="font-size: 30px;">
								<span id="funding-date">0</span>
								<span style="font-size: 1rem;">일 남음</span>
							</div>
						</div>
						<div style="margin: 0px 0px 1.75rem; letter-spacing: 0.5px;">
							<div style="font-size: 30px;">
								<span>${currentAmount}</span>
								<span style="font-size: 1rem;">원 펀딩</span>
								<span class="fBold fs20">${projectPercent}%</span>
							</div>
						</div>
						<div style="margin: 0px 0px 1.75rem; letter-spacing: 0.5px;">
							<div style="font-size: 30px;">
								<span>${currentSponsorMemberCount}</span>
								<span style="font-size: 1rem;">명의 참여자</span>
							</div>
						</div>
					</div>
					
					<div class="project-board-flex-div4" style="background-color: #f6f6f6; width: 100%; height: 170px; border-radius: 3%; text-align: left; border: 1px solid #ededed;">
						<p style="padding: 5px 10px 0 10px; font-size: 15px; color: black; font: bold;"><span class="font-12 red"><i class="fas fa-file"></i></span> 프로젝트 간단 소개</p>
						<p style="padding: 5px 10px 0 10px; font-size: 12px; color: #6b6565;">${projectDto.projectSummary}</p>
						<p style="padding: 25px 10px 0 10px; font-size: 15px; color: black; font: bold;"><span class="font-12 red"><i class="fas fa-coins"></i></span> 프로젝트 결제 안내</p>
						<p style="padding: 5px 10px 0 10px; font-size: 12px; color: #6b6565;">목표 금액인 ${projectDto.projectTargetAmount}원이 모여야만 결제됩니다.</p>
						<p style="padding: 5px 10px 0 10px; font-size: 12px; color: #6b6565;">후원은 ${projectDto.projectEndDate} 00:00:00 에 종료 됩니다.</p>
						<p style="padding: 5px 10px 0 10px; font-size: 12px; color: #6b6565;">결제는 프로젝트 예정 종료일인 ${projectDto.projectEndDate} 이후 ${plus7.substring(0, 10)} 이내에 다 함께 진행됩니다.</p>
					</div>

					<div class="project-board-flex-div4">
						<button class="project-board-div4-like" id="projectLikeBtn">
							<span class="font-20 red"><i id="projectLikeBtnI" class=' fa-heart'></i></span>
						</button>
						<button class="project-board-div4-like" id="report">
							<span class="font-20 red" id="report1"><i class="far fa-tired"></i></span>
							<span class="font-12 red" id="report2">신고하기</span>
						</button>
						<button class="project-board-div4-funding">프로젝트 후원</button>
					</div>
				</div>
				
				<!-- div33 -->
				<!-- div33 -->
				<div class="projext-board-flex-div3" id="day-open2">
					<div class="project-board-div3-div">
						<div style="margin: 0px 0px 1.75rem; letter-spacing: 0.5px;padding-bottom: 130px; border-bottom: 1px solid #ff6666;">
							<div style="font-size: 30px;">
								<span>${projectDto.projectStartDate}</span>
								<span style="font-size: 1rem;">펀딩 시작 예정</span>
							</div>
						</div>
					</div>
					
					<div class="project-board-flex-div4" style="background-color: #f6f6f6; width: 100%; height: 170px; border-radius: 3%; text-align: left; border: 1px solid #ededed;">
						<p style="padding: 5px 10px 0 10px; font-size: 15px; color: black; font: bold;"><span class="font-12 red"><i class="fas fa-file"></i></span> 프로젝트 간단 소개</p>
						<p style="padding: 5px 10px 0 10px; font-size: 12px; color: #6b6565;">${projectDto.projectSummary}</p>
						<p style="padding: 25px 10px 0 10px; font-size: 15px; color: black; font: bold;"><span class="font-12 red"><i class="fas fa-coins"></i></span> 프로젝트 결제 안내</p>
						<p style="padding: 5px 10px 0 10px; font-size: 12px; color: #6b6565;">목표 금액인 ${projectDto.projectTargetAmount}원이 모여야만 결제됩니다.</p>
						<p style="padding: 5px 10px 0 10px; font-size: 12px; color: #6b6565;">후원은 ${projectDto.projectEndDate} 00:00:00 에 종료 됩니다.</p>
						<p style="padding: 5px 10px 0 10px; font-size: 12px; color: #6b6565;">결제는 프로젝트 예정 종료일인 ${projectDto.projectEndDate} 이후 ${plus7.substring(0, 10)} 이내에 다 함께 진행됩니다.</p>
					</div>

					<div class="project-board-flex-div4">
						<button class="project-board-div4-funding" style="width: 430px;">현재 프로젝트는 펀딩 진행 전 입니다.</button>
					</div>
				</div>
				
				
				<!-- div33 -->
				<!-- div33 -->
				<div class="projext-board-flex-div3" id="day-open3">
					<div class="project-board-div3-div">
						<div style="margin: 0px 0px 1.75rem; letter-spacing: 0.5px;padding-bottom: 15px; border-bottom: 1px solid #ff6666;">
							<div style="font-size: 30px;">
								<span id="funding-date">펀딩 종료</span>
							</div>
						</div>
						<div style="margin: 0px 0px 1.75rem; letter-spacing: 0.5px;">
							<div style="font-size: 30px;">
								<span>${currentAmount}</span>
								<span style="font-size: 1rem;">원 펀딩</span>
								<span class="fBold fs20">${projectPercent}%</span>
							</div>
						</div>
						<div style="margin: 0px 0px 1.75rem; letter-spacing: 0.5px;">
							<div style="font-size: 30px;">
								<span>${currentSponsorMemberCount}</span>
								<span style="font-size: 1rem;">명의 참여자</span>
							</div>
						</div>
					</div>
					
					<div class="project-board-flex-div4" style="background-color: #f6f6f6; width: 100%; height: 170px; border-radius: 3%; text-align: left; border: 1px solid #ededed;">
						<p style="padding: 5px 10px 0 10px; font-size: 15px; color: black; font: bold;"><span class="font-12 red"><i class="fas fa-file"></i></span> 프로젝트 간단 소개</p>
						<p style="padding: 5px 10px 0 10px; font-size: 12px; color: #6b6565;">${projectDto.projectSummary}</p>
						<p style="padding: 25px 10px 0 10px; font-size: 15px; color: black; font: bold;"><span class="font-12 red"><i class="fas fa-coins"></i></span> 프로젝트 결제 안내</p>
						<p style="padding: 5px 10px 0 10px; font-size: 12px; color: #6b6565;">목표 금액인 ${projectDto.projectTargetAmount}원이 모여야만 결제됩니다.</p>
						<p style="padding: 5px 10px 0 10px; font-size: 12px; color: #6b6565;">후원은 ${projectDto.projectEndDate} 00:00:00 에 종료 됩니다.</p>
						<p style="padding: 5px 10px 0 10px; font-size: 12px; color: #6b6565;">결제는 프로젝트 예정 종료일인 ${projectDto.projectEndDate} 이후 ${plus7.substring(0, 10)} 이내에 다 함께 진행됩니다.</p>
					</div>

					<div class="project-board-flex-div4">
						<button class="project-board-div4-funding" style="width: 430px;">현재 프로젝트는 펀딩이 종료된 상태 입니다.</button>
					</div>
				</div>
				
			</div>
		</div>
		
	</div>
	
	<div class="bottomLine" style="height: 50px; box-shadow: rgb(0 0 0 / 10%) 0px 2px 3px;">
		<div class="project-board-mid">
			<div class="project-board-mid-div">
				<a class="project-board-mid-a" href="${pageContext.request.contextPath}/projectBoard/${projectDto.projectNo}">스토리</a>
				<a class="project-board-mid-a on" href="${pageContext.request.contextPath}/projectBoard/${projectDto.projectNo}/projectBoardCommunity">커뮤니티</a>
			</div>
		</div>
	</div>
	
	<div class="project-board-content">
		<div class="project-board-content-div">
			<!-- 커뮤니티 내용 div -->
			<div class="project-board-content-div1">
				<div class="project-board-community-row1 scrollThin">
					<div class="project-board-community-top" style="width: 100%; height: 40px; border: 1px solid #dcdcdc; border-radius: 3px; font-weight: bold; font-size: 18px; margin-bottom: 10px; background-color: #fff; padding: 7px 5px;">
						<p><span style="color: #ff3a3a;"><i class="fas fa-comments"></i></span> 프로젝트를 향한 응원의 메세지를 남겨주세요.</p>
					</div>
				
					<form action="projectBoardCommunity" method="post">
						<div class="project-board-community-row-form">
							<div class="project-board-community-row100">
								<div style="width: 100%; height: 30px;">
<!-- 									<img class="project-board-community-memberImage" id="myMemberImage"> -->
									<span>${memberDto.memberNick}</span>
								</div>
							</div>
							<div class="project-board-community-row100"> 
								<textarea class="project-board-community-text" name="projectCommunityContent"></textarea>
							</div>
							<div class="project-board-community-row100" style="text-align: right;">
								<button class="project-board-community-btn">등록</button>
							</div>
						</div>
					</form>
					
					<!-- 커뮤니티 내용들 -->
					<c:forEach var="communityList" items="${communityList}">
						<div class="project-board-community-row">
							<div class="project-board-community-row100" style="padding: 10px;">
								<div style="width: 100%; height: 30px; display: flex;">
									<c:choose>
										<c:when test="${projectDto.memberNo == communityList.memberNo}">
											<span style="font-weight: bold; font-size: 18px;  width: 15%;">${projectDto.memberInfoNick}</span>
										</c:when>
										<c:otherwise>
											<span style="font-weight: bold; font-size: 18px;  width: 15%;">${communityList.memberNick}</span>
										</c:otherwise>
									</c:choose>
									<c:if test="${memberDto.memberNo == communityList.memberNo}">
										<div style="text-align: right; width: 85%">
											<a href="${pageContext.request.contextPath}/projectBoard/${projectDto.projectNo}/projectBoardCommunityDelete?projectCommunityNo=${communityList.projectCommunityNo}"><span class="font-12 red"><i class="fas fa-times"></i></span></a>
										</div>
									</c:if>
								</div>
							</div>
							
							<div class="project-board-community-row100" style="padding: 10px; height: 50px; font-size: 15px;">
								${communityList.projectCommunityContent}
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
			
			<!-- 창작자 내용 div -->
			<div class="project-board-content-div2">
				<div class="project-board-content-row2" style="height: 100%;">
					<p style="font-weight: bolder; font-size: 16px; margin-bottom: 20px;">창작자 정보</p>
					<div class="project-board-content-member-image">
						<div style="width: 30px; height: 40px; margin-right: 10px;">
							<img class="project-board-memberImage" id="memberImage2">
						</div>
						<c:choose>
							<c:when test="${projectDto.memberInfoNick != null}">
								<p>${projectDto.memberInfoNick}</p>
							</c:when>
							<c:otherwise>
								<p>창작자 닉네임</p>
							</c:otherwise>
						</c:choose>
					</div>
					<c:choose>
						<c:when test="${projectDto.memberInfoContent != null}">
							<p style="font-size: 14px; color: #494949; margin-bottom: 10px;">${projectDto.memberInfoContent}</p>
						</c:when>
						<c:otherwise>
							<p style="font-size: 14px; color: #494949; margin-bottom: 10px;">창작자 소개</p>
						</c:otherwise>
					</c:choose>
					<div class="topLine" style="padding: 10px 0;">
						<button class="project-board-sns-btn" onclick="showMsg()"><span class="fonr-12"><i class="far fa-envelope"></i></span> 문의하기</button>
					</div>
				</div>
				
				<p style="font-weight: bolder; margin-bottom: 15px;">선물 구성</p>
				
				<c:choose>
					<c:when test="${giftCount == 0}">
						<div id="giftListNone" class="project-insert-gift-item-div h200">
							<p>만든 선물이 없습니다</p>
						</div>
					</c:when>
					<c:otherwise>
						<div id="giftList" class="project-giftList scrollThin">
						
							<div id="giftListBasic" class="project-insert-gift-list float-container p30 h140 project-board-item" style="margin-top: 10px;">
								<div>
									<div class="mb10">
										<span class="left w260 fBold fs22">1000원+</span>
									</div>
									<div>
										<span class="left w260 fs14 fBold">선물을 선택하지 않고 밀어만 줍니다.</span>
									</div>
								</div>
							</div>
						
							<c:forEach var="giftDto" items="${giftList}">
								<div class="project-insert-gift-list p30 project-board-item">
									<div class="mb10 w100p float-container">
										<span id="giftPrice" class="left w260 fBold fs22">${giftDto.giftPrice}원+</span> 
										<c:if test="${projectDto.projectState != '2'}">
										</c:if>
									</div>
									<div>
										<span id="giftSummary" class="w260 fs14 fBold">${giftDto.giftSummary}</span>
									</div>
									<div class="w100p fs12 p10">
										<ul style="list-style: none;">
			
											<c:forEach var="giftItemVo" items="${giftItemVoList}">
												<c:if test="${giftItemVo.giftNo == giftDto.giftNo}">
													<li>
														<div class="float-container w100p mb20">
															<span class="left w70p">${giftItemVo.itemName}</span> <span class="right w20p">x ${giftItemVo.itemCount}</span>
														</div>
													</li>
												</c:if>
											</c:forEach>
			
										</ul>
									</div>
									<span id="giftNo" class="yb hidden">${giftDto.giftNo}</span>
								</div>
							</c:forEach>
						</div>
					</c:otherwise>
				</c:choose>
				
				
			</div>
		</div>
	</div>
	
	<div class="report-modal"> 
		<div class="report-modal-body">
			<div style="text-align: right;">
				<button class="report-cancel-btn" id="modal-cancel"><span class="modal-body-cancel"><i class="fas fa-times"></i></span></button>
			</div>
			<div style="padding: 10px 0;">
				<p class="report-main-p">신고하기</p>
			</div>
			<div style="text-align: left; height: 50px;">
				<p class="report-sub-p"><span class="font-12 red"><i class="fas fa-exclamation-circle"></i></span> 해당 프로젝트의 신고 사유를 자세하게 적어주세요.</p> 
			</div>
			<form action="projectReport" method="post">
				<input type="hidden" value="${projectDto.projectNo}" name="projectNo">
				<div style="height: 130px;">
					<textarea class="report-insert-text" name="reportContent" required autocomplete="off"></textarea>
				</div>
				<div style="height: 60px; margin: 20px 0; text-align: center; padding: 10px 0;">
					<button class="project-report-btn">신고하기</button>
				</div>
			</form>
		</div> 
	</div>
	

</section>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>