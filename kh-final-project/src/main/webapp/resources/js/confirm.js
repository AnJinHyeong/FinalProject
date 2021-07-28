//결제 창
$(function(){
	
//  결제관련 금액입력, 금액선택 부분 가리기
	 $("#10underMoney").hide();
	 $("#10upMoney").hide();
	 
		//  10만원 이하 셀렉트부분에 값넣기
 	  var start = 5000;
	  var end = 100000;
		for(var money = 0; money<=end; money+=start){
			  $('#10underMoney').append("<option value = "+money+">"+money+"원"+"</option>");
			}
		
		var endResult = 0;
			
		//10만원 이하 부분
    $("input:radio[name=radio]").change(function(e){
    	if($("input:radio[name=radio]:checked").val() == "trueUnder"){
    		endResult = 0;
    		$("#10upMoney").attr("disabled", true);
    		$("#10underMoney").attr("disabled", false);    		
    	  $('#error').text("");
		 $("#10underMoney").fadeIn();
 		 $("#10upMoney").fadeOut();
		  $("#10upMoney option:selected").val("0");
		  $("#10upMoney").attr("disabled", true);
		  return endResult = 1;
		
  }
        //10만원 초과 부분
    	else if($("input:radio[name=radio]:checked").val() == "trueUp"){
    		endResult = 0;
    		$("#10underMoney").attr("disabled", true);
    		$("#10upMoney").attr("disabled", false);    	
		$("#10underMoney").val("0");
		  $("#10underMoney option:selected").val("0");
        		 $("#10upMoney	").fadeIn();
       		 $("#10underMoney").fadeOut();
       		 
   		  return endResult = 1;
       }
       });
      
//  10만원 이상 입력박스
	$('#10upMoney').blur('input', function(){
			var text = $(this).val();
			if(100000<=text&&text<=1000000){
				$('#error').text("");
				return $(this).val();
			}
			else{
				$('#error').val("");
				$('#error').text("십 만원 ~ 백 만원 이하의 숫자만 입력해주세요");
				$(this).val("");
				return false;
			}
	});
    
    
//  	폼전송 막기
  	$('#form').click('submit', function(e){
  		var a = $("#10underMoney").val();
  		var b = $("#10upMoney").val();
  		if((a==0&&b==0)||(b>1000000)){
  			window.alert('입력이 잘못되었습니다');
  			return false;
  		}
  	});

});