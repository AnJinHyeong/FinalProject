<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script>
	$(function(){
		
		$(".footer-btn").hover(function(){
			$(".footer-btn-i").style.color = "black";
		});
		
		
	});
	
	function showMsg2() { 

		 
		
		window.open("${pageContext.request.contextPath}/admin/adminMsgWrite","a","width=600, height=430, left=400, top=100 ,status=no,toolbar=no");
		
 

	}
	
</script>
	
	<footer class="main-row">
		
		<div class="footer-notice" style="height: 50px;">
			<p style="color: #fff; font-size: 12px; padding: 0 40px; margin-right: 50px;" class="">
				회사명 FüN‿ding 주소 서울특별시 영등포구 선유동2로 57 이레빌딩 20층
				대표 XXX 사업자등록번호 XXX-XX-XXXXX 대표번호 02-XXXX-XXXX
			</p>
			<br>
			<p style="color: #fff; font-size: 12px; text-align: right; ">&copy; 2021 FüN‿ding ,.</p>
			<button class="footer-btn" onclick="showMsg2()"><i class="fas fa-bullhorn footer-btn-i"></i> 문의 하기</button>
		</div>
		<div class="footer-notice">
			<p style="color: #fff; font-size: 12px; padding: 0 40px;">
				FüN‿ding은 플랫폼 제공자로서 프로젝트의 당사자가 아니며, 직접적인 통신판매를 진행하지 않습니다. 프로젝트의 완수 및 선물제공의 책임은 해당 프로젝트의 창작자에게 있으며, 프로젝트와 관련하여 후원자와 발생하는 법적 분쟁에 대한 책임은 해당 창작자가 부담합니다.
			</p>
		</div>
		
	</footer>
	
	
	
</body>
</html>