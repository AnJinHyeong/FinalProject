<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>

<jsp:include page="/WEB-INF/views/project/projectHeader.jsp">
	<jsp:param value="${root}/project/projectMainGift" name="division"/>
</jsp:include>

<section class="main-row topLine">

	<div class="bottomLine project-main-header4" style="position: fixed;">
		<div class="container-1200 h35 mCenter">
			<ul class="project-main-ul">
				<li class="project-main-li2"><a href="${root}/project/projectMainGift" class="main-li-a">
				<i class="fas fa-gift mr5"></i> 선물</a></li>
				<li class="project-main-li2"><a href="${root}/project/projectMainGiftItem" class="main-li-a">
				<i class="fas fa-list mr5"></i> 아이템</a></li>
			</ul>
		</div>
	</div>
	
	<div class="project-back-color" style="height: 1900px;">
		
		<div class="section-row" style=" padding-top: 10px;">
			
			<form action="?" method="post">
			
			<div class="project-insert-div" style="height: 300px;">
				<dl class="project-insert-dl">
					<dt class="project-insert-dt">
						내가 만든 아이템 <span id="itemCount">0</span>
					</dt>
					<div class="project-insert-funding-div">
						<div>
							<p style="padding-left: 14px; margin-bottom: 5px;">만든 아이템이 없습니다</p>
						</div>
					</div>
				</dl>
				<div class="projcet-insert-div2">
					<div>
						<p class="project-insert-p">아이템 만들기</p>
						<input type="text" class="projcet-insert-input">
					</div>
				</div>
			</div>
			
			<div class="project-insert-div3">
				<input class="project-btn btn3 project-btn-hover" type="submit" value="저장">
			</div>
			
			</form>
			
		</div>
		
		
		
	</div>

</section>



</body>
</html>