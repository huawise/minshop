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
class IndexController extends HomeController {
	
	
	//系统首页
    public function index(){
		to_url();
		$domain = M('config')->where('id = 101')->getField('value');
		if($domain == 1){
			$list = M('product')->where('status = 1')->order('sort asc,proid desc')->select();
			$value = M('config')->where('id = 88')->getField('value');
			$language = M('config')->where('id = 97')->getField('value');
			$this->assign('_list', $list);
			$this->assign('value', $value);
			$this->assign('language', $language);
			$this->display();
		}else{
			$url = $_SERVER['HTTP_HOST'];
			$zdomain = M('config')->where('id = 102')->getField('value');
			if($url == $zdomain){
				$list = M('product')->where('status = 1')->order('sort asc,proid desc')->select();
				$value = M('config')->where('id = 88')->getField('value');
				$language = M('config')->where('id = 97')->getField('value');
				$this->assign('_list', $list);
				$this->assign('value', $value);
				$this->assign('language', $language);
				$this->display();
			}else{
				$proid = M('domain')->where('domain = "'.$url.'"')->getField('proid');
				$this->info($proid);
			}
			
		}
		
    }
	
	public function info($proid){
		to_url();
		cookie('num',null);
		$proid = $proid?$proid:I('get.proid');
		$gzid = I('get.gzid',22);
		$uid = I('get.uid',1);
		$info = M('product')->where('proid = '.$proid)->find();
		$info['content'] = M('product_data')->where('proid = '.$proid)->getField('content');
		$temp = M('template')->where('tid = '.$info['template'])->find();
		$norms_pro = M('product_norms')->where('proid = '.$proid.' and type = 1')->order('def asc')->select();
		$norms_size = M('product_norms')->where('proid = '.$proid.' and type = 2')->order('def asc')->select();
		$norms_color = M('product_norms')->where('proid = '.$proid.' and type = 3')->order('def asc')->select();
		$temp['options'] = unserialize($temp['options']);
		$temp['pay_type'] = unserialize($temp['pay_type']);
		$info['images'] = explode(',',$info['images']);
		$info['review'] = explode("\r\n",trim($info['review']));
		foreach($info['review'] as $k=>$v){
			$info['review'][$k] = explode("|",$v);
		}
		$info['preferential'] = $info['oldprice']-$info['price'];
		$options = '';
		foreach($temp['options'] as $k=>$v){
			$options .= "'".$v."',";
		}
		$options = substr($options,0,-1);
		$pay = array();
		foreach($temp['pay_type'] as $k=>$v){
			if($v['status'] == 0){
				unset($temp['pay_type'][$k]);
			}else{
				$pay[$v['sort']] = $k;
			}
		}
		ksort($pay);
		$pay = array_merge($pay);
		$arr = array();
		$arr = cookie('num');
		$arr[$norms_pro[0]['nid']] = $norms_pro[0]['number'];
		cookie('num',$arr,600);
	//	p($temp);
	//	p($pay);

		
		$orderhtml = explode("\r\n",trim($temp['order_content']));
		foreach($orderhtml as $k=>$v){
			$orderhtml[$k] = str_replace("{time}",date('Y-m-d'),$v);
		}
		$html = explode("\r\n",trim($temp['delivery_content']));
		foreach($html as $k=>$v){
			$html[$k] = str_replace("{time}",date('Y-m-d'),$v);
		}
		
		if($info['time_status'] == 0){
			$endtime = $info['endtime']-time();
			if($info['time_type'] == 2){
				if($endtime < 0){
					$endtime = M('product')->where('proid = '.$proid)->save(array('endtime' => time()+$info['time_sum']));
					$this->redirect('Home/index/info?proid='.$proid.'&gzid='.I('get.gzid'));
				}
			}
		}
		
		if($info['parameter']){
			$parameter = explode("\r\n",trim($info['parameter']));
			foreach($parameter as $k=>$v){
				$parameter[$k] = explode(":",$v);
			}
		}
		
		if($info['status'] == 1){
			if($info['time_status'] == 0){
				if($info['time_type'] == 1){
					if(($info['starttime'] < time()) && ($info['endtime'] > time())){
						$temphtml = 1;
					}
				}else{
					$temphtml = 1;
				}	
			}else{
				$temphtml = 1;
			}			
		}
		
		$audit = M('audit')->where('id = '.$proid)->find();
		$temp['nav_temp'] = explode(',',$temp['nav_temp']);
		$temp['nav_count'] = count($temp['nav_temp']);
	//	p($temp);
		$language = M('config')->where('id = 97')->getField('value');
		$statistical = M('config')->where('id = 99')->getField('value');
		$value = M('config')->where('id = 88')->getField('value');
		/*
		$WX_APPID = M('config')->where('id = 53')->getField('value');
		$WX_APPSECRET = M('config')->where('id = 54')->getField('value');
		require 'Jssdk.php';
		$jssdk = new \Jssdk($WX_APPID, $WX_APPSECRET);
		$signPackage = $jssdk->GetSignPackage();
		*/
	
		$this->assign('audit', $audit);
		$this->assign('statistical', $statistical);
		$this->assign('signPackage', $signPackage);
		$this->assign('root', __ROOT__);
		$this->assign('value', $value);
		$this->assign('language', $language);
		$this->assign('parameter', $parameter);
		$this->assign('endtime', $endtime);
		$this->assign('html', $html);
		$this->assign('orderhtml', $orderhtml);
		$this->assign('options', $options);
		$this->assign('pay', $pay);
		$this->assign('info', $info);
		$this->assign('temp', $temp);
		$this->assign('norms_pro', $norms_pro);
		$this->assign('norms_size', $norms_size);
		$this->assign('norms_color', $norms_color);
		$this->assign('proid', $proid);
		$this->assign('gzid', $gzid);
		$this->assign('uid', $uid);
		$this->assign('temphtml', $temphtml);
		$this->display($info['style']);
	}
	
	
	public function post_order(){
		if(IS_POST){
			
			if(I('post.smstype') == 1){
				if(I('post.sms')){
					if(I('post.sms') != cookie('sms')){
						$arr = array(
							'status' => 4,
							'title' => '验证码不正确！',
						);
						echo json_encode($arr);exit;
					}
				}else{
					$arr = array(
						'status' => 4,
						'title' => '验证码不正确！',
					);
					echo json_encode($arr);exit;
				}
				
			}
			
			$ordernum = rand(10,99);
			$total = '';
			if(I('post.pro_class') == 3 || I('post.pro_class') == 4){
				$title = implode(',',I('post.pro'));
				$nid = implode(',',I('post.nid'));
				
				foreach(I('post.nid') as $k=>$v){
					$total += M('product_norms')->where('nid = '.$v)->getField('price');
				}
			}else{
				$title = I('post.title');
				$nid = I('post.nid');
				$total = M('product_norms')->where('nid = '.$nid)->getField('price');
			}
			
			$GetIpLookup = GetIpLookup(getIP());
			
			$data = array(
				'name' => I('post.name'),
				'phone' => trim(I('post.phone')),
				'province' => I('post.province'),
				'city' => I('post.city'),
				'area' => I('post.area'),
				'address' => htmlspecialchars(I('post.address')),
				'ipprovince' => $GetIpLookup['province'],
				'ipcity' => $GetIpLookup['city'],
				'ip' => getIP(),
				'status' => 1,
				'addtime' => NOW_TIME,
				'message' => htmlspecialchars(I('post.message')),
				'proid' => I('post.proid'),
				'nid' => $nid,
				'title' =>$title,
				'ordernum' => date('YmdHis',NOW_TIME).$ordernum,
				'paytype' => I('post.paytype'),
				'total' => trim(I('post.total')),
				'gzid' => I('post.gzid'),
				'num' => I('post.num'),
				'sex' => I('post.sex'),
				'age' => I('post.age'),
				'height' => I('post.height'),
				'weight' => I('post.weight'),
				'idnumber' => I('post.idnumber'),
				'tel' => I('post.tel'),
				'code' => I('post.code'),
				'qq' => I('post.qq'),
				'wechat' => I('post.wechat'),
				'email' => I('post.email'),
				'size' => I('post.size'),
				'color' => I('post.color'),
				'tid' => I('post.tid'),
				'uid' => I('post.uid'),
				'reclaim' => I('post.reclaim'),
			);
			
			$var = M('config')->where('id = 95')->getField('value');
			if($var == 1){
				$stime = strtotime(date('Ymd')); 
				$etime = strtotime(date('Ymd'))+86400;
				$map['addtime'] = array(array('gt',$stime),array('lt',$etime));
				$map['phone'] = array('eq',$data['phone']);
				$map['proid'] = array('eq',$data['proid']);
				$count = M('order')->where($map)->count();
				$char = M('config')->where('id = 96')->getField('value');
				if($count >= $char){
					$arr = array(
						'status' => 4,
						'title' => '参数出错！',
					);
					echo json_encode($arr);exit;
				}
				
				$where['addtime'] = array(array('gt',$stime),array('lt',$etime));
				$where['ip'] = array('eq',$data['ip']);
				$where['proid'] = array('eq',$data['proid']);
				$wcount = M('order')->where($where)->count();
				
				if($wcount >= $char){
					$arr = array(
						'status' => 4,
						'title' => '参数出错！',
					);
					echo json_encode($arr);exit;
				}
				
			}
			
			
			if($total*$data['num'] != $data['total']){
				$arr = array(
					'status' => 4,
					'title' => '参数出错！',
				);
				echo json_encode($arr);exit;
			}
			
			M('order')->add($data);
			M('product')->where('proid = '.$data['proid'])->setInc('number',1);
			
			if($data['paytype'] == 'huodao'){
				$return = $this->houdao_order_return($data);
			}else if($data['paytype'] == 'wechat'){
				$return = $this->wechat_order_return($data);
			}else if($data['paytype'] == 'alipay'){
				$return = $this->alipay_order_return($data);
			}else if($data['paytype'] == 'alipaycode'){
				$return = $this->alipaycode_order_return($data);
			}else if($data['paytype'] == 'wechatcode'){
				$return = $this->alipaycode_order_return($data);
			}else if($data['paytype'] == 'ty'){
				$return = $this->houdao_order_return($data);
			}else if($data['paytype'] == 'bty'){
				$return = $this->houdao_order_return($data);
			}else{
				$return = $this->houdao_order_return($data);
			}
			echo $return;exit;
		}
		
	}
	
	public function houdao_order_return($data){
		
		
		$nidarr = explode(',',$data['nid']);
		foreach($nidarr as $k=>$v){
			M('product_norms')->where('nid = '.$v)->setDec('number',$data['num']);
		}
		
		$temp = M('template')->where('tid = '.$data['tid'])->field('pay_type,alert,alert_type,alert_href,alert_content')->find();
		$order = M('order')->where('ordernum = '.$data['ordernum'])->getField('total');
		$temp['pay_type'] = unserialize($temp['pay_type']);
		$total = $temp['pay_type']['huodao']['discount']*$order;
		M('order')->where('ordernum = '.$data['ordernum'])->save(array('total' => $total));
		
		$email_value = M('config')->where('id = 64')->getField('value');
		if($email_value == 1){
			
			$info['temp'] = M('template')->where('tid = '.$data['tid'])->field('size_title,color_title')->find();
			if($data['color']){
				$color = $info['temp']['color_title'].' ：'.$data['color'];
			}
			if($data['size']){
				$size = $info['temp']['size_title'].' ：'.$data['size'];
			}
			$html = '';
			$html .= '<p>订单号：'.$data["ordernum"].'</p>';
			$html .= '<p>总价：'.$data["total"].'元</p>';
			$html .= '<p>收货人：'.$data["name"].'</p>';
			$html .= '<p>联系方式：'.$data["phone"].'</p>';
			$html .= '<p>收货地址：'.$data["province"].$data["city"].$data["area"].$data["address"].'</p>';
			$html .= '<p>订单详情：'.$data["title"].' 数量：'.$data['num'].$color.$size.'</p>';
			$html .= '<p>支付类型：货到付款</p>';
			$html .= '<p>下单时间：'.date('Y-m-d H:i',$data['addtime']).'</p>';
			$email_title = M('config')->where('id = 70')->getField('value');
			$email = M('config')->where('id = 60')->getField('value');
			
			send_email($email,$email_title,$html);
		}
		
		$status = M('config')->where('id = 71')->getField('value');
		if($status == 1){
			$dx = M('config')->where('id = 78')->getField('value');
			$dx_arr = unserialize($dx);
			if(in_array('gk',$dx_arr)){
				$gk = M('config')->where('id = 76')->getField('value');
				$order_gk = M('order')->where('ordernum = '.$data['ordernum'])->find();
				$order_gk['time'] = date('Y-m-d H:i',$order_gk['addtime']);
				$gk_html  = '';
				foreach($order_gk as $k=>$v){
					$gkkarr[] = "{".$k."}";
					$kkvarr[] = $v;
				}
				$gk_html = str_replace($gkkarr,$kkvarr,$gk);
				sms($data['phone'],$gk_html);
			}
			
			if(in_array('sj',$dx_arr)){
				$sj = M('config')->where('id = 77')->getField('value');
				$order_sj = M('order')->where('ordernum = '.$data['ordernum'])->find();
				$order_sj['time'] = date('Y-m-d H:i',$order_sj['addtime']);
				$sj_html  = '';
				foreach($order_sj as $k=>$v){
					$sjkarr[] = "{".$k."}";
					$sjvarr[] = $v;
				}
				$sj_html = str_replace($sjkarr,$sjvarr,$sj);
				$sj_phone = M('config')->where('id = 82')->getField('value');
				
				sms($sj_phone,$sj_html);
			}
		
		}
		
		if($temp['alert'] == 0){
			if($temp['alert_type'] == 1){
				$arr = array(
					'status' => 1,
					'url' => $temp['alert_href'],
				);
			}else if($temp['alert_type'] == 2){
				$html = '';
				foreach($data as $k=>$v){
					$karr[] = "{".$k."}";
					$varr[] = $v;
				}
				$html = str_replace($karr,$varr,$temp['alert_content']);
				$arr = array(
					'status' => 2,
					'title' => $html,
				);
			}
		}else{
			$arr = array(
				'status' => 3,
				'url' => U('order?ordernum='.$data['ordernum']),
			);
			
		}
		
		return json_encode($arr);exit;
	}
	
	
	public function wechat_order_return($data){
		
		$temp = M('template')->where('tid = '.$data['tid'])->field('pay_type')->find();
		$order = M('order')->where('ordernum = '.$data['ordernum'])->getField('total');
		$temp['pay_type'] = unserialize($temp['pay_type']);
		
		if($temp['pay_type']['wechat']['discount'] != '1'){
			if($order > '0.01'){
				$total = number_format($temp['pay_type']['wechat']['discount']*$order,2);
			}else{
				$total = $order;
			}
		}else{
			$total = $order;
		}
		
		M('order')->where('ordernum = '.$data['ordernum'])->save(array('total' => $total));
		
		if(is_weixin()){
			$url = U('Home/Wxpay/index?ordernum='.$data['ordernum']);
		}else{
			
			if(is_mobile()){
				$url = U('Home/Wxpay/Wxh5pay?ordernum='.$data['ordernum']);
			}else{
				$url = U('Home/Wxpay/native?ordernum='.$data['ordernum']);
			}
			
		}
		
		
		$arr = array(
			'status' => 5,
			'title' => '提交订单成功，即将跳转到支付页面...',
			'url' => $url,
		);
		return json_encode($arr);exit;
	}
	
	public function alipay_order_return($data){
		
		$temp = M('template')->where('tid = '.$data['tid'])->field('pay_type')->find();
		$order = M('order')->where('ordernum = '.$data['ordernum'])->getField('total');
		$temp['pay_type'] = unserialize($temp['pay_type']);
		
		if($temp['pay_type']['alipay']['discount'] != '1'){
			if($order > '0.01'){
				$total = number_format($temp['pay_type']['alipay']['discount']*$order,2);
			}else{
				$total = $order;
			}
		}else{
			$total = $order;
		}
		
		
		M('order')->where('ordernum = '.$data['ordernum'])->save(array('total' => $total));
		
		$url = U('Home/Alipay/index?ordernum='.$data['ordernum']);
		$arr = array(
			'status' => 5,
			'title' => '提交订单成功，即将跳转到支付页面...',
			'url' => $url,
		);
		return json_encode($arr);exit;
	}
	
	public function alipaycode_order_return($data){
		
		
		$nidarr = explode(',',$data['nid']);
		foreach($nidarr as $k=>$v){
			M('product_norms')->where('nid = '.$v)->setDec('number',$data['num']);
		}
		
		$temp = M('template')->where('tid = '.$data['tid'])->field('pay_type,alert,alert_type,alert_href,alert_content')->find();
		$order = M('order')->where('ordernum = '.$data['ordernum'])->getField('total');
		$temp['pay_type'] = unserialize($temp['pay_type']);
		
		if($temp['pay_type'][$data['paytype']]['discount'] != '1'){
			if($order > '0.01'){
				$total = number_format($temp['pay_type'][$data['paytype']]['discount']*$order,2);
			}else{
				$total = $order;
			}
		}else{
			$total = $order;
		}
		
		
		M('order')->where('ordernum = '.$data['ordernum'])->save(array('total' => $total));
		
		$email_value = M('config')->where('id = 64')->getField('value');
		if($email_value == 1){
			
			$info['temp'] = M('template')->where('tid = '.$data['tid'])->field('size_title,color_title')->find();
			if($data['color']){
				$color = $info['temp']['color_title'].' ：'.$data['color'];
			}
			if($data['size']){
				$size = $info['temp']['size_title'].' ：'.$data['size'];
			}
			$html = '';
			$html .= '<p>订单号：'.$data["ordernum"].'</p>';
			$html .= '<p>总价：'.$data["total"].'元</p>';
			$html .= '<p>收货人：'.$data["name"].'</p>';
			$html .= '<p>联系方式：'.$data["phone"].'</p>';
			$html .= '<p>收货地址：'.$data["province"].$data["city"].$data["area"].$data["address"].'</p>';
			$html .= '<p>订单详情：'.$data["title"].' 数量：'.$data['num'].$color.$size.'</p>';
			$html .= '<p>支付类型：货到付款</p>';
			$html .= '<p>下单时间：'.date('Y-m-d H:i',$data['addtime']).'</p>';
			$email_title = M('config')->where('id = 70')->getField('value');
			$email = M('config')->where('id = 60')->getField('value');
			
			send_email($email,$email_title,$html);
		}
		
		$status = M('config')->where('id = 71')->getField('value');
		if($status == 1){
			$dx = M('config')->where('id = 78')->getField('value');
			$dx_arr = unserialize($dx);
			if(in_array('gk',$dx_arr)){
				$gk = M('config')->where('id = 76')->getField('value');
				$order_gk = M('order')->where('ordernum = '.$data['ordernum'])->find();
				$order_gk['time'] = date('Y-m-d H:i',$order_gk['addtime']);
				$gk_html  = '';
				foreach($order_gk as $k=>$v){
					$gkkarr[] = "{".$k."}";
					$kkvarr[] = $v;
				}
				$gk_html = str_replace($gkkarr,$kkvarr,$gk);
				sms($data['phone'],$gk_html);
			}
			
			if(in_array('sj',$dx_arr)){
				$sj = M('config')->where('id = 77')->getField('value');
				$order_sj = M('order')->where('ordernum = '.$data['ordernum'])->find();
				$order_sj['time'] = date('Y-m-d H:i',$order_sj['addtime']);
				$sj_html  = '';
				foreach($order_sj as $k=>$v){
					$sjkarr[] = "{".$k."}";
					$sjvarr[] = $v;
				}
				$sj_html = str_replace($sjkarr,$sjvarr,$sj);
				$sj_phone = M('config')->where('id = 82')->getField('value');
				
				sms($sj_phone,$sj_html);
			}
		
		}
		
		$url = U('Home/Order/index?ordernum='.$data['ordernum']);
		$arr = array(
			'status' => 5,
			'title' => '提交订单成功，即将跳转到支付页面...',
			'url' => $url,
		);
		return json_encode($arr);exit;
	}
	
	
	public function json_num_min($nid,$num){
		$nid = I('post.nid');
		$num = I('post.num');
		$arr = array();
		$arr = cookie('num');
		if(in_array($num,$arr)){
			unset($arr[$nid]);
		}else{
			$arr[$nid] = $num;
		}
		cookie('num',$arr,600);
		$min = min($arr);
		echo $min;exit;
	}
	
	public function sms(){
		$sms = M('config')->where('id = 80')->getField('value');
		if($sms == 1){
			$phone = I('post.phone');
			$smscon = M('config')->where('id = 81')->getField('value');
			
			$sms = rand(1000,9999);
			cookie('sms',$sms,600);
			$content = str_replace('{sms}',$sms,$smscon);
			echo sms($phone,$content);exit;
		}else{
			echo 1;exit;
		}
		
	}
	
	
	public function order(){
		
		$pay = require './Application/Common/Conf/pay.php';
		$ordernum = I('get.ordernum');
		$info = M('order')->where('ordernum = "'.$ordernum.'"')->find();
		$temp = M('template')->where('tid = '.$info['tid'])->field('options,size_title,color_title')->find();
		$options = unserialize($temp['options']);
		$info['title'] = explode(',',$info['title']);
		$value = M('config')->where('id = 88')->getField('value');
		$currency = M('product')->where('proid = "'.$info['proid'].'"')->getField('currency');
		
		$language = M('config')->where('id = 97')->getField('value');
		
		$this->assign('language', $language);
		$this->assign('options', $options);
		$this->assign('info', $info);
		$this->assign('temp', $temp);
		$this->assign('value', $value);
		$this->assign('pay', $pay);
		$this->assign('currency', $currency);
		$this->display();
	}
	
	public function get_phone(){
		
		$phone = I('get.phone');
		$proid = I('get.proid');
		$list = M('order')->where('phone = "'.$phone.'" and proid = '.$proid)->order('addtime desc')->select();
		if(!$list){
			$this->error('暂无你要搜索的订单！');
		}else{
			$this->success('',U('phone?phone='.$phone.'&proid='.$proid));
		}
		
	}
	
	
	public function phone(){
		$phone = I('get.phone');
		$proid = I('get.proid');
		$list = M('order')->where('phone = "'.$phone.'" and proid = '.$proid)->order('addtime desc')->select();
		if(!$list){
			$this->error('暂无你要搜索的订单！');exit;
		}
		foreach($list as $k=>$v){
		//	$list[$k]['options'] = unserialize(M('template')->where('tid = '.$v['tid'])->getField('options'));
			$list[$k]['temp'] = M('template')->where('tid = '.$v['tid'])->field('options,size_title,color_title')->find();
			$list[$k]['options'] = unserialize($list[$k]['temp']['options']);
			$list[$k]['title'] = explode(',',$v['title']);
			$list[$k]['currency'] = M('product')->where('proid = "'.$v['proid'].'"')->getField('currency');
		}
	//	p($list);
		$value = M('config')->where('id = 88')->getField('value');
		$ems = M('config')->where('id = 92')->getField('value');
		$language = M('config')->where('id = 97')->getField('value');
		$status = require './Application/Common/Conf/status.php';
		
		$this->assign('status', $status);
		$this->assign('language', $language);
		$this->assign('value', $value);
		$this->assign('ems', $ems);
		$this->assign('list', $list);
		$this->assign('proid', $proid);
		$this->display();
	}
	
	public function explain(){
		
		$orderid = I('post.orderid');
		$explain = I('post.explain');
		
		M('order')->save(array('orderid' => $orderid,'explain' => $explain));
		$this->success('提交成功！');
		
	}
	
	
	
	public function ems(){
		
		$ordernum = I('get.ordernum');
		$proid = I('get.proid');
		$info = M('order')->where('ordernum = "'.$ordernum.'"')->find();
		if(function_exists('fsockopen')){
			$order = getOrderTracesByJson($info['exp_com'],$info['exp_num']);
		}else{
			$order = bw_getOrderTracesByJson($info['exp_com'],$info['exp_num']);
		}
		
		$ems = require './Application/Common/Conf/ems.php';
		$language = M('config')->where('id = 97')->getField('value');
		
		foreach($order['Traces'] as $k=>$v){
			$order['Traces'][$k]['AcceptTime'] = explode(' ',$v['AcceptTime']);
		}
		$count = count($order['Traces'])-1;
		$this->assign('count', $count);
		$this->assign('language', $language);
		$this->assign('order', $order);
		$this->assign('ems', $ems);
		$this->assign('info', $info);
		$this->assign('proid', $proid);
		$this->display();
	}
	
	public function post_cartadd(){
		cookie('bw_cart',null);
		$cart = cookie('bw_cart');
		$cart = json_decode($cart,true);
		$cart[I('post.proid').'-'.I('post.nid',0).'-'.I('post.sid',0).'-'.I('post.cid',0)] = array(
			'gzid' => I('post.gzid'),
			'tid' => I('post.tid'),
			'proid' => I('post.proid'),
			'nid' => I('post.nid'),
			'sid' => I('post.sid'),
			'cid' => I('post.cid'),
			'num' => I('post.num'),
			'title' => I('post.title'),
			'size' => I('post.size'),
			'color' => I('post.color'),
			'gzid' => I('post.gzid'),
			'pro_class' => I('post.pro_class'),
			'totals' => I('post.totals'),
			'total' => I('post.total'),
			'price' => I('post.price'),
			'number' => I('post.number'),
		);
		
		//p($cart);
		$data = json_encode($cart);
		cookie('bw_cart',$data,3600);
		echo $data;
	}
	
	
	public function message(){
		
		$proid = I('get.proid');
		$cart = cookie('bw_cart');
		$cart = json_decode($cart,true);
		sort($cart);
		
		$info = M('product')->where('proid = '.$proid)->find();
		$temp = M('template')->where('tid = '.$info['template'])->find();
		$temp['options'] = unserialize($temp['options']);
		$temp['pay_type'] = unserialize($temp['pay_type']);
		$options = '';
		foreach($temp['options'] as $k=>$v){
			$options .= "'".$v."',";
		}
		$options = substr($options,0,-1);
		
		$pay = array();
		foreach($temp['pay_type'] as $k=>$v){
			if($v['status'] == 0){
				unset($temp['pay_type'][$k]);
			}else{
				$pay[$v['sort']] = $k;
			}
		}
		ksort($pay);
		$pay = array_merge($pay);
	
		$this->assign('info', $info);
		$this->assign('proid', $proid);
		$this->assign('temp', $temp);
		$this->assign('options', $options);
		$this->assign('pay', $pay);
		$this->assign('cart', $cart);
		$this->meta_title = '提交信息';
		$this->display();
	}
	
	
	public function contact(){
		
		$contact = M('config')->where('id = 42')->getField('value');
		$this->assign('contact', $contact);
		$this->meta_title = '联系我们';
		$this->display();
	}
	
	public function about(){
		
		$contact = M('config')->where('id = 43')->getField('value');
		$this->assign('contact', $contact);
		$this->meta_title = '关于我们';
		$this->display();
	}
	
	
	public function html(){
		
		$pid = $_GET['proid'];
		if($pid){
			$list = M('product')->where('proid ='.$pid)->field('proid,style')->find();
		}else{
			$list = M('product')->order('proid desc')->field('proid,style')->find();
			delDirAndFile('html');
			if(!file_exists('./html')){
				mkdir('./html');
			}
		}
		
		cookie('num',null);
		$proid = $list['proid'];
		$info = M('product')->where('proid = '.$proid)->find();
		$info['content'] = M('product_data')->where('proid = '.$proid)->getField('content');
		$temp = M('template')->where('tid = '.$info['template'])->find();
		$norms_pro = M('product_norms')->where('proid = '.$proid.' and type = 1')->order('def desc')->select();
		$norms_size = M('product_norms')->where('proid = '.$proid.' and type = 2')->select();
		$norms_color = M('product_norms')->where('proid = '.$proid.' and type = 3')->select();
		$temp['options'] = unserialize($temp['options']);
		$temp['pay_type'] = unserialize($temp['pay_type']);
		$info['images'] = explode(',',$info['images']);
		$info['review'] = explode("\r\n",trim($info['review']));
		foreach($info['review'] as $k=>$v){
			$info['review'][$k] = explode("|",$v);
		}
		$info['preferential'] = $info['oldprice']-$info['price'];
		$options = '';
		foreach($temp['options'] as $k=>$v){
			$options .= "'".$v."',";
		}
		$options = substr($options,0,-1);
		
		$pay = array();
		foreach($temp['pay_type'] as $k=>$v){
			if($v['status'] == 0){
				unset($temp['pay_type'][$k]);
			}else{
				$pay[$v['sort']] = $k;
			}
		}
		ksort($pay);
		$pay = array_merge($pay);
		$arr = array();
		$arr = cookie('num');
		$arr[$norms_pro[0]['nid']] = $norms_pro[0]['number'];
		cookie('num',$arr,600);
		//p($temp);

		
		$orderhtml = explode("\r\n",trim($temp['order_content']));
		foreach($orderhtml as $k=>$v){
			$orderhtml[$k] = str_replace("{time}",date('Y-m-d'),$v);
		}
		$html = explode("\r\n",trim($temp['delivery_content']));
		foreach($html as $k=>$v){
			$html[$k] = str_replace("{time}",date('Y-m-d'),$v);
		}
		
		if($info['time_status'] == 0){
			if($info['time_type'] == 2){
				$endtime = $info['time_sum'];
			}else{
				$endtime = $info['endtime']-time();
			}
		}
		
		if($info['parameter']){
			$parameter = explode("\r\n",trim($info['parameter']));
			foreach($parameter as $k=>$v){
				$parameter[$k] = explode(":",$v);
			}
		}
		
		if($info['status'] == 1){
			if($info['time_status'] == 0){
				if($info['time_type'] == 1){
					if(($info['starttime'] < time()) && ($info['endtime'] > time())){
						$temphtml = 1;
					}
				}else{
					$temphtml = 1;
				}	
			}else{
				$temphtml = 1;
			}			
		}
		$audit = M('audit')->where('id = '.$proid)->find();
		$temp['nav_temp'] = explode(',',$temp['nav_temp']);
		$temp['nav_count'] = count($temp['nav_temp']);
		$language = M('config')->where('id = 97')->getField('value');
		$statistical = M('config')->where('id = 99')->getField('value');
		/*
		$WX_APPID = M('config')->where('id = 53')->getField('value');
		$WX_APPSECRET = M('config')->where('id = 54')->getField('value');
		require 'Jssdk.php';
		$jssdk = new \Jssdk($WX_APPID, $WX_APPSECRET);
		$signPackage = $jssdk->GetSignPackage();
		$this->assign('signPackage', $signPackage);
		*/
		
		$value = M('config')->where('id = 88')->getField('value');
		$this->assign('audit', $audit);
		$this->assign('value', $value);
		$this->assign('statistical', $statistical);
		$this->assign('root', __ROOT__);
		$this->assign('language', $language);
		$this->assign('parameter', $parameter);
		$this->assign('endtime', $endtime);
		$this->assign('html', $html);
		$this->assign('orderhtml', $orderhtml);
		$this->assign('options', $options);
		$this->assign('pay', $pay);
		$this->assign('info', $info);
		$this->assign('temp', $temp);
		$this->assign('norms_pro', $norms_pro);
		$this->assign('norms_size', $norms_size);
		$this->assign('norms_color', $norms_color);
		$this->assign('proid', $proid);
		$this->assign('temphtml', $temphtml);
		
		
		$gzname = M('gzname')->select();
		$member = M('member')->field('uid')->select();
		foreach($gzname as $gzv){
			if(!file_exists('./html/'.$proid)){
				mkdir('./html/'.$proid);
			}
			$this->assign('gzid', $gzv['gzid']);
			foreach($member as $mv){
				$this->assign('uid', $mv['uid']);
				$this->buildHtml($gzv['gzid'].'-'.$mv['uid'],'./html/'.$proid.'/',"Index:".$list['style']);
			}
		}
		
		foreach($member as $mv){
			$this->assign('uid', $mv['uid']);
			$this->buildHtml($proid.'-'.$mv['uid'],'./html/',"Index:".$list['style']);
		}
		$id = M('product')->where('proid < '.$list['proid'])->order('proid desc')->getField('proid');
		if($id){
			$this->redirect('html?proid='.$id);
		}
		
		
	}

    public function upload(){
    	if(IS_POST){
            //又拍云
            // $config = array(
            //     'host'     => 'http://v0.api.upyun.com', //又拍云服务器
            //     'username' => 'zuojiazi', //又拍云用户
            //     'password' => 'thinkphp2013', //又拍云密码
            //     'bucket'   => 'thinkphp-static', //空间名称
            // );
            // $upload = new \COM\Upload(array('rootPath' => 'image/'), 'Upyun', $config);
            //百度云存储
            $config = array(
                'AccessKey'  =>'3321f2709bffb9b7af32982b1bb3179f',
                'SecretKey'  =>'67485cd6f033ffaa0c4872c9936f8207',
                'bucket'     =>'test-upload',
                'size'      =>'104857600'
            );
    		$upload = new \COM\Upload(array('rootPath' => './Uploads/bcs'), 'Bcs', $config);
    		$info   = $upload->upload($_FILES);
    	} else {
    		$this->display();
    	}
    }

    public function upyun(){
        $policydoc = array(
            "bucket"             => "thinkphp-static", /// 空间名
            "expiration"         => NOW_TIME + 600, /// 该次授权过期时间
            "save-key"            => "/{year}/{mon}/{random}{.suffix}",
            "allow-file-type"      => "jpg,jpeg,gif,png", /// 仅允许上传图片
            "content-length-range" => "0,102400", /// 文件在 100K 以下
        );

        $policy = base64_encode(json_encode($policydoc));
        $sign = md5($policy.'&'.'56YE3Ne//xc+JQLEAlhQvLjLALM=');

        $this->assign('policy', $policy);
        $this->assign('sign', $sign);
        $this->display();
    }

    public function test(){
        $table = new \OT\DataDictionary;
        echo "<pre>".PHP_EOL;
        $out = $table->generateAll();
        echo "</pre>";
        // print_r($out);
    }

}
