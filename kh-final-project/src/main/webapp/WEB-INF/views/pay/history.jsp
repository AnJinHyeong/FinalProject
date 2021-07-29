<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="${root}/css/history.css">

<html>
<style>
#historyTitle {
	margin-top: 50px;
}

#tableAll {
	padding-left: 50px;
	margin-left: 100px;
}

table.type09 {
	width: 90%;
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
		<p class="fs34 pl20">
			<strong>결제 기능</strong>
		</p>
	</div>

	<div class="mt30 bottomLine poRelative">
		<div class="w1200 h35" style="margin: 0 auto;">
			<ul class="project-main-ul">
				<li class="project-main-li main-li-on"><a href="#"
					class="main-li-a">결제 및 조회 </a></li>
			</ul>
		</div>
	</div>

	
	<div style="min-height: 600px;">
		<div id=tableAll>
			<h2 id=historyTitle>결제 조회 내역</h2>
			<br>
			<table class=type09>
				<tr>
					<th>결제번호</th>
					<th>결제코드</th>
					<th>결제가격</th>
					<th>결제상태</th>
					<th>결제날짜</th>
				</tr>
	
				<c:forEach var="payDto" items="${list}">
					<tr>
						<td>${payDto.payNo}</td>
						<td>${payDto.payTid}</td>
						<td>${payDto.payPrice}원</td>
						<td>${payDto.payStatus}</td>
						<td><fmt:formatDate value="${payDto.payDate}"
								pattern="yyyy-MM-dd [E] a hh:mm:ss" /></td>
					</tr>
				</c:forEach>
			</table>
	
		</div>
	</div>
</section>

<br>
<div class=historyPage>
	<ul>
		<c:if test="${pageMaker.prev}">
			<li><a
				href="history${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a></li>
		</c:if>

		<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}"
			var="idx">
			<li><a id="current" href="history${pageMaker.makeQuery(idx)}">${idx}</a></li>
		</c:forEach>

		<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
			<li><a
				href="history${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a></li>
		</c:if>
	</ul>
</div>
<br>

</html>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>