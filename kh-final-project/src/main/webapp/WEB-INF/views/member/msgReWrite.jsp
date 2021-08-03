<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>



<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>문의하기</title>
<script>



</script>


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

<script>

	

</script>

</head>

<body>

	<div class="mainContext" > 

		<div><h1>문의 답장</h1></div>

		<form action="msgInsert" method="post">
			<input type="hidden" name="msgNo" value="${msgNo}">
			<div>
				
				<input type="hidden"  name="receiverNo" style="width:70%; margin-bottom:10px; margin-left:30px;" value="${msgVo.senderNo}">
				<input type="hidden"  name="msgTitle" style="width:70%; margin-bottom:10px; margin-left:30px;" value="문의내용답장" name="msgTitle">
			</div>
			<div>
				문의 내용 : ${msgVo.msgContent}
			</div>
				
		

			<div class="msgContentBox">

				<textarea name="msgContent"style="resize" class="msgTextarea" placeholder="문의 답신할 내용을 적어주세요" required></textarea>

			</div>

			<input type="submit" class="msgSendBtn" style="width:100%;" value="전송">

		</form>

	

	</div>

	

</body>

</html>