//결제 창
$(function(){

	$('#10upMoney').blur('input', function(){
			var text = $(this).val();
			var regexText = /^[0-9]{6}$/;
			if(!regexText.test(text)){
				$('#amountResult').css("color", "red");
				$('#amountResult').val("");
				$('#amountResult').text("십 만원 ~ 백 만원 이하의 숫자만 입력헤주세요");
				$(this).val("");
				return false;
			}
			else if(text<=100000){
				$('#amountResult').css("color", "red");
				$('#amountResult').val("");
				$('#amountResult').text("십 만원 ~ 백 만원 이하의 숫자만 입력헤주세요");
				$(this).val("");
				return false;
			}
				else{
					$('#amountResult').css("color", "black");
					$('#amountResult').text("");
			}
			
	});

//	폼전송 막기
	$('#form').click('submit', function(e){
		var a = $("#10underMoney").val();
		var b = $("#10upMoney").val();
		
		if(a==false&&b==false){
			e.preventDefault();
			window.alert('입력 값이 잘못되었습니다');
		}
	});
	
      
//      결제관련 금액입력, 금액선택 부분 가리기
		 $("#10underMoney").hide();
		 $("#10upMoney").hide();
		 
		 
//10만원 이하 부분
      $("#10under").change( function(){
 		 var a = $(this).val();
    	
    	  if(a=="trueUnder"){
    		 $("#10underMoney").fadeIn();
     		 $("#10upMoney").fadeOut();
   		  $("#10up option:selected").val("0");
      }
    	  
      });
      	
    //10만원 초과 부분
      $("#10up").change( function(){
  		 var a = $(this).val();
     	
     	  if(a=="trueUp"){
      		 $("#10upMoney").fadeIn();
     		 $("#10underMoney").fadeOut();
    		  $("#10under option:selected").val("0");
    		  $("#10underMoney").removeAttr("name");
       }
       });
      
//      셀렉트부분에 값넣기

    	  var start = 5000;
    	  var end = 100000;
      for(var money = 5000; money<=end; money+=start){
          $('#10underMoney').append("<option value = "+money+">"+money+"원"+"</option>");
      }

      
      
      
});