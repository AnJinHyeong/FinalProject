<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>

	function showMsg() {

		window.open("<%=request.getContextPath()%>/member/msgWrite","a","width=600, height=400, left=400, top=100 ,status=no,toolbar=no");

	}

</script>
</head>
<body>
<button onclick="showMsg()">버튼</button>
</body>
</html>