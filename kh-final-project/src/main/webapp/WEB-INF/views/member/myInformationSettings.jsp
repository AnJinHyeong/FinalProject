<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<c:set var="isIntro" value="${memberDto.memberIntroduce}"></c:set>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>



<style>
.section-setting {
	width: 85%;
	/* 	min-height: 1000px; */
	/* 	margin: 0 auto; */
	margin: 30px auto;
	padding-bottom: 30px;
}

.left-container {
	width: 60%;
}

.right-container {
	width: 25%;
}

.setTitle {
	padding-top: 35px;
	padding-bottom: 35px;
	font-size: 40px;
	color: gray;
}

.introduceCont {
	border: solid 1px gray;
	width: 100%;
	margin-top: 20px;
	font-size: 15px;
	padding: 15px;
}

.titleCont {
	width: 100px;
	color: gray;
	font-size: 20px;
	text-align: center;
	padding: 15px;
}

.titleCont:hover {
	color: black;
}

.checked {
	color: black;
	border-bottom: solid 2px black;
}

.changeTitle {
	color: #27A3FF;
	border: 0;
	outline: 0;
	background-color: white;
	font-size: 18px;
}

.title2 {
	margin-top: 10px;
	margin-bottom: 10px;
}

.changeNick {
	margin-top: 10px;
	margin-bottom: 10px;
}

.changeNick2 {
	margin-top: 10px;
	margin-bottom: 10px;
}

.nickBtn {
	font-size: 17px;
	margin-top: 15px;
	margin-bottom: 15px;
	width: 20%;
	height: 40px;
	text-align: center;
	background-color: #3D3D3D;
	color: white;
	border-radius: 5px;
}

.nickBtn:hover {
	color: gray;
}

.introBtn {
	font-size: 17px;
	margin-top: 15px;
	margin-bottom: 15px;
	width: 20%;
	height: 40px;
	text-align: center;
	background-color: #3D3D3D;
	color: white;
	border-radius: 5px;
}

.introBtn:hover {
	color: gray;
}

.imgBtn {
	font-size: 17px;
	margin-top: 15px;
	margin-bottom: 15px;
	width: 20%;
	height: 40px;
	text-align: center;
	background-color: #3D3D3D;
	color: white;
	border-radius: 5px;
}

.imgBtn:hover {
	color: gray;
}
</style>

<script>
	$(function() {

		$('#changeProBtn').click(function() {
			$(".targetDiv").hide('fast');
			$(".targetBtn").html('변경');
			$(".targetBtn").not($(this)).hide('fast');
			if ($('.changePro').css("display") == "none") {
				$('.changePro').show('fast');
				$("#changeProBtn").html('취소');
			} else if ($('.changePro').css("display") != "none") {
				$('.changePro').hide('fast');
				$("#changeProBtn").html('변경');
				$(".targetBtn").not($(this)).show('fast');
			}
		});

		$('#changeNickBtn').click(function() {
			$(".targetDiv").hide('fast');
			$(".targetBtn").html('변경');
			$(".targetBtn").not($(this)).hide('fast');
			if ($('.changeNick').css("display") == "none") {
				$('.changeNick').show('fast');
				$('.changeNick2').hide();
				$("#changeNickBtn").html('취소');
			} else if ($('.changeNick').css("display") != "none") {
				$('.changeNick').hide('fast');
				$('.changeNick2').show();
				$("#changeNickBtn").html('변경');
				$(".targetBtn").not($(this)).show('fast');
			}
		});

		$('#changeIntroBtn').click(function() {
			$(".targetDiv").hide('fast');
			$(".targetBtn").html('변경');
			$(".targetBtn").not($(this)).hide('fast');
			if ($('.changeIntro').css("display") == "none") {
				$('.changeIntro').show('fast');
				$('.divIntro').hide();
				$("#changeIntroBtn").html('취소');
			} else if ($('.changeIntro').css("display") != "none") {
				$('.changeIntro').hide('fast');
				$('.divIntro').show();
				$("#changeIntroBtn").html('변경');
				$(".targetBtn").not($(this)).show('fast');
			}
		});

		$('#changePwBtn').click(function() {
			$(".targetDiv").hide('fast');
			$(".targetBtn").html('변경');
			$(".targetBtn").not($(this)).hide('fast');
			if ($('.changePw2').css("display") == "none") {
				$('.changePw2').show('fast');
				$("#changePwBtn").html('취소');
			} else if ($('.changePw2').css("display") != "none") {
				$('.changePw2').hide('fast');
				$("#changePwBtn").html('변경');
				$(".targetBtn").not($(this)).show('fast');
			}
		});
		
		$('#changeAddressBtn').click(function() {
			$(".targetDiv").hide('fast');
			$(".targetBtn").html('변경');
			$(".targetBtn").not($(this)).hide('fast');
			if ($('.changeAddress').css("display") == "none") {
				$(".changeAddress").show('fast');
				$("#changeAddressBtn").html('취소');
			} else {
				$(".changeAddress").hide('fast');
				$("#changeAddressBtn").html('변경');
				$(".targetBtn").not($(this)).show('fast');
			}

		});

		$("#memberAddressInsert").on("click", function(e){
			$("input[name=memberAddress]").val($("input[name=postNumber]").val() + ")" + $("input[name=basicAddress]").val() + " " + $("input[name=detailAddress]").val());
			if($("input[name=postNumber]").val() == ""){
				alert("주소를 입력하세요.")
				e.preventDefault();
			}
		});

	});
</script>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>
    function findAddress() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                } else {
                	
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.querySelector("input[name=postNumber]").value = data.zonecode;
                document.querySelector("input[name=basicAddress]").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.querySelector("input[name=detailAddress]").focus();
                
            }
        }).open();
    }
</script>

<script>

	$(function() {
		
	
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
						
		//	 				jquery ajax에서 파일 업로드를 하려면 formData 객체가 필요
							var fd = new FormData();
							console.log(fd);
		//	 				fd.append(이름,데이터또는 파일);
							fd.append("f",files0);
							
							var that = this;//$("input[name=f]")
							
		//	 				(주의) 반드시 ajax file upload에서는 다음 두 가지 설정을 해야 한다.
		//	 				1. processData : false 설정
		//	 				2. contentType : false 설정
		//	 				3. type : "post" 설정
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
						
		//	 				jquery ajax에서 파일 업로드를 하려면 formData 객체가 필요
							var fd = new FormData();
							console.log(fd);
		//	 				fd.append(이름,데이터또는 파일);
							fd.append("f",files0);
							
							var that = this;//$("input[name=f]")
							
		//	 				(주의) 반드시 ajax file upload에서는 다음 두 가지 설정을 해야 한다.
		//	 				1. processData : false 설정
		//	 				2. contentType : false 설정
		//	 				3. type : "post" 설정
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
		
		
	});
	
	
</script>

<section class="main-row topLine">

	<div class="container-1200 mt30 poRelative">
		<p class="fs34 pl20">
			<strong>내 정보 수정</strong>
		</p>
	</div>

	<div class="mt30 bottomLine poRelative"></div>

	<div class="container-1200 dpFlex " style="min-height: 708px;">

		<div class="container-800 mt30 mb30 scrollThin">


			<div class="mb20">
				<div class="float-container bottomLine pb20">
					<div class="left pl10">
						<span class="fs18 fBold">프로필 사진</span>
					</div>
					<button type="button" class="right bosNone bora5 fBold project-btn-normal-hover w70 h30 targetBtn" id="changeProBtn">변경</button>
				</div>

				<div class="targetDiv changePro dpNone" style="display: none; margin-top: 10px; margin-bottom: 10px;">
					<div style="width: 250px; height: 250px;">
						<input class="" type="file" id="memberImage">
						<img src="" style="width: 200px; height: 200px; border-radius: 70%; border: 1px solid #DCDCDC;" id="preview">
					</div>
				</div>
			</div>

			<div class="mb20">
				<div class="float-container bottomLine pb20">
					<div class="left pl10">
						<span class="fs18 fBold dpInlineBlock w120">닉네임</span> <span>${memberDto.memberNick}</span>
					</div>
					<button type="button" class="right bosNone bora5 fBold project-btn-normal-hover w70 h30 targetBtn" id="changeNickBtn">변경</button>
				</div>

				<div class="targetDiv changeNick dpNone bottomLine pb20" style="margin-top: 20px; margin-bottom: 50px;">
					<form action="upNick" method="post" class="float-container">
						<input class="left h30 w700 p10 project-border-normal" type="text" placeholder="${memberDto.memberNick}" name="memberNick" required>
						<button type="submit" class="right bosNone bora5 fBold project-btn-normal-hover w70 h30">저장</button>
					</form>
				</div>
			</div>

			<div class="mb20">
				<div class="float-container bottomLine pb20">
					<div class="left pl10">
						<span class="fs18 fBold dpInlineBlock w120">소개</span> <span class="changeNick2">${isIntro}</span>
					</div>
					<button type="button" class="right bosNone bora5 fBold project-btn-normal-hover w70 h30 targetBtn" id="changeIntroBtn">변경</button>
				</div>

				<div class="targetDiv changeIntro dpNone bottomLine pb20" style="margin-top: 20px; margin-bottom: 50px;">
					<form action="upIntro" method="post" class="float-container">
						<input class="left h30 w700 p10 project-border-normal" type="text" placeholder="${isIntro}" name="memberIntroduce">
						<button type="submit" class="right bosNone bora5 fBold project-btn-normal-hover w70 h30">저장</button>
					</form>
				</div>
			</div>

			<div class="mb20">
				<div class="float-container bottomLine pb20">
					<div class="left pl10">
						<span class="fs18 fBold dpInlineBlock w120 h30">이메일</span> <span>${memberDto.memberEmail}</span>
					</div>
				</div>
			</div>

			<div class="mb20">
				<div class="float-container bottomLine pb20">
					<div class="left pl10">
						<span class="fs18 fBold dpInlineBlock w120">비밀번호</span>
					</div>
					<button type="button" class="right bosNone bora5 fBold project-btn-normal-hover w70 h30 targetBtn" id="changePwBtn">변경</button>
				</div>

				<div class="targetDiv changePw2 dpNone bottomLine pb20" style="margin-top: 20px; margin-bottom: 50px;">
					<form action="upPw2" method="post" class="float-container">

						<div class="left w700">
							<input class="left h30 w700 p10 project-border-normal mb30" type="password" name="memberPw" placeholder="현재 비밀번호" autocomplete="off" required>

							<input class="left h30 w700 p10 project-border-normal mb10" type="password" name="newPw" placeholder="변경할 비밀번호" autocomplete="off" required>
							<input class="left h30 w700 p10 project-border-normal" type="password" name="newPwCheck" placeholder="변경할 비밀번호 확인" autocomplete="off" required>
						</div>

						<button type="submit" class="right bosNone bora5 fBold project-btn-normal-hover w70 h30 mt100">저장</button>

					</form>
				</div>
			</div>

			<div class="mb20">
				<div class="float-container bottomLine pb20">
					<div class="left pl10">
						<span class="fs18 fBold dpInlineBlock w120">주소</span> <span>${memberDto.memberAddress}</span>
					</div>
					<button type="button" class="right bosNone bora5 fBold project-btn-normal-hover w70 h30 targetBtn" id="changeAddressBtn">변경</button>
				</div>

				<div class="targetDiv changeAddress float-container dpNone bottomLine pb20" style="margin-top: 20px; margin-bottom: 50px;">

					<div class="left w700">
						<input class="left h30 w300 p10 project-border-normal mb10" type="text" name="postNumber" placeholder="우편번호">
						<input class="right bosNone bora5 fBold project-btn-normal-hover w120 h30 changeBtn" type="button" onclick="findAddress()" value="우편번호 찾기">
						
						<input class="left h30 w700 p10 project-border-normal mb10" type="text" name="basicAddress" placeholder="주소">
						<input class="left h30 w700 p10 project-border-normal" type="text" name="detailAddress" placeholder="상세주소">
					</div>
					
					<form action="upAddress" method="post" class="right">
						<input type="hidden" name="memberAddress">
						<button id="memberAddressInsert" type="submit" class="right bosNone bora5 fBold project-btn-normal-hover w70 h30 mt80">저장</button>
					</form>

				</div>
			</div>

		</div>









		<div class="container-300 h400 mt30 mb30 boc200 bosSolid bow1 bora5 p30">

			<div>어떤 정보가 공개되나요?</div>
			<div class="fs12 fc150 mt10 mb40">프로필 사진과, 이름, 사용자 이름, 소개글, 웹사이트 및 회원님과 관련된 프로젝트 등이 프로필 페이지에 공개 됩니다.</div>

			<div>이메일은 어디에 쓰이나요?</div>
			<div class="fs12 fc150 mt10 mb40">이메일로 회원의 비밀번호와 프로젝트 알림을 드립니다.</div>

			<div>배송지를 삭제하면 예약된 후원의 배송지 정보도 삭제되나요?</div>
			<div class="fs12 fc150 mt10">현재 후원하신 프로젝트에 등록된 배송지가 삭제되거나 변경되진 않습니다. 이를 변경하시려면 후원현황에서 변경해주세요.</div>

		</div>

	</div>

</section>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>