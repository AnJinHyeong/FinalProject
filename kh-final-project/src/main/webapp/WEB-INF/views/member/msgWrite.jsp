<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>



<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>문의하기 답장</title>



<style>
*{
	box-sizing : border-box;
}
textarea.msgTextarea {
	margin-bottom: 20px;
	width: 100%;
	padding: 10px;
	height: 200px;
	resize: none;
}
input.msgTitle, select.msgTitle{
	width: 100%;
	margin-bottom: 20px;
	height: 40px;
	padding: 10px;
}
input, textarea, select{
	border: 1px solid rgb(220, 220, 220);
}
input.msgSendBtn{
	height: 40px;
	background-color: #fff; 
	color: black;
	border: 1px solid rgb(240, 240, 240);
	cursor: pointer;
	width: 100%;
}
input.msgSendBtn:hover{
	background: rgb(248, 100, 83);
	color: #fcfcfc;
	transition: background 0.2s ease-in-out;
}
</style>



</head>

<body>

	<div class="mainContext" style="padding: 0 20px;">

		<div><h1>문의 답장</h1></div>

		<form action="msgInsert" method="post">

			<div>
				
				<input type="hidden"  name="receiverNo" style="width:70%; margin-bottom:10px; margin-left:30px;" value="${projectDto.memberNo}" name="receiverNo">

			</div>
			<div style="margin-bottom: 20px;">
				문의 프로젝트 제목 : ${projectDto.projectTitle}
			</div>

			<div style="width:100%">

				<select class="msgTitle" name="msgTitle">

					<option value="" selected>문의 유형</option>	

					<option value="선물/후원">선물/후원</option>	

					<option value="프로젝트">프로젝트</option>

					<option value="교환/환불">교환/환불</option>

					<option value="기타">기타</option>

				</select>

			</div>

			

			<div>

							

			</div>

			<div class="msgContentBox">

				<textarea class="msgTextarea" name="msgContent" placeholder="프로젝트 진행자에게 문의하고 싶은 내용을 적어주세요" required></textarea>

			</div>

			<input type="submit" class="msgSendBtn" style="width:100%;" value="전송">

		</form>

	

	</div>

	

</body>

</html>