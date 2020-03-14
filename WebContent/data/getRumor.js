/**
 * 获取谣言
 */

function loadData() {
			XHR = new XMLHttpRequest();
			XHR.open('GET', 'http://api.tianapi.com/txapi/rumour/index?&key=dcd2cc2b1d430288b8c21a3647b375ba&num=50&rand=1', true);
			XHR.send();
			XHR.onreadystatechange = function() {
				var data={};
				if (XHR.readyState === 4 && XHR.status === 200) {
					
					// 从天行数据那获取数据之后解码为JSON对象。
					getText = JSON.parse(XHR.responseText); 
					data=getText.newslist;
					
				}
				 var titles = document.getElementsByClassName("title");
				 var contents = document.getElementsByClassName("content");
				 var sources = document.getElementsByClassName("source");
				 for(var i=0;i<titles.length;i++) {
					   titles[i].innerHTML=data[i].title.substring(0,10)+"....";
					   contents[i].innerHTML=data[i].desc;
					   sources[i].innerHTML=data[i].author;
				}
			}
		}
		
loadData();