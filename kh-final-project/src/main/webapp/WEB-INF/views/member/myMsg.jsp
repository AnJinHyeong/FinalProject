<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<c:set var="isLogin" value="${not empty memberNo}"></c:set>
<c:set var="division" value="${param.division}"></c:set>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>FUN_ding</title>
	<link rel="stylesheet" type="text/css" href="${root}/css/template.css">
	<link rel="stylesheet" type="text/css" href="${root}/css/common.css">
	<link rel="stylesheet" type="text/css" href="${root}/css/project.css">
	<link rel="stylesheet" type="text/css" href="${root}/css/yb.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script>
		$(document).ready(function(){
		 
	   	 // 라디오버튼 클릭시 이벤트 발생
	    	$("input:radio[name=show2]").click(function(){
	 
	        	if($("input[name=show2]:checked").val() == "1"){
	        		$('')
	            	$('.a').css('display','block');
	            	$('.b').css('display','none');
	            	$('.c').css('display','none');
	            	// radio 버튼의 value 값이 1이라면 활성화
	 
	        	}else if($("input[name=show2]:checked").val() == "2"){
	        		$('.a').css('display','none');
	            	$('.b').css('display','block');
	            	$('.c').css('display','none');
		        }else if($("input[name=show2]:checked").val() == "3"){
	        		$('.a').css('display','none');
	            	$('.b').css('display','none');
	            	$('.c').css('display','block');
		        }
		    });
		});

	
	</script>
	<style>

	.msgTitleImg{
				background: #757F8A; 
				background: -webkit-linear-gradient(to bottom, #757F8A, #D7DDE8);
				background: linear-gradient(to bottom, #757F8A, #D7DDE8); 
		 		width:100%;
		 		height: 180px;
		 		border:solid 1px;
			}
	.msgTitleContent{
		font-size:35px;
		color:black;
		margin-left: 130px;
		margin-top:40px;
		width: 100%;
	}

.main input[type=radio] {
	display: none;
	margin-left:20px;
}
#tab-1:checked ~ .tab label:nth-child(1),
#tab-2:checked ~ .tab label:nth-child(2) {
	background-color: white;
 	box-shadow: none;
 	border-top:solid 1px;
 	border-left:solid 1px;
 	border-right:solid 1px;
}
#tb-1:checked ~ .tb label:nth-child(1),
#tb-2:checked ~ .tb label:nth-child(2),
#tb-3:checked ~ .tb label:nth-child(3) {
	background-color:#d5d5d5;
	color:blue;
	box-shadow: none;
}
#tb2-1:hover{
	 background-color:#d5d5d5;
}
#tb2-1:checked ,
#tb2-2:checked ,
#tb2-3:checked {
	background-color:#d5d5d5;
	color:blue;
	box-shadow: none;
}
.content > div {
	display: none;
}
.content2 > span {
	display: none;
}
#tab-1:checked ~ .content div:nth-child(1),
#tab-2:checked ~ .content div:nth-child(2) {
	display: block;
}
#tb-1:checked ~ .content2 span:nth-child(1),
#tb-2:checked ~ .content2 span:nth-child(2),
#tb-3:checked ~ .content2 span:nth-child(3){
	display: block;
}

.main {
  margin: 0 auto;
  width:100%;
}
.tab {
  overflow: auto;

}
.tb{
	overflow:auto;
}
.tab label {
    font-size: 18px;
    cursor: pointer;
    float: left;
    width: 25%;
    text-align: center;
    padding: 15px 0;
    text-transform: uppercase;
    font-weight: bold;
    letter-spacing: 2px;
    user-select: none;
    -webkit-user-select: none;
}
.tb label {
	margin-right:12px;
	padding-bottom:5px;
	padding-top:5px;
	height:30px;
    font-size: 14px;
    cursor: pointer;
    float: left;
    width: 100px;
    text-align: center;
    text-transform: uppercase;
    font-weight: bold;
    letter-spacing: 2px;
    user-select: none;
    -webkit-user-select: none;
}
.content3-dis input[type=radio]~ label{
	margin-right:12px;
	padding-bottom:5px;
	padding-top:5px;
	height:30px;
    font-size: 14px;
    cursor: pointer;
    float: left;
    width: 100px;
    text-align: center;
    text-transform: uppercase;
    font-weight: bold;
    letter-spacing: 2px;
    user-select: none;
    -webkit-user-select: none;
}
.tb label:hover{
	background: #d5d5d5;
}

.content {
  background-color: white;
  min-height: 350px;
}
.content2{
	min-height:350px;
}
.a , .b, .c {
	min-height: 350px;
}
.content > div{
   padding: 30px;
   line-height: 1.5;
   font-size: 17px;
}
.content2 > span{
	padding:30px;
	line-height: 1.5;
	font-size:14px;
}
.a , .b , .c {
	padding:30px;
	line-height: 1.5;
	font-size:14px;
}
.content3-dis label:hover{
	background: #d5d5d5;
}
.content3-dis input[type=radio]:checked+label{
	background-color:#d5d5d5;
	color:blue;
	box-shadow: none;
}
</style>

</head>
<body class="align-column">

	<header class="main-row"> 
		<div class="header-row" style="height:100px">
			<div class="header-left">
				<a href="${root}/member/myPage"><img src="${pageContext.request.contextPath}/image/back.svg" width="25" height="25" style="margin-top: 20px;"></a>
			</div>
			<div class="header-center">
				<a class="header-center-link" href="${root}/">FüN_ding</a>
			</div>
			<div class="header-right">
				<img src="${root}/image/search.svg" width="20" height="20">
				<c:choose>
					<c:when test="${isLogin}">
						<a class="header-link" href="${root}/member/logout" style="width: 95px; text-align: center;">로그아웃</a>
						<a class="header-link" href="#" style="margin: 0 10px;">5000p</a>
						<a href="${root}/member/myPage"><img src="${root}/image/user-in.svg" width="25" height="25"></a>
					</c:when>
					<c:otherwise>
						<a class="header-link" href="${root}/member/login" style="width: 120px; margin: 0 35px;">로그인/회원가입</a>
						<a href="${root}/member/myPage"><img src="${root}/image/user-out.svg" width="25" height="25" ></a>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</header>
	<section class="main">
		<div class="msgTitleImg" >
			<div class="msgTitleContent" >메시지</div>
		</div>
		<div style="margin-top: -55px; margin-left:80px;">
			<input type="radio" id="tab-1" name="show"   checked>
	 		<input type="radio" id="tab-2" name="show" >
	 		<div class="tab" >
	    		<label for="tab-1" >후원/문의한 프로젝트</label>
	    		<label for="tab-2" >만든 프로젝트</label>
	    	</div>
	    	<div class="content">
	    		<div class="content-dis">
	     			 <input type="radio" id="tb-1" name="show1"checked>
	     			 <input type="radio" id="tb-2" name="show1">
	     			 <input type="radio" id="tb-3" name="show1">
	     			 <div class="tb">
	     			 	<label for="tb-1">모든 메시지</label>
	     			 	<label for="tb-2">발신 메시지</label>
	     			 	<label for="tb-3">수신 메시지</label>
	     			 </div>
	     			 <div class="content2">
	     				<span class="content2-dis">
		    					흠흠
	     			 	</span>
	     			 	
	     			 	<span class="content2-dis">
	     			 	발신 메시지 내용모든 메시지모든 메시지모든 메시지모든 메시지모든 메시지
	     			 	</span>
	     			 	<span class="content2-dis">
	     			 	수신 메시지 내용모든 메시지모든 메시지모든 메시지모든 메시지모든 메시지
	     			 	</span>
	     			 </div>
	    		</div>
	    		<div class="content3-dis">
	      			 <input type="radio" id="tb2-1" name="show2" value="1" checked><label for="tb2-1" >모든 메시지</label>
	     			 <input type="radio" id="tb2-2" name="show2" value="2"><label for="tb2-2" >발신 메시지</label>
	     			 <input type="radio" id="tb2-3" name="show2" value="3"><label for="tb2-3">수신 메시지</label>
    			</div>
    			<div class="a">a의영역</div>
    			<div class="b" style="display:none">b의영역</div>
    			<div class="c" style="display:none">c의영역</div>
    			
    		</div>
    	</div>
	</section>

		<footer class="main-row topLine">
			<div class="footer-row">
				<p style="color: black; font-size: 12px; margin-bottom: 10px">
					상호:FUN_ding | 사업장소재지:서울특별시 영등포구 | 안내전화:1588-XXXX | 대표이사:이창엽 |
					제휴/광고문의:soo4767@naver.com | 사업자등록번호:XXX-XX-XXXXX <br> 통신판매업
					신고번호:XXXX-서울영등포구-XXXX
				</p>
				<br>
				<p style="color: black; font-size: 12px; text-align: right;">&copy; 2021 FUN_ding ,.</p>
			</div>
		</footer>
		
		<div class="footer-notice">
			<p style="color: #fff; font-size: 12px; padding: 0 40px;">
				FUN_ding은 플랫폼 제공자로서 프로젝트의 당사자가 아니며, 직접적인 통신판매를 진행하지 않습니다. 프로젝트의 완수 및 선물제공의 책임은 해당 프로젝트의 창작자에게 있으며, 프로젝트와 관련하여 후원자와 발생하는 법적 분쟁에 대한 책임은 해당 창작자가 부담합니다.
			</p>
		</div>
	
</body>
</html>