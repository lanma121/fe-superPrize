//申明变量信息
var link = '/prize/index/ajax';
var noce = '/prize/index/notice?pid=';
var aswf = $('#swf').val();
//处理数据信息
var prize_id = parseInt($('#prize_id').val());
var prize_eid = $('#prize_eid').val();
var prize_ernie = parseInt($('#prize_ernie').val());
var prize_speed = parseFloat($('#prize_speed').val());
var prize_down = parseInt($('#prize_down').val());
var prize_win = $('#prize_win').val();
var prize_draw = $('#prize_draw').val();
//系统初始化
$(document).ready(function(){ 
	//刷新或关闭的系统提示
	window.onbeforeunload = function(e){
		//检测是否已经开过奖
		var mydata = 'pid='+prize_id;
		var object = json_ajax('/prize/asyn/checkflash',mydata,'POST',true);
		if(!(object && object.result>0)){
			var str = "系统严重警告：\n\t";
			str += "摇奖过程中请误刷新或者关闭该浏览器,\n\t";
			str += "否则造成数据丢失将会导致摇奖失败!\n\t";
			return str;
		}
	}
	//屏蔽浏览器刷新
	window.onkeydown = function(e){
		var event = e || window.event;
		//屏蔽 F5 ; 屏蔽 F11 ; 屏蔽 shift+F10 ; 屏蔽enter
		if((event.keyCode == 116) || (event.keyCode == 122) || (event.shiftKey && event.keyCode == 121) || (event.keyCode == 13)){
			return false;
		}
		//屏蔽Alt+F4 can not close this window
		if((event.altKey) && (event.keyCode == 115)){
			window.showModelessDialog('about:blank', '', 'dialogWidth:1px;dialogheight:1px');
			return false;
		}
	}
	//禁止f5刷新
	document.onkeydown = function(e){
		var ev = window.event || e;
		var code = ev.keyCode || ev.which;
		if(code == 116){
			ev.keyCode ? ev.keyCode = 0 : ev.which = 0;
			cancelBubble = true;
			return false;
		}
	}
	//禁止右键
	document.oncontextmenu = function(e){
		var event = e || window.event;
		return false;
	}
	//信息验证
	if(prize_id>0 && prize_ernie>0 && prize_speed>0 && prize_down>0 && prize_win!='' && prize_draw!='' && prize_eid!=''){
		//检测是否已经开过奖
		var mydata = 'pid='+prize_id;
		var object = json_ajax('/prize/asyn/checkflash',mydata,'POST',true);
		if(object && parseInt(object.result)>0){
			//进入中奖公告
			window.location.href = noce+prize_eid;
		}else{
			//进入摇奖页面
			loadFlash(aswf);
		}
	}
}); 