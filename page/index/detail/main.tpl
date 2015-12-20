<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>百利网超级大奖</title>
<link rel="stylesheet" type="text/css" href="/css/detail.css"/>
<script type="text/javascript" src="/util/jquery.js"></script>
<script type="text/javascript" src="/util/unajax.js"></script>
<script type="text/javascript" src="/util/dialog.js"></script>
</head>
<body>

<!-- 隐藏区域信息 -->
<input type="hidden" id="uid" value="{$item.uid}"/>
<input type="hidden" id="pid" value="{$item.id}"/>
<input type="hidden" id="eid" value="{$item.pid}"/>
<input type="hidden" id="curTime" value="{$item.curret_time}"/>
<input type="hidden" id="curStat" value="{$item.prize_status}"/>
<input type="hidden" id="curStar" value="{$item.prize_start_time}"/>
<input type="hidden" id="curFact" value="{$item.prize_fact_num}"/>
<input type="hidden" id="curMinm" value="{$item.prize_min_num}"/>
<input type="hidden" id="curAuto" value="{$item.prize_auto}"/>
<input type="hidden" id="curTart" value="{$item.prize_start}"/>
<input type="hidden" id="curStarText" value="{$item.cstart_time}"/>
<input type="hidden" id="curBuff" value="{$item.prize_buffer_time}"/>
<input type="hidden" id="curWait" value="{$item.prize_wait_time}"/> 
<input type="hidden" id="curPhas" value="{$item.prize_phase}"/>
<input type="hidden" id="curTitl" value="{$item.prize_title}"/>
<input type="hidden" id="curMinm" value="{$item.prize_min_num}"/>
<input type="hidden" id="curFact" value="{$item.prize_fact_num}"/>
<input type="hidden" id="curPict" value="{$item.prize_picture}"/> 
<input type="hidden" id="curErni" value="{$item.prize_ernie}"/>
<input type="hidden" id="curRoll" value="{$item.prize_roll_speed}"/>
<input type="hidden" id="curDown" value="{$item.prize_down_time}"/>  
<input type="hidden" id="curCode" value="{$item.prize_code}"/>
<input type="hidden" id="curComp" value="{$item.prize_company}"/> 
<input type="hidden" id="curRule" value="{$item.prize_game_rule}"/>
<input type="hidden" id="curExpl" value="{$item.prize_game_explain}"/>
<input type="hidden" id="curAgain" value="{$item.start_again}"/>
<!-- FLASH插件检测 -->
<div id="chker" style="position:fixed;top:0;left:0;z-index:3;width:100%;height:100%;display:none;">
	<div style="width:65%;height:37%;margin:200px auto 0;border:3px solid #CCCCBE;background:#fff;">
		<div style="padding:3px;color:#336699;font-weight:bold;margin:5px;padding-bottom:5px;border-bottom:1px solid #ccc;text-align:right;">
			<div><b>系统公告</b></div>
		</div>	
		<div style="padding:2px;margin:5px;background:#fff;"> 
			<br/><b style="font-size:20px;">尊敬的会员：您好!</b><br/><br/>
			<br/><b style="font-size:20px;">系统检测到您当前浏览器没有安装flash插件,将无法参与抽奖!</b><br/><br/>
			<br/><b style="font-size:20px;">为了您能享受到参与抽奖，请立即点击该连接<a href="https://get.adobe.com/cn/flashplayer/?no_redirect" target="_blank">Adobe Flash Player Down</a>下载并安装，请安装成功之后刷新该抽奖页面即可进行参与。</b><br/><br/>
			<br/><b style="font-size:20px;">在此非常感谢您的参与与配合。</b><br/><br/>
		</div>
	</div>
</div>

<!-- 会员快速登录 -->
<div id="outer" style="position:fixed;top:0;left:0;z-index:2;width:100%;height:100%;display:none;">
	<div style="width:480px;height:300px;margin:100px auto 0;border:8px solid #CCCCBE;background:#fff;">
		<div style="padding:8px;color:#336699;font-weight:bold;margin:20px;padding-bottom:20px;border-bottom:1px solid #ccc;" id="login_title">您需要先登录才能参与投注</div>	
		<div style="padding:8px;margin:20px;background:#fff;"> 
			<table style="border-spacing:2px;border-color:gray;background:#fff;">				
				<tr style="height:40px;">
					<td width="100">用户名：</td>
					<td><input type="text" id="username" style="height:25px;width:200px;line-height:25px;"/></td>
				</tr>
				<tr style="height:40px;">
					<td>密&nbsp;&nbsp;&nbsp;码：</td>
					<td><input type="password" id="userpass" style="height:25px;width:200px;line-height:25px;"/></td>
				</tr>
				<tr style="height:40px;">
					<td>验证码：</td>
					<td>
						<input type="text" id="validcode" style="height:25px;width:135px;line-height:25px;"/>
						<img id="imgs" class="yzm" src="/prize/index/valid?{math equation=rand(0,255)}" border="0" style="vertical-align:middle; margin-left:8px;"/>
						<a href="javascript:void(0)" style="margin-left:15px;font-size:12px;"  onClick="document.getElementById('imgs').src='/prize/index/valid?'+Math.random();">换一张</a>
					</td>
				</tr>
				<tr style="height:40px;">
					<td>&nbsp;</td>
					<td>
						<input type="button" value="登录" style="border:none;background:#FF0000; width:120px;height:40px;color:#fff;float:left;margin-right:10px;cursor:pointer;" onclick="userLogin();"/>&nbsp;&nbsp;
						<input type="button" value="取消" style="border:none;background:#DDDDDD; width:120px;height:40px;color:#999;cursor:pointer;" onclick="document.getElementById('outer').style.display='none';"/>&nbsp;&nbsp;
					</td>
				</tr>
			</table>		
		</div>
	</div>
</div>

<div id="coder" style="position:fixed;top:0;left:0;z-index:2;width:100%;height:100%;display:none;">
	<div style="width:480px;height:260px;margin:100px auto 0;border:8px solid #CCCCBE;background:#fff;">
		<div style="padding:8px;color:#336699;font-weight:bold;margin:20px;padding-bottom:20px;border-bottom:1px solid #ccc;" id="login_title">您的投注过于频繁本次投注需要输入验证码</div>	
		<div style="padding:8px;margin:20px;background:#fff;"> 
			<table style="border-spacing:2px;border-color:gray;background:#fff;">				
				<tr style="height:40px;">
					<td>验证码：</td>
					<td>
						<input type="text" id="cod" style="height:25px;width:135px;line-height:25px;"/>
						<img id="imgd" class="yzm" src="/prize/index/valid?{math equation=rand(0,255)}" border="0" style="vertical-align:middle; margin-left:8px;"/>
						<a href="javascript:void(0)" style="margin-left:15px;font-size:12px;"  onClick="document.getElementById('imgd').src='/prize/index/valid?'+Math.random();">换一张</a>
					</td>
				</tr>
				<tr style="height:20px;"><td></td></tr>
				<tr style="height:40px;">
					<td>&nbsp;</td>
					<td>
						<input type="button" value="确定" style="border:none;background:#FF0000; width:120px;height:40px;color:#fff;float:left;margin-right:10px;cursor:pointer;" onclick="luckCode();"/>&nbsp;&nbsp;
						<input type="button" value="取消" style="border:none;background:#DDDDDD; width:120px;height:40px;color:#999;cursor:pointer;" onclick="document.getElementById('coder').style.display='none';"/>&nbsp;&nbsp;
					</td>
				</tr>
			</table>		
		</div>
	</div>
</div>

<!-- 详细信息 -->
<div id='box'>
	<div id="con_prix">
        <div id="prix_top">
        	<div id='prix_goods'>
        		<div class='goodsd goods_img'>
                	<ul>
                    	<li class='li_lf'><span>{$item.prize_code}</span></li>
                        <li class='li_ls'><div><img src="{$item.prize_picture}"/></div></li>
                	</ul>
            	</div>
            	{if $item.prize_fact_num lt $item.prize_min_num}
            	<div class='goodsd goods_info' id="show01_{$item.id}">
                	<ul>
                    	<li class='li_rf'>
                        	<p>{$item.prize_title}</p>
                            <p class='less_count'>最低 ({$item.prize_min_num}) 人/次开奖</p>
                        </li>
                        <li class='li_rs'><font id="fact_{$item.id}">{$item.prize_fact_num}</font>&nbsp;人/次已参与</li>
                        <li class='li_rt'><a href="javascript:checkDraw();">立即投注</a></li>
                        <li class="li_jf">{$item.prize_draw_currency} 积分/次</li>
                	</ul>
                </div>
            	{else}
            	<div class='goodsd goods_info' id="show02_{$item.id}">
					<ul>
						<li class='li_rf'>
							<p>{$item.prize_title}</p>
							<p class='less_count'>最低({$item.prize_min_num})人/次开奖</p>
						</li>
						<li class='li_rs'>
							{if ($item.prize_status eq 3 || $item.prize_status eq 4) && $item.prize_out gt 0}
							<span>抽奖已结束</span>
							{else}
							<span>参与人数已满</span>
							{/if}
						</li>
						<li class='li_rt'>
							<p class='prix_time'>
								{if $item.prize_status eq 3 || $item.prize_status eq 4}
									{if $item.prize_winmsg != '' && $item.prize_out gt 0}
									<font>{$item.prize_winmsg}</font>
									{else}
									<font>请耐心等待抽奖结果!</font>
									{/if}
								{else}
									<font id="show_info_{$item.id}">
										<span id="hour_{$item.id}"></span>时 
										<span id="mini_{$item.id}"></span>分 
										<span id="sec_{$item.id}"></span>秒
										&nbsp;&nbsp;&nbsp;后自动跳转摇奖页面
									</font>
								{/if}
							</p>
							<p class="prix_time_next"></p>
						</li>
					</ul>
				</div>
            	{/if}
				<div class="goods_ewm">
					<img class="good_img1" src="/images/007.jpg" width="220" height="98"/>
					<img class="good_img2" src="{$item.url}" width="260" height="260"/>
				</div>
        	</div>	
        </div>
		
		<div id="prix_bottom"> 
            <div id="prix_sever"><marquee behavior="scroll">{$item.limit_info}</marquee></div>
        </div>
		
		<div id='prix_scoll' >
			<div style='width:100%;height:54px;background: #F7D801;position:relative;top:34px'>
				<div style='width:1005px;height:100%;margin:0 auto;background: #F7D801 '>
					<div class="scoll_l">百利网超级大奖最终解释权归陕西百利网事电子商务有限公司所有</div>
					<div class="scoll_r">
						<span style="padding-bottom:10px;float:left;">中奖快报：</span>
						<marquee behavior="scroll" style="width:320px;height:38px;">{$item.notice_info}</marquee>
					</div>
				</div>  
            </div>
        </div>
    </div>    
	<div id="con_users"> 
		<div id="users_list"></div>
	</div>
	<div id="footer_d" style="width:100%;height:50px;background:#B80000"></div>
</div>
<script type="text/javascript" src="/page/index/detail/detail.js"></script>
</body>
</html>
