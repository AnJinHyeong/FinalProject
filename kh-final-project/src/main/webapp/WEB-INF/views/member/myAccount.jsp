<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="root" value="${pageContext.request.contextPath}"></c:set>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

 

<style>

	.wall{

		content:"";

		display:block;

		clear:both;

	}

	.section-setting{

		width: 85%;

		min-height: 700px;

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

	.changeEmail{

		margin-top:10px;

		margin-bottom:10px; 

	}

	.changeEmail2{

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

	.emailBtn2{

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

	.emailBtn2:hover{

		color:gray;

	}

</style>

<script>

	$(function(){

		

		$('#emailBtn1').click(function(){

			if($('.changeEmail').css("display")=="none"){

				

				$('.changeEmail').show();

				$('.changeEmail2').hide();

				$("#emailBtn1").html('취소');

				

			}else if($('.changeEmail').css("display")!="none"){

				$('.changeEmail').hide();

				$('.changeEmail2').show();

				$("#emailBtn1").html('변경');

			}

		});

		

		$('#changeBtn2').click(function(){

			if($('.changePw2').css("display")=="none"){

				

				$('.changePw2').show();

				$('.changePw1').hide();

				$("#changeBtn2").html('취소');

				

			}else if($('.changePw2').css("display")!="none"){

				$('.changePw2').hide();

				$('.changePw1').show();

				$("#changeBtn2").html('변경'); 

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

			<div class="left titleCont" onclick="location.href='${root}/member/mySettings'"><strong>프로필</strong></div>

			<div class="left titleCont checked"><strong>계정</strong></div>

			<div class="left titleCont" onclick="location.href='${root}/member/myAddress'"><strong>배송지</strong></div>

			<div class="wall"></div>

		</div>

		

		<hr>

		

		<div class="left left-container">

		<div style="margin-top:20px;">

			<div>

				<div class="float-container">

					<div class="left" style="margin-top:10px; margin-bottom:10px;"><strong>이메일</strong></div>

					<button type="button" class="right changeTitle" id="emailBtn1">변경</button>

					<div class="wall"></div>

				</div>

				<div class="changeEmail2" style="color:#3d3d3d;">${memberDto.memberEmail}</div>

				<div class="changeEmail" style="display:none; margin-top:10px; margin-bottom:10px;">
					<form action="upEmail" method="post">
					
						<input type="text" name="memberEmail"placeholder="바뀔이메일" style="width:100%; height:40px;">
	
						<button type="submit" class="emailBtn2" >저장</button>
					
					</form>

				</div>

				<hr>

			</div>

			

			<div>

				<div class="float-container">

					<div class="left title2"><strong>비밀번호</strong></div>

					<button type="button" class="right changeTitle" id="changeBtn2">변경</button>

					<div class="wall"></div>

				</div>

				

				<div class="changePw" style="margin-top:20px; margin-bottom:10px;"></div>

				<div class="changePw2" style="display:none; margin-top:10px; margin-bottom:10px;">
					<form action="upPw2" method="post">
					<label for="curPw">현재 비밀번호</label><br>

					<input type="password" name="memberPw" placeholder="현재비밀번호" style="width:60%; height:40px; margin-top:10px; margin-bottom:25px; border-radius:4px; border: solid 1px gray;"><br>

					<div>변경할 비밀번호</div>

					<input type="password" name="newPw" placeholder="변경할 비밀번호" style="width:60%; height:40px; margin-top:5px;margin-bottom:5px; border-radius:4px; border: solid 1px gray;"><br>

					<input type="password" name="newPwCheck" placeholder="변경할 비밀번호 확인" style="width:60%; height:40px; margin-top:5px; margin-bottom:10px; border-radius:4px; border: solid 1px gray;"><br>

					<button type="submit" class="emailBtn2" >저장</button>
					</form>
				</div>

				<hr>

			</div>

			

		</div>

	</div>

	<div class="right right-container">

		<div class="introduceCont">

			<div>

				이메일은 어디에 쓰이나요?

			</div>

			

			<div class="introCont" style="margin-top:5px;">이메일로 회원의 비밀번호와 프로젝트 알림을 드립니다.</div>

			

		</div>

	

	</div>

	

	<div class="wall"></div>

</section>

 

 

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>