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
class OrderController extends HomeController {

	//系统首页
    public function index(){
    	
		if(IS_POST){
			$data = array(
				"alinum" => trim(I('post.alinum')),
			);
			if($proid = M('order')->where('ordernum = "'.I('post.ordernum').'"')->getField('proid')){
				if(!M('order')->where('alinum = "'.$data['alinum'].'"')->getField('proid')){
					M('order')->where('ordernum = "'.I('post.ordernum').'"')->save($data);
					$this->success('提交成功！',U("index/info?proid=".$proid));
				}else{
					$this->error('参数错误！');
				}
			}else{
				$this->error('参数错误！');
			}
			
		}else{
			$ordernum = I('get.ordernum');
			$order = M('order')->where('ordernum = "'.$ordernum.'"')->field('paytype,total,proid,alinum')->find();
			$pay =  M('paycode')->where('price = '.$order['total'].' and type = "'.$order['paytype'].'"')->find();
			if(!$order || $order['alinum'] || !$pay){
				$this->error('参数错误！');
			}
			//p($order);
			$this->assign('pay', $pay);
			$this->assign('order', $order);
			$this->display();
		}
		
    }

}
