<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>

<style>
	html, body{
		background-color: rgba(180, 253, 11, 0.03);
		padding: 0px;
		margin: 0px;
	}
</style>

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<script>
	$(function(){
		
		for(var i = 0 ; i < 70 ; i++){
			var template = $("#footPrintTemplate").html();
			
			template = template.replace("{{left}}", Math.random() * 100);
			template = template.replace("{{top}}", Math.random() * 100);
			template = template.replace("{{rotate}}", Math.random() * 360);
			
			$("#result").append(template);
		}
		
	});
</script>

<script id="footPrintTemplate" type="text/template">
	<div style="position: fixed; left: {{left}}%; top: {{top}}%; transform: rotate({{rotate}}deg); font-size: 28px; color: #BCED36; z-index: 0">
		<i class="fas fa-paw"></i>
	</div>
</script>

<div id="result">
	<div style="width: 700px; text-align: center; font-size: 100px; font-weight: bold; position: fixed; left: 50%; top: 50%; transform: translate(-50%, -50%); z-index: 1">
		<span>500 ERROR <i class="fas fa-dog"></i></span>
		<a style="font-size: 24px; text-decoration: none; color: black;" href="${root}">홈으로</a>
	</div>
</div>


	