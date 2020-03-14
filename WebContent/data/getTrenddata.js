/**
 * 获取趋势图数据
 */

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