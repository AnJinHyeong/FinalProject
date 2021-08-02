<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

 <jsp:include page="/WEB-INF/views/template/adminSidebar.jsp"></jsp:include>
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
		
		 $(".w1200 h35").css("margin", "0");
		

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
 <style>
 

 .admin-home_content100{
	width:98%;
	border: none;
	    border-bottom: 1px solid rgba(0,0,0,0.2);
	background-color: white;
	padding: 15px 5px;
	height: 70px;
}
 
 .admin-home-top-p {
    font-size: 24px;
    color: #5b5b5b;
}
 
 .w1200 {
 width:0px;
    padding-left: 20px;

}
 
 
element.style {
    margin: 1px;
}

 </style>
 
 
<body>

	<section class="main-row topLine" >

 

	<div class="admin-home_content_area">
		<div class="admin-home_content100">
			<p class="admin-home-top-p">메세지	 조회</p>
		</div>
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
		
			<div>
				<form action="" method="post">
					<input type="text" name="keyword">
					<input type="submit" value="검색">
				</form>
			</div>
		
		
		
			<div>
				<c:forEach var="msgVo" items="${msgVoList}">
					<div>
						<span>${msgVo.msgNo}</span>
						<span>${msgVo.senderNick}</span>
						<span>${msgVo.msgTitle}</span>
						<span>${msgVo.receiverNick}</span>
						<span>${msgVo.msgDate}</span>
						
						<c:if test="${msgVo.receiverNo == 1}">
							<span>관리자한테 온 메시지 : ${msgVo.msgContent}</span>
						</c:if>
					</div>
				</c:forEach>
			</div>
			
			
			
			
			
			
			
				<div id="msgList" class="a" style="display:none;">

			<c:choose>

				<c:when test="${isMsg}">
					<div class="w100p pb10 mt20" style="text-align:center;"><i class="fas fa-envelope" style="width:20px;heigth:20px;"></i></div>
					<div class="w100p pb10 mt10" style="text-align:center;">새로운 메시지가 없습니다.</div>
				</c:when>
				<c:otherwise>
				<c:forEach var="messageDto" items="${messageDto}">
				
			<div class="admin-project-div2" style="display: inline;">
				<div class="admin-home-content-list"
					style="text-align: center; width: 99%;">
					<span style="width: 33%;">메세지 제목</span> 
					<span style="width: 33%;">보내는 사람</span>
					<span style="width: 33%;">내용</span> 
				</div>
				</div>
				
								<div class="admin-home-content-list-div" style="height: 300px;"
					id="projectSearchDiv">
										<div class="projectInsert3 w80p pb30">
																<button class="btn btn-hover w100p h80 msgBtn"> 		 

						<div class="admin-home-content-list div-select" style="text-align: center;" id="{{projectNo}}">
							<span style="width: 10%;">${messageDto.msgTitle}</span>
							 <span style="width: 10%;">${messageDto.receiverNo}</span>
							  <span style="width: 10%;">${fn:substring(messageDto.msgContent,0,5)}</span> 	

							  							</div>
							  								<div class="dpNone msgNo" >${messageDto.msgNo}</div>
						</button>				
						</div>
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
		<div class="container-300 h700 mt30 mb30 boc200 bosSolid bow1 bora5 p30 target" id="msgSummarize"></div>
	</div>
	</section>
</body>
</html>