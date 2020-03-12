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
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<style type="text/css">
		.info-block > h1 {
			font-size: 18px;
		}
		
		.info-block > p {
			font-size: 16px;
		}
	</style>
</head>
<body>
	<div id="wapper" style="width: 360px;height: 660px;border: 1px solid red;">
		<!-- 头部区域 -->
		<div id="header" style="width: 360px;height: 60px;background-color: #6200EE;">
			<button type="button" class="btn btn-default" aria-label="Left Align">
			  <span class="glyphicon glyphicon-align-left" aria-hidden="true">疫情统计</span>
			</button>	
			<span>疫情统计</span>
		</div>
		<!-- 身体区域 -->
		<div id="body" style="width: 360px;height:600px;">
			<!-- 显示信息取域 -->
			<div id="info" style="width: 360px; height:250px;">
				<button type="button" class="btn btn-primary btn-lg btn-block">（块级元素）Block level button</button>
				
				<div style="width: 200px;height: 2px;background-color: #D9001B">
					<div style="float: left;width: 90px;height: 66px" class="info-block">
						<h1>现存确证</h1>
						<p>51325</p>
						<p>昨日+2</p>
					</div>
					<div style="float: left;width: 90px;height: 66px" class="info-block">
						<h1>现存确证</h1>
						<p>51325</p>
						<p>昨日+2</p>
					</div>
					<div style="float: left;width: 90px;height: 66px" class="info-block">
						<h1>现存确证</h1>
						<p>51325</p>
						<p>昨日+2</p>
					</div>
					<div style="float: left;width: 90px;height: 66px" class="info-block">
						<h1>现存确证</h1>
						<p>51325</p>
						<p>昨日+2</p>
					</div>
					<div style="float: left;width: 90px;height: 66px" class="info-block">
						<h1>现存确证</h1>
						<p>51325</p>
						<p>昨日+2</p>
					</div>
					<div style="float: left;width: 90px;height: 66px" class="info-block">
						<h1>现存确证</h1>
						<p>51325</p>
						<p>昨日+2</p>
					</div>
					
					<a href="#" class="btn btn-primary btn-lg active" role="button">Primary link</a>
					<a href="#" class="btn btn-primary btn-lg active" role="button">Primary link</a>
				</div>
				
				<!-- 显示6个文字信息 -->
				
			</div>  
			
			<!-- 图表区域 -->
			<div id="chart" style="width: 328px; height:275px;"></div>  
		</div>
		
		<!-- 底栏 -->
		<div id="footer" style="width: 360px;height: 54px;background-color: #FACD91;">
			<span>如果你有意愿支持武汉	请点一点爱心</span>
		</div>
	</div>
	
	<script type="text/javascript" src="js/bootstrap.min.js"></script>

<script type="text/javascript">
var myChart = echarts.init(document.getElementById('chart'));
var dataSource = [];
var dimensions = ['日期', '累计确诊', '现有确诊（含重症）', '现有疑似', '现有重症', '累计死亡', '累计治愈',
	'累计确诊+现有疑似', '新增确诊', '新增疑似', '新增(疑似+确诊)', '观察中', '死亡/确诊'];
option = {
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

$.ajaxSettings.async = false;
$.getJSON("../Json/data.json?" + Date.parse(new Date()), function (data) {
	dataSource = data;

	option.legend.selected['累计确诊'] = false;
	option.legend.selected['累计确诊+现有疑似'] = false;
	option.legend.selected['观察中'] = true;
	option.legend.selected['死亡/确诊'] = true;
	option.legend.selected['新增确诊'] = false;
	option.legend.selected['新增疑似'] = false;
	option.legend.selected['新增(疑似+确诊)'] = false;
	option.dataset.source = dataSource;

	var yesterday_data = data.filter(item =>
		(new Date(item.日期)).Format("yyyy/M/d") == (new Date()).DateAdd("d", -1).Format("yyyy/M/d")
	);
	console.log(yesterday_data);
	if (yesterday_data.length > 0) {
		yesterday_confirmed = ~~yesterday_data[0]["累计确诊"];
		yesterday_died = ~~yesterday_data[0]["累计死亡"];
		yesterday_cured = ~~yesterday_data[0]["累计治愈"];

		yesterday_current_confirmed = ~~yesterday_data[0]["现有确诊（含重症）"];
		yesterday_current_serious = ~~yesterday_data[0]["现有重症"];
		yesterday_current_unconfirmed = ~~yesterday_data[0]["现有疑似"];

	}
})


myChart.setOption(option);
window.onresize = () => this.myChart.resize();
</script>

</body>
</html>