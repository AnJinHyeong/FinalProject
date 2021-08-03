<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/adminSidebar.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- 1번 -->
<script id="searchContent" type="text/template">
<div class="admin-home-content-list div-select" style="text-align: center;" id="{{projectNo}}">
	<span style="width: 5%;">{{row.memberNo}}</span>	
	<span style="width: 10%;">{{categoryTheme}}</span>	
	<span style="width: 45%;">{{projectTitle}}</span>
	<span style="width: 10%;">{{projectTargetAmount}}원</span>
	<span style="width: 10%;">{{projectPercent}}%</span>
	<span style="width: 5%;">{{projectState}}</span>
	<span style="width: 5%;">
		<button class="admin-btn updateBtnX" id="{{projectNo}}" style="width: 30px;" >중단</button>
	</span>
	<span style="width: 10%;">
		<button class="admin-btn updateBtn3" id="{{projectNo}}" style="width: 30px; margin-right:5px;" >승인</button>
		<button class="admin-btn updateBtn1" id="{{projectNo}}" style="width: 30px;" >탈락</button>
	</span>
	<span style="width: 10%;"><button class="admin-btn projectPage" style="width: 70px;" id="{{projectNo}}">페이지 이동</button></span>
</div>
</script>
<style>
#flex{
diplay:flex;
margin-top: 30px;
margin-left: 10px;
}


#searchDiv{
display:none;
}


.left {
	padding-left: 10px;
}
</style>
<section>
	<div class="admin-home_content_area">
		<div class="admin-home_content100">
			<p class="admin-home-top-p">회원 조회</p>
		</div>
	</div>
	<div class="admin-home_content_area">
		<div class="admin-home_content100"
			style="height: 85px; padding: 15px 0;">
			<div class="admin-project-div1">
				<p class="admin-home-content-p">조건 검색</p>
			</div>
			<form action="" method="post">
				<div class="admin-project-div2">
					<select class="admin-project-div2-select1" name="searchOption" required style="width: 10%;">
						<option value="all"
							<c:out value = "${map.searchOption == 'all'?'selected' : ' '}"/>>모두</option>
						<option value="member_id"
							<c:out value = "${map.searchOption == 'member_id'?'selected' : ' '}"/>>아이디</option>
						<option value="member_nick"
							<c:out value = "${map.searchOption == 'member_nick'?'selected' : ' '}"/>>닉네임</option>
						<option value="member_email"
							<c:out value = "${map.searchOption == 'member_email'?'selected' : ' '}"/>>이메일</option>
						<option value="member_grade"
							<c:out value = "${map.searchOption == 'member_grade'?'selected' : ' '}"/>>등급</option>
					</select>

					<!-- 					<select class="admin-project-div2-select2" name="projectState" required>
						<option>선택</option>
						<option value="1">프로젝트 기획중 - 1</option>
						<option value="2">프로젝트 심사중 - 2</option>
						<option value="3">프로젝트 펀딩중 - 3</option>
						<option value="4">프로젝트 펀딩종료 - 4</option>
						<option value="x">프로젝트 중단 - x</option>
					</select> -->
					<input class="admin-project-div2-input" type="text" name="keyWord" autocomplete="off" value="${map.keyWord}" placeholder = "검색어를 입력하세요" style="width: 90%;">
					<button class="admin-project-div2-btn">
						<i class="fas fa-search bacWhite"></i>
					</button>
				</div>
			</form>
		</div>
	</div>

	<div class="admin-home_content_area">
		<div class="admin-home_content100"
			style="min-height: 400px; max-height: 400px; padding: 15px 0;">
			<div
				style="width: 100%; border-bottom: 1px solid rgba(0, 0, 0, 0.2); padding: 0 0 5px 5px;">
				<p class="admin-home-content-p">리스트</p>
			</div>

			<div class="admin-project-div2" style="display: inline;">
				<div class="admin-home-content-list"
					style="text-align: center; width: 99%;">
					<span style="width: 10%;">회원번호</span> 
					<span style="width: 10%;">아이디</span>
					<span style="width: 10%;">닉네임</span> 
					<span style="width: 10%;">보유포인트</span>
					<span style="width: 20%;">이메일</span>
					 <span style="width: 10%;">등급</span>
					<span style="width: 30%;">주소</span>
				</div>


				<div class="admin-home-content-list-div" style="height: 300px;"
					id="projectSearchDiv">
					<c:forEach var="row" items="${memberTable}">
						<div class="admin-home-content-list div-select" style="text-align: center;" id="{{projectNo}}">

							<span style="width: 10%;">${row.memberNo}</span>
							 <span style="width: 10%;">${row.memberId}</span>
							  <span style="width: 10%;">${row.memberNick}</span> 
							  <span style="width: 10%;">${row.memberHavePoint}</span> 
							<span style="width: 20%;">${row.memberEmail}</span> 
							<span style="width: 10%;">${row.memberGrade}</span>
							<span style="width: 30%;">${row.memberAddress}</span>
							
						</div>
						
					</c:forEach>

				</div>
			</div>
		</div>
		</div>
		<div class="admin-project-div1" id = flex>
			<p id="searchResult" class="admin-home-content-p left">${count}개의 결과가 검색되었습니다.</p>
		</div>
</section>

</body>

</html>