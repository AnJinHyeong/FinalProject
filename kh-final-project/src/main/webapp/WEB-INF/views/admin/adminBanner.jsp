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
		
		<%-- 	<a href="${root}/banner/bannerList">배너 목록</a> --%>
		
		<div class="admin-home_content_area">
			<div class="admin-home_content100" style="min-height: 400px; max-height: 400px; padding: 10px;">
				<div style="width: 15%; border-bottom: 1px solid rgba(0,0,0,0.2); padding: 0 0 5px 5px;">
					<p class="admin-home-content-p">배너 목록</p>
				</div>
				<div class="admin-project-div2">
				
				
					<table>
						<thead>
							<tr>
								<th>배너번호</th>
								<th>배너타이틀</th>
								<th>배너내용</th>
								<th>배너 배경색</th>
								<th>배너 글씨색</th>
								<th>배너이미지번호</th>
								<th>삭제</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="bannerVo" items="${bannerList}">
								<tr>
									<td>${bannerVo.bannerNo}</td>
									<td>${bannerVo.bannerTitle}</td>
									<td>${bannerVo.bannerContent}</td>
									<td>${bannerVo.bannerBackgroundColor}</td>
									<td>${bannerVo.bannerColor}</td>
									<td>${bannerVo.bannerImageNo}</td>
									<td>
										<form action="${root}/banner/bannerDelete">
											<input type="hidden" name="bannerNo" value="${bannerVo.bannerNo}">
											<input type="hidden" name="bannerImageNo" value="${bannerVo.bannerImageNo}">
											<input type="submit" value="삭제">
										</form>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					
					
				</div>
			</div>
		</div>
		
		<div class="admin-home_chart_area">
			<div class="admin-home_content100" style="min-height: 100%; padding: 15px 0;">
				<div style="width: 100%; border-bottom: 1px solid rgba(0,0,0,0.2); padding: 0 0 5px 5px;">
					<p class="admin-home-content-p">상세 페이지</p>
				</div>
			</div>
		</div>
	</section>
</body>
</html>