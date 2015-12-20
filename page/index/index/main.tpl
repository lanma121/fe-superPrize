<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>百利网超级大奖</title>
<link rel="stylesheet" type="text/css" href="/css/base.css"/>
<link rel="stylesheet" type="text/css" href="/css/default.css"/>
<script type="text/javascript" src="/util/jquery.js"></script>
<script type="text/javascript" src="/util/unajax.js"></script>
</head>
<body>
{include file="common/widgets/header/header.tpl"} 
{include file="common/widgets/nav/nav.tpl"}
<!--公告 -->
<div id="outer" style="position:fixed;top:0;left:0;z-index:3;width:100%;height:100%;display:none;">
	<div style="width:60%;height:30%;margin:200px auto 0;border:3px solid #CCCCBE;background:#fff;">
		<div style="padding:3px;color:#336699;font-weight:bold;margin:5px;padding-bottom:5px;border-bottom:1px solid #ccc;text-align:right;">
			<div><b>系统公告</b></div>
		</div>	
		<div style="padding:2px;margin:5px;background:#fff;"> 
			<br/><b style="font-size:20px;">尊敬的会员：您好!</b><br/><br/>
			<br/><b style="font-size:20px;">由于超级大奖功能近期需要全面升级，现在不能参与抽奖活动，给您带来的不便敬请谅解，具体恢复时间请留意系统通知!</b><br/><br/>
			<br/><b style="font-size:20px;">2015年10月25日&nbsp;&nbsp;&nbsp;&nbsp;网络部</b><br/><br/>
		</div>
	</div>
</div>

<!--头部-->
<input type="hidden" id="user_id" value="{$users_id}"/>

<span id="show_service"></span>

<div id="main-retail">
	<p class="dqwz">您当前的位置：{$position}</p>
	<ul class="category-nav">
		<li class="term-list-item">
            <strong class="term">状态：</strong>
            <div class="term-list">
                <div class="desc">
                   <a href="/prize/index/index?stu=-1&flg={$flg}&gid={$gid}&lev={$lev}&zid={$zid}&cid={$cid}&did={$did}" {if $stu eq -1}class="this"{/if}>全部</a>
                    <a href="/prize/index/index?stu=0&flg={$flg}&gid={$gid}&lev={$lev}&zid={$zid}&cid={$cid}&did={$did}" id="wait_link" {if $stu eq 0}class="this"{/if}>待开放({$wait_count})</a>
                    <a href="/prize/index/index?stu=1&flg={$flg}&gid={$gid}&lev={$lev}&zid={$zid}&cid={$cid}&did={$did}" id="open_link" {if $stu eq 1}class="this"{/if}>进行中 ({$open_count}) </a>
                    <a href="/prize/index/index?stu=3&flg={$flg}&gid={$gid}&lev={$lev}&zid={$zid}&cid={$cid}&did={$did}" id="end_link" {if $stu eq 3}class="this"{/if}>已结束 ({$end_count})</a> 
				</div>
	    	</div>
		</li>
		
		<li class="term-list-item">
            <strong class="term">推荐：</strong>
            <div class="term-list">
               <div class="desc">
                    <a href="/prize/index/index?flg=-1&stu={$stu}&gid={$gid}&lev={$lev}&zid={$zid}&cid={$cid}&did={$did}" {if $flg eq -1}class="this"{/if}>全部</a>
                    <a href="/prize/index/index?flg=0&stu={$stu}&gid={$gid}&lev={$lev}&zid={$zid}&cid={$cid}&did={$did}" id="is_flag" {if $flg eq 0}class="this"{/if}>推荐 ({$is_count}) </a>
                    <a href="/prize/index/index?flg=1&stu={$stu}&gid={$gid}&lev={$lev}&zid={$zid}&cid={$cid}&did={$did}" id="no_flag" {if $flg eq 1}class="this"{/if}>不推荐 ({$no_count})</a> 
				</div>
	    	</div>
		</li>
		
		<li class="term-list-item">
            <strong class="term">分类：</strong>
            <div class="term-list">
               <div class="desc">
                    <a href="/prize/index/index?gid=-1&stu={$stu}&flg={$flg}&lev={$lev}&zid={$zid}&cid={$cid}&did={$did}" {if $gid eq -1}class="this"{/if}>全部</a>
                    {if $group_list}
                    	{foreach from=$group_list key=i item=group}
                    	<a href="/prize/index/index?gid={$group.group_id}&stu={$stu}&flg={$flg}&lev={$lev}&zid={$zid}&cid={$cid}&did={$did}" id="group_{$group.group_id}" {if $gid eq $group.group_id}class="this"{/if}>{$group.group_title}({$group.group_total})</a>	
                    	{/foreach}
                    {/if}
				</div>
	    	</div>
		</li>
		
		<li class="term-list-item">
            <strong class="term">级别：</strong>
            <div class="term-list">
               	<div class="desc">
               		<a href="/prize/index/index?lev=-1&stu={$stu}&flg={$flg}&gid={$gid}" {if $lev eq -1}class="this"{/if}>全部</a>
					<a href="/prize/index/index?lev=0&stu={$stu}&flg={$flg}&gid={$gid}" {if $lev eq 0}class="this"{/if}>按店铺</a>
					<a href="/prize/index/index?lev=1&stu={$stu}&flg={$flg}&gid={$gid}" {if $lev eq 1}class="this"{/if}>按地区</a>
					<a href="/prize/index/index?lev=2&stu={$stu}&flg={$flg}&gid={$gid}" {if $lev eq 2}class="this"{/if}>自营店</a>
			 	</div>
	    	</div>
		</li>
		
		{if $zone_list && $lev != 2}
		<li class="term-list-item">
            <strong class="term">省份：</strong>
            <div class="term-list">
               <div class="desc">
               		<a href="/prize/index/index?zid=0&stu={$stu}&flg={$flg}&gid={$gid}&lev={$lev}" {if $zid eq 0}class="this"{/if}>全部</a>
                    {foreach from=$zone_list key=i item=item}
                   	<a href="/prize/index/index?zid={$item.id}&stu={$stu}&flg={$flg}&gid={$gid}&lev={$lev}" {if $zid eq $item.id}class="this"{/if}>{$item.title}</a>
                    {/foreach}
				</div>
	    	</div>
		</li>
		{/if}
		
		{if $city_list && $lev != 2}
		<li class="term-list-item">
            <strong class="term">城市：</strong>
            <div class="term-list">
               <div class="desc">
               		<a href="/prize/index/index?cid=0&zid={$zid}&stu={$stu}&flg={$flg}&gid={$gid}&lev={$lev}" {if $cid eq 0}class="this"{/if}>全部</a>
                    {foreach from=$city_list key=i item=item}
                   	<a href="/prize/index/index?cid={$item.id}&zid={$zid}&stu={$stu}&flg={$flg}&gid={$gid}&lev={$lev}" {if $cid eq $item.id}class="this"{/if}>{$item.title}</a>
                    {/foreach}
				</div>
	    	</div>
		</li>
		{/if}
		
		{if $disc_list && $lev != 2}
		<li class="term-list-item">
            <strong class="term">城市：</strong>
            <div class="term-list">
               <div class="desc">
               		<a href="/prize/index/index?did=0&cid={$cid}&zid={$zid}&stu={$stu}&flg={$flg}&gid={$gid}&lev={$lev}" {if $did eq 0}class="this"{/if}>全部</a>
                    {foreach from=$disc_list key=i item=item}
                   	<a href="/prize/index/index?did={$item.id}&cid={$cid}&zid={$zid}&stu={$stu}&flg={$flg}&gid={$gid}&lev={$lev}" {if $did eq $item.id}class="this"{/if}>{$item.title}</a>
                    {/foreach}
				</div>
	    	</div>
		</li>
		{/if}
	</ul>
	
	<!-- 超级大奖列表 -->
	<div class="main-cont">
		<div class="main-cont-l">
			<div class="rebate-bar">
	        	<div class="rebate-bar-l left">截止目前为止共举办了  <span class="red">{$end_count}</span> 期积分抽奖活动</div>
	            <div class="page rebate-bar-r"></div>
	       	</div>
	       	
	       	{if $prize_list}
	       		{foreach from=$prize_list key=i item=item}
				<input type="hidden" name="prizeID" value="{$item.id}"/>
		       	<div class="rebate-cont">
		       		<div class="rebate-cont-re" style="position:relative;">
		       			<div style="width:148px; height:88px; position:absolute; top:10px;left:380px;">
		       				{if $item.prize_status eq 0}
	            		   	<img src="/images/006.png" width="162" height="101"/>
		       				{/if}
		       				{if $item.prize_status eq 3}
		           			<img src="/images/005.png" width="162" height="101"/>
		            		{/if}
		            	</div>
		            	<div class="rebate-title">
		            		{if $item.prize_status eq 0}
		            		<a href="javascript:void(0)">
		            			<span style="color:red">{$item.prize_code}</span>
		            		</a>	
		            		{/if}
		            		{if $item.prize_status eq 1}
		            		<a href="/prize/index/detail?id={$item.prize_eid}" target="_blank">
		            			<span style="color:red">{$item.prize_code}</span>
		            		</a>
		            		{/if}
		            		{if $item.prize_status eq 3}
		            		<a href="javascript:void(0)">
		            			<span style="color:red">{$item.prize_code}</span>
		            			<span>第{$item.prize_phase}期</span>
		            		</a>	
		            		{/if}
		            		<span>{$item.prize_title}</span>
		            	</div>
		            	<div class="rebate-cont-com">
	                    	<span>最低（{$item.prize_min_num}）人/次开奖</span>
	                        <span>|</span>
	                        <span class="red">{$item.prize_fact_num}</span>人/次已参与
	                        <p>{$item.prize_mssge_text}<span class="red"><b>{$item.prize_shows_text}</b></span>{$item.prize_sport_text}</p>
	                    </div>	
	                    <div class="rebate-cont-button" style="height:64px;">
	                        <div class="txt"><b>{$item.prize_draw_currency}</b>积分</div>
	                        <div class="goto_price left">
	                        	{if $item.prize_status eq 1}
	                           	<a href="/prize/index/detail?id={$item.prize_eid}" target="_blank" title="我要投注"></a>
	                        	{/if}
	                        </div>
	                        <ul>
	                            <li>市场价：<span>{$item.prize_price}元</span></li>
	                            <li>状态：
	                            	<span>
	                            		{if $item.prize_status eq 0}
	                            		待开放
	                            		{else if $item.prize_status eq 1}
	                            		进行中
	                            		{else if $item.prize_status eq 3}
	                            		已结束
	                            		{/if}
	                            	</span>
	                            </li>
	                        </ul>
	                    </div>
	                    <div style="height:64px;"><!--补--></div>
	                    <div class="rebate-cont-time">
							{if $item.prize_status eq 1}
	                    	<span id="span_prize_bet_time_{$item.id}"></span>
	                    	{/if}
	                    	{if $item.prize_status eq 3 && $item.prize_user_publish eq 0}
	                    	<a href="/prize/index/notice?pid={$item.prize_eid}" target="_blank">恭喜{$item.user_province}{$item.user_city}{$item.user_district}({$item.user_name}-{$item.user_mobile})获得本期奖品</a>
	                   		{/if}
	                    </div>
		       		</div>
                    <div class="rebate-cont-img">
                    	{if $item.prize_status eq 1}
                    	<a href="/prize/index/detail?id={$item.prize_eid}" target="_blank"><img src="{$item.prize_picture}"/></a>
                    	{else}
                    	<a href="javascript:void(0)"><img src="{$item.prize_picture}"/></a>
                    	{/if}
                    </div>
                    
		       	</div>
	       		{/foreach}
				<div class="page">
					{if $prize_list && $prize_page.nc != 1}															
						{if $prize_page.has_prev != 0}
			            	<a class="pagebox_pre_nolink" href="/prize/index/index?rn={$prize_page.rn}&pn={$prize_page.pn-1}&lev={$lev}&stu={$stu}&flg={$flg}&gid={$gid}&zid={$zid}&cid={$cid}&did={$did}">上一页</a>
						{/if}
						{foreach from=$prize_page.display_pages key=i item=item}
							<a class="{if $prize_page.pn eq $item} pagebox_num_nonce current{else}pagebox_num {/if}" href="{if $prize_page.pn eq $item} javascript:void(0) {else} /prize/index/index?rn={$prize_page.rn}&pn={$item}&lev={$lev}&stu={$stu}&flg={$flg}&gid={$gid}&zid={$zid}&cid={$cid}&did={$did} {/if}" >{$item}</a>
						{/foreach}
						{if $prize_page.has_next != 0}
			            	<a class="pagebox_next" id="pagelist" href="/prize/index/index?rn={$prize_page.rn}&pn={$prize_page.pn+1}&lev={$lev}&stu={$stu}&flg={$flg}&gid={$gid}&zid={$zid}&cid={$cid}&did={$did}"> 下一页</a>
			            {/if}
					{/if}
				</div>
	       	{/if}
		</div>
		
		<!-- 中奖公告 -->
		<div class="yui-b-r">
			<div class="hot-cont">
	        	<div class="rebate-bar list-title">中奖公告</div>
	        	<div class="hot-list">
	        		<ul>
	        		{if $note_list}
	        			{foreach from=$note_list key=i item=item}
	        			<li>
	        				<div class="hot-bg bg{$i+1} left"></div>
	        				<div class="hot-list-cont left">
	        					<ul class="list-r">
	        						<li class="hot-list-name"><a href="/prize/index/notice?pid={$item.encty_id}" target="_blank">恭喜{$item.user_province}{$item.user_city}({$item.user_name}){$item.user_mobile}获得第{$item.prize_phase}期奖品</a></li>
	        						<li class="list-r-c"><span>{$item.prize_title}</span></li>
	        					</ul>
	        				</div>
	        			</li>
	        			{/foreach}
	        		{/if}
	        		</ul>
	        	</div>
	        </div>        
			<div class="hot-cont" style="margin-top:10px;">
				<div class="rebate-bar list-title">游戏规则</div>
				<div class="hot-list">{$prize_rule}</div>
			</div>
		</div>
		
	</div>
</div>
<script type="text/javascript" src="/page/index/index/index.js"></script>
{include file="common/widgets/footer/footer.tpl"} 
</body>
</html>