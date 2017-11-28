if(time_type == 2){
	var timestamp = Date.parse(new Date());
	$.post(endurl,{proid:PID,t:timestamp},function(data){
		var starttime = data.endtime*1000;
		setInterval(function () {
			var nowtime = new Date();
		//	console.log(nowtime);
			var time = starttime - nowtime;
			if(time > 0){
				var hour = parseInt(time / 1000 / 60 / 60);
				var minute = parseInt(time / 1000 / 60 % 60);
				var seconds = parseInt(time / 1000 % 60);
				var hour = hour < 10 ? '0'+hour.toString() : hour.toString();
				var minute = minute < 10 ? '0'+minute.toString() : minute.toString();
				var seconds = seconds < 10 ? '0'+seconds.toString() : seconds.toString();
				var html = "<span>"+hour+"</span>小时"+"<span>"+minute+"</span>分钟"+"<span>"+seconds+"</span>秒";
				$('#remainTime_1').html(html);
			}else{
				location = location;
			}
		}, 1000);
	},'json');
}

