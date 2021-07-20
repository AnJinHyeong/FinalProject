<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>

<jsp:include page="/WEB-INF/views/project/projectHeader.jsp">
	<jsp:param value="${root}/project/${projectNo}/projectMainMember" name="division"/>
</jsp:include>


<script src="http://code.jquery.com/jquery-3.6.0.js"></script>
<script>

	$(function(){
		
		$(document).ready(function(){
			var inVal = $("input[name=memberInfoNick]").val();
			var regexVal = /^[a-zA-Z가-힣0-9]{1,10}$/;
			
			if (regexVal.test(inVal)) {
				$(".font-on").text("");
			}			
			else {
				$(this).val("");
				$(".font-on").text("최소 1글자 최대 10글자 이내에 입력해주세요");
			}
		});
		
		
		//펀딩 금액 
		$("input[name=memberInfoNick]").blur(function(){
			var inVal = $(this).val();
			var regexVal = /^[a-zA-Z가-힣0-9]{1,10}$/;
			
			if (regexVal.test(inVal)) {
				$(".font-on").text("");
			}			
			else {
				$(this).val("");
				$(".font-on").text("최소 1글자 최대 10글자 이내에 입력해주세요");
			}	
			
		});
		
		
		
		
		
		
		//페이지 로딩 시 프로젝트 이미지가 있으면 화면에 송출
		
		$.ajax({
			url :"${pageContext.request.contextPath}/image/member/confirm",
			type: "post",
			success : function(resp){
				if(resp == 1){
					$.ajax({
						url :"${pageContext.request.contextPath}/image/member/getByMemberNo",
						type: "get",
						processData : false,
						contentType : false,
						success : function(resp){
							var url = "${pageContext.request.contextPath}/image/member/memberDownload/"+resp.imageNo;
							$("#preview").attr("src",url);
						}
						
					});				
				}
				else{
					$("#preview").attr("src","${pageContext.request.contextPath}/image/memberImageNull.png");
				}
			}
		
		});
					
		
		
		//프로젝트 사진 등록 후 보여주기
		$("#memberImage").on("input",function(){
			var files = this.files;
			var filesLength = this.files.length > 0;
			var files0 = this.files[0];
			$.ajax({
				url :"${pageContext.request.contextPath}/image/member/confirm",
				type: "post",
				success : function(resp){
					console.log(resp);
					if(resp == 1){//등록된 이미지가 있을경우 지우고 다시 등록
						var fileOn = 1;
						//이미지 삭제
						$.ajax({
							url :"${pageContext.request.contextPath}/image/member/delete",
							type: "post",
							success : function(resp){
								console.log(resp);
							}
						});

						if(files && filesLength){//파일 저장소 존재 및 0번 위치에 파일 존재
							console.log("파일이 선택되었습니다");
						
//			 				jquery ajax에서 파일 업로드를 하려면 formData 객체가 필요
							var fd = new FormData();
							console.log(fd);
//			 				fd.append(이름,데이터또는 파일);
							fd.append("f",files0);
							
							var that = this;//$("input[name=f]")
							
//			 				(주의) 반드시 ajax file upload에서는 다음 두 가지 설정을 해야 한다.
//			 				1. processData : false 설정
//			 				2. contentType : false 설정
//			 				3. type : "post" 설정
							$.ajax({
								url :"${pageContext.request.contextPath}/image/member/upload",
								type: "post",
								processData : false,
								contentType : false,
								data: fd,
								success : function(resp){
									$("#preview").empty();
									var url = "${pageContext.request.contextPath}/image/member/memberDownload/"+resp.imageNo;
									$("#preview").attr("src",url);
								},
								error :function(resp){
									window.alert("업로드 실패!");
								}
							
							});
							
						}
					
					}
					else{//등록된 이미지가 없을 경우 등록
						console.log(files);
						console.log(filesLength);
						if(files && filesLength){//파일 저장소 존재 및 0번 위치에 파일 존재
							console.log("파일이 선택되었습니다");
						
//			 				jquery ajax에서 파일 업로드를 하려면 formData 객체가 필요
							var fd = new FormData();
							console.log(fd);
//			 				fd.append(이름,데이터또는 파일);
							fd.append("f",files0);
							
							var that = this;//$("input[name=f]")
							
//			 				(주의) 반드시 ajax file upload에서는 다음 두 가지 설정을 해야 한다.
//			 				1. processData : false 설정
//			 				2. contentType : false 설정
//			 				3. type : "post" 설정
							$.ajax({
								url :"${pageContext.request.contextPath}/image/member/upload",
								type: "post",
								processData : false,
								contentType : false,
								data: fd,
								success : function(resp){
									console.log(resp);
									var url = "${pageContext.request.contextPath}/image/member/memberDownload/"+resp.imageNo;
									$("#preview").attr("src",url);
								},
								error :function(resp){
									window.alert("업로드 실패!");
								}
							
							});
							
						}
					}
						
				}
			
			});
			
		});
		
		
		$("#textSize").css("color", "black");
		$("#textMin").hide();
		$("#textMax").hide();
		$("#textSizeSpan").text($("textarea[name=memberInfoContent").val().length);
		
		$("textarea[name=memberInfoContent").on("input", function(){
			$("#textSizeSpan").text($(this).val().length);
			if($(this).val().length > 300){
				$("#textSize").css("color", "red");
				$("#textMax").show();
			}
			else{
				$("#textSize").css("color", "black");
				$("#textMin").hide();
				$("#textMax").hide();
			}
		});
		
		
		//form JS
		$("#projectMainMember").on("submit", function(e){
			if($("textarea[name=memberInfoContent]").val().length > 300){
				$("textarea[name=memberInfoContent]").focus();
				e.preventDefault();
			}
			
		});
		
		
		if($("input[name=memberInfoNick]").val() == null || $("input[name=memberInfoNick]").val() == ""){
			var min = 0;
		}
		else{
			var min = 1;
		}
		if($("textarea[name=memberInfoContent]").val() == null || $("textarea[name=memberInfoContent]").val() == ""){
			var mic = 0;
		}
		else{
			var mic = 1;
		}
		
		$("#progress").text(33*(min+mic)+34);
		
		
		 
		 
	});
	
	
</script>


<section class="main-row topLine" style="background-color: #f8f8f8;">
	
	<div class="project-back-color" style="height: 1550px;">
		
		<div class="section-row" style=" padding-top: 10px;">
			
			<form id="projectMainMember" action="projectMainMember" method="post">
			
				<div class="project-insert-div" style="height: 100px;">
					<dl class="project-insert-dl">
						<dt class="project-insert-dt">
							창작자 이름 <span class="project-insert-font">*</span>
						</dt> 
						<dd class="project-insert-dd">
							<p>창작자 개인이나 팀을 대표할 수 있는 이름을 써주세요.</p>
						</dd>
					</dl>
					<div class="projcet-insert-div2">
						<div>
							<input type="text" name="memberInfoNick" class="projcet-insert-input" autocomplete="off" value="${projectDto.memberInfoNick}">
							<p class="project-insert-font font-on" style="font-size: 12px; margin-top: 5px;"></p>
						</div>
					</div>
				</div>
				
				<hr>
				
				<div class="project-insert-div" style="height: 350px;">
					<dl class="project-insert-dl">
						<dt class="project-insert-dt">
							프로필 이미지 <span class="project-insert-font">*</span>
						</dt> 
						<dd class="project-insert-dd">
							<p>창작자 개인이나 팀의 사진을 올려주세요.</p>
							<br>
							<p class="font-12 red"><i class="fas fa-exclamation-circle"></i> 사진의 크기에 따라 비율이 달라질 수 있습니다.</p>
						</dd>
					</dl>
					<div class="projcet-insert-div2">
						<div>
							<div class="project-insert-file-div">
								<input class="project-insert-file" type="file" id="memberImage">
								<img style="border-radius: 70%; border: 1px solid #DCDCDC; " id="preview" width="200" height="200">
							</div>
						</div>
					</div>
				</div>
				
				<hr>
				
				<div class="project-insert-div" style="height: 200px;">
					<dl class="project-insert-dl">
						<dt class="project-insert-dt">
							창작자 소개 <span class="project-insert-font">*</span>
						</dt> 
						<dd class="project-insert-dd">
							<p>2~3문장으로 창작자님의 이력과 간단한 소개를 써주세요.</p>
						</dd>
					</dl>
					<div class="projcet-insert-div2">
						<div>
							<textarea class="project-insert-text" rows="1" name="memberInfoContent">${projectDto.memberInfoContent}</textarea>
							<div>
								<p id="textMax" class="f12 pb10 pt10 left fRed font-12">최대 300자 이하로 입력해주세요</p>
								<p id="textSize" class="f12 pb10 pt10 right font-12">(<span id="textSizeSpan" class="font-12">0</span><span class="font-12">/300</span>)</p>
							</div>
						</div>
					</div>
				</div>
				
				
				<hr>
				
				<div class="project-insert-div" style="height: 150px;">
					<dl class="project-insert-dl">
						<dt class="project-insert-dt">
							본인 인증  <span class="project-insert-font">*</span>
						</dt> 
						<dd class="project-insert-dd">
							<p>현재 창작자 본인 명의의 휴대폰 번호를 대신해 이메일로 인증을 진행하고 있습니다.</p>
							<br>
							<p class="font-12 red"><i class="fas fa-exclamation-circle"></i> 회원가입시 인증을 진행했던 이메일로 본인 인증이 진행됩니다.</p>
						</dd>
					</dl>
					<div class="projcet-insert-div2">
						<div>
							<div style="background-color: white; height: 100px; width: 630px; padding: 25px;">
								<p style="margin-bottom: 5px;"><i class="far fa-envelope"></i> 이메일 인증 </p>
								<p class="font-12">${memberDto.memberEmail}  <span class="font-12 red"><i class="far fa-check-circle"></i></span></p>
							</div>
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