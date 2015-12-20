<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<meta http-equiv="pragma" content="no-cache"/> 
<meta http-equiv="Cache-Control" content="no-cache, must-revalidate"/> 
<meta http-equiv="expires" content="Wed, 26 Feb 1997 08:21:57 GMT"/>
<title>超级大奖专区</title>
<link rel="stylesheet" type="text/css" href="/css/base.css"/>
<link type="text/css" rel="stylesheet" href="/css/notice.css"/>
<link type="text/css" rel="stylesheet" href="/css/flash.css"/>
</head>
<body>
<div class="prize_cont">
	<div class="prize_ernie prize_ernie_ad">
    	<div class="bgimg fleft"></div>
        <div class="flash_img fleft">
        	<span class="red"><b class="f48">{$item.prize_user_mobile}</b><br />{$item.prize_user_province}{$item.prize_user_city}({$item.prize_user_name})</span>
        </div>
        <div class="prize_er fleft">
        	<h2>中奖公告</h2>
            <ul>
            	<li class="cor_q">第{$item.prize_phase}期<br/>编号：{$item.prize_code}</li>
                <li>单次投注：{$item.prize_draw_currency}积分</li>
                <li>最低开奖人次：{$item.prize_min_num}人/次 </li>
                <li>投注人次：{$item.prize_fact_num}人</li>
                <li>冠名支持：{$item.prize_fcompany}</li>
            </ul>
        </div>
    </div>
	<div class="prize-ernie-bottom"><span>本期赞助商：{$item.prize_company}</span></div>  
	<div class="prize_bul_out">
	<div class="prize_bul">
    	<div class="prize_bul_bg">
            <div class="bul_left">百利网超级大奖最终解释权归陕西百利网事电子商务有限公司所有</div>
	            <div class="bul_right">
	               <marquee scrolldelay="100" direction="left" style="display:inline-block;width:200px;">
	               恭喜{$item.prize_user_name}中得第{$item.prize_phase}期大奖{$item.prize_title}                            
	               </marquee><span>中奖快报：</span>
	            </div>
        </div>
    </div>
    </div>
    <div class="prize_rule_out">
	<div class="notice_bg_top">
    	<div class="left_img">
    		{if $item.prize_picture != ''}
        	<img src="{$item.prize_picture}"/>
            {/if}
            <span class="img_p"></span>
        </div>
        <div class="right_c">
        	<h1><span class="f_red">本期奖品：</span> {$item.prize_title}</h1>
            <p>
            	<b>市场价：<font class="f_red">{$item.prize_price}元</font></b><br />
                <b>奖品描述：</b>{$item.prize_explain}
            </p>
        </div>
    </div>
	<div class="notice_bg">
    	<div class="notice_news">
        	<h1 class="news_title"><font class="f_red">第{$item.prize_phase}期</font>{$item.prize_title}<font class="f_red">中奖用户</font></h1>
            {if $item.prize_photo}
            <div class="img_img"><img src="{$item.prize_photo}"/></div>
            {/if}
            <div class="news_right">
            	<b>姓　　名：{$item.prize_user_name}</b><br />
                <b>手　　机：{$item.prize_user_mobile}</b><br />
                <b>地　　址：{$item.prize_user_province}{$item.prize_user_city}</b><br/>
				{if $item.prize_user_word}
                <b>获奖感言：</b>{$item.prize_user_word}
				{/if}
            </div>
        </div>
    </div>
</div></div>
</body>
</html>
