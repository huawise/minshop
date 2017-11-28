$(document).ready(function(){
	$("button").click(function(){
		var alinum = $('input[name="alinum"]').val();
		var ordernum = $('input[name="ordernum"]').val();
		var proid = $('input[name="proid"]').val();
		var reg = /^[0-9]*$/;
		if(!reg.test(alinum) || alinum.length != 32){
			new TipBox({type:'tip',str:'订单号错误!',clickDomCancel:false,setTime:3000,hasBtn:true});
			return false;
		}
		
		$.post(order,{alinum:alinum,ordernum:ordernum,proid:proid},function(data){
			if(data.status = 1){
				new TipBox({type:'success',str:data.info,clickDomCancel:false,setTime:2000,hasBtn:true,callBack:function(){
					window.location.href = data.url;
				}});
			}else{
				new TipBox({type:'tip',str:data.info,clickDomCancel:false,setTime:3000,hasBtn:true});
				return false;
			}
		},'json');
		
	});
});