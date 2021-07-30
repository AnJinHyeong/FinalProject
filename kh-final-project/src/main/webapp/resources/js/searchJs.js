$(function () {
	$("#projectStateBtn").on("click", function(){
		$("#projectStateSelectBox").toggle();
	});
	
	$("#projectStateSelectBox").children("ul").children("li").on("click", function(){
		$("#projectStateText").text($(this).text());
		$("input[name=projectState]").val($(this).val());
		$("#projectStateSelectBox").toggle();
	});
	
	$("#projectOrderBtn").on("click", function(){
		$("#projectOrderSelectBox").toggle();
	});
	
	$("#projectOrderSelectBox").children("ul").children("li").on("click", function(){
		$("#projectOrderText").text($(this).text());
		$("input[name=projectOrder]").val($(this).val());
		$("#projectOrderSelectBox").toggle();
	});
	
	$("html").on("click", function(e){
		if($("#projectStateSelectBox").css("display") == "block"){
			if(!$(e.target).hasClass("On3")){
				$("#projectStateSelectBox").toggle();
			}
		}
		
		if($("#projectOrderSelectBox").css("display") == "block"){
			if(!$(e.target).hasClass("On4")){
				$("#projectOrderSelectBox").toggle();
			}
		}
	});
});
