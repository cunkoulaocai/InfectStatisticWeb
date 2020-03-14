/**
 * 获取新闻信息
 */

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
					   titles[i].innerHTML=newArr[i].title.substring(0,18)+"..";
					   times[i].innerHTML=newArr[i].time;
					   contents[i].innerHTML=newArr[i].content.substring(0,80)+"..";
					   sources[i].innerHTML=newArr[i].source;
					   }
	       		   }
		
	});
	}
	
    getNewsData();