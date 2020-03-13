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
	<link rel="stylesheet" href="../css/bootstrap.min.css">
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
		#footer span {
			font-size: 12px;
			color: #EC808D;
			display: block;
			line-height: 54px;
			margin: 0 auto;
		}
	</style>
</head>
<body>
	<div id="wapper" style="width: 360px;height: 660px;border: 1px solid red;">
		<!-- 头部区域 -->
		<div id="header" style="width: 360px;height: 60px;background-color: #6200EE;">
			<button type="button" class="btn btn-default" aria-label="Left Align" >
			  <span class="glyphicon glyphicon-align-left" aria-hidden="true">疫情统计</span>
			</button>	
			<span style="font-size: 20px;color: white;line-height: 20px;">疫情统计</span>
			<button type="button" class="btn btn-default" aria-label="Left Align">
			  <span class="glyphicon glyphicon-option-vertical" aria-hidden="true"></span>
			</button>	
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
				 <button id="nowButton" type="button" class="btn btn-primary">现存确诊</button> 
				<button id="totalButton" type="button" class="btn btn-primary">累计确诊</button>
			</div>
			<!-- 图表区域 -->
			<div id="main" style="width: 360px;height: 250px;margin: 0 auto;"></div>
		</div>
		
		<!-- 底栏 -->
		<div id="footer" style="width: 360px;height: 54px;background-color: #FACD91;">
			<span>如果你有意愿支持武汉	请点:<em style="color: #6200EE;">一点爱心</em></span>
		</div>
	</div>
	<!--  <script type="text/javascript" src="js/juqery-3.3.1.js"></script>  -->
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script>
//按钮的响应与跳转



var chart = echarts.init(document.getElementById('main'));
chart.setOption({
    title: {
        text: '全国地图',
        subtext: '该页面的数据仅供参考',
    },
    tooltip: {
    	trigger: 'item',
    	formatter:function(params){
    		return params.name+'<br />'+'确诊人数：'+params['data']['value']+'<br />'+'死亡人数：'
            +params['data']['dead']+'<br />'+'治愈人数：'+params['data']['heal'];
        }//数据格式化
    },
    toolbox: {
        show: true,
        orient: 'vertical',
        left: 'right',
        top: 'center',
        feature: {
            dataView: {readOnly: false},
            restore: {},
            saveAsImage: {}
        }
    },
    visualMap: {
    	type: 'piecewise',
    	pieces: [
    	 { min: 1000, max: 1000000, label: '大于等于1000人', color: '#372a28' },
    	 { min: 500, max: 999, label: '确诊500-999人', color: '#4e160f' },
    	 { min: 100, max: 499, label: '确诊100-499人', color: '#974236' },
    	 { min: 10, max: 99, label: '确诊10-99人', color: '#ee7263' },
    	 { min: 1, max: 9, label: '确诊1-9人', color: '#f5bba7' },
    	 ],
    	 color: ['#E0022B', '#E09107', '#A3E00B']
    },
    series: [{
    	name: '累积确诊',
        type: 'map',
        map: 'china',
        label:{
            show: true
        },
    }
    ]
});

//异步加载数据
function getMapData() {
	$.ajax({
	   type: "get",
	   url : "https://view.inews.qq.com/g2/getOnsInfo?name=disease_h5",   
	   dataType: "jsonp",
	   success : function(data) {
		   console.log(data.data)
		   var res = data.data || "";
	       res = JSON.parse(res)
	       console.log(res.chinaTotal.confirm)
	       
	       document.getElementById("update_time").innerHTML=res.lastUpdateTime;
	       
	       document.getElementById("confirm").innerHTML=res.chinaTotal.confirm;
	       document.getElementById("nowConfirm").innerHTML=res.chinaTotal.nowConfirm;
	       document.getElementById("nowSevere").innerHTML=res.chinaTotal.nowSevere;
	       document.getElementById("suspect").innerHTML=res.chinaTotal.suspect;
	       document.getElementById("dead").innerHTML=res.chinaTotal.dead;
	       document.getElementById("heal").innerHTML=res.chinaTotal.heal;
	       
	       
	       document.getElementById("confirmAdd").innerHTML=res.chinaAdd.confirm;
	       document.getElementById("nowconfirmAdd").innerHTML=res.chinaAdd.confirm;
	       document.getElementById("SevereAdd").innerHTML=res.chinaAdd.nowSevere;
	       document.getElementById("suspectAdd").innerHTML=res.chinaAdd.suspect;
	       document.getElementById("deadAdd").innerHTML=res.chinaAdd.dead;
	       document.getElementById("healAdd").innerHTML=res.chinaAdd.heal;
	       
	       
	       
	       var newArr = [];
	       var total = [];
	       if (res) {
	           //获取到各个省份的数据
	           var province = res.areaTree[0].children;
	           for (var i = 0; i < province.length; i++) {
	             var json = {
	               name: province[i].name,
	               value: province[i].total.confirm,
	               suspect: province[i].total.suspect,
	               dead: province[i].total.dead,
	               heal: province[i].total.heal,
	             }
	             newArr.push(json)
	           }
	           
	             console.log("111")
	             console.log(newArr),
	             chart.setOption({        //加载数据图表
	                 series: [{
	                     data: newArr
	                 }]
	             });        
	       }
	  },
	   error : function(errorMsg) {
	       //请求失败时执行该函数
	   alert("图表请求数据失败!");
	   }
	});
}


getMapData();


</script>


</body>
</html>