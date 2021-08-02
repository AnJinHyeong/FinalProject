<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>

 

<html>

 

<head>

 

<meta charset="UTF-8">

 

<title>문의하기 답장</title>

 

 

 

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

 

		width:100%;

 

	}

 

}

 

</style>

 

 

 

<script>

 

 

 

</script>

 

</head>

 

<body>

 

	<div class="mainContext" >

 

		<div><h1>관리자에게 문의</h1></div>

 

		<form action="adminMsgInsert" method="post">

 

 

				<input type="text" name="msgTitle"  style="width:70%; margin-left:30px; margin-bottom:30px;" placeholder="관리자에게 문의할 제목을 입력해주세요(10글자내)">

				

 

			<div class="msgContentBox">

 

				<textarea name="msgContent"style="resize" class="msgContent" placeholder="문의 내용을 입력해주세요(100글자내)" required></textarea>

 

			</div>

 

			<input type="submit" class="textBtn" style="width:100%;" value="전송">

 

		</form>

 

	

 

	</div>

 

	

 

</body>

 

</html>