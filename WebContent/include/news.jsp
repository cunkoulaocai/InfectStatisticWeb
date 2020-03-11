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
			  <span class="glyphicon glyphicon-align-left" aria-hidden="true">yi'qing'xin'wen</span>
			</button>	
			<span>疫情新闻</span>
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
			<div id="main" style="width: 328px; height:275px;"></div>  
		</div>
		
		<!-- 底栏 -->
		<div id="footer" style="width: 360px;height: 54px;background-color: #FACD91;">
			<span>如果你有意愿支持武汉	请点一点爱心</span>
		</div>
	</div>
	
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/juqery-3.3.1.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
<script>
var chart = echarts.init(document.getElementById('main'));
chart.setOption({
    title: {
        text: '全国地图',
        subtext: '该页面的数据仅供参考',
    },
    tooltip: {
        formatter:function(params){
            return params.name+'<br />'+'确诊人数：'+params['data']['value']+'<br />'+'死亡人数：'
            +params['data']['dead']+'<br />'+'治愈人数：'+params['data']['cure'];
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
        min: 0,
        max: 40000,
        left: 'left',
        top: 'bottom',
        text: ['多','少'],
        inRange: {
            color: ['lightskyblue', 'yellow', 'orangered']
        },
        show:true
    },
    series: [{
        type: 'map',
        map: 'china',
        label:{
            show: true
        },
        nameMap:{
            
            "南海诸岛" : "南海诸岛",
             '北京'   :'北京市',
             '天津'   :'天津市',
             '上海'   :'上海市',
             '重庆'   :'重庆市',
             '河北'   :'河北省',
             '河南'   :'河南省',
             '云南'   :'云南省',
             '辽宁'   :'辽宁省',
             '黑龙江'  :  '黑龙江省',
             '湖南'   :'湖南省',
             '安徽'   :'安徽省',
             '山东'   :'山东省',
             '新疆' :'新疆维吾尔自治区',
             '江苏' :'江苏省',
             '浙江' :'浙江省',
             '江西' :'江西省',
             '湖北' :'湖北省',
             '广西' : '广西壮族自治区',
             '甘肃' :'甘肃省',
             '山西' :'山西省',
             '内蒙古' : "内蒙古自治区",
             '陕西'  :'陕西省',
             '吉林'  :'吉林省',
             '福建'  :'福建省',
             '贵州'  :'贵州省',
             '广东'  :'广东省',
             '青海'  :'青海省',
             '西藏'  :'西藏自治区',
             '四川'  :'四川省',
             '宁夏' :'宁夏回族自治区',
             '海南' :'海南省',
             '台湾' :'台湾',
             '香港' :'香港',
             '澳门' :'澳门'
        }
    }
    ]
});

//异步加载数据
$.ajax({
   type : "get",
   async : true,            //异步请求（同步请求将会锁住浏览器，用户其他操作必须等待请求完成才可以执行）
   url : "https://api.yonyoucloud.com/apis/dst/ncov/country",    //请求发送到TestServlet处
   success : function(resultJson) {
       var result= jQuery.parseJSON(resultJson);
       //请求成功时执行该函数内容，result即为服务器返回的json对象
       if (result) {
               chart.setOption({        //加载数据图表
                  series: [{
                      data: result
                  }]
              });
              
       }
  },
   error : function(errorMsg) {
       //请求失败时执行该函数
   alert("图表请求数据失败!");
   }
});

</script>


</body>
</html>