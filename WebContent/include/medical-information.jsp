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
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.3.1.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap-multiselect.css">
	<script src="${pageContext.request.contextPath }/js/bootstrap-multiselect.js"></script>
	<style type="text/css">
		
		/* body部分 */
		.body::-webkit-scrollbar {
			display: none;
		}
		
		.info {
			width: 347px;
			height: 200px;
			margin: 5px auto 15px; auto;
			
			border-radius: 5px;
			box-shadow: 2px 2px 5px rgba(0,0,0,0.35);
		}
		
		.info-select {
			width: 330px;
			height: 35px;
			line-height: 35px;
			margin: 0 auto;
			
		}
		.info-title {
			font-size: 20px;
			margin-left: 10px;
		}
		.info-select p {
			margin-left: 20px;
			font-size: 18px;
		}
		
		.info-select div {
			width: 120px;
		}
		
		.info-select div button {
			width: 120px;
		}
		.info-show {
			width: 330px;
			margin: 10px auto;
			height: 120px;
		}
		
		.address-select-left {
			float: left;
		}
		
		.address-select-right {
			float: right;
			width: 150px;
			margin-right: 10px;
		}
		.select {
			width: 347px;
			height: 40px;
			margin: 1px auto 5px auto;
		}
		
		.medical-info {
			width: 347px;
			height: 275px;
			margin: 2px auto;
			border-radius: 5px;
			box-shadow: 2px 2px 5px rgba(0,0,0,0.35);
			overflow: auto;
		}
		
		.hospital {
			height: 75px;
			border-bottom: 1px solid rgb(215,215,215);
		}
		.hospital-left {
			float: left;
			width: 53px;
			padding: 2px;
			color: #515151;
		}
		
		.hospital-mid {
			float: left;
			width: 184px;
		}
		
		.hospital-mid >p:first-child {
			font-size: 14px;
		}
		
		.hospital-mid >p:last-child {
			font-size: 12px;
		}
		.hospital-right {
			float: right;
			font-size: 14px;
			color: rgb(170,170,170);
		}
		/* 底部 */
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
		
		textarea {
			resize: none;
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
			<span style="font-size: 20px;color: white;line-height: 20px;margin-left: 10px;">医疗信息查询</span>
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
		<div id="body" style="width: 360px;height:546px;overflow: auto;">
			<!-- 上半部分信息栏 -->
			<div class="info" id="info">
				<p class="info-title">医疗信息查询</p>
				<!-- Single button -->
				<div class="info-select">
					<p class="address-select-left">请选择你的位置</p>
					<div class="btn-group address-select-right">
					  	<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown"
					  	 aria-haspopup="true" aria-expanded="false"s>
					    	定位 <span class="caret"></span>
					  	</button>
					  	<ul class="dropdown-menu">
					    	<li><a href="#">定位</a></li>
					    	<li><a href="#">自定义</a></li>    
					  	</ul>
					</div>
				</div>
				
				
				<div class="info-show">
					<p style="margin-left: 20px;">你的位置是</p>
					<textarea rows="3" cols="40" style="margin-left: 15px;" disabled="disabled">福建省福州市</textarea>
				</div>
			</div>
			
			<!-- 中间多选框 -->
			<div class="select" id="select">
				<!-- Build your select: -->
				<select id="example-getting-started" multiple="multiple">
				    <option value="cheese" selected="selected" style="height: 40px;">医院</option>
				    <option value="tomatoes">诊所</option>
				    <option value="mozarella">药店</option>
				    <option value="mushrooms">隔离区</option>
				</select>
				<button type="button" class="btn btn-primary" 
					style="width: 70px;height: 37px;background-color: #6200EE;">搜索</button>
			</div>
			
			<!-- 下半部分显示信息 -->
			<div class="medical-info" id="medical-info">
				<!-- 显示一个医疗信息 -->
				<div class="hospital">
					<div class="hospital-left">
						<span class="glyphicon glyphicon-briefcase" aria-hidden="true" style="font-size: 40px;
						padding: 5px;margin-top: 5px;"></span>
					</div>
					<div class="hospital-mid">
						<p style="margin-top: 5px;margin-bottom: 2px;">XXXX战地医院</p>
						<p style="margin-top: 0px;">福建省福州市闽侯县上街镇学院路二号学生公寓29号楼</p>
					</div>
					<div class="hospital-right" style="margin-top: 40px;margin-right: 10px;">距离<span>0.2KM</span></div>
				</div>
				<!-- 显示一个医疗信息 -->
				<div class="hospital">
					<div class="hospital-left">
						<span class="glyphicon glyphicon-briefcase" aria-hidden="true" style="font-size: 40px;
						padding: 5px;margin-top: 5px;"></span>
					</div>
					<div class="hospital-mid">
						<p style="margin-top: 5px;margin-bottom: 2px;">XXXX战地医院</p>
						<p style="margin-top: 0px;">福建省福州市闽侯县上街镇学院路二号学生公寓29号楼</p>
					</div>
					<div class="hospital-right" style="margin-top: 40px;margin-right: 10px;">距离<span>0.2KM</span></div>
				</div>
				<!-- 显示一个医疗信息 -->
				<div class="hospital">
					<div class="hospital-left">
						<span class="glyphicon glyphicon-briefcase" aria-hidden="true" style="font-size: 40px;
						padding: 5px;margin-top: 5px;"></span>
					</div>
					<div class="hospital-mid">
						<p style="margin-top: 5px;margin-bottom: 2px;">XXXX战地医院</p>
						<p style="margin-top: 0px;">福建省福州市闽侯县上街镇学院路二号学生公寓29号楼</p>
					</div>
					<div class="hospital-right" style="margin-top: 40px;margin-right: 10px;">距离<span>0.2KM</span></div>
				</div>
				<!-- 显示一个医疗信息 -->
				<div class="hospital">
					<div class="hospital-left">
						<span class="glyphicon glyphicon-briefcase" aria-hidden="true" style="font-size: 40px;
						padding: 5px;margin-top: 5px;"></span>
					</div>
					<div class="hospital-mid">
						<p style="margin-top: 5px;margin-bottom: 2px;">XXXX战地医院</p>
						<p style="margin-top: 0px;">福建省福州市闽侯县上街镇学院路二号学生公寓29号楼</p>
					</div>
					<div class="hospital-right" style="margin-top: 40px;margin-right: 10px;">距离<span>0.2KM</span></div>
				</div>
			</div>
		</div>
		
		<!-- 底栏 -->
		<div id="footer" class="footer" style="width: 360px;height: 54px;background-color: #FACD91;">
			<p class="left">如果你有意支持武汉!!&nbsp;&nbsp;&nbsp;&nbsp;请点:</p>
			<p class="right">一定爱心</p>
		</div>
	</div>
	
	
	<script>
	$(function() {
			$(".popup-icon").click(function() {
				$("#popup").slideToggle();
			})
			$('#example-getting-started').multiselect({
	            buttonWidth: '269px',
	            dropRight: true,
	            includeResetOption: true
	        });
		})
	</script>
</body>
</html>