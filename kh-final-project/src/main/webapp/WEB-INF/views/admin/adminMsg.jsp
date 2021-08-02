<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

 
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<c:set var="isLogin" value="${not empty memberNo}"></c:set>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>

<c:set var="isMsg" value="${empty messageDto}"></c:set>

 

<c:set var="isMsg2" value="${empty messageDto2}"></c:set>

 

<c:set var="isMsg3" value="${empty messageDto3}"></c:set>

  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FüN‿ding - ADMIN</title>
    <link rel="stylesheet" type="text/css" href="${root}/css/template.css">
	<link rel="stylesheet" type="text/css" href="${root}/css/common.css">
	<link rel="stylesheet" type="text/css" href="${root}/css/project.css">
	<link rel="stylesheet" type="text/css" href="${root}/css/yb.css">
	<link rel="stylesheet" type="text/css" href="${root}/css/yongbo.css">
	<link rel="stylesheet" type="text/css" href="${root}/css/projectBoard.css">
	<link rel="stylesheet" type="text/css" href="${root}/css/templateSection.css">
	<link rel="stylesheet" type="text/css" href="${root}/css/requestBoard.css">
    <link rel="stylesheet" type="text/css" href="${root}/css/adminPage.css">
	
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>

	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
    
</head>
<script>

	$(function(){

		

		$(".project-main-li").on("click", function() {

			$(".project-main-li").removeClass("main-li-on");

			$(this).addClass("main-li-on");

		});

		$(".ab").on("click",function(){

			$('.a').css('display','block');

 

           	$('.b').css('display','none');

 

           	$('.c').css('display','none');

 

		});

		$(".bc").on("click",function(){

			$('.a').css('display','none');

 

           	$('.b').css('display','block');

 

           	$('.c').css('display','none');

 

		});

		$(".cd").on("click",function(){

			$('.a').css('display','none');

 

           	$('.b').css('display','none');

 

           	$('.c').css('display','block');

 

		});
		
		function replaceMsgSummarizeTemplate(resp) {

			var template = $("#msgSummarizeTemplate").html();

 			template = template.replace("{{msgNo}}",resp.msgNo);

			template = template.replace("{{msgTitle}}", resp.msgTitle);

			template = template.replace("{{msgDate}}", resp.msgDate);

			template = template.replace("{{receiverNo}}", resp.receiverNo);

			template = template.replace("{{msgContent}}", resp.msgContent);

			template = template.replace("{{senderNo}}", resp.senderNo);

			

			

			$("#msgSummarize").append(template);

		}

		 

		$(".msgBtn").on("click", function() {

			$("#msgSummarize").empty();

			var msgNo = $(this).find(".msgNo").text();
			

			$.ajax({

				url : "${pageContext.request.contextPath}/member/data/msgInformation",

				type : 'post',

				data : {

					"msgNo" : msgNo

				},

				success : function(resp) {

					replaceMsgSummarizeTemplate(resp);

					
					
					

				} 

			});	

	});
		
		
	});
	</script>
	<script id="msgSummarizeTemplate" type="text/template"> 
 
 
	
 	<div class="h500">
 
 

 		<div class="h200"> 

			<pre class="msgNo" name="msgNo">{{msgNo}}</pre>

 			<pre class="wordBreak preWrap fs18 fBold h80">{{msgTitle}}</pre> 

 

			<pre class="fs12 fBold mb30 taRight">날짜 : {{msgDate}}</pre> 
 
		

			

 

		<pre class="fs12 fBold mb10">보내는 사람 : {{receiverNo}}</pre> 

			<pre class="fs12 fBold mb10">받는 사람 : {{senderNo}}</pre> 

 

 			<pre class="fs12 fBold mb10">문의 내용</pre> 

 

 		</div>		

 

 		<div class="bac250 boc220 bosSolid bow1 w100p h270 p20 scrollThin"> 

			

 			<pre class="fs12 fBold mb10 ml10">{{msgContent}}</pre> 

			

				

 			</div>

 		</div> 

 

 	 

	  

 	<div class="h100">

		
			
 			<button class="w100p project-btn btn3 project-btn-hover" onclick="showMsg()"><i class="far fa-envelope"></i>문의 답글 보내기</button>
 			<button class="w100p project-btn btn3 project-btn-hover" onclick="showMsg()">메시지 삭제</button>
			
 			

 	</div> 
	
	
 

 </script>  
<body>
	<aside>
		<div class="admin-logo"><a href="#">FüN‿ding</a></div>
		<ul>
			<li class="admin-aside-top_menu"><span class="">회원</span>
				<ul class="admin-aside-side_menus">
					<li><a href="#">회원</a></li>
					<li><a href="#">회원</a></li>
				</ul>
			</li>
			<li class="admin-aside-top_menu"><span class=""></span>
				<ul class="admin-aside-side_menus">
					<li><a href="#">메인 페이지</a></li>
				</ul>
			</li>
		</ul>
	</aside>

	<section class="main-row topLine" >

 

	<div class="container-1200 mt30 poRelative">

		<p class="fs34 pl20">

			<strong><i class="far fa-envelope"></i>메시지</strong>

		</p>

	</div>

 

	<div class="mt30 bottomLine poRelative">

		<div class="w1200 h35" style="margin: 0 auto;"> 

			<ul class="project-main-ul" style="margin-left:10px;">

				<li class="project-main-li main-li-on ab"><a class="main-li-a cursorPointer"><i class="far fa-envelope"></i>&nbsp;전체 메시지함</a></li>

				<li class="project-main-li bc"><a class="main-li-a cursorPointer"><i class="far fa-envelope"></i>&nbsp;수신 메시지함</a></li>

				<li class="project-main-li cd"><a class="main-li-a cursorPointer"><i class="far fa-envelope"></i>&nbsp;발신 메시지함</a></li>

			</ul>

		</div>

	</div>
	
	<div class="container-1400 dpFlex pl100 pr100">

 

		<div class="container-800 hMax600 mt30 mb30 scrollThin">

				<div id="msgList" class="a" style="display:none;">

			<c:choose>

				<c:when test="${isMsg}">

					<div class="w100p pb10 mt20" style="text-align:center;"><i class="fas fa-envelope" style="width:20px;heigth:20px;"></i></div>

					<div class="w100p pb10 mt10" style="text-align:center;">새로운 메시지가 없습니다.</div>

				</c:when>

				<c:otherwise>

				<c:forEach var="messageDto" items="${messageDto}">

 

					<div class="projectInsert3 w80p pb30">

						<button class="btn btn-hover w100p h80 msgBtn"> 

						 
							<table>
							<tr>
							
							<td width="90px"  style="margin-top:60px; text-align:center;" class="msgTitle">${messageDto.msgTitle}</td>

						
							<td width="90px"  style="margin-top:40px; margin-left:50px;" class="receiverNo">${messageDto.receiverNo}</td>

							<td width="90px"  style="margin-top:40px; margin-left:50px;">${fn:substring(messageDto.msgContent,0,5)}</td>
							</tr>
							</table>
							<div class="dpNone msgNo" >${messageDto.msgNo}</div>
						</button>
						


						 

					</div>  

 

				</c:forEach> 

				</c:otherwise>

			</c:choose>

				</div>

			

			<div id="msgList2" class="b" style="display:none;">

			<c:choose>

				<c:when test="${isMsg2}">

				<div class="w100p pb10 mt20" style="text-align:center;"><i class="fas fa-envelope" style="width:20px;heigth:20px;"></i></div>

					<div class="w100p pb10 mt10" style="text-align:center;">새로운 메시지가 없습니다.</div>

				</c:when>

				<c:otherwise>

				<c:forEach var="messageDto2" items="${messageDto2}">

				

					<div class="projectInsert3 w80p pb30">

						<button class="btn btn-hover w100p h80 msgBtn"> 

							
							<table>
							<tr>
							<td width="90px"  style="margin-top:40px;" class="msgTitle">${messageDto2.msgTitle}</td>

							<td width="90px"  style="margin-top:40px; margin-left:50px;" class="receiverNo">${messageDto2.receiverNo}</td>

							<td width="90px"  style="margin-top:40px; margin-left:50px;">${fn:substring(messageDto2.msgContent,0,5)}</td>

							</tr>
							</table>

							<div class="dpNone msgNo" >${messageDto2.msgNo}</div>

						</button>

					</div>

 

				</c:forEach> 

				</c:otherwise>

			</c:choose>

			</div>

			

			<div id="msgList3" class="c" style="display:none;">

			<c:choose>

			<c:when test="${isMsg3}">

			<div class="w100p pb10 mt20" style="text-align:center;"><i class="fas fa-envelope" style="width:20px;heigth:20px;"></i></div>

					<div class="w100p pb10 mt10" style="text-align:center;">새로운 메시지가 없습니다.</div>

			</c:when>

			<c:otherwise>

				<c:forEach var="messageDto3" items="${messageDto3}">

					<div class="projectInsert3 w80p pb30">

						<button class="btn btn-hover w100p h80 msgBtn"> 

						

							<table>
							<tr>
							<td width="90px"  style="margin-top:40px;" class="msgTitle">${messageDto3.msgTitle}</td>

							<td width="90px"  style="margin-top:40px; margin-left:50px;" class="receiverNo">${messageDto3.receiverNo}</td>

							<td width="90px"  style="margin-top:40px; margin-left:50px;">${fn:substring(messageDto3.msgContent,0,5)}</td>

							</tr>
							</table>
							<div class="dpNone msgNo" >${messageDto3.msgNo}</div>

						</button>

					</div>

 

				</c:forEach> 

				</c:otherwise>

			</c:choose>

			</div>

 

		</div>
		<div class="container-300 h700 mt30 mb30 boc200 bosSolid bow1 bora5 p30" id="msgSummarize"></div>
	</div>
	</section>
</body>
</html>