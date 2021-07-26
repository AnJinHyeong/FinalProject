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

		<form>

			<div>

				받는 사람<br>

				<input type="text"  placeholder="받는사람 이름" style='width:70%; margin-bottom:10px; margin-left:30px;' value="">

			</div>

			<div>

				주소<br>

				<input type="text"  placeholder="주소" style='width:70%; margin-bottom:10px; margin-left:30px;' value="">

			</div>

			

			<input type="submit" class="textBtn" disabled="disabled" style="width:100%;" value="등록 완료">

		</form>

	

	</div>

	

</body>

</html>