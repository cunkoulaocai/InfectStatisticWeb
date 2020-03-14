<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>疫情统计app</title>
	<script src="${pageContext.request.contextPath }/js/echarts.min.js"></script>
	<script src="${pageContext.request.contextPath }/js/china.js"></script>
	<script src="${pageContext.request.contextPath }/js/Date.prototype.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.min.css">
	<style type="text/css">
		.header > button {
			height: 24px;
			width: 24px;
			border-color: #6200EE;
			margin-left: 24px;
			font-size: 30px;
		}
		.city-block {
			display: inline-block;
			width: 65px;
			height: 37px;
			background-color: #5200EE;
			border-radius: 5px;
			color: #FFF;
			line-height: 37px;
			text-align: center;
			font-size: 14px;
		}
		.search {
			width: 346px;
			height: 44px;
			margin:5px auto;
			border-radius: 5px;
			box-shadow: 3px 3px 5px #000;
			border: 1px solid black;
		}
		
		.search > input {
			display: inline-block;
			width: 290px;
			border: 0;
			margin-left: 1px;
			outline: none;
			border-radius: 5px;
			padding: 0px;
		}
		
		.search > div {
			height: 42px;
			width: 49px;
			background-color: #6200EE; 
			display: inline-block;
			text-align: center;
			font-size: 28px;
		}
		
		
		
		.search-icon {
			line-height: 42px;
		}
		.select-city {
			width: 346px;
			height: 180px;
			margin:5px auto;
			border-radius: 5px;
		}
		
		.select-city-header {
			width: 346px;
			height: 22px;
			
		}
		.select-city-header p:first-child {
			float: left;
			font-size: 14px;
			color: #333;
			line-height: 22px;
			margin-left: 20px;
		}
		.select-city-header p:last-child {
			float: right;
			font-size: 14px;
			color: #AAAAAA;
			line-height: 22px;
			margin-right: 20px;
		}
		
		.select-city-mid {
			clear: both;
			
		}
		
		.select-city-mid span {
			margin: 5px;
		}
		
		.select-city-mid span:hover {
			background-color: blue;
		}
		.hot {
			height: 20px;
			width: 340px;
		}
		.hot p:first-child {
			float: left;
		}
		
		.hot p:last-child {
			float: right;
		}
		.switch {
			width: 333px;
			height: 37px;
			background-color: #6200EE;
			margin:5px auto;
		}
		
		.switch li {
			width: 105px;
			height: 37px;
			background-color: #6200EE;
			color: white;
			font-size: 14px;
			line-height: 37px;
			text-align: center;
		}
		
		.switch li a {
			padding: 0 2px;
			color: white;
		}
		.switch li a:hover {
			background-color: #337ab7;
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
		
		.switch li {
			width: 105px;
			height: 37px;
			background-color: #6200EE;
			color: white;
			font-size: 14px;
			line-height: 37px;
			text-align: center;
		}
		
		.switch li a {
			padding: 0 2px;
			color: white;
		}
		.switch li a:hover {
			background-color: #337ab7;
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
			<span style="font-size: 20px;color: white;line-height: 20px;margin-left: 10px;">疫情趋势</span>
			<button type="button" class="btn btn-default" aria-label="Justify" style="height: 60px;width: 40px;
					background-color: #6200EE;border-color: #6200EE;float: right;margin-right: 10px;">
			  	<span class="glyphicon glyphicon-option-vertical" aria-hidden="true" style="font-size: 30px;color: white;"></span>
			</button>

		</div>
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
		<div id="body" style="width: 360px;height:546px;"> 
			<!-- 搜索框 -->
			<div class="search">
				<input type="text" placeholder="请输入省份">
				<div>
					<span class="glyphicon glyphicon-search search-icon" aria-hidden="true"></span>
				</div>
			</div>
			
			<!-- 选择城市 -->
			<div class="select-city">
				<div class="select-city-header">
					<p>热门省份</p>
					<p>省份列表</p>
				</div>
				<div class="select-city-mid">
					<span class="label label-default city-block" id="湖北省">湖北省</span>
					<span class="label label-default city-block" id="浙江省">浙江省</span>
					<span class="label label-default city-block" id="湖南省">湖南省</span>
					<span class="label label-default city-block" id="江苏省">江苏省</span>
					<span class="label label-default city-block" id="福建省">福建省</span>
				</div>
				
				<div class="select-city-buttom" style="height: 48px;width: 340px;margin: 2px auto;">
					<span style="font-size: 15px;line-height: 48px;color: #333;">你现在选择的省份是:</span>
					<span class="label label-primary city-block" id="show"></span>
				</div>
			</div>
			
			<!-- 切换选项 -->
			<div class="switch">
				<ul class="nav nav-pills">
				  	<li role="presentation" class="active" id="total">全国总体趋势</li>
				  	<li role="presentation" id="now">全国累积确诊</li>
				  	<li role="presentation" id="dead">全国累计死亡</li>
				</ul>
			</div>   
			
			
			
			
			<!-- 图表 -->
			<div id="chart" style="width: 334px;height: 263px;margin: 0 auto;"></div>
			<!-- <div id="main" style="width: 334px;height: 263px;margin: 0 auto;display: none;"></div>
			<div id="main" style="width: 334px;height: 263px;margin: 0 auto;display: none;"></div> -->
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
    
<script type="text/javascript" src="${pageContext.request.contextPath }/data/getTrenddata.js"></script>
    

	
	
</body>
</html>