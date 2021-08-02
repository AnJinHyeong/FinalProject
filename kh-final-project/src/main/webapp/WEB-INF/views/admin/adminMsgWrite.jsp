<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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

input.msgTitle{
	width: 100%;
	margin-bottom: 20px;
	height: 40px;
	padding: 10px;
}

input, textarea{
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







<script>
 

</script>



</head>



<body>



	<div style="padding: 20px;">

		<div style="margin-bottom: 30px;">
			<span style="font-size: 28px; font-weight: bold;">관리자에게 문의</span>
		</div>

		<div style="width: 100%;">
			<form action="adminMsgInsert" method="post">

				<input class="msgTitle" type="text" name="msgTitle" placeholder="관리자에게 문의할 제목을 입력해주세요(10글자내)" autocomplete="off" required>
				<textarea class="msgTextarea" name="msgContent" placeholder="문의 내용을 입력해주세요(100글자내)" required></textarea>
				<input type="submit" class="msgSendBtn" value="전송">

			</form>
		</div>

	</div>

</body>

</html>