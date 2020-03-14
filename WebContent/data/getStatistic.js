/**
 *  获取统计数据
 */
 
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