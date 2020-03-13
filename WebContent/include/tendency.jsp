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
			<span style="font-size: 20px;color: white;line-height: 20px;margin-left: 10px;">疫情趋势</span>
			<button type="button" class="btn btn-default" aria-label="Justify" style="height: 60px;width: 40px;
					background-color: #6200EE;border-color: #6200EE;float: right;margin-right: 10px;">
			  	<span class="glyphicon glyphicon-option-vertical" aria-hidden="true" style="font-size: 30px;color: white;"></span>
			</button>
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
	var myChart = echarts.init(document.getElementById('chart'));
	var dataSource = [];
	var dimensions = ['日期', '累计确诊', '现有确诊（含重症）', '现有疑似', '现有重症', '累计死亡', '累计治愈',
		'累计确诊+现有疑似', '新增确诊', '新增疑似', '新增(疑似+确诊)', '观察中', '死亡/确诊'];
	options = {
		title: {
			text: '全国新型肺炎疫情趋势',
			x: 'center',
			y: 'top',
			top: '15px',
			subtext: '(支持缩放及左右滑动)',
			subtextStyle: {
				fontSize: 12
			}
		},
		legend: {
			type: 'scroll',
			x: 'center',
			y: 'bottom',
			padding: [0, 20],
			itemGap: 3,
			selected: {}
		},
		grid: {
			left: '15%',
			bottom: '40px'
		},
		tooltip: {},
		dataset: {
			dimensions: dimensions,
			source: dataSource,
		},
		xAxis: { type: 'category' },
		yAxis: {},
		dataZoom: [
			{
				type: 'inside',
				throttle: '50',
				minValueSpan: 7,
				start: 100,
				end: 100
			}],
		series: [	
			{ type: 'bar' },
			{ type: 'bar' },
			{ type: 'bar' },
			{ type: 'bar' },
			{ type: 'bar' },
			{ type: 'bar' },
			{
				type: 'line',
				label: {
					normal: {
						show: true,
						position: 'top',
					},
	
	
				}
			},
			{
				type: 'line',
				label: {
					normal: {
						show: true,
						position: 'top',
					},
	
	
				}
			},
			{
				type: 'line',
				label: {
					normal: {
						show: true,
						position: 'top',
					},
	
	
				}
			},
			{
				type: 'line',
				label: {
					normal: {
						show: true,
						position: 'top',
					}
				}
			},
			{
				type: 'line',
				label: {
					normal: {
						show: true,
						position: 'top',
					}
				}
			},
			{
				type: 'line',
				label: {
					normal: {
						show: true,
						position: 'top',
						formatter: function (params) {
							str = params.data['死亡/确诊'] + '%'
							return str;
						}
					}
				},
				tooltip: {
					formatter: function (item) {
						str = item.seriesName + "<br>"
							+ item.marker + ' ' + item.data['日期'] + ' : ' + item.data['死亡/确诊'] + '%';
						return str;
					}
	
				}
			}
		]
	};
	
	var dimension1 = [ '更新日期','累积确诊', '现有确诊','现有疑似','累积死亡','累积治愈'];
	var dataSource1 = [];
	pro_option = {
			title : {
		        text: '趋势图',
		    },
		    tooltip: {},
		    legend: {
		    	
			},
		    dataset: {
				dimensions: dimension1,
				source: dataSource1,
			},
		    toolbox: {
		        show : true,
		        feature : {
		            mark : {show: true},
//		            dataView : {show: true, readOnly: false},     //数据视图按钮
		            magicType : {show: true, type: ['line', 'bar']},
//		            restore : {show: true},       //图表右上角刷新按钮
		            saveAsImage : {show: true}
		        }
		    },
		    calculable : true,
		    xAxis: { type: 'category' },
		    yAxis: {},
		    series : [
		    	{ type: 'bar' },
				{ type: 'bar' },
				{ type: 'bar' },
				{
					type: 'line',
					label: {
						normal: {
							show: true,
							position: 'top',
						},
		
		
					}
				},
				{
					type: 'line',
					label: {
						normal: {
							show: true,
							position: 'top',
						},
		
		
					}
				},

		    ],
		};
	
	var dimension2 = [ ];
	var dataSource2 = [];
	country_option = {
			title : {
		        text: '趋势图',
		    },
		    tooltip: {},
		    legend: {
		    	
			},
		    dataset: {
				dimensions: dimension2,
				source: dataSource2,
			},
		    toolbox: {
		        show : true,
		        feature : {
		            mark : {show: true},
		            magicType : {show: true, type: ['line', 'bar']},
		            saveAsImage : {show: true}
		        }
		    },
		    calculable : true,
		    xAxis: { type: 'category' },
		    yAxis: {},
		    series : [
				{
					type: 'line',
					label: {
						normal: {
							show: true,
							position: 'top',
						},
		
		
					}
				},
		    ],
		};
	
	var dimension3 = [ ];
	var dataSource3 = [];
	country_option1 = {
			title : {
		        text: '趋势图',
		    },
		    tooltip: {},
		    legend: {
		    	
			},
		    dataset: {
				dimensions: dimension3,
				source: dataSource3,
			},
		    toolbox: {
		        show : true,
		        feature : {
		            mark : {show: true},
		            magicType : {show: true, type: ['line', 'bar']},
		            saveAsImage : {show: true}
		        }
		    },
		    calculable : true,
		    xAxis: { type: 'category' },
		    yAxis: {},
		    series : [
		    	{ type: 'bar' },
				{
					type: 'line',
					label: {
						normal: {
							show: true,
							position: 'top',
						},
		
		
					}
				},
		    ],
		};
	
	
	function getEchartData(param) {
    	var myChart = null;
    	myChart = echarts.init(document.getElementById('chart'));
    	myChart.clear();
	if(param=="china") {
		//myChart.clear();
		//myChart = echarts.init(document.getElementById('chart'));
	$.ajaxSettings.async = true;
	$.getJSON("../Json/data.json?" + Date.parse(new Date()), function (data) {
		console.log(data)
		dataSource = data;
	
		options.legend.selected['累计确诊'] = false;
		options.legend.selected['累计确诊+现有疑似'] = false;
		options.legend.selected['观察中'] = true;
		options.legend.selected['死亡/确诊'] = true;
		options.legend.selected['新增确诊'] = false;
		options.legend.selected['新增疑似'] = false;
		options.legend.selected['新增(疑似+确诊)'] = false;
		options.dataset.source = dataSource;
	
		
		myChart.setOption(options,true);
	})
	} else {
		$.ajax({
			   url : "https://lab.isaaclin.cn/nCoV/api/area?latest=0&province="+param,
			   dataType: "json",
			   success : function(data) {
	       		   //console.log(data.results[0].updateTime),
	       		   //console.log(data.results),
	       		   for(var i=0;i<data.results.length;i++){
	       		   var json = {
	               	"更新日期": transferTime(data.results[i].updateTime),
	              	"累积确诊": data.results[i].confirmedCount,
	              	"现有确诊": data.results[i].currentConfirmedCount,
	              	"现有疑似": data.results[i].suspectedCount,
	              	'累积死亡': data.results[i].deadCount,
	              	'累积治愈': data.results[i].curedCount,
	             	}
	       			dataSource1.push(json);
	       		 }
	       			//console.log(dataSource1);
	       			myChart.setOption(pro_option,true);
	       		   }
	});
	}
	
	window.onresize = () => this.myChart.resize();
	
	}
	
	function setEchart1(){
		$.ajaxSettings.async = true;
		$.getJSON("../Json/data.json?" + Date.parse(new Date()), function (data) {
			console.log(data[0]["日期"])
			dimension2.push("更新日期");
			dimension2.push("累计确诊");
			for(var i=0;i<data.length;i++){
			var json = {
	               	"更新日期": data[i]["日期"],
	              	"累计确诊": data[i]["累计确诊"],
	         }
			dataSource2.push(json);
			}
			
		   myChart.setOption(country_option,true);
			
		})
	}
	
	function setEchart2(){
		$.ajaxSettings.async = true;
		$.getJSON("../Json/data.json?" + Date.parse(new Date()), function (data) {
			console.log(data[0]["日期"])
			dimension3.push("更新日期");
			dimension3.push("累计死亡");
			dimension3.push("死亡/确诊");
			for(var i=0;i<data.length;i++){
			var json = {
	               	"更新日期": data[i]["日期"],
	              	"累计死亡": data[i]["累计死亡"],
	              	"死亡/确诊": data[i]["死亡/确诊"],
	         }
			dataSource3.push(json);
			}
			
		   myChart.setOption(country_option1,true);
			
		})
	}
	
	
	getEchartData("china");
	//getEchartData("湖北省");
	
	
	var province = document.getElementsByClassName("label label-default city-block");
	for(var i=0;i<province.length;i++){
		(function(i){
			province[i].onclick = function(){
				myChart = echarts.init(document.getElementById('chart'));
				myChart.clear();
				
				console.log(dataSource1);
				console.log(province[i].innerHTML);
				document.getElementById("show").innerHTML=province[i].innerHTML;
				getEchartData(province[i].innerHTML);
			}	
		})(i)
		};
		
		document.getElementById("total").onclick = function(){
			document.getElementById("show").innerHTML="全国";
			getEchartData("china");
		}
		
		document.getElementById("now").onclick=function(){
			document.getElementById("show").innerHTML="全国";
			setEchart1();
		}
		
		document.getElementById("dead").onclick=function(){
			document.getElementById("show").innerHTML="全国";
			setEchart2();
		}
			
		
	
	
</script>
</body>
</html>