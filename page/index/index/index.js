//系统初始化
$(document).ready(function(){
	$("input[type='hidden'][name='prizeID']").each(function(){
		var msg = $('#span_prize_bet_time_'+parseInt($(this).val()));
		if(msg){
			msg.text(random_msg);
		}
	});
});
