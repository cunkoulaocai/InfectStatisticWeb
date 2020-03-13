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
	<script src="${pageContext.request.contextPath }/js/jquery-3.3.1.js"></script>
	<script src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.min.css">
	<style type="text/css">
		
		.body::-webkit-scrollbar {
			display: none;
		}
		.news-block {
			width: 350px;
			height: 120px;
			box-shadow: 3px 3px 5px rgba(0,0,0,0.35);
			border-radius: 5px;
			margin: 5px auto;
			float: left;
				
		}
		.new-block::hover {
			cursor: pointer;
		}
		.news-block h1 {
			font-size: 18px;
			font-weight: 700;
			margin-left:3px;
			margin: 3px;
		}
		
		.news-block .time {
			font-size: 12px;
			color: rgba(0,0,0,0.7);
			margin-left:3px;
			margin-bottom: 0;
		}
		
		.news-block .content {
			font-size: 10px; 
			margin-top: 2px;
			margin-bottom: 0;
			margin-left:3px;
			text-indent: 4px;
		}
		
		.news-block .source {
			font-size: 12px;
			color: rgba(0,0,0,0.7);
			margin-left:3px;
			margin-bottom: 0;
		}
		#footer {
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
	</style>
</head>
<body>
	<div id="wapper" style="width: 360px;height: 660px;">
		<!-- 头部区域 -->
		<div id="header" style="width: 360px;height: 60px;background-color: #6200EE;">
			<button type="button" class="btn btn-default" aria-label="Justify" style="height: 60px;width: 40px;
					background-color: #6200EE;border-color: #6200EE;">
			  	<span class="glyphicon glyphicon-align-left" aria-hidden="true" style="font-size: 30px;color: white;"></span>
			</button>	
			<span style="font-size: 20px;color: white;line-height: 20px;margin-left: 10px;">疫情新闻</span>
			<button type="button" class="btn btn-default" aria-label="Justify" style="height: 60px;width: 40px;
					background-color: #6200EE;border-color: #6200EE;float: right;margin-right: 10px;">
			  	<span class="glyphicon glyphicon-option-vertical" aria-hidden="true" style="font-size: 30px;color: white;"></span>
			</button>
		</div>
		
		
		<!-- 身体区域 -->
		<div id="body" style="width: 360px;height:546px;overflow: auto;">
			<div class="news-block">
				<h1 class="title"></h1>
				<p class="time">发布时间<span>2020/3/3 23:01</span></p>
				<div class="content">为了减少患者聚集，医院严格实行了预检分诊制度，初诊患者可通过网络、电话、现场预约等方式选择就诊时段，而对于复诊患者，医院引导使用互联网诊疗</div>
				<p class="source">信息来源:<span>人民网</span></p>
			</div>
			<div class="news-block">
				<h1 class="title">抗击疫情：疫情期间保证日常诊疗秩序</h1>
				<p class="time">发布时间<span>2020/3/3 23:01</span></p>
				<div class="content">为了减少患者聚集，医院严格实行了预检分诊制度，初诊患者可通过网络、电话、现场预约等方式选择就诊时段，而对于复诊患者，医院引导使用互联网诊疗</div>
				<p class="source">信息来源:<span>人民网</span></p>
			</div>
			<div class="news-block">
				<h1 class="title">抗击疫情：疫情期间保证日常诊疗秩序</h1>
				<p class="time">发布时间<span>2020/3/3 23:01</span></p>
				<div class="content">为了减少患者聚集，医院严格实行了预检分诊制度，初诊患者可通过网络、电话、现场预约等方式选择就诊时段，而对于复诊患者，医院引导使用互联网诊疗</div>
				<p class="source">信息来源:<span>人民网</span></p>
			</div>
			<div class="news-block">
				<h1 class="title">抗击疫情：疫情期间保证日常诊疗秩序</h1>
				<p class="time">发布时间<span>2020/3/3 23:01</span></p>
				<div class="content">为了减少患者聚集，医院严格实行了预检分诊制度，初诊患者可通过网络、电话、现场预约等方式选择就诊时段，而对于复诊患者，医院引导使用互联网诊疗</div>
				<p class="source">信息来源:<span>人民网</span></p>
			</div>
			<div class="news-block">
				<h1 class="title">抗击疫情：疫情期间保证日常诊疗秩序</h1>
				<p class="time">发布时间<span>2020/3/3 23:01</span></p>
				<div class="content">为了减少患者聚集，医院严格实行了预检分诊制度，初诊患者可通过网络、电话、现场预约等方式选择就诊时段，而对于复诊患者，医院引导使用互联网诊疗</div>
				<p class="source">信息来源:<span>人民网</span></p>
			</div>
		</div>
		
		<!-- 底栏 -->
		<div id="footer" class="footer" style="width: 360px;height: 54px;background-color: #FACD91;">
			<p class="left">如果你有意支持武汉!!&nbsp;&nbsp;&nbsp;&nbsp;请点:</p>
			<p class="right">一定爱心</p>
		</div>
	</div>
<script>	
	function getNewsData(){
		console.log("111")
		$.ajax({
			   url : "http://www.dzyong.top:3005/yiqing/news",
			   dataType: "json",
			   success : function(data) {
				   var news = data.data;
				   var newArr = [];
				   //console.log(data.data)
	       		   console.log(news[0].createTime)
	       		   for (var i = 0; i < news.length; i++) {
	       			var json = {
	     	               title: news[i].title,
	     	               time: news[i].createTime,
	     	               content: news[i].summary,
	     	               source: news[i].infoSource,
	     	             }
	       			newArr.push(json)
	       		   }
	       		   console.log(newArr)
				   
				   var titles = document.getElementsByClassName("title");
				   var times = document.getElementsByClassName("time");
				   var contents = document.getElementsByClassName("content");
				   var sources = document.getElementsByClassName("source");
				   for(var i=0;i<titles.length;i++) {
					   titles[i].innerHTML=newArr[i].title.substring(0,20)+"..";
					   times[i].innerHTML=newArr[i].time;
					   contents[i].innerHTML=newArr[i].content;
					   sources[i].innerHTML=newArr[i].source;
					   }
	       		   }
		
	});
	}
	
    getNewsData();
</script>

</body>
</html>