<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>

<jsp:include page="/WEB-INF/views/template/adminSidebar.jsp">
	<jsp:param value="${root}/css/adminPage2.css" name="adminPage"/>
</jsp:include>

	<section>
		<div class="admin-home_content_area">
			<div class="admin-home_content100">
				<p class="admin-home-top-p">배너 관리</p>
			</div>
		</div>
		
		<div class="admin-home_content_area" style="height: 400px;">
			<div class="admin-home_content100" style="border: none; padding: 10px;">
				<div style="width: 15%; border-bottom: 1px solid rgba(0,0,0,0.2); padding: 0 0 5px 5px;">
					<p class="admin-home-content-p">배너 목록</p>
				</div>
				<div class="admin-project-div2">
				
					<div class="admin-home-content-list">
						<span style="width: 6%;">배너번호</span>
						<span style="width: 24%;">배너타이틀</span>
						<span style="width: 40%;">배너내용</span>
						<span style="width: 8%;">배너배경색</span>
						<span style="width: 8%;">배너글씨색</span>
						<span style="width: 10%;">배너이미지번호</span>
						<span style="width: 4%;">삭제</span>
					</div>
					
					<div class="admin-home-content-list-div" style="height: 300px;">
						<c:forEach var="bannerVo" items="${bannerList}">
							<div class="admin-home-content-list">
								<span style="width: 6%;">${bannerVo.bannerNo}</span>
								<span style="width: 24%;">${bannerVo.bannerTitle}</span>
								<span style="width: 40%;">${bannerVo.bannerContent}</span>
								<span style="width: 8%;">${bannerVo.bannerBackgroundColor}</span>
								<span style="width: 8%;">${bannerVo.bannerColor}</span>
								<span style="width: 10%;">${bannerVo.bannerImageNo}</span>
								<div style="width: 4%;">
									<form action="${root}/banner/bannerDelete">
										<input type="hidden" name="bannerNo" value="${bannerVo.bannerNo}">
										<input type="hidden" name="bannerImageNo" value="${bannerVo.bannerImageNo}">
										<input class="admin-btn" type="submit" value="삭제">
									</form>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
		
		<div class="admin-home_content_area" style="height: 400px;">
			<div class="admin-home_content100" style="border: none; padding: 10px;">
				<div style="width: 15%; border-bottom: 1px solid rgba(0,0,0,0.2); padding: 0 0 5px 5px;">
					<p class="admin-home-content-p">배너 상세 보기</p>
				</div>
				<div class="admin-project-div2">
				
					<div class="admin-home-content-list">
						<span style="width: 6%;">배너번호</span>
						<span style="width: 24%;">배너타이틀</span>
						<span style="width: 40%;">배너내용</span>
						<span style="width: 8%;">배너배경색</span>
						<span style="width: 8%;">배너글씨색</span>
						<span style="width: 10%;">배너이미지번호</span>
						<span style="width: 4%;">삭제</span>
					</div>
					
					<div class="admin-home-content-list-div" style="height: 300px;">
						<c:forEach var="bannerVo" items="${bannerList}">
							<div class="admin-home-content-list">
								<span style="width: 6%;">${bannerVo.bannerNo}</span>
								<span style="width: 24%;">${bannerVo.bannerTitle}</span>
								<span style="width: 40%;">${bannerVo.bannerContent}</span>
								<span style="width: 8%;">${bannerVo.bannerBackgroundColor}</span>
								<span style="width: 8%;">${bannerVo.bannerColor}</span>
								<span style="width: 10%;">${bannerVo.bannerImageNo}</span>
								<div style="width: 4%;">
									<form action="${root}/banner/bannerDelete">
										<input type="hidden" name="bannerNo" value="${bannerVo.bannerNo}">
										<input type="hidden" name="bannerImageNo" value="${bannerVo.bannerImageNo}">
										<input type="submit" value="삭제">
									</form>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
		
	</section>
</body>
</html>