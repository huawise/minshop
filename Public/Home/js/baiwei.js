	
	function contains(arr, obj) {
		var i = arr.length;
		while (i--) {
			if (arr[i] === obj) {
			  return true;
			}
		}
		return false;
	}
	$("document").ready(function(){
		$('#select_pro').change(function(){
			var title = $(this).children('option:selected').val(); 
			var price = $(this).children('option:selected').attr('price');
			var number = $(this).children('option:selected').attr('number');
			var nid = $(this).children('option:selected').attr('nid');
			var num = $('input[name="num"]').val();
			$('input[name="nid"]').val(nid);
			$('input[name="price"]').val(price);
			$('input[name="number"]').val(number);
			$('input[name="title"]').val(title);
			$('input[name="total"]').val((num*price).toFixed(2));
			$('input[name="totals"]').val((num*price).toFixed(2));
			$('#showprice').text((num*price).toFixed(2));
		});
		
		$('#select_size').change(function(){
			var size = $(this).children('option:selected').val(); 
			$('input[name="size"]').val(size);
		});
		
		$('#select_color').change(function(){
			var color = $(this).children('option:selected').val(); 
			$('input[name="color"]').val(color);
		});
		
		$('#pay b').click(function(){
			var pay = $(this).attr('pay');
			$(this).siblings().removeClass("b-no");
			$(this).addClass("b-no");
			$(this).parent().siblings('p').hide();
			$("#s-"+pay).show();
			$('input[name="paytype"]').val(pay);
		});
		
		$('#sorder').click(function(){
			var sphone = $('input[name="sphone"]').val();
			var proid = $('input[name="proid"]').val();
			
			var phonereg = /^1[3|4|5|7|8][0-9]{9}$/;
			if(!phonereg.test(sphone)){
				layer.msg('手机号码格式错误！',{icon:7,time:2000,shift:6}); 
				return false;
			}
			
			$.post(APP+"/home/index/get_phone/phone/"+sphone+"/proid/"+proid+".html",function(data){
				if(data.status == 0){
					layer.msg(data.info,{icon:7,time:2000,shift:6}); 
				}else{
					window.location.href = data.url;
				}
			}, "json");
			
		});
		
		$('.submit').click(function(){
		
			var total = $('input[name="total"]').val();
			var name = $('input[name="name"]').val();
			var age = $('input[name="age"]').val();
			var height = $('input[name="height"]').val();
			var weight = $('input[name="weight"]').val();
			var idnumber = $('input[name="idnumber"]').val();
			var tel = $('input[name="tel"]').val();
			var code = $('input[name="code"]').val();
			var qq = $('input[name="qq"]').val();
			var wechat = $('input[name="wechat"]').val();
			var email = $('input[name="email"]').val();
			var phone = $('input[name="phone"]').val();
			var address = $('input[name="address"]').val();
			var province = $('#s_province').find('option:selected').val();
			var city = $('#s_city').find('option:selected').val();
			var county = $('#s_county').find('option:selected').val();
			var number = parseInt($('input[name="number"]').val());
			var num = parseInt($('input[name="num"]').val());
		
			
			var namereg = /[\u4E00-\u9FA5\uF900-\uFA2D]/;
			var phonereg = /^1[3|4|5|7|8][0-9]{9}$/;
			var emailreg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
			var qqreg = /^[0-9]*$/;
			var idreg = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;

			
			if(total == '0.00'){ 
				layer.msg('请选择订购产品！',{icon:7,time:2000,shift:6});   
				return false;
			}
			if(number < num){ 
				layer.msg('库存有限，请谅解！',{icon:7,time:2000,shift:6});   
				return false;
			}
			
			if(contains(temp,'name')){
				if(!namereg.test(name)){
					layer.msg('姓名格式错误！',{icon:7,time:2000,shift:6});   
					return false;
				}
			}
			if(contains(temp,'age')){
				if(!qqreg.test(age) || age.length > 3 || age == '' || age > 200){
					layer.msg('请输入正确年龄！',{icon:7,time:2000,shift:6});   
					return false;
				}
			}
			if(contains(temp,'height')){
				if(!qqreg.test(height) || height.length > 3 || height == '' || height > 300){
					layer.msg('请输入正确身高！',{icon:7,time:2000,shift:6});   
					return false;
				}
			}
			if(contains(temp,'weight')){
				if(!qqreg.test(weight) || weight.length > 3 || weight == ''){
					layer.msg('请输入正确体重！',{icon:7,time:2000,shift:6});   
					return false;
				}
			}
			if(contains(temp,'idnumber')){
				if(!idreg.test(idnumber) ||idnumber.length != 18){
					layer.msg('请输入正确身份证号！',{icon:7,time:2000,shift:6});   
					return false;
				}
			}
			if(contains(temp,'phone')){
				if(!phonereg.test(phone)){
					layer.msg('手机号码格式错误！',{icon:7,time:2000,shift:6});   
					return false;
				}
			}
			if(contains(temp,'tel')){
				if(!qqreg.test(tel)){
					layer.msg('电话号码格式错误！',{icon:7,time:2000,shift:6});   
					return false;
				}
			}
			
			if(contains(temp,'area')){
				if(province == ''){
					layer.msg('请选择所属省份！',{icon:7,time:2000,shift:6});   
					return false;
				}
				if(city == ''){
					layer.msg('请选择所属地级市！',{icon:7,time:2000,shift:6});   
					return false;
				}
				
			}
			if(contains(temp,'address')){
				if(!address){
					layer.msg('请输入详细地址！',{icon:7,time:2000,shift:6}); 
					return false;
				}
			}
			if(contains(temp,'code')){
				if(!qqreg.test(code) || code.length != 6){
					layer.msg('请输入正确邮编！',{icon:7,time:2000,shift:6}); 
					return false;
				}
			}
			if(contains(temp,'qq')){
				if(!qqreg.test(qq) || qq.length < 5){
					layer.msg('请输入正确QQ号！',{icon:7,time:2000,shift:6}); 
					return false;
				}
			}
			if(contains(temp,'wechat')){
				if(!wechat){
					layer.msg('请输入正确微信号！',{icon:7,time:2000,shift:6}); 
					return false;
				}
			}
			if(contains(temp,'email')){
				if(!emailreg.test(email)){
					layer.msg('请输入正确邮箱地址！',{icon:7,time:2000,shift:6}); 
					return false;
				}
			}
			layer.load(1,{shade: [0.5,'#000']});
			$.post(post_order,$("form").serialize(),function(data){
				setTimeout(function() {
				layer.closeAll();
					if(data.status == 1){
						window.location.href = data.url;
					}else if(data.status == 2){
						layer.msg(data.title, {icon:1,time:2000},function(){
						  window.location.href = location;
						});   
					}else if(data.status == 3){
						layer.msg('提交订单成功！', {icon:1,time:2000},function(){
						  window.location.href = data.url;
						});   
					}else if(data.status == 4){
						layer.msg(data.title,{icon:7,time:2000,shift:6}); 
						return false;
					}else if(data.status == 5){
						layer.msg(data.title, {time:2000},function(){
						  window.location.href = data.url;
						}); 
					}
					
				},1000);
			},'json');
		});
		
		
	});
	
	function postsms(){
		
		var phone = $('input[name="phone"]').val();
		var phonereg = /^1[3|4|5|7|8][0-9]{9}$/;
		
		if(!phonereg.test(phone)){
			layer.msg('手机号码格式错误！',{icon:7,time:2000,shift:6}); 
			return false;
		}
	
		layer.load(1,{shade: [0.5,'#000']});
		$.post(sms,{phone:phone},function(data){
			layer.closeAll();
			if(data == 0){
				
				layer.msg('短信发送成功！',{icon:1,time: 2000}); 
				var intDiff = 60;
				timer(intDiff); 	
			
				return false;
			}else{
				layer.msg('短信发送失败！',{icon:7,time:2000,shift:6}); 
				return false;
			}
		},'json');
		
	
	}
	
	function pro(obj,price,number,title,nid,thumb){
		$(obj).siblings().removeClass("ul-no");
		$(obj).addClass("ul-no");
		var num = $('input[name="num"]').val();
		$('.bw-count').html(number);
		$('input[name="price"]').val(price);
		$('input[name="number"]').val(number);
		$('input[name="nid"]').val(nid);
		$('input[name="title"]').val(title);
		$('input[name="total"]').val((num*price).toFixed(2));
		$('input[name="totals"]').val((num*price).toFixed(2));
		$('#showprice').text((num*price).toFixed(2));
		$('#bw-showprice').html((num*price).toFixed(2));
		$('#c-price').html(price);
		$('#c-thumb').html('<img src="'+thumb+'"/>');
		$('#c-title').html(title);
	}
	
	function pros(obj,price,number,title,nid){
	
		var num = $('input[name="num"]').val();
		var total = parseFloat($('input[name="total"]').val());
		var totals = parseFloat($('input[name="totals"]').val());
		$('input[name="price"]').val(price);
		$('input[name="title"]').val(title);
		
		if($(obj).hasClass('ul-no')){
			$(obj).removeClass("ul-no");
			$(obj).children('input').remove();
			$('input[name="total"]').val((total-(price*num)).toFixed(2));
			$('input[name="totals"]').val((totals-(price*1)).toFixed(2));
			$('#showprice').text((total-(price*num)).toFixed(2));
		}else{
			$(obj).addClass("ul-no");
			$(obj).append('<input type="hidden" name="pro[]" value="'+title+'"/>');
			$(obj).append('<input type="hidden" name="nid[]" value="'+nid+'"/>');
			$('input[name="total"]').val(((price*num)+(total)).toFixed(2));
			$('input[name="totals"]').val(((price*1)+(totals)).toFixed(2));
			$('#showprice').text(((price*num)+(total)).toFixed(2));
		}
		$.post(json_num,{nid:nid,num:number},function(data){
			$('input[name="number"]').val(data);
		},'json');
	}
	
	
	function sizety(obj,title,sid){
		$(obj).siblings().removeClass("ul-no");
		$(obj).addClass("ul-no");
		$('input[name="size"]').val(title);
		$('input[name="sid"]').val(sid);
	}
	
	function colorty(obj,title,cid){
		$(obj).siblings().removeClass("ul-no");
		$(obj).addClass("ul-no");
		$('input[name="color"]').val(title);
		$('input[name="cid"]').val(cid);
	}
	
	function numdec(){
		var num = parseInt($('input[name="num"]').val());
		if(num > 1){
			$('input[name="num"]').val(num-1);
			var totals = parseFloat($('input[name="totals"]').val());
			$('input[name="total"]').val(((num-1)*totals).toFixed(2));
			$('#showprice').text(((num-1)*totals).toFixed(2));
			$('#bw-showprice').html(((num-1)*totals).toFixed(2));
			
		}
	}
	
	function numlnc(){
		var num = parseInt($('input[name="num"]').val());
		var number = parseInt($('input[name="number"]').val());
		if(num < number){
			$('input[name="num"]').val(num+1);
			var totals = parseFloat($('input[name="totals"]').val());
			$('input[name="total"]').val(((num+1)*totals).toFixed(2));
			$('#showprice').text(((num+1)*totals).toFixed(2));
			$('#bw-showprice').text(((num+1)*totals).toFixed(2));
		}else{
			layer.msg('库存有限，请谅解！',{icon:7,time:2000,shift:6}); 
			return false;
		}
	}
	
	
	
	
	function timer(intDiff){
		console.log(intDiff);
		
		var smstime = setInterval(function(){
			if(intDiff < 0){
				clearTimeout(smstime); 
				$('object i').removeClass();
				$('object').html("<i onclick='postsms()'>发送短信</i>");
				
			}else{
				$('object').html("<i class='sms-bg'>发送成功("+intDiff+")</i>");
				intDiff--;
			}
		}, 1000);
	}
	
	