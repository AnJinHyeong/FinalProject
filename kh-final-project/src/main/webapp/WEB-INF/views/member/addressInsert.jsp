<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>배송지 주소 입력</title>

<style>

	.mainContext{

		width: 100%;

		height: 100%;

	}

	.msgContentBox{

		width : 100%;

		height : 200;

	}

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

		<div><h1>배송지 추가</h1></div>

		<form action="upAddress" method ="post">


			<div>

				주소 :

				<input type="text"  placeholder="주소" style='width:70%; margin-bottom:10px; margin-left:30px;' name="memberAddress">

			</div>

			

			<input type="submit" class="textBtn" style="width:70%;" value="등록 완료">

		</form>

	

	</div>

	

</body>

</html>