<?php
    if(C('LAYOUT_ON')) {
        echo '{__NOLAYOUT__}';
    }
?>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0" name="viewport"> 
<meta content="yes" name="apple-mobile-web-app-capable"> 
<meta content="yes" name="apple-touch-fullscreen">
<meta content="black" name="apple-mobile-web-app-status-bar-style">
<meta content="320" name="MobileOptimized">
<meta content="telephone=no" name="format-detection">
<title>跳转提示</title>
<style type="text/css">
*{ padding: 0; margin: 0; }
body{ background: #fff; font-family: '微软雅黑'; color: #333; font-size: 16px; }
.success{ font-size:100px; text-align:center; width:100%; color:#fff; font-weight:bold; width:120px; height:120px; line-height:120px; background:#333;  border-radius:50%; margin:100px auto 30px auto;}
.error{ font-size:100px; text-align:center; width:100%; color:#fff; font-weight:bold; width:120px; height:120px; line-height:120px; background:red;  border-radius:50%; margin:100px auto 30px auto;}
.title{ text-align:center; font-size:20px;}
.time{ text-align:center; font-size:16px; line-height:40px;}
</style>
</head>
<body>
<div class="system-message">
<present name="message">
<div class="success">&radic;</div>
<p class="title"><?php echo($message); ?></p>
<else/>
<div class="error">&Chi;</div>
<p class="title"><?php echo($error); ?></p>
</present>
<p class="time">
页面自动 <a id="href" href="<?php echo($jumpUrl); ?>">跳转</a> 等待时间： <b id="wait"><?php echo($waitSecond); ?></b>
</p>
</div>
<script type="text/javascript">
(function(){
var wait = document.getElementById('wait'),href = document.getElementById('href').href;
var interval = setInterval(function(){
	var time = --wait.innerHTML;
	if(time <= 0) {
		location.href = href;
		clearInterval(interval);
	};
}, 1000);
})();
</script>
</body>
</html>
