<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<c:set var="isIntro" value="${memberIntroduce eq null}"></c:set>
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

	.changeNick{

		margin-top:10px;

		margin-bottom:10px; 

	}

	.changeNick2{ 

		margin-top:10px;

		margin-bottom:10px;

	}

	.nickBtn{

		font-size:17px;

		margin-top:15px; 

		margin-bottom:15px; 

		width:20%; 

		height:40px; 

		text-align:center; 

		background-color:#3D3D3D; 

		color:white; 

		border-radius:5px;

	}

	.nickBtn:hover{

		color:gray;

	}

	.introBtn{

		font-size:17px;

		margin-top:15px; 

		margin-bottom:15px; 

		width:20%; 

		height:40px; 

		text-align:center; 

		background-color:#3D3D3D; 

		color:white; 

		border-radius:5px;

	}

	.introBtn:hover{

		color:gray;

	}

	.imgBtn{

		font-size:17px;

		margin-top:15px; 

		margin-bottom:15px; 

		width:20%; 

		height:40px; 

		text-align:center; 

		background-color:#3D3D3D; 

		color:white; 

		border-radius:5px;

	}

	.imgBtn:hover{

		color:gray;

	}

</style>

<script>

	$(function(){

		

		$('#changeBtn1').click(function(){

			if($('.changePro').css("display")=="none"){

				

				$('.changePro').show();

				$("#changeBtn1").html('취소');

				

			}else if($('.changePro').css("display")!="none"){

				$('.changePro').hide();

				$("#changeBtn1").html('변경');

			}

		});

		

		$('#changeBtn2').click(function(){

			if($('.changeNick').css("display")=="none"){

				

				$('.changeNick').show();

				$('.changeNick2').hide();

				$("#changeBtn2").html('취소');

				

			}else if($('.changeNick').css("display")!="none"){

				$('.changeNick').hide();

				$('.changeNick2').show();

				$("#changeBtn2").html('변경');

			}

		});

		

		$('#changeBtn3').click(function(){

			if($('.changeIntro').css("display")=="none"){

				

				$('.changeIntro').show();
				$('.divIntro').hide();
				$("#changeBtn3").html('취소');

				

			}else if($('.changeIntro').css("display")!="none"){

				$('.changeIntro').hide();
				$('.divIntro').show();
				$("#changeBtn3").html('변경');

			}

		});

	});

</script>

<section class="section-setting float-container">

<hr>

		<div class="setTitle">

		설정

		</div>

		<div class="float-container">

			<div class="left titleCont checked"><strong>프로필</strong></div>

			<div class="left titleCont" onclick="location.href='${root}/member/myAccount'"><strong>계정</strong></div>

			<div class="left titleCont" onclick="location.href='${root}/member/myAddress'"><strong>배송지</strong></div>

			<div class="wall"></div>

		</div>

		

		<hr>

		

		<div class="left left-container">

		<div style="margin-top:20px;">

			<div>

				<div class="float-container">

					<div class="left" style="margin-top:10px; margin-bottom:10px;"><strong>프로필 사진</strong></div>

					<button type="button" class="right changeTitle" id="changeBtn1">변경</button>

					<div class="wall"></div>

				</div>

				<div class="changePro" style="display:none; margin-top:10px; margin-bottom:10px;">

					<div> 프로필사진업로드</div>

					<button type="button" class="imgBtn" >저장</button>

				</div>

				<hr>

			</div>

			

			<div>

				<div class="float-container">

					<div class="left title2"><strong>닉네임</strong></div>

					<button type="button" class="right changeTitle" id="changeBtn2">변경</button>

					<div class="wall"></div>

				</div>

				<div class="changeNick2">${memberDto.memberNick}</div>

				<div class="changeNick" style="display:none;">

				

					<input type="text" placeholder="바뀔이름" style="width:100%; height:40px;">

					<button type="button" class="nickBtn" >저장</button>

					

				</div>

				<hr>

			</div>

			

			<div>

				<div class="float-container">

					<div class="left" style="margin-top:10px; margin-bottom:10px;"><strong>소개</strong></div>
					

					<button type="button" class="right changeTitle" id="changeBtn3">변경</button>

					<div class="wall"></div>
					
				</div>

				<div style="color:#9E9E9E; margin-top:10px; margin-bottom:10px;">
					<div class="divIntro"> 
					<c:choose>
						<c:when test="${isIntro}">
							<div>현재 소개글이 없습니다.</div>
						</c:when>
						<c:otherwise>
							<div>${memberDto.memberIntroduce}</div>
						</c:otherwise> 
					</c:choose></div>
					</div>

				<div class="changeIntro" style="display:none;">

					<textarea rows="10" cols="100" style="padding:5px;"></textarea>

					

					<button type="button" class="introBtn" >저장</button>

				</div>

				<hr>

			</div>

			

		</div>

	</div>

	<div class="right right-container">

		<div class="introduceCont">

			<div>

				어떤 정보가 공개되나요?

			</div>

			

			<div class="introCont" style="margin-top:5px;">프로필 사진과, 이름, 사용자 이름, 소개글, 웹사이트 및 회원님과 관련된 프로젝트 등이 프로필 페이지에 공개 됩니다. </div>

			

		</div>

	

	</div>

	

	<div class="wall"></div>

</section>

 

 

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>