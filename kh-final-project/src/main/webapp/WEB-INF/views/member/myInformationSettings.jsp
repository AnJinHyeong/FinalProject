<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<c:set var="isIntro" value="${memberDto.memberIntroduce}"></c:set>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>



<style>
.wall {
	content: "";
	display: block;
	clear: both;
}

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

.introCont {
	font-size: 12px;
	color: gray;
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

		$('#changeBtn1').click(function() {

			if ($('.changePro').css("display") == "none") {

				$('.changePro').show();

				$("#changeBtn1").html('취소');

			} else if ($('.changePro').css("display") != "none") {

				$('.changePro').hide();

				$("#changeBtn1").html('변경');

			}

		});

		$('#changeBtn2').click(function() {

			if ($('.changeNick').css("display") == "none") {

				$('.changeNick').show();

				$('.changeNick2').hide();

				$("#changeBtn2").html('취소');

			} else if ($('.changeNick').css("display") != "none") {

				$('.changeNick').hide();

				$('.changeNick2').show();

				$("#changeBtn2").html('변경');

			}

		});

		$('#changeBtn3').click(function() {

			if ($('.changeIntro').css("display") == "none") {

				$('.changeIntro').show();
				$('.divIntro').hide();
				$("#changeBtn3").html('취소');

			} else if ($('.changeIntro').css("display") != "none") {

				$('.changeIntro').hide();
				$('.divIntro').show();
				$("#changeBtn3").html('변경');

			}

		});

		$('#changeBtn4').click(function() {

			if ($('.changePw2').css("display") == "none") {

				$('.changePw2').show();

				$('.changePw1').hide();

				$("#changeBtn4").html('취소');

			} else if ($('.changePw2').css("display") != "none") {

				$('.changePw2').hide();

				$('.changePw1').show();

				$("#changeBtn4").html('변경');

			}

		});
		
		$('#changeBtn5').click(function() {

			$(".changeAddress").toggle();
			
			$("#submittedAddress").toggle();
			
			if ($('.changeAddress').css("display") == "none") {

				$("#changeBtn5").html('변경');

			} else if ($('.changeAddress').css("display") != "none") {

				$("#changeBtn5").html('취소');

			}

		});

		$("#memberAddressInsert").on("click", function(){
			$("input[name=memberAddress]").val("(" + $("input[name=postNumber]").val() + ") " + $("input[name=basicAddress]").val() + " " + $("input[name=detailAddress]").val());
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

<section class="topLine main-row">

	<div class="mt30" style="margin-left: 85px;">
		<strong class="setTitle pl20" style="font-size: 34px; color: black;">내 정보 수정</strong>
	</div>

	<div class="mt20 bottomLine w100p"></div>

	<div class="section-setting float-container bottomLine">

		<div class="left left-container">

			<div>

				<div class="float-container">

					<div class="left" style="margin-top: 10px; margin-bottom: 10px;">
						<strong>프로필 사진</strong>
					</div>

					<button type="button" class="right changeTitle" id="changeBtn1">변경</button>

					<div class="wall"></div>

				</div>

				<div class="changePro" style="display: none; margin-top: 10px; margin-bottom: 10px;">

					<div>프로필사진업로드</div>

					<button type="button" class="imgBtn">저장</button>

				</div>

				<hr>

			</div>



			<div>

				<div class="float-container">

					<div class="left title2">
						<strong>닉네임</strong>
					</div>


					<button type="button" class="right changeTitle" id="changeBtn2">변경</button>

					<div class="wall"></div>

				</div>

				<div class="changeNick2">${memberDto.memberNick}</div>

				<div class="changeNick" style="display: none;">

					<form action="upNick" method="post">

						<input type="text" placeholder="바뀔이름" style="width: 100%; height: 40px;" name="memberNick">

						<button type="submit" class="nickBtn">저장</button>

					</form>


				</div>

				<hr>

			</div>



			<div>

				<div class="float-container">

					<div class="left" style="margin-top: 10px; margin-bottom: 10px;">
						<strong>소개</strong>
					</div>


					<button type="button" class="right changeTitle" id="changeBtn3">변경</button>

					<div class="wall"></div>

				</div>

				<div style="color: #9E9E9E; margin-top: 10px; margin-bottom: 10px;">
					<div class="divIntro">
						<c:choose>
							<c:when test="${isIntro}">
								<div>현재 소개글이 없습니다.</div>
							</c:when>
							<c:otherwise>
								<div>${memberDto.memberIntroduce}</div>
							</c:otherwise>
						</c:choose>
					</div>
				</div>

				<div class="changeIntro" style="display: none;">
					<form action="upIntro" method="post">
						<textarea rows="10" cols="100" style="padding: 5px;" name="memberIntroduce"></textarea>



						<button type="submit" class="introBtn">저장</button>
					</form>

				</div>

				<hr>

			</div>

		</div>

		<div class="right right-container">

			<div class="introduceCont">

				<div>어떤 정보가 공개되나요?</div>



				<div class="introCont" style="margin-top: 5px;">프로필 사진과, 이름, 사용자 이름, 소개글, 웹사이트 및 회원님과 관련된 프로젝트 등이 프로필 페이지에 공개 됩니다.</div>



			</div>



		</div>



		<div class="wall"></div>
	</div>

	<div class="section-setting float-container bottomLine">

		<div class="left left-container">

			<div>

				<div class="float-container">

					<div class="left" style="margin-top: 10px; margin-bottom: 10px;">
						<strong>이메일</strong>
					</div>

					<!-- 					<button type="button" class="right changeTitle" id="emailBtn1">변경</button> -->

					<div class="wall"></div>

				</div>

					<div class="changeEmail2" style="color: #3d3d3d;">${memberDto.memberEmail}</div>

				<!-- 				<div class="changeEmail" style="display: none; margin-top: 10px; margin-bottom: 10px;"> -->
				<!-- 					<form action="upEmail" method="post"> -->

				<!-- 						<input type="text" name="memberEmail" placeholder="바뀔이메일" style="width: 100%; height: 40px;"> -->

				<!-- 						<button type="submit" class="emailBtn2">저장</button> -->

				<!-- 					</form> -->

				<!-- 				</div> -->

				<hr>

			</div>



			<div>

				<div class="float-container">

					<div class="left title2">
						<strong>비밀번호</strong>
					</div>

					<button type="button" class="right changeTitle" id="changeBtn4">변경</button>

					<div class="wall"></div>

				</div>



				<div class="changePw" style="margin-top: 20px; margin-bottom: 10px;"></div>

				<div class="changePw2" style="display: none; margin-top: 10px; margin-bottom: 10px;">
					<form action="upPw2" method="post">
						<label for="curPw">현재 비밀번호</label><br> <input type="password" name="memberPw" placeholder="현재비밀번호"
							style="width: 60%; height: 40px; margin-top: 10px; margin-bottom: 25px; border-radius: 4px; border: solid 1px gray;"
						autocomplete="off"><br>

						<div>변경할 비밀번호</div>

						<input type="password" name="newPw" placeholder="변경할 비밀번호"
							style="width: 60%; height: 40px; margin-top: 5px; margin-bottom: 5px; border-radius: 4px; border: solid 1px gray;"
						autocomplete="off"><br> <input type="password" name="newPwCheck" placeholder="변경할 비밀번호 확인"
							style="width: 60%; height: 40px; margin-top: 5px; margin-bottom: 10px; border-radius: 4px; border: solid 1px gray;"
						autocomplete="off"><br>

						<button type="submit" class="emailBtn2">저장</button>
					</form>
				</div>

				<hr>

			</div>
		</div>

		<div class="right right-container">

			<div class="introduceCont">

				<div>이메일은 어디에 쓰이나요?</div>



				<div class="introCont" style="margin-top: 5px;">이메일로 회원의 비밀번호와 프로젝트 알림을 드립니다.</div>



			</div>



		</div>

	</div>

	<div class="section-setting float-container bottomLine">

		<div class="left left-container">

				<div>

					<div class="float-container">

						<div class="left" style="margin-top: 10px; margin-bottom: 10px;">
							<strong>등록된 배송지</strong>
						</div>

						<button type="button" class="right changeTitle" id="changeBtn5">변경</button>

					</div>
					
					
					
					<div id="submittedAddress" style="margin-top:10px; margin-bottom:10px;">

						<c:choose>
							<c:when test="${isAddress}">
							<div class="addressBox">현재 배송지 정보가 없습니다.</div>
							</c:when>
							<c:otherwise>
							<div class="addressBox">${memberDto.memberAddress}</div>
							</c:otherwise>
						</c:choose> 
						
	
					</div>
					
					

<!-- 					<div class="changePro" style="margin-top: 10px; margin-bottom: 10px;"> -->

<%-- 						<c:choose> --%>
<%-- 							<c:when test="${isAddress}"> --%>
<!-- 								<div class="addressBox" style="text-align: center; padding-top: 100px;">현재 배송지 정보가 없습니다.</div> -->
<%-- 							</c:when> --%>
<%-- 							<c:otherwise> --%>
<%-- 								<div class="addressBox" style="text-align: center; padding-top: 100px;">${memberDto.memberAddress}</div> --%>
<%-- 							</c:otherwise> --%>
<%-- 						</c:choose> --%>


<!-- 					</div> -->

					<div class="changeAddress dpNone">
						<div class="row">
							<input type="text" name="postNumber" placeholder="우편번호" class="form-input form-input-inline"> <input type="button"
								onclick="findAddress()" value="우편번호 찾기" class="form-btn form-btn-inline form-btn-positive"
							>
						</div>
						<div class="row">
							<input type="text" name="basicAddress" placeholder="주소" class="form-input">
						</div>
						<div class="row">
							<input type="text" name="detailAddress" placeholder="상세주소" class="form-input">
						</div>
						
						<form action="upAddress" method ="post">
							
							<input type="hidden" name="memberAddress">
					
							<input id="memberAddressInsert" type="submit" class="textBtn" value="등록 완료">
							
						</form>
						
					</div>
					
					<hr>

				</div>


		</div>

		<div class="right right-container">

			<div class="introduceCont">

				<div>배송지를 삭제하면 예약된 후원의 배송지 정보도 삭제되나요?</div>



				<div class="introCont" style="margin-top: 5px;">현재 후원하신 프로젝트에 등록된 배송지가 삭제되거나 변경되진 않습니다. 이를 변경하시려면 후원현황에서 변경해주세요.</div>



			</div>



		</div>

	</div>

</section>





<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>