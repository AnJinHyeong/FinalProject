<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


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
		
		
	});
		
	
</script>

<section class="main-row topLine">

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
				
				<div class="projext-board-flex-div3">
					<div class="project-board-div3-div">
						<div style="margin: 0px 0px 1.75rem; letter-spacing: 0.5px;padding-bottom: 15px; border-bottom: 1px solid #ff6666;">
							<div style="font-size: 30px;">
								<span>0</span>
								<span style="font-size: 1rem;">일 남음</span>
							</div>
						</div>
						<div style="margin: 0px 0px 1.75rem; letter-spacing: 0.5px;">
							<div style="font-size: 30px;">
								<span>0</span>
								<span style="font-size: 1rem;">원 펀딩</span>
								<span style="font-size: 20px;"><span>0</span>%</span>
							</div>
						</div>
						<div style="margin: 0px 0px 1.75rem; letter-spacing: 0.5px;">
							<div style="font-size: 30px;">
								<span>0</span>
								<span style="font-size: 1rem;">명의 참여자</span>
							</div>
						</div>
					</div>
					
					<div class="project-board-flex-div4" style="background-color: #f6f6f6; width: 100%; height: 150px; border-radius: 3%; text-align: left; border: 1px solid #ededed;">
						<p style="padding: 5px 10px 0 10px; font-size: 15px; color: black; font: bold;"><span class="font-12 red"><i class="fas fa-file"></i></span> 프로젝트 간단 소개</p>
						<p style="padding: 5px 10px 0 10px; font-size: 12px; color: #6b6565;">${projectDto.projectSummary}</p>
						<p style="padding: 25px 10px 0 10px; font-size: 15px; color: black; font: bold;"><span class="font-12 red"><i class="fas fa-coins"></i></span> 프로젝트 결제 안내</p>
						<p style="padding: 5px 10px 0 10px; font-size: 12px; color: #6b6565;">목표 금액인 ${projectDto.projectTargetAmount}원이 모여야만 결제됩니다.</p>
						<p style="padding: 5px 10px 0 10px; font-size: 12px; color: #6b6565;">결제는 프로젝트 예정 종료일인 ${projectDto.projectEndDate} 이후 ${plus7.substring(0, 10)} 이내에 다 함께 진행됩니다.</p>
					</div>

					<div class="project-board-flex-div4">
						<button class="project-board-div4-like">좋아요</button>
						<button class="project-board-div4-like">신고하기</button>
						<button class="project-board-div4-funding">프로젝트 후원</button>
					</div>
				</div>
				
			</div>
		</div>
	</div>
	
	<div class="bottomLine" style="height: 50px; box-shadow: rgb(0 0 0 / 10%) 0px 2px 3px;">
		<div class="project-board-mid">
			<div class="project-board-mid-div">
				<a class="project-board-mid-a on" href="#">스토리</a>
				<a class="project-board-mid-a" href="#">커뮤니티</a>
			</div>
		</div>
	</div>
	
	<div class="project-board-content">
		<div class="project-board-content-div">
			<!-- 스토리 내용 div -->
			<div class="project-board-content-div1">
				<div class="project-board-content-row1 scrollThin">
					${projectDto.projectContent}
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
						<button class="project-board-sns-btn"><span class="fonr-12" style="color: #f8ff49;" ><i class="fas fa-comment"></i></span> 문의하기</button>
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
	

</section>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>