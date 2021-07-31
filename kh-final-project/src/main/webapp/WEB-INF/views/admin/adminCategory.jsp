<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>

<jsp:include page="/WEB-INF/views/template/adminSidebar.jsp"></jsp:include>

<script>
	$(function() {
		var projectCountByCategoryNo;

		$(".updateCategory").on("submit", function(e) {
			e.preventDefault();
			var deleteOk = confirm("카테고리를 승인하시겠습니까?");
			if (deleteOk) {
				this.submit();
			}
		});

		$(".deleteCategory").on("submit", function(e) {
			e.preventDefault();
			var deleteOk = confirm("카테고리를 지우시겠습니까?");

			if (deleteOk) {

				var categoryNo = $(this).find("input[name=categoryNo]").val();

				$.ajax({
					context : this,
					url : "${pageContext.request.contextPath}/project/data/getProjectByCategoryNo",
					type : "post",
					data : {
						categoryNo : categoryNo
					},
					success : function(resp) {
						if (resp.length == 0) {
							this.submit();
						} else {
							alert("관련된 프로젝트가 존재합니다.");
						}
					}
				})

			}
		});

		$(".target").on("click", function() {
			var categoryNo = $(this).children(".categoryNo").text();
		});

		$(".admin-home-content-list").on("click", function() {
			$(".admin-home-content-list").removeClass("on");
			$(this).addClass("on");
		});

	});
</script>

<section>
	<div class="admin-home_content_area">
		<div class="admin-home_content100">
			<p class="admin-home-top-p">카테고리 관리</p>
		</div>
	</div>

	<div class="admin-home_content_area" style="height: 450px;">
		<div class="admin-home_content100" style="border: none; padding: 10px;">
			<div style="width: 100%; border-bottom: 1px solid rgba(0, 0, 0, 0.2); padding: 0 0 5px 5px;">
				<p class="admin-home-content-p">카테고리 목록</p>
			</div>
			<div class="admin-project-div2">

				<div class="admin-home-content-list">
					<span style="width: 10%;">카테고리 번호</span> <span style="width: 30%;">카테고리 이틀</span> <span style="width: 30%;">상위 카테고리</span> <span
						style="width: 20%;"
					>카테고리 승인여부</span> <span style="width: 10%;">삭제/승인</span>
				</div>

				<div class="admin-home-content-list-div" style="height: 280px;">
					<c:forEach var="categoryDto" items="${categoryList}">
						<div class="admin-home-content-list target">
							<span class="categoryNo" style="width: 10%;">${categoryDto.categoryNo}</span> <span class="categoryTheme" style="width: 30%;">${categoryDto.categoryTheme}</span>
							<span class="categorySuper" style="width: 30%;">${categoryDto.categorySuperTheme}</span> <span class="categoryApprove" style="width: 20%;">${categoryDto.categoryApprove}</span>
							<div style="width: 10%; display: flex;">
								<form action="${root}/category/categoryDelete" class="deleteCategory" style="margin-right: 10px;">
									<input type="hidden" name="categoryNo" value="${categoryDto.categoryNo}"> <input class="admin-btn" type="submit" value="삭제">
								</form>
								<c:if test="${categoryDto.categoryApprove == null}">
									<form action="${root}/category/categorySetApproveY" class="updateCategory">
										<input type="hidden" name="categoryNo" value="${categoryDto.categoryNo}"> <input class="admin-btn" type="submit" value="승인">
									</form>
								</c:if>
							</div>
						</div>
					</c:forEach>
				</div>

				<div class="admin-home-content-list">
					<div id="insertCategoryForm" style="width: 100%; height: 60px;" class="admin-home-content-list-div">
						<form action="${root}/category/categoryInsert" method="post" style="display: flex;">
							<span style="width: 10%;">카테고리 등록</span> <input class="admin-inputBox" style="width: 30%; margin-right: 20px; height: 30px;" type="text"
								name="categoryTheme" placeholder="카테고리 이름" required autocomplete="off"
							> <select class="admin-inputBox" style="width: 30%; margin-right: 20px; height: 30px;" name="categorySuper">
								<option></option>
								<c:forEach var="categoryDto" items="${categoryList}">
									<option value="${categoryDto.categoryNo}">${categoryDto.categoryTheme}
								</c:forEach>
							</select> <input class="admin-inputBox" style="width: 20%; margin-right: 20px; height: 30px;" type="text" name="categoryApprove" readonly="readonly"
								value="Y"
							> <input style="width: 10%; margin-right: 20px; height: 30px;" type="submit" value="등록" class="admin-btn">
						</form>
					</div>
				</div>

			</div>
		</div>
	</div>

	<div class="admin-home_content_area" style="height: 400px;">
		<div class="admin-home_content100" style="border: none; padding: 10px;">

			<div style="width: 100%; border-bottom: 1px solid rgba(0, 0, 0, 0.2); padding: 0 0 5px 5px; margin-bottom: 10px;">
				<p class="admin-home-content-p">관련 프로젝트</p>
			</div>
			<div class="admin-project-div2" style="display: flex; justify-content: center;">

				<div style="width: 800px; height: 450px;"></div>

				<div id="mainBannerTextContainer"
					style="width: 400px; height: 450px; padding-top: 100px; padding-left: 30px; padding-right: 30px; border: 1px solid rgb(220, 220, 220);"
				>

					<div class="mb20 h80">
						<span id="mainBannerTitle" style="font-size: 30px; font-weight: bold"></span>
					</div>
					<div class="mb50 h80">
						<span id="mainBannerContent" style="font-size: 12px;"></span>
					</div>

				</div>

			</div>

		</div>
	</div>

</section>
</body>
</html>