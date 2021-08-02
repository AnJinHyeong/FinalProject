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

		<div><h1>문의 답장</h1></div>

		<form action="msgInsert" method="post">

			<div>
				
				<input type="hidden"  name="receiverNo" style="width:70%; margin-bottom:10px; margin-left:30px;" value="${msgVo.senderNo}" name="receiverNo">
				<input type="hidden"  name="msgTitle" style="width:70%; margin-bottom:10px; margin-left:30px;" value="문의내용답장" name="msgTitle">
			</div>
			<div>
				문의 내용 : ${msgVo.msgContent}
			</div>
				
		

			<div class="msgContentBox">

				<textarea name="msgContent"style="resize" class="msgContent" placeholder="문의 답신할 내용을 적어주세요" required></textarea>

			</div>

			<input type="submit" class="textBtn" style="width:100%;" value="전송">

		</form>

	

	</div>

	

</body>

</html>