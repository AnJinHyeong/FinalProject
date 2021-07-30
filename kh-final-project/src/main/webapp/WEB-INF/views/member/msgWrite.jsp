<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>



<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>문의하기</title>



<style>

	.mainContext{

		width: 100%;

		height: 100%;

	}

	.msgContentBox{

		width : 100%;

		height : 200;

	}

	textarea{

	width:585px; 

	height:200px; 

    resize:none;/* 크기고정 */ 

/*   resize: horizontal; // 가로크기만 조절가능 

	resize: vertical;  세로크기만 조절가능  */

	#textBox{

	

	}

	.textBtn{

		width:580px;

	}

}

</style>

<script>

	

</script>

</head>

<body>

	<div class="mainContext" >

		<div><h1>창작자에게 문의</h1></div>

		<form action="msgInsert" method="post">

			<div>
				
				<input type="hidden"  name="receiverNo" style="width:70%; margin-bottom:10px; margin-left:30px;" value="${projectDto.memberNo}" name="receiverNo">

			</div>
			<div>
				문의 프로젝트 제목 : ${projectDto.projectTitle}
			</div>

			<div style="width:100%">

				문의 내용 

				<select name="msgTitle"  style="width:70%; margin-left:30px; margin-bottom:30px;">

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

				<textarea name="msgContent"style="resize" class="msgContent" placeholder="프로젝트 진행자에게 문의하고 싶은 내용을 적어주세요" required></textarea>

			</div>

			<input type="submit" class="textBtn" style="width:100%;" value="전송">

		</form>

	

	</div>

	

</body>

</html>