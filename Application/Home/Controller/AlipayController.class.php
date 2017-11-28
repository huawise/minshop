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
class AlipayController extends HomeController {
	

	public function alipay_config(){
		
		//↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
		//合作身份者ID，签约账号，以2088开头由16位纯数字组成的字符串，查看地址：https://openhome.alipay.com/platform/keyManage.htm?keyType=partner
		$alipay_config['partner']		= M('config')->where('id = 50')->getField('value');

		//收款支付宝账号，以2088开头由16位纯数字组成的字符串，一般情况下收款账号就是签约账号
		$alipay_config['seller_id']	= $alipay_config['partner'];

		//商户的私钥,此处填写原始私钥去头去尾，RSA公私钥生成：https://doc.open.alipay.com/doc2/detail.htm?spm=a219a.7629140.0.0.nBDxfy&treeId=58&articleId=103242&docType=1
		$alipay_config['private_key']	= M('config')->where('id = 51')->getField('value');

		//支付宝的公钥，查看地址：https://openhome.alipay.com/platform/keyManage.htm?keyType=partner
		$alipay_config['alipay_public_key']= M('config')->where('id = 52')->getField('value');

		// 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
		$alipay_config['notify_url'] = _SERVER_NAME_."/notify_url.php";

		// 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
		$alipay_config['return_url'] = _SERVER_NAME_."/return_url.php";

		//签名方式
		$alipay_config['sign_type']    = strtoupper('RSA');

		//字符编码格式 目前支持utf-8
		$alipay_config['input_charset']= strtolower('utf-8');

		//ca证书路径地址，用于curl中ssl校验
		//请保证cacert.pem文件在当前文件夹目录中
		$alipay_config['cacert']    = getcwd().'\\cacert.pem';

		//访问模式,根据自己的服务器是否支持ssl访问，若支持请选择https；若不支持请选择http
		$alipay_config['transport']    = 'http';
		$alipay_config['app_pay ']    = 'Y';

		// 支付类型 ，无需修改
		$alipay_config['payment_type'] = "1";
				
		// 产品类型，无需修改
		$alipay_config['service'] = "alipay.wap.create.direct.pay.by.user";
        
		return $alipay_config;
		
		
		
	}

	//系统首页
    public function index(){
    	header("Content-type:text/html;charset=utf-8");
		$alipay_config = $this->alipay_config();
		/**************************请求参数**************************/
		
		$ordernum = I('get.ordernum');
		
		if($info = M('order')->where('ordernum = "'.$ordernum.'"')->find()){
			$title = M('product')->where('proid = '.$info['proid'])->getField('title');
		}else{
			$this->error('订单不存在！',U('Home/index/index'));
		}
		
        //商户订单号，商户网站订单系统中唯一订单号，必填
        $out_trade_no = $ordernum;

        //订单名称，必填
        $subject = $title;

        //付款金额，必填
        $total_fee = $info['total'];

        //收银台页面上，商品展示的超链接，必填
        $show_url = 'http://'.$_SERVER['SERVER_NAME'];

        //商品描述，可空
        $body = $title;

		/************************************************************/

		//构造要请求的参数数组，无需改动
		$parameter = array(
				"service"       => $alipay_config['service'],
				"partner"       => $alipay_config['partner'],
				"seller_id"  => $alipay_config['seller_id'],
				"payment_type"	=> $alipay_config['payment_type'],
				"notify_url"	=> $alipay_config['notify_url'],
				"return_url"	=> $alipay_config['return_url'],
				"_input_charset"	=> trim(strtolower($alipay_config['input_charset'])),
				"out_trade_no"	=> $out_trade_no,
				"subject"	=> $subject,
				"total_fee"	=> $total_fee,
				"show_url"	=> $show_url,
				//"app_pay"	=> "Y",//启用此参数能唤起钱包APP支付宝
				"body"	=> $body,
				//其他业务参数根据在线开发文档，添加参数.文档地址:https://doc.open.alipay.com/doc2/detail.htm?spm=a219a.7629140.0.0.2Z6TSk&treeId=60&articleId=103693&docType=1
				//如"参数名"	=> "参数值"   注：上一个参数末尾需要“,”逗号。
				
		);
	//	p($parameter);exit;
		//建立请求
		require(VENDOR_PATH.'lib/alipay_submit.class.php');
		$alipaySubmit = new \AlipaySubmit($alipay_config);
		$html_text = $alipaySubmit->buildRequestForm($parameter,"post", "确认");
		echo $html_text;
				
		
    }
	
	
	
	public function notify_url(){
		
		require(VENDOR_PATH.'lib/alipay_notify.class.php');
		$alipay_config = $this->alipay_config();
		//计算得出通知验证结果
		$alipayNotify = new \AlipayNotify($alipay_config);
		$verify_result = $alipayNotify->verifyNotify();

		if($verify_result) {//验证成功
			

			$out_trade_no = $_POST['out_trade_no'];
			$trade_no = $_POST['trade_no'];
			$trade_status = $_POST['trade_status'];

			if($_POST['trade_status'] == 'TRADE_FINISHED') {
				
				if(M('order')->where('ordernum = "'.$out_trade_no.'"')->find()){
					M('order')->where('ordernum = "'.$out_trade_no.'"')->save(array('paytime' => time()));
				}
			}
			else if ($_POST['trade_status'] == 'TRADE_SUCCESS') {
				
				if($info = M('order')->where('ordernum = "'.$out_trade_no.'"')->find()){
					logWrite('【支付成功】 订单号：'.$out_trade_no,'alipay');
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
					$html .= '<p>收货地址：'.$info["address"].'</p>';
					$html .= '<p>订单详情：'.$info["title"].' 数量：'.$info['num'].$color.$size.'</p>';
					$html .= '<p>支付类型：支付宝支付</p>';
					send_email(C("WEB_EMAIL"),'你有一个新订单',$html);
					
					M('order')->where('ordernum = "'.$out_trade_no.'"')->save(array('paytime' => time()));
					
					
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
							M('order')->where('ordernum = "'.$out_trade_no.'"')->save(array('sms' => 1));
						}
					}
				}
				
			}

			echo "success";		//请不要修改或删除
			
			/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		}
		else {
			//验证失败
			echo "fail";

			
		}
				
	}

	
	public function return_url(){
		
		require(VENDOR_PATH.'lib/alipay_notify.class.php');
		$alipay_config = $this->alipay_config();
		$alipayNotify = new \AlipayNotify($alipay_config);
		$verify_result = $alipayNotify->verifyReturn();
		if($verify_result) {//验证成功
			$out_trade_no = $_GET['out_trade_no'];
			$trade_no = $_GET['trade_no'];
			$trade_status = $_GET['trade_status'];
			
			if($_GET['trade_status'] == 'TRADE_FINISHED' || $_GET['trade_status'] == 'TRADE_SUCCESS') {
				
					if(M('order')->where('ordernum = "'.$out_trade_no.'"')->find()){
						M('order')->where('ordernum = "'.$out_trade_no.'"')->save(array('paytime' => time()));
					}
			}
			else {
			
				if(M('order')->where('ordernum = "'.$out_trade_no.'"')->find()){
					M('order')->where('ordernum = "'.$out_trade_no.'"')->save(array('paytime' => time()));
				}
			}
				
			//echo "验证成功<br />";
			//$this->redirect('Home/index/order',array('ordernum' => $out_trade_no));
			$url = _SERVER_NAME_.'/index.php?s=/home/index/order/ordernum/'.$out_trade_no.'.html';
			header("Location: $url"); 
			//——请根据您的业务逻辑来编写程序（以上代码仅作参考）——
			
			/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		}
		else {
			
			$url = _SERVER_NAME_.'/index.php?s=/home/index/index.html';
			header("Location: $url"); 
			
		}
		
	}
	
	
}
