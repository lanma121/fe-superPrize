//全局变量
var movieObj = null;

//flash初始化成功后调用这个函数，在调用这个函数前，调用Flash接口无效
function as2js_ready(){
	//系统初始化
	thisMovie();
	//开始flash倒计时
	if(movieObj && typeof(movieObj.as_countDown)=='function'){
		setTimeout(js2as_countDown,1000);
	}
}

//滚动信息
function thisMovie(){
	if(movieObj===window['alpha'] || movieObj===document['alpha']){
		return movieObj;
	}else{
		if(navigator.appName.indexOf('Microsoft') != -1){
			movieObj = window['alpha'];
		}else{
			movieObj = document['alpha'];
		}
	}
	return movieObj;
}

//进入等待状态，此时可以投注
function js2as_waiting(){
	movieObj.as_ready();
}

//进入倒计时状态
function js2as_countDown(){
	movieObj.as_countDown(parseFloat(prize_down));
}

//Flash倒计时结束,请求服务器是否可以开始滚动参与者消息
function as2js_onTime(){
	js2as_yaojiang()
}

//开始滚动抽奖人名单所需参数：抽奖人名单，滚动持续时间（秒为单位），滚动时间间隔（秒为单位）,中奖者名称
function js2as_yaojiang(){
	movieObj.as_showName(prize_draw , prize_ernie , prize_speed , prize_win);
	setTimeout(function(){
		//检测是否已经开过奖，防止重复写入,延迟1秒钟作为缓冲
		var object = json_ajax('/prize/asyn/checkflash','pid='+prize_id,'POST',true);
		if(!(object && object.result>0)){
			//写入开奖检测标志
			json_ajax('/prize/asyn/markflash','pid='+prize_id,'POST',true);
		}
	},(prize_ernie-1)*1000);
}

//系统初始化加载flash信息
function loadFlash(alpha){
	var swfVersionStr = "11.1.0";
    var xiSwfUrlStr = "playerProductInstall.swf";
    var flashvars = {};
    var params = {};
    params.quality = "high";
    params.bgcolor = "#ffffff";
    params.allowscriptaccess = "sameDomain";
    params.allowfullscreen = "true";
    var attributes = {};
    attributes.id = "alpha";
    attributes.name = "alpha";
    attributes.align = "middle";
    swfobject.embedSWF(
  	    ""+alpha+"",
        "flashContent", 
        "483px", 
        "263px", 
        swfVersionStr, 
        xiSwfUrlStr, 
        flashvars, 
        params, 
        attributes
    );
    swfobject.createCSS('#flashContent','display:block;text-align:left;');
}