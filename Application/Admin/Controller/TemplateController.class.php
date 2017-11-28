<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: 麦当苗儿 <zuojiazi@vip.qq.com> <http://www.zjzit.cn>
// +----------------------------------------------------------------------

namespace Admin\Controller;
use User\Api\UserApi as UserApi;
use COM\Page;
/**
 * 产品控制器
 * @author 麦当苗儿 <zuojiazi@vip.qq.com>
 */
class TemplateController extends AdminController {

	public $infoadmin = array();

	public function __construct(){
		parent::__construct();  
		
		$perid = M('member')->where('uid = '.UID)->getField('perid');
		
		$infoadmin = M('permissions')->where('perid = '.$perid)->field('product')->find();
		
		if($infoadmin['product']){
			$infoadmin['product'] = explode(',',$infoadmin['product']);
		}
		
		if(!$infoadmin['product']){
			$this->error('参数错误！');
		}
		$this->infoadmin = $infoadmin;
		
		$nav_type = 'product';
		$nav_type_li = 'temp';
		$this->assign('nav_type', $nav_type);
		$this->assign('nav_type_li', $nav_type_li);
		
	}
	

    public function index(){
		
		if(UID != 1){
			$infoadmin = $this->peradmin;
			if(!in_array("template",$infoadmin['product'])){
				$this->error('参数错误！');
			}
		}
		$count = M('Template')->count();
		$page = new Page($count,50);
		$list = M('Template')->limit($page->firstRow.','.$page->listRows)->select();
		
		$pages = $page->show();
		
        $this->assign('count', $count);
		$this->assign('_list', $list);
		$this->assign('_page', $pages);
		$this->meta_title = '模板管理';
		$this->display();
    }
	
	
	public function add(){
		if(UID != 1){
			$infoadmin = $this->peradmin;
			if(!in_array("template_add",$infoadmin['product'])){
				$this->error('参数错误！');
			}
		}
		
		if(IS_POST){
			
			$data = array(
				'name' => I('post.name'),
				'title' => I('post.title'),
				'pro_class' => I('post.pro_class'),
				'pro_title' => I('post.pro_title'),
				'size_class' => I('post.size_class'),
				'color_class' => I('post.color_class'),
				'color_title' => I('post.color_title'),
				'size_title' => I('post.size_title'),
				'options' => serialize(I('post.options')),
				'sms' => I('post.sms'),
				'delivery' => I('post.delivery'),
				'delivery_title' => I('post.delivery_title'),
				'delivery_content' => I('post.delivery_content'),
				'order' => I('post.order'),
				'order_title' => I('post.order_title'),
				'order_content' => I('post.order_content'),
				'alert' => I('post.alert'),
				'alert_type' => I('post.alert_type'),
				'alert_href' => I('post.alert_href'),
				'alert_content' => I('post.alert_content'),
				'message' => I('post.message'),
				'nav' => I('post.nav'),
				'nav_temp' => implode(',',I('post.nav_temp')),
				'smsphone' => I('post.smsphone'),
				'qq' => I('post.qq'),
				'search' => I('post.search'),
				'phone' => I('post.phone'),
				'addtime' => NOW_TIME,
			);
			
			$data['pay_type'] = serialize(array(
				'huodao' => array(
					'status' => I('post.huodao',0),
					'discount' => trim(I('post.huodao_discount')),
					'sort' => trim(I('post.huodao_sort')),
					'content' => trim(I('post.huodao_content')),
					'title' => '货到付款',
				),
				'alipay' => array(
					'status' => I('post.alipay',0),
					'discount' => trim(I('post.alipay_discount')),
					'sort' => trim(I('post.alipay_sort')),
					'content' => trim(I('post.alipay_content')),
					'title' => '支付宝',
				),
				'wechat' => array(
					'status' => I('post.wechat',0),
					'discount' => trim(I('post.wechat_discount')),
					'sort' => trim(I('post.wechat_sort')),
					'content' => trim(I('post.wechat_content')),
					'title' => '微信',
				),
				'alipaycode' => array(
					'status' => I('post.alipaycode',0),
					'discount' => trim(I('post.alipaycode_discount')),
					'sort' => trim(I('post.alipaycode_sort')),
					'content' => trim(I('post.alipaycode_content')),
					'title' => '支付宝二维码',
				),
				'wechatcode' => array(
					'status' => I('post.wechatcode',0),
					'discount' => trim(I('post.wechatcode_discount')),
					'sort' => trim(I('post.wechatcode_sort')),
					'content' => trim(I('post.wechatcode_content')),
					'title' => '微信二维码',
				),
			));
			
			if($data['sms'] == 'on'){
				$data['sms'] = 0;
			}else{
				$data['sms'] = 1;
			}
			if($data['delivery'] == 'on'){
				$data['delivery'] = 0;
			}else{
				$data['delivery'] = 1;
			}
			if($data['alert'] == 'on'){
				$data['alert'] = 0;
			}else{
				$data['alert'] = 1;
			}
			if($data['nav'] == 'on'){
				$data['nav'] = 0;
			}else{
				$data['nav'] = 1;
			}
			if($data['order'] == 'on'){
				$data['order'] = 0;
			}else{
				$data['order'] = 1;
			}
			if($data['search'] == 'on'){
				$data['search'] = 0;
			}else{
				$data['search'] = 1;
			}
			M('Template')->add($data);
			action_log('temp_add', 'member', UID, UID);
			$this->success('添加成功！',U('index'));
			
		}else{
			
			$nav = $this->nav();
			$options = $this->options();
			$this->assign('options', $options);
			$this->assign('nav', $nav);
			$this->meta_title = '模板管理';
			$this->display();
		}
	}
	
	public function update(){
		if(UID != 1){
			$infoadmin = $this->peradmin;
			if(!in_array("template_update",$infoadmin['product'])){
				$this->error('参数错误！');
			}
		}
		if(IS_POST){
			
			$data = array(
				'name' => I('post.name'),
				'title' => I('post.title'),
				'pro_class' => I('post.pro_class'),
				'pro_title' => I('post.pro_title'),
				'size_class' => I('post.size_class'),
				'color_class' => I('post.color_class'),
				'color_title' => I('post.color_title'),
				'size_title' => I('post.size_title'),
				'options' => serialize(I('post.options')),
				'sms' => I('post.sms'),
				'delivery' => I('post.delivery'),
				'delivery_title' => I('post.delivery_title'),
				'delivery_content' => I('post.delivery_content'),
				'order' => I('post.order'),
				'order_title' => I('post.order_title'),
				'order_content' => I('post.order_content'),
				'alert' => I('post.alert'),
				'alert_type' => I('post.alert_type'),
				'alert_href' => I('post.alert_href'),
				'alert_content' => I('post.alert_content'),
				'message' => I('post.message'),
				'nav' => I('post.nav'),
				'nav_temp' => implode(',',I('post.nav_temp')),
				'smsphone' => I('post.smsphone'),
				'qq' => I('post.qq'),
				'search' => I('post.search'),
				'phone' => I('post.phone'),
				'addtime' => NOW_TIME,
			);
			
			$data['pay_type'] = serialize(array(
				'huodao' => array(
					'status' => I('post.huodao',0),
					'discount' => trim(I('post.huodao_discount')),
					'sort' => trim(I('post.huodao_sort')),
					'content' => trim(I('post.huodao_content')),
					'title' => '货到付款',
				),
				'alipay' => array(
					'status' => I('post.alipay',0),
					'discount' => trim(I('post.alipay_discount')),
					'sort' => trim(I('post.alipay_sort')),
					'content' => trim(I('post.alipay_content')),
					'title' => '支付宝',
				),
				'wechat' => array(
					'status' => I('post.wechat',0),
					'discount' => trim(I('post.wechat_discount')),
					'sort' => trim(I('post.wechat_sort')),
					'content' => trim(I('post.wechat_content')),
					'title' => '微信',
				),
				'alipaycode' => array(
					'status' => I('post.alipaycode',0),
					'discount' => trim(I('post.alipaycode_discount')),
					'sort' => trim(I('post.alipaycode_sort')),
					'content' => trim(I('post.alipaycode_content')),
					'title' => '支付宝二维码',
				),
				'wechatcode' => array(
					'status' => I('post.wechatcode',0),
					'discount' => trim(I('post.wechatcode_discount')),
					'sort' => trim(I('post.wechatcode_sort')),
					'content' => trim(I('post.wechatcode_content')),
					'title' => '微信二维码',
				),
			));
			
			if($data['sms'] == 'on'){
				$data['sms'] = 0;
			}else{
				$data['sms'] = 1;
			}
			if($data['delivery'] == 'on'){
				$data['delivery'] = 0;
			}else{
				$data['delivery'] = 1;
			}
			if($data['alert'] == 'on'){
				$data['alert'] = 0;
			}else{
				$data['alert'] = 1;
			}
			if($data['nav'] == 'on'){
				$data['nav'] = 0;
			}else{
				$data['nav'] = 1;
			}
			if($data['order'] == 'on'){
				$data['order'] = 0;
			}else{
				$data['order'] = 1;
			}
			if($data['search'] == 'on'){
				$data['search'] = 0;
			}else{
				$data['search'] = 1;
			}
			M('Template')->where('tid = '.I('post.tid'))->save($data);
			action_log('temp_update', 'member', UID, UID);
			$this->success('编辑成功！',U('index'));
			
		}else{
			
			$tid = I('get.tid');
			$info = M('Template')->where('tid = '.$tid)->find();
			$info['options'] = unserialize($info['options']);
			$info['pay_type'] = unserialize($info['pay_type']);
			$info['nav_temp'] = explode(',',$info['nav_temp']);
			$options = $this->options();
			$nav = $this->nav();
			
			$this->assign('nav', $nav);
			$this->assign('options', $options);
			$this->assign('info', $info);
			$this->meta_title = '模板管理';
			$this->display();
		}
	}
	
	
	public function del(){
		if(UID != 1){
			$infoadmin = $this->peradmin;
			if(!in_array("template_del",$infoadmin['product'])){
				$this->error('参数错误！');
			}
		}
		$tid = I('get.tid');
		if($tid != 1){
			M('Template')->where('tid = '.$tid)->delete();
			action_log('temp_del', 'member', UID, UID);
			$this->success('删除成功！',U('index'));
		}
		
	}
	
	
	public function del_arr(){
		if(IS_POST){
			foreach($_POST['tid'] as $k=>$v){
				M('Template')->where('tid = '.$v)->delete();
			}
			action_log('temp_del', 'member', UID, UID);
			$this->success('删除成功！');
		}
	}
	
	public function options(){
		$options = array(
			'num' => '订购数量',
			'price' => '产品价格',
			'name' => '姓名',
			'sex' => '性别',
			'age' => '年龄',
			'height' => '身高',
			'weight' => '体重',
			'idnumber' => '身份证号',
			'phone' => '手机号码',
			'tel' => '电话号码',
			'area' => '地区选择',
			'address' => '详情地址',
			'code' => '邮编',
			'qq' => 'QQ号',
			'wechat' => '微信号',
			'email' => '邮箱',
			//'invitation' => '邀请码',
			'message' => '留言',
		);
		return $options;
	}
	
	public function nav(){
		
		$nav = array(
			'index' => '首页',
			'buy' => '在线下单',
			'tel' => '电话咨询',
			'sms' => '短信咨询',
			'qq' => 'QQ咨询',
			'top' => '返回顶部',
		);
		return $nav;
		
	}
	
}
