<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<c:set var="isAddress" value="${empty memberDto.memberAddress}"></c:set>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

 

<style>

	.wall{

		content:"";

		display:block;

		clear:both;

	}

	.section-setting{

		width: 85%;

		min-height: 1000px;

		margin : 0 auto;

	}

	.left-container{

		width: 60%;

	}

	.right-container{

		width:25%;

	}

	.setTitle{

		padding-top : 35px;

		padding-bottom : 35px;

		font-size: 40px;

		color : gray;

	}

	.introduceCont{

		border : solid 1px gray;

		width: 100%;

		margin-top: 20px;

		font-size:15px;

		padding : 15px;

		

	}

	.introCont{

		font-size:12px;

		color:gray;

	

	}

	.titleCont{

		width: 100px;

		color: gray;

		font-size: 20px;

		text-align:center;

		padding : 15px;

		

	}

	.titleCont:hover{

		color: black;

	}

	.checked{

		color:black;

		border-bottom: solid 2px black;

	}

	.changeTitle{

		color:#27A3FF;	

		border:0;

		outline:0;

		background-color	: white;

		font-size: 18px;

		

	}

	.title2{

		margin-top:10px;

		margin-bottom:10px;

	}

	.addressBox{

		border: solid 1px gray;

		width: 100%;

		min-height: 200px;

		color: #BDBDBD;

	}

 

</style>

<script>

	function showAddress() {

		window.open("<%=request.getContextPath()%>/member/addressInsert","a","width=600, height=400, left=400, top=100 ,status=no,toolbar=no");

	}

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

<section class="section-setting float-container">

<hr>

		<div class="setTitle">

		설정

		</div>

		<div class="float-container">

			<div class="left titleCont" onclick="location.href='${root}/member/mySettings'"><strong>프로필</strong></div>

			<div class="left titleCont" onclick="location.href='${root}/member/myAccount'"><strong>계정</strong></div>

			<div class="left titleCont checked"><strong>배송지</strong></div>

			<div class="wall"></div>

		</div>

		

		<hr>

		

		<div class="left left-container">

		<div style="margin-top:20px;">

			<div>

				<div class="float-container">

					<div class="left" style="margin-top:10px; margin-bottom:10px;"><strong>등록된 배송지</strong></div>

					<button type="button" class="right changeTitle" id="changeBtn1" onclick="showAddress()">+추가</button>

					<div class="wall"></div>

				</div>

				<div class="changePro" style="margin-top:10px; margin-bottom:10px;">

					<c:choose>
						<c:when test="${isAddress}">
						<div class="addressBox" style="text-align:center; padding-top:100px;">현재 배송지 정보가 없습니다.</div>
						</c:when>
						<c:otherwise>
						<div class="addressBox" style="text-align:center; padding-top:100px;">${memberDto.memberAddress}</div>
						</c:otherwise>
					</c:choose> 
					

				</div>
				
				<div class="row">
					<input type="text" name="postNumber" placeholder="우편번호"
						class="form-input form-input-inline"> <input type="button"
						onclick="findAddress()" value="우편번호 찾기"
						class="form-btn form-btn-inline form-btn-positive">
				</div>
				<div class="row">
					<input type="text" name="basicAddress" placeholder="주소"
						class="form-input">
				</div>
				<div class="row">
					<input type="text" name="detailAddress" placeholder="상세주소"
						class="form-input">
				</div>

			</div>
			
			
			
			

			

		</div>

	</div>

	<div class="right right-container">

		<div class="introduceCont">

			<div> 

				배송지를 삭제하면 예약된 후원의 배송지 정보도 삭제되나요?

			</div>

			

			<div class="introCont" style="margin-top:5px;">현재 후원하신 프로젝트에 등록된 배송지가 삭제되거나 변경되진 않습니다. 이를 변경하시려면 후원현황에서 변경해주세요.</div>

			

		</div>

	

	</div>

	

	<div class="wall"></div>

</section>

 

 

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>