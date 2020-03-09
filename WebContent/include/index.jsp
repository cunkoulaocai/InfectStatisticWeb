<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<script src="${pageContext.request.contextPath }/js/echarts.min.js"></script>
<script src="${pageContext.request.contextPath }/js/china.js"></script>
</head>
<body>
<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
        <div id="main" style="width: 420px;;height:300px;"></div>    
        
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
   type : "post",
   async : true,            //异步请求（同步请求将会锁住浏览器，用户其他操作必须等待请求完成才可以执行）
   url : "${pageContext.request.contextPath }/getMapData",    //请求发送到TestServlet处
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