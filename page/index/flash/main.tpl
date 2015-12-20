<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>百利网超级大奖</title>
<link rel="stylesheet" type="text/css" href="/css/detail.css"/>
<link type="text/css" rel="stylesheet" href="/css/alpha.css" />
<link type="text/css" rel="stylesheet" href="/css/flash.css" />
<script type="text/javascript" src="/util/jquery.js"></script>
<script type="text/javascript" src="/util/unajax.js"></script>
<script type="text/javascript" src="/util/dialog.js"></script>
<script type="text/javascript" src="/page/index/flash/swfobject.js"></script>
<script type="text/javascript" src="/page/index/flash/alpha.js"></script>
</head>
<body>
<input type="hidden" id="swf" value="/prize/static/alpha.swf"/>
<input type="hidden" id="prize_id" value="{$item.prize_id}"/>
<input type="hidden" id="prize_eid" value="{$item.prize_eid}"/>
<input type="hidden" id="prize_draw" value="{$item.prize_draw}"/>
<input type="hidden" id="prize_win" value="{$item.prize_win}"/>
<input type="hidden" id="prize_ernie" value="{$item.prize_ernie}"/>
<input type="hidden" id="prize_speed" value="{$item.prize_roll_speed}"/>
<input type="hidden" id="prize_down" value="{$item.prize_down_time}"/>
<div class="prize_cont">
	<div class="prize_ernie">
		<div class="bgimg fleft">
			<div>
				{if $item.prize_show != '' && $item.prize_show != 0}
				<p>
					<span>冠名企业LOGO:</span>
					<img src="{$item.prize_show}"/>
				</p>
				{/if}
			</div>
		</div>
		
		<div class="flash fleft"><div id="flashContent"></div> </div>
		
		<div class="prize_er fleft">
			<h2>摇奖进行时</h2>
			<ul>
				<li class="cor_q">
					第{$item.prize_phase}期 &nbsp;&nbsp;&nbsp;&nbsp;
					编号：{$item.prize_code}
				</li>
				<li>本期奖品：{$item.prize_short_title}</li>
				<li>最低开奖人次：{$item.prize_min_num}人/次</li>
				<li>当前投注人次：<span id="cur_total">{$item.prize_fact_num}</span> 人/次  </li>
				{if $item.user_id > 0}
				<li>您已投注：<span id="cur_num">{$item.draw_count}</span>次</li>
				{/if}
			</ul>
		</div>
	</div>
	
	<div class="prize-ernie-bottom">本期赞助商：{$item.prize_company}</div>   
	
	<div class="prize_bul_out">
		<div class="prize_bul">
			<div class="prize_bul_bg">
				<div class="bul_left">百利网超级大奖最终解释权归陕西百利网事电子商务有限公司所有</div>
				<div class="bul_right">
					<marquee scrolldelay="100" direction="left" style="display:inline-block;width:200px;">
					{$item.other_win}                              
					</marquee><span>中奖快报：</span>
				</div>
			</div>
		</div>
	</div> 
	
	<div class="prize_rule_out">
		<div class="prize_rule">
			<div class="prize_rule_c">
				<h2 class="rule_c_title">
					<form>
						<fieldset>
							<legend><img src="/images/016.gif" width="143" height="32" /></legend>
						</fieldset>
					</form>
				</h2>
				<div class="award_rule_c">
					<p><img src="{$item.prize_picture}"/>{$item.prize_explain}</p>
				</div>			
			</div>
			<div class="prize_rule_c">
				<h2 class="rule_c_title">
					<form>
						<fieldset>
							<legend><img src="/images/017.gif" width="143" height="32" /></legend>
						</fieldset>
					</form>
				</h2>
				<div class="award_rule_c">{$item.rule_content}</div>
			</div>
		</div>
	</div>
	
</div>
<script type="text/javascript" src="/page/index/flash/flash.js"></script>
</body>
</html>
