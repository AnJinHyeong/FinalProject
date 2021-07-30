<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

 

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="isMsg" value="${empty messageDto}"></c:set>

<c:set var="isMsg2" value="${empty messageDto2}"></c:set>

<c:set var="isMsg3" value="${empty messageDto3}"></c:set>

<c:set var="root" value="${pageContext.request.contextPath}"></c:set>

 

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

 

<script>

$(document).ready(function(){

	 

  	 // 라디오버튼 클릭시 이벤트 발생

   	$("input:radio[name=show2]").click(function(){

 

       	if($("input[name=show2]:checked").val() == "1"){

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

.a , .b, .c {

	min-height:350px;

}
.content3-dis {
	margin-bottom: 10px;
	width:100%;
	min-height:100px;

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

.content3-dis label:hover{

	background: #d5d5d5;

}

.content3-dis input[type=radio]:checked+label{

	background-color:#d5d5d5;

	color:blue;

	box-shadow: none;

}

 input[type=radio] { 

 	display: none; 

 	margin-left:20px; 

} 

.aBtn:hover,.bBtn:hover,.cBtn:hover{
	background-color:white;
}
</style>

 

 

 

 

 

<section class="main-row topLine" style="min-height:1000px;">

 

	<div class="container-1200 mt30 poRelative">

		<p class="fs34 pl20">

			<strong><i class="fas fa-envelope">&nbsp;메시지</i></strong>
 
		</p>

	</div> 

 

	<div class="mt30 bottomLine poRelative">

		<div class="w1200 h35" style="margin: 0 auto;">

			<ul class="project-main-ul">

				<li class="project-main-li"><a class="main-li-a cursorPointer" href="${pageContext.request.contextPath}/member/myMsg">사용자 문의함</a></li>

				<li class="project-main-li main-li-on"><a class="main-li-a cursorPointer " href="${pageContext.request.contextPath}/member/myMsg2">관리자 문의함</a></li>

			</ul>

		</div>

	</div> 

 

	<div class="container-1400 pl50 pr50 mt30" > 



				<div class="content3-dis">

	      			 <input type="radio" id="tb2-1" name="show2" value="1" checked><label for="tb2-1"  style="width:140px;"><i class="fas fa-envelope"></i>모든 메시지</label>

	     			 <input type="radio" id="tb2-2" name="show2" value="2" ><label for="tb2-2"  style="width:140px;"><i class="fas fa-envelope"></i>발신 메시지</label>

	     			 <input type="radio" id="tb2-3" name="show2" value="3"><label for="tb2-3" style="width:140px;"><i class="fas fa-envelope"></i>수신 메시지</label>

				</div>	


 
				<div class="a" style="display:none">	

					<c:choose>

						<c:when test="${isMsg3}">

							<div class="w100p pb10 mt20" style="text-align:center;"><i class="fas fa-envelope" style="width:20px;heigth:20px;"></i></div>
							<div class="w100p pb10 mt10" style="text-align:center;">새로운 메시지가 없습니다.</div>
							<div class="w100p pb10 mt10" style="text-align:center;color:gray;">프로젝트 페이지에서 '문의하기' 버튼을 눌러 메시지를 보낼 수 있습니다.</div>
						</c:when>

						<c:otherwise>

							<div class="w200p pb30 mt10;">

								<c:forEach var="messageDto3" items="${messageDto3}">

										<div style="padding:10px;">
										<button style="width:400px; min-height:60px;background-color:#F0F0F0;" class="aBtn">
											<div class="float-container" style="border-bottom:solid 1px #3d3d3d; padding:20px;">
												<div class="left" style="margin-left:10px;"><strong>${messageDto3.msgTitle}</strong></div>
		
												<div class="left" style="margin-left:10px;">${messageDto3.msgDate}</div>
		
												<div class="left" style="margin-left:10px;">${messageDto3.receiverNo}</div>
											</div>
										</button>
										<div></div>   

									</div> 

								</c:forEach>

							</div>	

						</c:otherwise>

					</c:choose> 

				</div>

				<div class="b" style="display:none;" >

					<div>	 

					<c:choose>

						<c:when test="${isMsg}">

							<div class="w100p pb10 mt20" style="text-align:center;"><i class="fas fa-envelope" style="width:20px;heigth:20px;"></i></div>
							<div class="w100p pb10 mt10" style="text-align:center;">새로운 메시지가 없습니다.</div>
							<div class="w100p pb10 mt10" style="text-align:center;color:gray;">프로젝트 페이지에서 '문의하기' 버튼을 눌러 메시지를 보낼 수 있습니다.</div>
						</c:when>

						<c:otherwise>



								<c:forEach var="messageDto" items="${messageDto}">
								
									<div style="padding:10px;">
									<button style="width:400px;min-height:60px; background-color:#F0F0F0;" class="bBtn">	

										<div class="float-container" style="border-bottom:solid 1px #3d3d3d; padding:20px;">

										<div class="left" style="margin-left:10px;"><strong>${messageDto.msgTitle}</strong></div>

										<div class="left" style="margin-left:10px;">${messageDto.msgDate}</div>

										<div class="left" style="margin-left:10px;">${messageDto.receiverNo}</div>   

									   </div>

									</button> 
									</div>
								</c:forEach>

						

						</c:otherwise>

					</c:choose>

					</div>

				</div>

				<div class="c" style="display:none">	

					<c:choose>

						<c:when test="${isMsg2}">

							<div class="w100p pb10 mt20" style="text-align:center;"><i class="fas fa-envelope" style="width:20px;heigth:20px;"></i></div>
							<div class="w100p pb10 mt10" style="text-align:center;">새로운 메시지가 없습니다.</div>
							<div class="w100p pb10 mt10" style="text-align:center;color:gray;">프로젝트 페이지에서 '문의하기' 버튼을 눌러 메시지를 보낼 수 있습니다.</div>

						</c:when>

						<c:otherwise> 

							<div class="projectInsert3 w100p pb30; mt30">

								<c:forEach var="messageDto2" items="${messageDto2}">
									<div style="padding:10px;">
									<button style="width:400px;min-height:60px; background-color:#F0F0F0;" class="cBtn">	

										<div class="float-container" style="border-bottom:solid 1px #3d3d3d; padding:20px;">

										<div class="left" style="margin-left:10px;">${messageDto2.msgTitle}</div>

										<div class="left" style="margin-left:10px;">${messageDto2.msgDate}</div>

										<div class="left" style="margin-left:10px;"><strong>${messageDto2.receiverNo}</strong></div> 

										</div> 
										</button>
										</div>

								</c:forEach>

							</div>	

						</c:otherwise>

					</c:choose>

					</div>

	  

    			

    		</div>

	

 

</section>

 

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>

  	