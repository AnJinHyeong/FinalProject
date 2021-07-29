//결제 창
$(function(){
	
	$('#totalAmount').blur('input', function(){
			var text = $(this).val();
			var regexText = /^[0-9]{1,6}$/;
			if(!regexText.test(text)){
				$('#amountResult').css("color", "red");
				$('#amountResult').val("");
				$('#amountResult').text("백 만원 이하의 숫자만 입력헤주세요");
				return false;
			}
				else{
					$('#amountResult').css("color", "black");
					$('#amountResult').text("");
			}
			
	});
		
	
	$('#form').on('submit', function(e){
		if(('#totalAmount').text==''){
			e.preventDefault();
			window.alert('입력 값이 잘못되었습니다');
		}
		else if(('#totalAmount').text){
			e.preventDefault();
			confirm('정말 결제하시겠습니까?');
		}
	});
	
    $("button").click(function(){
        $(".modal").fadeIn();
      });
      
      $(".modal_content").click(function(){
        $(".modal").fadeOut();
      });
      
});