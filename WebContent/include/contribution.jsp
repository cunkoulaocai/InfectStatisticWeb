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
			width: 134px;
			background-color: #D7D7D7;
			font-size: 13px;
			color: #333333;
			text-align: center;
			display: inline-block;
			margin-left: 10px;
		}
		.footer li {
			margin: 5px 0;
			font-size: 20px;
			color: black;
			width: 118px;
			text-align: center;
			line-height: 48px;
			margin: 0 auto;
		}
		
		.footer li:hover {
			color: #6200EE;
		}
		#main {
			width: 212px;
			height: 519px;
			position: absolute;
			background-color: #8080FF;
			top: 40px;
			display: none;
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
			  	<span id="pupup" class="glyphicon glyphicon-align-left popup-icon" aria-hidden="true" style="font-size: 30px;color: white;"></span>
			</button>	
			<span style="font-size: 20px;color: white;line-height: 20px;margin-left: 10px;">奉献</span>
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
			<ul class="nav nav-pills nav-stacked">
			  <li role="presentation"><a href="#">微博:</a></li>
			  <li role="presentation"><a href="#">官网</a></li>
			</ul>
		</div>
		
		<!-- 底栏 -->
		<div id="footer" class="footer" style="width: 360px;height: 54px;">
			<!-- 底栏 -->
			<ul class="nav nav-pills">
			  	<li role="presentation"><span class="glyphicon glyphicon-earphone" aria-hidden="true"></span></li>
			  	<li role="presentation"><span class="glyphicon glyphicon-heart" aria-hidden="true"></span></li>
			  	<li role="presentation"><span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span></li>
			</ul>
		
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


</body>
</html>