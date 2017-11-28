<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: 麦当苗儿 <zuojiazi@vip.qq.com> <http://www.zjzit.cn>
// +----------------------------------------------------------------------

namespace Home\Controller;

/**
 * 前台首页控制器
 * 主要获取首页聚合数据
 */
class WxpayController extends HomeController {

	//系统首页
    public function index(){
    	
		$state = $_GET['state'];
		require(VENDOR_PATH.'WxPayPubHelper/WxPayPubHelper.php');
	
		//使用jsapi接口
		$jsApi = new \JsApi_pub();

		//=========步骤1：网页授权获取用户openid============
		//通过code获得openid
		if (!isset($_GET['code']))
		{
			//触发微信返回code码
			$url = $jsApi->createOauthUrlForCode(\WxPayConf_pub::JS_API_CALL_URL);
			$url = str_replace("STATE", $_GET['ordernum'], $url);
			Header("Location: $url"); 
		}else
		{
			//获取code码，以获取openid
			$code = $_GET['code'];
			$jsApi->setCode($code);
			$openid = $jsApi->getOpenId();
		}
		
		//=========步骤2：使用统一支付接口，获取prepay_id============
		//使用统一支付接口
		$unifiedOrder = new \UnifiedOrder_pub();
		
		if($info = M('order')->where('ordernum = "'.$state.'"')->find()){
			$title = M('product')->where('proid = '.$info['proid'])->getField('title');
			$total = $info['total']*100;
		}else{
			$this->error('订单不存在！',U('Home/Index/index'));
		}
		
		//设置统一支付接口参数
		//设置必填参数
		//appid已填,商户无需重复填写
		//mch_id已填,商户无需重复填写
		//noncestr已填,商户无需重复填写
		//spbill_create_ip已填,商户无需重复填写
		//sign已填,商户无需重复填写
		$unifiedOrder->setParameter("openid","$openid");//商品描述
		$unifiedOrder->setParameter("body","$title");//商品描述
		//自定义订单号，此处仅作举例
		//$timeStamp = time();
		//$out_trade_no = \WxPayConf_pub::APPID."$timeStamp";
		$out_trade_no = $state;
		$unifiedOrder->setParameter("out_trade_no","$out_trade_no");//商户订单号 
		$unifiedOrder->setParameter("total_fee","$total");//总金额
		$unifiedOrder->setParameter("notify_url",\WxPayConf_pub::NOTIFY_URL);//通知地址 
		$unifiedOrder->setParameter("trade_type","JSAPI");//交易类型
		//非必填参数，商户可根据实际情况选填
		//$unifiedOrder->setParameter("sub_mch_id","XXXX");//子商户号  
		//$unifiedOrder->setParameter("device_info","XXXX");//设备号 
		//$unifiedOrder->setParameter("attach","XXXX");//附加数据 
		//$unifiedOrder->setParameter("time_start","XXXX");//交易起始时间
		//$unifiedOrder->setParameter("time_expire","XXXX");//交易结束时间 
		//$unifiedOrder->setParameter("goods_tag","XXXX");//商品标记 
		//$unifiedOrder->setParameter("openid","XXXX");//用户标识
		//$unifiedOrder->setParameter("product_id","XXXX");//商品ID

		$prepay_id = $unifiedOrder->getPrepayId();
		//=========步骤3：使用jsapi调起支付============
		$jsApi->setPrepayId($prepay_id);

		$jsApiParameters = $jsApi->getParameters();
		//echo $jsApiParameters;
		$info = M('order')->where('ordernum = "'.$out_trade_no.'"')->find();
		$temp = M('template')->where('tid = '.$info['tid'])->getField('options');
		$options = unserialize($temp);
		$info['title'] = explode(',',$info['title']);
		//p($info);
		
		$url = _SERVER_NAME_.'/index.php?s=/home/index/order/ordernum/'.$out_trade_no.'.html';
		$value = M('config')->where('id = 88')->getField('value');
		$pay = require './Application/Common/Conf/pay.php';
		$currency = M('product')->where('proid = "'.$info['proid'].'"')->getField('currency');
		
		$this->assign(get_defined_vars());
		$this->display();
    }
	
	
	//微信h5支付
    public function Wxh5pay(){
    	
		$ordernum = I('get.ordernum');
		if($info = M('order')->where('ordernum = "'.$ordernum.'"')->find()){
			$title = M('product')->where('proid = '.$info['proid'])->getField('title');
			$total = $info['total']*100;
		}else{
			$this->error('订单不存在！',U('Home/Index/index'));
		}
		
		$info = M('order')->where('ordernum = "'.$ordernum.'"')->find();
		$temp = M('template')->where('tid = '.$info['tid'])->getField('options');
		$options = unserialize($temp);
		$info['title'] = explode(',',$info['title']);
		
		require('wechatAppPay.class.php');
		
		$appid = M('config')->where('id = 53')->getField('value');
		$mch_id = M('config')->where('id = 56')->getField('value');
		$notify_url = _SERVER_NAME_.'/wxnotify_url.php';
		
		$key = M('config')->where('id = 55')->getField('value');
		
		$wechatAppPay = new \wechatAppPay($appid, $mch_id, $notify_url, $key);
		$params['body'] = $title; //商品描述
		$params['out_trade_no'] = $ordernum;; //自定义的订单号
		$params['total_fee'] = $total; //订单金额 只能为整数 单位为分
		$params['trade_type'] = 'MWEB'; //交易类型 JSAPI | NATIVE | APP | MWEB 
		$result = $wechatAppPay->unifiedOrder( $params );
		$url = $result['mweb_url'];

		$value = M('config')->where('id = 88')->getField('value');
		$pay = require './Application/Common/Conf/pay.php';
		$currency = M('product')->where('proid = "'.$info['proid'].'"')->getField('currency');
		$this->assign(get_defined_vars());
		$this->display('Wxpay/wxh5pay');
    }
	
	//微信扫码支付
	public function native(){
    	
		$ordernum = I('get.ordernum');
		if($info = M('order')->where('ordernum = "'.$ordernum.'"')->find()){
			$title = M('product')->where('proid = '.$info['proid'])->getField('title');
			$total = $info['total']*100;
		}else{
			$this->error('订单不存在！',U('Home/Index/index'));
		}
		
		$info = M('order')->where('ordernum = "'.$ordernum.'"')->find();
		$temp = M('template')->where('tid = '.$info['tid'])->getField('options');
		$options = unserialize($temp);
		$info['title'] = explode(',',$info['title']);
		
		require('wechatAppPay.class.php');
		
		$appid = M('config')->where('id = 53')->getField('value');
		$mch_id = M('config')->where('id = 56')->getField('value');
		$notify_url = _SERVER_NAME_.'/wxnotify_url.php';
		
		$key = M('config')->where('id = 55')->getField('value');
		
		$wechatAppPay = new \wechatAppPay($appid, $mch_id, $notify_url, $key);
		$params['body'] = $title; //商品描述
		$params['out_trade_no'] = $ordernum;; //自定义的订单号
		$params['total_fee'] = $total; //订单金额 只能为整数 单位为分
		$params['trade_type'] = 'NATIVE'; //交易类型 JSAPI | NATIVE | APP | WAP 
		$result = $wechatAppPay->unifiedOrder( $params );
		$url1 = $result['code_url'];
		$qrcode = _SERVER_NAME_.'/ThinkPHP/Library/Vendor/WxPayNotify/example/qrcode.php?data='.urlencode($url1);
		
	//	p($result);exit;
		$value = M('config')->where('id = 88')->getField('value');
		
		$this->assign(get_defined_vars());
		$this->display('Wxpay/native');
    }

	
	
	public function notify_url(){
		
		require(VENDOR_PATH."WxPayPubHelper/log_.php");
		require(VENDOR_PATH.'WxPayPubHelper/WxPayPubHelper.php');

		//使用通用通知接口
		$notify = new \Notify_pub();

		//存储微信的回调
		$xml = $GLOBALS['HTTP_RAW_POST_DATA'];	
		$notify->saveData($xml);  
		
		//验证签名，并回应微信。
		//对后台通知交互时，如果微信收到商户的应答不是成功或超时，微信认为通知失败，
		//微信会通过一定的策略（如30分钟共8次）定期重新发起通知，
		//尽可能提高通知的成功率，但微信不保证通知最终能成功。
		if($notify->checkSign() == FALSE){
			$notify->setReturnParameter("return_code","FAIL");//返回状态码
			$notify->setReturnParameter("return_msg","签名失败");//返回信息
		}else{
			$notify->setReturnParameter("return_code","SUCCESS");//设置返回码
		}
		$returnXml = $notify->returnXml();
		echo $returnXml;
		
		//==商户根据实际情况设置相应的处理流程，此处仅作举例=======
		
		//以log文件形式记录回调信息
	//	$log_ = new \Log_();
	//	$log_name = VENDOR_PATH."WxPayPubHelper/notify_url.log";//log文件路径
	//	$log_->log_result($log_name,"【接收到的notify通知】:\n".$xml."\n");
		logWrite("【接收到的notify通知】:\n".$xml."\n",'wxpay');

		if($notify->checkSign() == TRUE){
			if ($notify->data["return_code"] == "FAIL") {
				//此处应该更新一下订单状态，商户自行增删操作
			//	$log_->log_result($log_name,"【通信出错】:\n".$xml."\n");
				logWrite("【通信出错】:\n".$xml."\n",'wxpay');
			}
			elseif($notify->data["result_code"] == "FAIL"){
				//此处应该更新一下订单状态，商户自行增删操作
			//	$log_->log_result($log_name,"【业务出错】:\n".$xml."\n");
				logWrite("【业务出错】:\n".$xml."\n",'wxpay');
			}
			else{
				//此处应该更新一下订单状态，商户自行增删操作
			//	$log_->log_result($log_name,"【支付成功】:\n".$xml."\n");  
				logWrite("【支付成功】:\n".$xml."\n",'wxpay');
				
				if($info = M('order')->where('ordernum = "'.$notify->data["out_trade_no"].'"')->find()){
					
					M('order')->where('ordernum = "'.$notify->data["out_trade_no"].'"')->save(array('paytime' => time()));
					

					$email_value = M('config')->where('id = 64')->getField('value');
					if($email_value == 1){
						
						$info['temp'] = M('template')->where('tid = '.$info['tid'])->field('size_title,color_title')->find();
						if($info['color']){
							$color = $info['temp']['color_title'].' ：'.$info['color'];
						}
						if($info['size']){
							$size = $info['temp']['size_title'].' ：'.$info['size'];
						}
						$html = '';
						$html .= '<p>订单号：'.$info["ordernum"].'</p>';
						$html .= '<p>总价：'.$info["total"].'元</p>';
						$html .= '<p>收货人：'.$info["name"].'</p>';
						$html .= '<p>联系方式：'.$info["phone"].'</p>';
						$html .= '<p>收货地址：'.$info["province"].$info["city"].$info["area"].$info["address"].'</p>';
						$html .= '<p>订单详情：'.$info["title"].' 数量：'.$info['num'].$color.$size.'</p>';
						$html .= '<p>支付类型：货到付款</p>';
						$html .= '<p>下单时间：'.date('Y-m-d H:i',$info['addtime']).'</p>';
						$email_title = M('config')->where('id = 70')->getField('value');
						$email = M('config')->where('id = 60')->getField('value');
						
						send_email($email,$email_title,$html);
					}
					
					if($info['sms'] == 0){
						$status = M('config')->where('id = 71')->getField('value');
						if($status == 1){
							$dx = M('config')->where('id = 78')->getField('value');
							$dx_arr = unserialize($dx);
							if(in_array('gk',$dx_arr)){
								$gk = M('config')->where('id = 76')->getField('value');
								$order_gk = M('order')->where('ordernum = '.$info['ordernum'])->find();
								$order_gk['time'] = date('Y-m-d H:i',$order_gk['addtime']);
								$gk_html  = '';
								foreach($order_gk as $k=>$v){
									$gkkarr[] = "{".$k."}";
									$kkvarr[] = $v;
								}
								$gk_html = str_replace($gkkarr,$kkvarr,$gk);
								if($order_gk['sms'] == 0){
									sms($info['phone'],$gk_html);
								}
								
							}
							
							if(in_array('sj',$dx_arr)){
								$sj = M('config')->where('id = 77')->getField('value');
								$order_sj = M('order')->where('ordernum = '.$info['ordernum'])->find();
								$order_sj['time'] = date('Y-m-d H:i',$order_sj['addtime']);
								$sj_html  = '';
								foreach($order_sj as $k=>$v){
									$sjkarr[] = "{".$k."}";
									$sjvarr[] = $v;
								}
								$sj_html = str_replace($sjkarr,$sjvarr,$sj);
								$sj_phone = M('config')->where('id = 82')->getField('value');
								if($order_sj['sms'] == 0){
									sms($sj_phone,$sj_html);
								}
								
							}
							M('order')->where('ordernum = "'.$info['ordernum'].'"')->save(array('sms' => 1));
						}
					}
					
				}
				
			}
		}
	}
	
	
	/*
	public function native(){
		$ordernum = $_GET['ordernum'];
		
		if($info = M('order')->where('ordernum = "'.$ordernum.'"')->find()){
			$title = M('product')->where('proid = '.$info['proid'])->getField('title');
			$total = $info['total']*100;
		}else{
			$this->error('订单不存在！',U('Home/index/index'));
		}
		
		require(VENDOR_PATH.'WxPayNotify/lib/WxPay.Api.php');
		require(VENDOR_PATH.'WxPayNotify/example/WxPay.NativePay.php');
		require(VENDOR_PATH.'WxPayNotify/example/log.php');
		
		$notify = new \NativePay();
		$url1 = $notify->GetPrePayUrl($ordernum);
		
		$qrcode = _SERVER_NAME_.'/ThinkPHP/Library/Vendor/WxPayNotify/example/qrcode.php?data='.urlencode($url1);
		
		$this->assign(get_defined_vars());
		$this->display();
		
	}
	
	public function proname(){
		$ordernum = $_GET['ordernum'];
		$info = M('order')->where('ordernum = "'.$ordernum.'"')->find();
		$title = M('product')->where('proid = '.$info['proid'])->getField('title');
		M('order')->where('ordernum = "'.$ordernum.'"')->save(array('openid'=>$_GET['openid']));
		echo $title;
	}
	
	public function prototal(){
		$ordernum = $_GET['ordernum'];
		$total = M('order')->where('ordernum = "'.$ordernum.'"')->getField('total');
		echo $total*100;
	}
	
	public function savewxpay(){
		$cash_fee = $_GET['cash_fee'];
		$openid = $_GET['openid'];
		$order = M('order')->where(array('total'=>$cash_fee*0.01,'openid'=>$openid))->order("orderid desc")->find();
		
		M('order')->where('ordernum = "'.$order['ordernum'].'"')->save(array('paytype'=>2,'paytime'=>time()));
	}
	*/
	public function setinterval(){
		$ordernum = $_GET['ordernum'];
		$paytime = M('order')->where('ordernum = "'.$ordernum.'"')->getField('paytime');
		if(!empty($paytime)){
			echo 'ok';
		}else{
			echo 'no';
		}
	}
	
	
}
