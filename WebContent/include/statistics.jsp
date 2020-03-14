<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>疫情统计app</title>

	<script src="${pageContext.request.contextPath }/js/echarts.min.js"></script>
	<script src="${pageContext.request.contextPath }/js/china.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.min.css">
	<style type="text/css">
	
		.info-block {
			height: 60px;
			width: 100px;
			position: absolute;
		}
		
		.info-block:first-child {
			top: 2px;
			left: 15px;
		}
		
		.info-block:nth-child(2) {
			top: 2px;
			left: 135px;
		}
		
		.info-block:nth-child(3) {
			top: 2px;
			left: 255px;
		}
		.info-block:nth-child(4) {
			top: 75px;
			left: 15px;
		}
		
		.info-block:nth-child(5) {
			top: 75px;
			left: 135px;
		}
		
		.info-block:nth-child(6) {
			top: 75px;
			left: 255px;
		}
		.info-block > h1 {
			font-size: 18px;
			color: #353535;
			margin: 2px auto;
			text-align: center;
		}
		
		.info-block > p {
			font-size: 16px;
			margin: 0 auto;
			text-align: center;
		}
		
		.info-block p:last-child {
			font-size: 14px;
			margin: 0;
		}
		#info-header {
			height: 85px;
		}
		
		#info-header-line {
			height: 4px;
			width: 240px;
			margin: 1px auto;
			background-color: #D9001B;
		}
		#info-header-line:first-child {
			width: 140px;
			height: 4px;
			display: inline-block;
			background-color: #D9001B;
		}
		#info-header-line:nth-child(2) {
			width: 100px;
			height: 4px;
			display: inline-block;
			background-color: rgba(236, 128, 141, 0.6);
		}
		#static-button {
			margin: 3px auto;
			width: 250px;
			height: 40px;
			border-radius: 15px;
			font-size: 20px;
			background-color: #D9001B;
		}
		
		#data-main > div {
			margin-top: 2px;
			padding: 0;
		}
		#info-buttom {
			height: 30px;
			width: 300px;
			margin: 2px auto;
			border-color: black;
		}
		#info-buttom-line {
			width: 240px;
			height: 4px;
			background-color: rgba(98, 0, 238, 0.6);
			margin: 1px auto;
		}
		/* 信息页面的最下面部分 */
		#info-buttom > button {
			height: 26px;
			width: 268px;
			background-color: #D7D7D7;
			font-size: 13px;
			color: #333333;
			text-align: center;
			display: inline-block;
			margin-left: 10px;
		}
		.footer {
			position: absolute;
			left: 0;
			top: 606px;
		}
		
		.footer .left{
			float: left;
			height: 50px;
			line-height: 50px;
			color: #EC808D;
		}
		
		.footer .right {
			float: right;
			height: 50px;
			line-height: 50px;
			color: #6200EE;
			margin-right: 100px;
			font-size: 15px;
		}
		
		#popup {
			width: 212px;
			height: 519px;
			position: absolute;
			background-color: #8080FF;
			display: none;
			z-index: 999;
		}
		
		.blogroll {
			font-size: 18px;
			border-color: #8080FF;
			
		}
		
		.blogroll li {
			background-color: #8080FF;
			border: 0px;
		}
		.blogroll a {
			color: black;
		}
		
	</style>
</head>
<body>
	<div id="wapper" style="width: 360px;height: 660px;">
		<!-- 头部区域 -->
		<div id="header" style="width: 360px;height: 60px;background-color: #6200EE;">
			<button type="button" class="btn btn-default" aria-label="Justify" style="height: 60px;width: 40px;
					background-color: #6200EE;border-color: #6200EE;">
			  	<span class="glyphicon glyphicon-align-left popup-icon" aria-hidden="true" style="font-size: 30px;color: white;"></span>
			</button>	
			<span style="font-size: 20px;color: white;line-height: 20px;margin-left: 10px;">疫情统计</span>
			<button type="button" class="btn btn-default" aria-label="Justify" style="height: 60px;width: 40px;
					background-color: #6200EE;border-color: #6200EE;float: right;margin-right: 10px;">
			  	<span class="glyphicon glyphicon-option-vertical" aria-hidden="true" style="font-size: 30px;color: white;"></span>
			</button>
		</div>
		
		<!-- 弹出框 -->
		<div id="popup">
			<p style="height: 52px;width: 212px;font-size: 20px;margin: 10px 0px;">疫情</p>
			<ul class="list-group blogroll">
			  <li class="list-group-item"><a href="statistics.jsp">疫情统计</a></li>
			  <li class="list-group-item"><a href="tendency.jsp">疫情趋势</a></li>
			  <li class="list-group-item"><a href="news.jsp">疫情新闻</a></li>
			  <li class="list-group-item"><a href="rumor-broken.jsp">谣言粉碎机</a></li>
			  <li class="list-group-item"><a href="medical-information.jsp">医疗信息查询</a></li>
			  <li class="list-group-item"><a href="contribution.jsp">奉献</a></li>
			</ul>
		</div>
		
		<!-- 身体区域 -->
		<div id="body" style="width: 360px;height: 546px;">
			<!-- 按钮+实时数据标签+横线 -->
			<div id="info-header">
				<button type="button" class="btn btn-primary btn-lg btn-block" id="static-button">疫情统计</button>
				<div id="update_time" style="margin: 0 auto;border-radius: 15px;width: 120px;height: 24px;border: 1px solid #009999;
					font-size: 12px;line-height: 24px;"></div>
				<div id="info-header-line">
					<div></div>
					<div></div>
				</div>
			</div>
			<!-- 显示信息区域 -->
			<div id="info" style="width: 360px; height: 150px;position: relative;">
				
				<!-- 显示6个数据项 -->
				<div class="info-block">
					<h1>累计确诊</h1>
					<p id="confirm" style="color: #D9001B;"></p>
					<p id="confirmAdd"></p>
				</div>
				<div class="info-block">
					<h1>现存确诊</h1>
					<p  id="nowConfirm" style="color: #FF6A57;"></p>
					<p id="nowconfirmAdd"></p>
				</div>
				<div class="info-block">
					<h1>现存重症</h1>
					<p  id="nowSevere" style="color: #476DA0;">51325</p>
					<p id="SevereAdd"></p>
				</div>
				<div class="info-block">
					<h1>现存疑似</h1>
					<p id="suspect" style="color: #02A7F0;">51325</p>
					<p id="suspectAdd"></p>
				</div>
				<div class="info-block">
					<h1>累计死亡</h1>
					<p id="dead" style="color: #A30014;">51325</p>
					<p id="deadAdd"></p>
				</div>
				<div class="info-block">
					<h1>累计治愈</h1>
					<p id="heal" style="color: #70B603;">51325</p>
					<p id="healAdd"></p>
				</div>		

			</div>    
			<!-- 下横线+切换按钮 -->
			<div id="info-buttom">
				<div id="info-buttom-line">
					<div></div>
					<div></div>
				</div>
				<!--  <button type="button" class="btn btn-primary">现存确诊</button> -->
				<button type="button" class="btn btn-primary">全国主要疫情信息</button>
			</div>
			<!-- 图表区域 -->
			<div id="main" style="width: 360px;height: 250px;margin: 0 auto;"></div>
		</div>
		
		<!-- 底栏 -->
		<div id="footer" class="footer" style="width: 360px;height: 54px;background-color: #FACD91;">
			<p class="left">如果你有意支持武汉!!&nbsp;&nbsp;&nbsp;&nbsp;请点:</p>
			<p class="right">一定爱心</p>
		</div>
	</div>
	
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.3.1.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
	<script>
		$(function() {
			$(".popup-icon").click(function() {
				$("#popup").slideToggle();
			})
		})
	</script>
	
<script type="text/javascript" src="${pageContext.request.contextPath }/data/getStatistic.js"></script>

</body>
</html>