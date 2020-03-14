<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>疫情统计app</title>

	<script src="${pageContext.request.contextPath }/js/echarts.min.js"></script>
	<script src="${pageContext.request.contextPath }/js/china.js"></script>
	<script src="${pageContext.request.contextPath }/js/jquery-3.3.1.js"></script>
	<script src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.min.css">
	<style type="text/css">
		.news-block {
			width: 336px;
			height: 166px;
			border-radius: 10px;
			border: 1px solid #6403EF;
			box-shadow: 3px 3px 3px #000000;
			margin: 15px auto;
		}
		.news-block img {
			float: left;
			width: 65px;
			height: 65px;
			margin-left: 10px;
			margin-top: 1px;
		}
		.news-block > h1{
			font-size: 20px;
			float: left;
			margin-left: 20px;
			
		}
		
		.news-block > p {
			font-size: 13px;
			color: rgba(127,127,127,0.85);
			clear: both;
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
		
		::-webkit-scrollbar {
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
			  	<span class="glyphicon glyphicon-align-left popup-icon" aria-hidden="true" style="font-size: 30px;color: white;"></span>
			</button>	
			<span style="font-size: 20px;color: white;line-height: 20px;margin-left: 10px;">谣言粉碎机</span>
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
		<div id="body" style="width: 360px;height: 546px;overflow: auto;">
			<!-- 制作假新闻的盒子 -->
			<div class="news-block">
				<img alt="谣" src="${pageContext.request.contextPath}/images/rumor-images.png">
				<h1 class="title">专家说:抢购双黄连?</h1>
				<p class="content" style="width: 296px;height: 54px;margin: 0 auto;">2013和2014年的国家药品不良反应监测年度报告显示，双黄连合剂（口服液、颗粒、胶囊、片）在中成药口服制剂中不良反应中分列第二名和第一名....</p>
				<p class="source" style="float: right;margin-top: 10px;margin-right: 10px;"><a href="#">查看源消息</a></p>
			</div>
			
			<div class="news-block">
				<img alt="谣" src="${pageContext.request.contextPath}/images/rumor-images.png">
				<h1 class="title">专家说:抢购双黄连?</h1>
				<p  class="content" style="width: 296px;height: 54px;margin: 0 auto;">2013和2014年的国家药品不良反应监测年度报告显示，双黄连合剂（口服液、颗粒、胶囊、片）在中成药口服制剂中不良反应中分列第二名和第一名....</p>
				<p class="source" style="float: right;margin-top: 10px;margin-right: 10px;"><a href="#">查看源消息</a></p>
			</div>
			
			<div class="news-block">
				<img alt="谣" src="${pageContext.request.contextPath}/images/rumor-images.png">
				<h1 class="title">专家说:抢购双黄连?</h1>
				<p  class="content" style="width: 296px;height: 54px;margin: 0 auto;">2013和2014年的国家药品不良反应监测年度报告显示，双黄连合剂（口服液、颗粒、胶囊、片）在中成药口服制剂中不良反应中分列第二名和第一名....</p>
				<p class="source" style="float: right;margin-top: 10px;margin-right: 10px;"><a href="#">查看源消息</a></p>
			</div>
			<div class="news-block">
				<img alt="谣" src="${pageContext.request.contextPath}/images/rumor-images.png">
				<h1 class="title">专家说:抢购双黄连?</h1>
				<p class="content" style="width: 296px;height: 54px;margin: 0 auto;">2013和2014年的国家药品不良反应监测年度报告显示，双黄连合剂（口服液、颗粒、胶囊、片）在中成药口服制剂中不良反应中分列第二名和第一名....</p>
				<p class="source" style="float: right;margin-top: 10px;margin-right: 10px;"><a href="#">查看源消息</a></p>
			</div>
		</div>
		
		<!-- 底栏 -->
		<div id="footer" class="footer" style="width: 360px;height: 54px;background-color: #FACD91;">
			<p class="left">如果你有意支持武汉!!&nbsp;&nbsp;&nbsp;&nbsp;请点:</p>
			<p class="right">一定爱心</p>
		</div>
	</div>
	

	<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.3.1.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
	<script type="text/javascript">
	$(function() {
		$(".popup-icon").click(function() {
			$("#popup").slideToggle();
		})
	})
	</script>


<script type="text/javascript" src="${pageContext.request.contextPath }/data/getRumor.js"></script>

	

</body>
</html>