//定时器侦听对象
var otm = '';
var otn = '';

//本机时间和服务器时间之差
var curTime = timeDifference();

//系统初始化
$(document).ready(function(){ 
	//检查浏览器是否支持flash
	var pid = parseInt($('#pid').val());
	var sta = parseInt($('#curStat').val());
	if(checkFlash() && sta==1){
		//加载倒计时
		loadDown();
		//事件监听器
		listenEvent();
		//需要重新启动
		startAgain();
	}else{
		$('#show_info_'+pid).html('请立即安装flash插件!');
	}
	//加载抽奖列表
	loadDraw(1,20);
}); 

//加载抽奖列表信息
function loadDraw(pn,rn){
	var pid = parseInt($('#pid').val());
	var mydata = 'id='+pid+'&pn='+pn+'&rn='+rn;
	var object = json_ajax('/prize/asyn/userdraw',mydata,'POST');
	var html = '';
	if(object && object.list && object.list.length>0){
		var pags = object.page;
		var data = object.list;
		var lens = data.length;
		var disp = (pags.display_pages).toString().split(',');
		html += '<h1>抽奖直播<span style="font-size:16px;font-weight:normal">（最新'+parseInt(object.coun)+'条记录）</span></h1>';
		html += '<table>';
		html += '<tr>';
		html += '<td>编号</td>';
		html += '<td>姓名</td>';
		html += '<td>电话</td>';
		html += '<td>地址</td>';
		html += '<td>时间</td>';
		html += '</tr>';
		for(var i=0;i<lens;i++){
			html += '<tr>';
			html += '<td>'+data[i].id+'</td>';
			html += '<td>'+data[i].prize_user_name+'</td>';
			html += '<td>'+data[i].prize_user_mobile+'</td>';
			html += '<td>'+data[i].prize_user_locat+'</td>';
			html += '<td>'+data[i].prize_user_pdate+'</td>';
			html += '</tr>';
		}
		if(pags.nc != 1){
			html += '<tr>';
			html += '<td colspan="5" align="center">';
			if(pags.has_prev != 0){
				html += '<a class="pagebox_num" href="javascript:loadDraw('+parseInt(pags.pn-1)+','+parseInt(pags.rn)+');">上一页</a>';
			}
			
			for(var i=0;i<disp.length;i++){
				if(parseInt(pags.pn) == parseInt(disp[i])){
					html += '<a class="pagebox_num current" href="javascript:void(0);">';
				}else{
					html += '<a class="pagebox_num" href="javascript:loadDraw('+parseInt(disp[i])+','+parseInt(pags.rn)+');">';
				}
				html += parseInt(disp[i]);
				html += '</a>';
			}
			if(pags.has_next != 0){
				html += '<a class="pagebox_num pagebox_next" href="javascript:loadDraw('+parseInt(pags.pn+1)+','+parseInt(pags.rn)+');"> 下一页</a>';
			}
			html += '</tr>';
		}
		
		html += '<table>';
	}else{
		html += '<h1><span style="font-size:16px;font-weight:normal">暂无数据!</span></h1>';
	}
	$('#users_list').html(html);
}

//检查浏览器是否支持 flash
function checkFlash(){
	var sta = parseInt($('#curStat').val());
	//是否安装了flash
	var hasFlash = 0; 
	//flash版本
	var flashVersion = 0;
	//验证IE浏览器	
	if(document.all){
		var swf = new ActiveXObject('ShockwaveFlash.ShockwaveFlash');
		if(swf){
			hasFlash = 1;
			VSwf = swf.GetVariable('$version');
			flashVersion = parseInt(VSwf.split(' ')[1].split(',')[0]);
		}
	}
	//验证火狐浏览器
	else{
		if(navigator.plugins && navigator.plugins.length > 0){
			var swf = navigator.plugins['Shockwave Flash'];
			if(swf){
				hasFlash = 1;
				var words = swf.description.split(' ');
				for(var i = 0; i < words.length; ++i){
					if(isNaN(parseInt(words[i]))){
						continue;
					}else{
						flashVersion = parseInt(words[i]);
					}
				}
			}
		}
	}
	var fls = {f:hasFlash,v:flashVersion};
	if(!fls.f && sta==1){
		$('#chker').show();
	}
	return hasFlash;	
}

/**
 * 日期格式化
 */
function dTime(time){
	var hour = minute = second = 0;
	if(parseInt(time%3600)>=60){
		minute = parseInt(time%3600);
		if(parseInt(minute%60)>=1){
			second = parseInt(minute%60);
		}
		minute = parseInt(minute/60);
	}
	if(time>=3600){
		if(parseInt(time/3600)>=1){
			hour = parseInt(time/3600);
		}
	}
	if(time<60){
		second = time;
	}
	var obj = {
	    secs: second,
	    mini: minute,
	    hour: hour
	}
	return obj;
}

/**
 * 需要重新启动
 */
function startAgain(){
	var curAgain = parseInt($('#curAgain').val());
	if(curAgain==1){
		window.location.reload();
	}
}

/**
 * 事件监听器
 */
function listenEvent(){
	//指定秒数内触发侦听器
	if(parseInt($('#curStat').val())==1 && parseInt($('#curStar').val())==0){
		if(parseInt($('#curFact').val())>=parseInt($('#curMinm').val()) && 
		   parseInt($('#curAuto').val())==2 && parseInt($('#curTart').val())==1){
			otm = setInterval(function(){
				listenStart();
			},6000);
		}else{
			otn = setInterval(function(){
				listenStatus();
			},5000);
		}
	}	
}

/**
 * 侦听超级大奖启动状态
 */
function listenStart(){
	var pid = parseInt($('#pid').val());
	var mydata = 'pid='+pid;
	var object = json_ajax('/prize/asyn/checkstart',mydata,'POST');
	if(object && parseInt(object.result)==2){
		clearInterval(otm);
		window.location.reload();
	}
}

/**
 * 侦听超级大奖当前状态
 */
function listenStatus(){
	var pid = parseInt($('#pid').val());
	var mydata = 'action=checkStatus&pid='+pid;
	var object = json_ajax('/prize/asyn/checkstatus',mydata,'POST');
	if(object && parseInt(object.caleor)>0){
		$('#fact_'+pid).text(parseInt(object.factnm));
	}else{
		clearInterval(otn);
		window.location.reload();
	}
}

/**
 * 本机时间和服务器时间之差
 * @returns {Number}
 */
function timeDifference(){
	var jts = parseInt((new Date()).valueOf().toString().substr(0,10));
	var pts = parseInt($('#curTime').val());
	var dfc = jts-pts;
	return dfc;
}

/**
 * 获取会员登录信息
 */
function userInfo(){
	var object = json_ajax('/prize/asyn/userinfo',null,'POST');
	var uid = (object.uid)?parseInt(object.uid):0;
	var rid = (object.rid)?parseInt(object.rid):0;
	var mid = (object.mid)?parseInt(object.mid):0;
	var result = {
	     uid: uid,
	     rid: rid,
	     mid: mid,
	}
	return result;
}

/**
 * 会员登录
 */
function userLogin(){
	var name = all_trim($('#username').val());
	var pass = all_trim($('#userpass').val());
	var code = all_trim($('#validcode').val());
	if(name!='' && pass!='' && code!=''){
		var mydata = 'name='+name+'&pass='+pass+'&code='+code;
		var object = json_ajax('/prize/asyn/userlogin',mydata,'POST');
		if(object && object.result){
			switch(parseInt(object.result)){
				case 1:
					$.MsgBox.Alert('系统警告', '信息错误!');
				break;
				case 2:
					$.MsgBox.Alert('系统警告', '验证码错误!');
				break;
				case 3:
					$.MsgBox.Alert('系统警告', '账号错误!');
				break;
				case 4:
					$.MsgBox.Alert('系统警告', '密码错误!');
				break;
				case 5:
					$.MsgBox.Alert('系统警告', '账号被冻结!');
				break;
				case 6:
					$.MsgBox.Alert('系统警告', '积分异常!');
				break;
				case 7:
					$.MsgBox.Alert('系统警告', '系统更新失败请重新登录!');
				break;
				case 8:
					//登录成功开始抽奖
					window.location.reload();
				break;
			}
		}else{
			$.MsgBox.Alert('系统警告', '系统繁忙,请稍后再试!');
		}
	}else{
		$('#outer').show();
		$.MsgBox.Alert('系统警告', '用户名和密码以及验证码不能为空!');
	}
}

/**
 * 检查抽奖条件
 */
function checkDraw(cod){
	var info = userInfo();
	var uid = parseInt(info.uid);
	var pid = parseInt($('#pid').val());
	if(uid > 0 && pid > 0){
		var mydata = 'pid='+pid+'&uid='+uid;
		if(cod!='' &&  cod!=null && cod!=undefined){
			mydata += '&cod='+all_trim(cod);
		}
		var object = json_ajax('/prize/asyn/checkdraw',mydata,'POST');
		if(object && object.result){
			switch(parseInt(object.result)){
				case 1:
					$.MsgBox.Alert('系统警告', '系统数据信息有误!');
				break;
				case 2:
					$.MsgBox.Alert('系统警告', '会员基本信息异常!');
				break;
				case 3:
					$.MsgBox.Alert('系统警告', '会员积分账号异常!');
				break;
				case 4:
					$.MsgBox.Alert('系统警告', '该奖品暂时不能投注!');
				break;
				case 5:
					$.MsgBox.Alert('系统警告', '您的会员积分异常!');
				break;
				case 6:
					$.MsgBox.Alert('系统警告', '该奖品需要身份认证,请到会员中心填写您的身份证号码!');
				break;
				case 7:
					$.MsgBox.Alert('系统警告', '你还未在该店铺消费过!');
				break;
				case 8:
					$.MsgBox.Alert('系统警告', '你还未在该地区消费过!');
				break;
				case 9:
					$.MsgBox.Alert('系统警告', '您的会员积分不足!');
				break;
				case 10:
					$('#cod').val('').focus();							
					$('#coder').show();
					$.MsgBox.Alert('系统警告', '验证码错误!');
				break;
				case 11:
					$('#coder').show();
				break;
				case 12:
					//可以进行投注
					luckDraw(pid,uid);
				break;
			}
		}else{
			$.MsgBox.Alert('系统警告', '系统繁忙,请稍后再试!');
		}
	}else{
		$('#outer').show();
	}
}

/**
 * 抽奖验证码
 */
function luckCode(){
	var info = userInfo();
	var uid = parseInt(info.uid);
	var pid = parseInt($('#pid').val());
	var cod = all_trim($('#cod').val());
	if(uid > 0 && pid > 0 && cod!=''){
		checkDraw(cod);
	}else{
		$.MsgBox.Alert('系统警告', '请将信息填写完整!');
		$('#cod').focus();		
	}
}

/**
 * 开始抽奖
 * @param pid
 * @param uid
 */
function luckDraw(pid,uid){
	if(parseInt(pid)>0 && parseInt(uid)>0){
		$.MsgBox.Confirm('系统提示','您确定要投注吗？', function(){
			var mydata = 'pid='+pid+'&uid='+uid;
			var object = json_ajax('/prize/asyn/luckdraw',mydata,'POST');	
			if(object && object.result){
				switch(parseInt(object.result)){
					case 1:
						$.MsgBox.Alert('系统警告', '系统数据信息异常!');
					break;
					case 2:
						$.MsgBox.Alert('系统警告', '您的基本信息异常!');
					break;
					case 3:
						$.MsgBox.Alert('系统警告', '您的积分账号异常!');
					break;
					case 4:
						$.MsgBox.Alert('系统警告', '您的个人信息不全请去会员中心完善!');
					break;
					case 5:
						$.MsgBox.Alert('系统警告', '当前奖品信息异常系统正在处理请稍后再投注!');	
					break;
					case 6:
						$.MsgBox.Alert('系统警告', '您的积分不足,请努力消费!');	
					break;
					case 7:
						$.MsgBox.Alert('系统警告', '您的积分等级异常!');	
					break;
					case 8:
						$.MsgBox.Alert('系统警告', '系统更新失败请稍后再试!');	
					break;
					case 9:
						$.MsgBox.Alert('系统警告', '参与人数已满,谢绝投注!');	
					break;
					case 10:
						$('#fact_'+pid).text(parseInt(object.factnum));
						$.MsgBox.Alert('系统消息', '恭喜你投注成功!');
						window.location.reload();
					break;
				}
			}else{
				$.MsgBox.Alert('系统警告', '系统繁忙,请稍后再试!');
			}	
		});
	}
}

/**
 * 日期格式化
 * @param date
 * @returns {___anonymous4620_4740}
 */
function formatDate(date){
	var tag1 = '-';
	var tag2 = ':';
	var year = date.substring(0,date.indexOf(tag1));
	var month = date.substring(date.indexOf(tag1)+tag1.length,date.lastIndexOf(tag1));
	var day = date.substring(date.lastIndexOf(tag1)+tag1.length,date.lastIndexOf(tag1)+tag1.length+2);
	var hour = date.substring(date.lastIndexOf(tag1)+tag1.length+3,date.indexOf(tag2));
	var minute = date.substring(date.indexOf(tag2)+tag2.length,date.lastIndexOf(tag2));
	var second = date.substring(date.lastIndexOf(tag2)+tag2.length,date.length);
	var obj = {
	     sec: second,
	     mini: minute,
	     hour: hour,
	     day: day,
	     month: month,
	     year: year
	}
	return obj;
}

//设置开奖倒计时间
function setTime(year,month,day,hour,minute,second,id,buffer,end,prize_phase,prize_title,
    prize_min_num,prize_fact_num,prize_picture,user_id, prize_ernie,prize_roll_speed,
    prize_down_time,this_second,prize_code,prize_rule,prize_explain,prize_company){
	var d = Date.UTC(year, month, day, hour, minute, second);
	var obj = {
	     sec: document.getElementById('sec_'+id),
	     mini: document.getElementById('mini_'+id),
	     hour: document.getElementById('hour_'+id)
	}
	fnTimeDown(
		d,obj,id,buffer,end,prize_phase,prize_title,prize_min_num,
		prize_fact_num,prize_picture,user_id,prize_ernie,prize_roll_speed,
	    prize_down_time,this_second,prize_code,prize_rule,prize_explain,
	    prize_company
	);
}

//加载倒计时
function loadDown(){
	var pid = parseInt($('#pid').val());
	var curAuto = parseInt($('#curAuto').val());
	var curTart = parseInt($('#curTart').val());
	switch(parseInt(curAuto)){
		case 1:
			startDown();
		break;
		case 2:
			if(parseInt(curTart)==2){
				startDown();
			}else{
				$('#show_info_'+pid).text('请等待店家启动摇奖程序!');
			}
		break;
	}
}

/**
 * 启动超级大奖
 * @param pid
 */
function startPrize(pid){
	var mydata = 'pid='+pid;
	var object = json_ajax('/prize/asyn/startprize',mydata,'POST');
	var result = 0;
	switch(parseInt(object.result)){
		case 0:
			$.MsgBox.Alert('系统警告', '系统数据信息异常!');	
		break;
		case 1:
			$.MsgBox.Alert('系统警告', '该奖品的信息异常!');	
		break;	
		case 2:
			$.MsgBox.Alert('系统警告', '系统数据信息缺陷!');	
		break;
		case 3:
			$.MsgBox.Alert('系统警告', '奖品启动失败!');	
		break;
		case 4:
			//启动成功
			result = 1;
		break;
	}
	return result;
}

/**
 * 倒计时的实现
 * @param d
 * @param o
 * @param id
 * @param buffer
 * @param end
 * @param prize_phase
 * @param prize_title
 * @param prize_min_num
 * @param prize_fact_num
 * @param prize_picture
 * @param user_id
 * @param prize_ernie
 * @param prize_roll_speed
 * @param prize_down_time
 * @param this_second
 * @param prize_code
 * @param prize_rule
 * @param prize_explain
 * @param prize_company
 * @returns
 */
function fnTimeDown(d, o ,id,buffer,end,prize_phase,prize_title,
	prize_min_num,prize_fact_num,prize_picture,user_id,prize_ernie,
    prize_roll_speed,prize_down_time,this_second,prize_code,prize_rule,
    prize_explain,prize_company){
	//开奖状态
	var startStatus = 0;
	var f = {
		zero: function(n){
			var n = parseInt(n, 10);
			if(n > 0){
				if(n <= 9){
					n = '0' + n;	
				}
				return String(n);
			}else{
				return '00';	
			}
		},
		dv: function(){
			var future = new Date(d), now = new Date();
			var this_date = 0;
			if(curTime > 0){
				this_date = future.getTime() - now.getTime() + this_second * 1000;
			}else{
				this_date = future.getTime() - now.getTime() - this_second * 1000;
			}
			var dur = Math.round(this_date / 1000) + future.getTimezoneOffset() * 60, pms = {
				sec:   '00',
				mini:  '00',
				hour:  '00',
				day:   '00',
				month: '00',
				year:  '00'
			};
			if(dur > 0){
				pms.sec = f.zero(dur % 60);
				pms.mini = Math.floor((dur / 60)) > 0? f.zero(Math.floor((dur / 60)) % 60) : '00';
				pms.hour = Math.floor((dur / 3600)) > 0? f.zero(Math.floor((dur / 3600)) % 24) : '00';
				pms.day = Math.floor((dur / 86400)) > 0? f.zero(Math.floor((dur / 86400)) % 30) : '00';
				//月份，以实际平均每月秒数计算
				pms.month = Math.floor((dur / 2629744)) > 0? f.zero(Math.floor((dur / 2629744)) % 12) : '00';
				//年份，按按回归年365天5时48分46秒算
				pms.year = Math.floor((dur / 31556926)) > 0? Math.floor((dur / 31556926)) : '0';
			}
			return pms;
		},
		ui: function(){
			if(o.sec){
				o.sec.innerHTML = f.dv().sec;
			}
			if(o.mini){
				o.mini.innerHTML = f.dv().mini;
			}
			if(o.hour){
				o.hour.innerHTML = f.dv().hour;
			}
			if(o.day){
				o.day.innerHTML = f.dv().day;
			}
			if(o.month){
				o.month.innerHTML = f.dv().month;
			}
			if(o.year){
				o.year.innerHTML = f.dv().year;
			}
			
			//启动定时器
			var t = setTimeout(f.ui, 1000);
			
			//将缓冲时间转为分钟和秒
			var buffer_second = buffer % 60;
			var buffer_minute = (buffer - buffer_second) / 60;
			
			//将结束时间转换为分钟和秒
			var end_second = end % 60;
			var end_minute = (end - end_second) / 60;
			var this_end_second = buffer_second + 10;
			//缓冲时间
			var this_buffer = end - buffer;
			var this_buffer_second = this_buffer % 60;
			var this_buffer_minute = (this_buffer - this_buffer_second) / 60;
			//如果刷新失败!
			if(f.dv().hour >= 23){
				//自动刷新一下页面
				window.location.reload();
			}
			//缓冲结束停止投注处理
			if(f.dv().mini == this_buffer_minute && f.dv().sec == this_buffer_second){
				//do something ......
			}
			//开始处理中奖人员信息
			if(f.dv().hour == 0 && f.dv().mini == 0 && (f.dv().sec >= 0 && f.dv().sec<=2)){
				//开始处理抽奖倒计时
				startStatus = startPrize(id);
			}
			//抽奖结束
			if(f.dv().hour == 0 && f.dv().mini == 0 && (f.dv().sec >= 0 && f.dv().sec<=1) && startStatus==1){
				//显示结束标语
				$('#show_info_'+id).text('抽奖已结束,已进入开奖倒计时!');
				//跳转中奖滚动页面
				window.location.href = '/prize/index/flash?pid='+$('#eid').val();
				//停止计时
				clearTimeout(t);
			}
		}
	};	
	f.ui();
};

//开始倒计时
function startDown(){
	var info = userInfo();
	var uid = parseInt(info.uid);
	var pid = parseInt($('#pid').val());
	var curStatus = parseInt($('#curStat').val());
	var startTime = parseInt($('#curStar').val());
	if(curStatus == 1 && startTime > 0){
		//停止投注
		$('#show01_'+pid).hide();
		$('#show02_'+pid).show();
		//获取参数信息
		var obj = formatDate($('#curStarText').val());
		var prize_buffer = $('#curBuff').val();
		var prize_wait  = $('#curWait').val();
		var prize_phase = $('#curPhas').val();
		var prize_title = $('#curTitl').val();
		var prize_min = $('#curMinm').val();
		var prize_fact = $('#curFact').val();
		var prize_pics = $('#curPict').val();
		var prize_ernie = $('#curErni').val();
		var prize_roll = $('#curRoll').val();
		var prize_down = $('#curDown').val();
		var prize_code = $('#curCode').val();
		var prize_comp = $('#curComp').val();
		var prize_rule = $('#curRule').val();
		var prize_expl = $('#curExpl').val();
		var prize_seco = (curTime > 0)?curTime:-curTime;
		//获取当前日期信息
		var prize_tday = obj.day-1;
		//进入倒数计时
		setTime(
			obj.year,obj.month,prize_tday,obj.hour,obj.mini,obj.sec,pid,prize_buffer,
			prize_wait,prize_phase,prize_title,prize_min,prize_fact,prize_pics,uid,prize_ernie,
			prize_roll,prize_down,prize_seco,prize_code,prize_rule,prize_expl,prize_comp
		);
	}
}