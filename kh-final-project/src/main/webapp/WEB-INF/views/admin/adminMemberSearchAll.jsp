<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/views/template/adminSidebar.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="${root}/css/history.css">

<html>
<style>
#historyTitle {
	margin-top: 50px;
}

#tableAll {
	margin-left: 50px;
}

table.type09 {
	width: 95%;
	border-collapse: collapse;
	text-align: center;
	line-height: 1.5;
}

table.type09 thead th {
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	color: #369;
	border-bottom: 3px solid #036;
}

table.type09 tbody th {
	width: 150px;
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
	background: #f3f6f7;
}

table.type09 td {
	width: 350px;
	padding: 10px;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
}

div.historyPage ul {
	text-align: center;
}

div.historyPage ul li {
	display: inline;
	vertical-align: middle;
}

div.historyPage ul li a {
	display: -moz-inline-stack; /*FF2*/
	vertical-align: top;
	padding: 4px;
	margin-right: 3px;
	width: 15px !important;
	color: #000;
	font: bold 12px tahoma;
	border: 1px solid #eee;
	text-align: center;
	text-decoration: none;
	width /**/: 26px; /*IE 5.5*/
}

div.historyPage ul li a.now {
	color: #fff;
	background-color: #f40;
	border: 1px solid #f40;
}

div.historyPage ul li a:hover, ul li a:focus {rgb (255, 87, 87);
	color: white;
	border: 1px solid #f40;
	background-color: #f40;
	div
	.historyPage
	ul
	li
	{
	color
	:
	green;
}
}
</style>

<section class="main-row topLine">

	<div class="container-1200 mt30 poRelative">

	</div>

	
	<div style="min-height: 600px;">
		<div id=tableAll>
			<h2 id=historyTitle>결제 조회 내역</h2>
			<br>
			<table class=type09>
				<tr>
					<th>회원아이디</th>
					<th>회원닉네임</th>
					<th>회원보유금액</th>
					<th>회원이메일</th>
					<th>회원등급</th>
					<th>회원주소</th>	
				</tr>
				
				<c:forEach var="adminMemberVO" items="${list}">
					<tr>
						<td>${adminMemberVO.memberId}</td>
						<td>${adminMemberVO.memberNick}</td>
						<td>${adminMemberVO.memberHavePoint}원</td>
						<td>${adminMemberVO.memberEmail}</td>
						<td>${adminMemberVO.memberGrade}</td>
						<td>${adminMemberVO.memberAddress}</td>
					</tr>
				</c:forEach>
			</table>
	
		</div>
	</div>
</section>
