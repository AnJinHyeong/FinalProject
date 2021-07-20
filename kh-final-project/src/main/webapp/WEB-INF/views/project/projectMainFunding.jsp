<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>

<jsp:include page="/WEB-INF/views/project/projectHeader.jsp">
	<jsp:param value="${root}/project/${projectNo}/projectMainFunding" name="division"/>
</jsp:include>

<script>
	
	$(function(){
		
		$(document).ready(function(){
			var inVal = $("input[name=projectTargetAmount]").val();
			var regexVal = /^[0-9]{6,20}$/;
			
			if (regexVal.test(inVal)) {
				if(inVal >= 500000){
					$(".font-on").text("");
				}
				else{
					$(this).val("");
					$(".font-on").text("50만원 이상의 금액을 입력해주세요.");
				}
			}			
			else {
				$(this).val("");
				$(".font-on").text("50만원 이상의 금액을 입력해주세요.");
			}
		});
		
		
		//펀딩 금액 
		$("input[name=projectTargetAmount]").blur(function(){
			var inVal = $(this).val();
			var regexVal = /^[0-9]{6,20}$/;
			
			if (regexVal.test(inVal)) {
				if(inVal >= 500000){
					$(".font-on").text("");
				}
				else{
					$(this).val("");
					$(".font-on").text("50만원 이상의 금액을 입력해주세요.");
				}
			}			
			else {
				$(this).val("");
				$(".font-on").text("50만원 이상의 금액을 입력해주세요.");
			
			}	
			
		});
		
		
		//시작일,종료일 min 오늘 날짜 / 시작일 종료일 차이 계산
		$(document).ready(function(){
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
			document.getElementById("startDate").setAttribute("min", today);
			document.getElementById("endDate").setAttribute("min", today);
			
			var sdd = document.getElementById("startDate").value;
			var edd = document.getElementById("endDate").value;
		   	var ar1 = sdd.split('-');
		   	var ar2 = edd.split('-');
		   	var da1 = new Date(ar1[0], ar1[1], ar1[2]);
	   		var da2 = new Date(ar2[0], ar2[1], ar2[2]);
	   		
		   	var dif = da2 - da1;
		   	var cDay = 24 * 60 * 60 * 1000;// 시 * 분 * 초 * 밀리세컨
		   	var cMonth = cDay * 30;// 월 만듬
		   	var cYear = cMonth * 12; // 년 만듬
		 	if(sdd && edd){
			    document.getElementById('funding-date').text = parseInt(dif/cDay);
			    $("#funding-date").text(parseInt(dif/cDay)+" 일");
		 	}
		   	
			document.getElementById("startDate").setAttribute("max", edd);
		   	
		});
		
		//시작일 입력 시 종료일 min 시작일로 변경
		$("#startDate").on("input",function(){
			var startDateVal = $(this).val();
			var endDate = document.getElementById("endDate").setAttribute("min", startDateVal);
		});
		
		//종료일 입력 시 시작일 max 를 종료일 min으로 변경
		$("#endDate").on("input",function(){
			var startDateVal = $(this).val();
			var endDate = document.getElementById("startDate").setAttribute("max", startDateVal);
		});
		
		//시작일 입력 시 시작일과 종료일 차이 계산
		$("#startDate").on("input",function(){
			var sdd = document.getElementById("startDate").value;
			var edd = document.getElementById("endDate").value;
		   	var ar1 = sdd.split('-');
		   	var ar2 = edd.split('-');
		   	var da1 = new Date(ar1[0], ar1[1], ar1[2]);
	   		var da2 = new Date(ar2[0], ar2[1], ar2[2]);
		   	var dif = da2 - da1;
		   	var cDay = 24 * 60 * 60 * 1000;// 시 * 분 * 초 * 밀리세컨
		   	var cMonth = cDay * 30;// 월 만듬
		   	var cYear = cMonth * 12; // 년 만듬
		 	if(sdd && edd){
			    document.getElementById('funding-date').text = parseInt(dif/cDay);
			    $("#funding-date").text(parseInt(dif/cDay)+"일");
		 	}
		});
		
		//종료일 입력 시 시작일과 종료일 차이 계산
		$("#endDate").on("input",function(){
			var sdd = document.getElementById("startDate").value;
			var edd = document.getElementById("endDate").value;
		   	var ar1 = sdd.split('-');
		   	var ar2 = edd.split('-');
		   	var da1 = new Date(ar1[0], ar1[1], ar1[2]);
	   		var da2 = new Date(ar2[0], ar2[1], ar2[2]);
		   	var dif = da2 - da1;
		   	var cDay = 24 * 60 * 60 * 1000;// 시 * 분 * 초 * 밀리세컨
		   	var cMonth = cDay * 30;// 월 만듬
		   	var cYear = cMonth * 12; // 년 만듬
		 	if(sdd && edd){
			    document.getElementById('funding-date').text = parseInt(dif/cDay);
			    $("#funding-date").text(parseInt(dif/cDay)+" 일");
		 	}
		});
		
		
		$("#projectMainFunding").on("submit", function(e){
			if($("input[name=projectTargetAmount]").val() < 500000){
				$("input[name=projectTargetAmount]").focus();
				e.preventDefault();
			}
			if($("input[name=projectStartDate]").val() == ""){
				$("input[name=projectStartDate]").focus();
				e.preventDefault();
			}
			if($("input[name=projectEndDate]").val() == ""){
				$("input[name=projectEndDate]").focus();
				e.preventDefault();
			}
			
		});
		
		
		
		if($("input[name=projectTargetAmount]").val()){
			var pta = 1;
		}
		else{
			var pta = 0;
		}
		if($("input[name=projectStartDate]").val() == null || $("input[name=projectStartDate]").val() == ""){
			var psd = 0;
		}
		else{
			var psd = 1;
		}
		if($("input[name=projectEndDate]").val() == null || $("input[name=projectEndDate]").val() == ""){
			var ped = 0;
		}
		else{
			var ped = 1;
		}
		
		
		$("#progress").text(33*(pta+psd+ped)+1);
		
		
	});
	
</script>

<section class="main-row topLine">
	
	<div class="project-back-color" style="min-height: 1180px;">
		
		<div class="section-row" style=" padding-top: 10px;">
			
			<form action="projectMainFunding" method="post" id="projectMainFunding">
			
				<div class="project-insert-div" style="height: 300px;">
					<dl class="project-insert-dl">
						<dt class="project-insert-dt">
							목표 금액 <span class="project-insert-font">*</span>
						</dt> 
						<dd class="project-insert-dd">
							<p>프로젝트를 완수하기 위해 필요한 금액을 설정해주세요.</p>
						</dd>
						<div class="project-insert-funding-div">
							<div style="color: rgb(248, 100, 83); margin-bottom: 10px;">
								<i class="fas fa-exclamation-circle"></i> 목표 금액 설정 시 꼭 알아두세요!
							</div>
							<div>
								<p class="project-funding-p">종료일까지 목표금액을 달성하지 못하면 후원자 결제가 진행되지 않습니다.</p>
								<p class="project-funding-p">종료 전 후원 취소를 대비해 10% 이상 초과 달성을 목표로 해주세요.</p>
								<p class="project-funding-p">제작비, 선물 배송비, 인건비, 예비 비용 등을 함께 고려해주세요.</p>
							</div>
						</div>
					</dl>
					<div class="projcet-insert-div2">
						<div style="width: 630px;">
							<p class="project-insert-p">목표 금액</p>
							<div class="project-funding-money-div">
								<span class="project-funding-money-span">
									<input type="text" class="projcet-insert-input project-input-money" name="projectTargetAmount" min="500000" value="${projectDto.projectTargetAmount}"><p style="padding-left: 3px;">원</p>
								</span>
							</div>
							<p class="project-insert-font font-on" style="font-size: 12px; margin-top: 5px;"></p>
						</div>
					</div>
				</div>
				
				<hr>
				
				<div class="project-insert-div" style="height: 450px;">
					<dl class="project-insert-dl">
						<dt class="project-insert-dt">
							펀딩 일정 <span class="project-insert-font">*</span>
						</dt> 
						<dd class="project-insert-dd">
							<p>설정한 일시가 되면 펀딩이 자동 시작됩니다. 펀딩 시작 전까지 날짜를 변경할 수 있고, 즉시 펀딩을 시작할 수도 있습니다.</p>
						</dd>
					</dl>
					<div class="projcet-insert-div2">
						<div style="width: 630px;">
							<ul style="margin: 0; padding: 0; list-style-position: inherit;">
								<li class="project-funding-li">
									<div style="width: 630px;">
										<p class="project-insert-p">시작일</p>
										<div class="projcet-insert-div2">
											<input type="date" class="projcet-insert-input" name="projectStartDate" id="startDate" value="${projectDto.projectStartDate}">
										</div>
									</div>
									<div style="height: 20px; margin-top: 30px;">
										<p class="project-insert-p">펀딩기간</p>
										<p class="project-insert-p" id="funding-date" style="font-size: 14px; color: #a09e9e;"></p>
									</div>
								</li>
								<li class="project-funding-li">
									<div style="width: 630px;">
										<p class="project-insert-p">종료일</p>
										<div class="projcet-insert-div2">
											<input type="date" class="projcet-insert-input" name="projectEndDate" id="endDate" value="${projectDto.projectEndDate}">
										</div>
									</div>
								</li>
								<li class="project-funding-li">
									<div style="width: 630px;">
										<p class="project-insert-p">후원자 결제 종료</p>
										<c:choose>
											<c:when test="${projectDto.projectEndDate == null}">
												<p class="project-insert-p" style="font-size: 14px; color: #a09e9e;">프로젝트 종료일로 부터 7일 이내에 진행 됩니다.</p>										
											</c:when>
											<c:otherwise>
												<p class="project-insert-p" style="font-size: 14px; color: #a09e9e;">${plus7.substring(0, 10)}</p>										
											</c:otherwise>
										</c:choose>
									</div>
								</li>
								<li class="project-funding-li">
									<div style="width: 630px;">
										<p class="project-insert-p">정산일</p>
										<c:choose>
											<c:when test="${projectDto.projectEndDate == null}">
												<p class="project-insert-p" style="font-size: 14px; color: #a09e9e;">후원자 결제 종료일로 부터 7일 이내에 진행 됩니다.</p>										
											</c:when>
											<c:otherwise>
												<p class="project-insert-p" style="font-size: 14px; color: #a09e9e;">${plus14.substring(0, 10)}</p>
											</c:otherwise>
										</c:choose>
									</div>
								</li>
								
							</ul>
						</div>
					</div>
				</div>
				
				<c:if test="${projectDto.projectState != '2'}">
					<div class="project-insert-div3">
						<input class="project-btn btn3 project-btn-hover" type="submit" value="저장">
					</div>
				</c:if>
				
			</form>
			
		</div>
		
	</div>

</section>



</body>
</html>