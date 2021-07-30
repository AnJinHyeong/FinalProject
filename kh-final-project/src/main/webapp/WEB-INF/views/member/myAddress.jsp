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