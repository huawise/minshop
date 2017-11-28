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
 * 订单控制器
 * @author 麦当苗儿 <zuojiazi@vip.qq.com>
 */
class OrderController extends AdminController {


	public $infoadmin = array();

	public function __construct(){
		parent::__construct();  
		
		$perid = M('member')->where('uid = '.UID)->getField('perid');
		
		$infoadmin = M('permissions')->where('perid = '.$perid)->field('order,list')->find();
		
		if($infoadmin['order']){
			$infoadmin['order'] = explode(',',$infoadmin['order']);
		}
		if($infoadmin['list']){
			$infoadmin['list'] = explode(',',$infoadmin['list']);
		}
		if(!$infoadmin['order']){
			$this->error('参数错误！');
		}
		$this->infoadmin = $infoadmin;
		
		$nav_type = 'order';
		$nav_type_li = 'order_list';
		$this->assign('nav_type', $nav_type);
		$this->assign('nav_type_li', $nav_type_li);
		
	}
	
	/*
	 *手机版产品列表选择
	*/
	public function orderpro(){
		if(UID != 1){
			$infoadmin = $this->peradmin;
			if($infoadmin['list']){ 
				$where['proid']  = array('in',$infoadmin['list']);
				$list = M('product')->where($where)->order('sort asc,proid desc')->select();
			}
			if(!in_array("pro",$infoadmin['product'])){
				$this->error('参数错误！');
			}
		}else{
			$list = M('product')->where($where)->order('sort asc,proid desc')->select();
		}
		
		$this->assign('list', $list);
		$this->display();
	}
	
	public function search(){
		
		$this->display('m-index');
	}

    /**
     * 订单列表
     * @author 麦当苗儿 <zuojiazi@vip.qq.com>
     */
    public function index(){
		
		$status = require './Application/Common/Conf/status.php';
		$pay = require './Application/Common/Conf/pay.php';
		$ems = require './Application/Common/Conf/ems.php';
		$where = array();
		$reclaim = I('get.r')?I('get.r'):0;
		
		$where['reclaim'] = array('eq',$reclaim);
		$totalwhere['reclaim'] = array('eq',$reclaim);
		
		if(I('get.ordernum') != 'no' && I('get.ordernum') != ''){
			$where['ordernum'] = I('get.ordernum');
		}
		
		if(I('get.phone') != 'no' && I('get.phone') != ''){
			$where['phone'] = I('get.phone');
		}
		
		if(I('get.status') != '0' && I('get.status') != ''){
			$where['status'] = I('get.status');
		}
		
		if((I('get.starttime') != 'no' && I('get.starttime') != '') || (I('get.endtime') == 'no' && I('get.endtime') == '')){
			$where['addtime'] = array('gt',I('get.starttime'));
			$s = date('Y-m-d H:i',I('get.starttime'));
		}
		
		if((I('get.starttime') == 'no' && I('get.starttime') == '') || (I('get.endtime') != 'no' && I('get.endtime') != '')){
			$where['addtime'] = array('lt',I('get.endtime'));
			$e = date('Y-m-d H:i',I('get.endtime'));
		}
		
		if((I('get.starttime') != 'no' && I('get.starttime') != '') && (I('get.endtime') != 'no' && I('get.endtime') != '')){
			$where['addtime'] = array(array('gt',I('get.starttime')),array('lt',I('get.endtime')));
			$s = date('Y-m-d H:i',I('get.starttime'));
			$e = date('Y-m-d H:i',I('get.endtime'));
		}
		
		if(I('get.paytype') != 'no' && I('get.paytype') != ''){
			$where['paytype'] = I('get.paytype');
		}
		
		if(I('get.proid') != 'no' && I('get.proid') != ''){
			$where['proid'] = I('get.proid');
			$whereproid = 1;
		}
		if(I('get.gzid') != 'no' && I('get.gzid') != ''){
			$where['gzid'] = I('get.gzid');
		}
		
		if(I('get.paytime') != 'no'){
			if(I('get.paytime') == 1){
				$where['paytime'] = array('exp','is null');
			}else if(I('get.paytime') == 2){
				$where['paytime'] = array('gt',0);
			}
		}
		
		if(I('get.province') != '0' && I('get.province') != ''){
			$where['province'] = I('get.province');
		}
		
		if(I('get.name') != '0' && I('get.name') != ''){
			$where['name'] = I('get.name');
		}
		
		$stime = strtotime(date('Ymd')); 
		$etime = strtotime(date('Ymd'))+86400;
		$infoadmin = $this->peradmin;
		if(UID != 1){
			
			if(!in_array("order_list",$infoadmin['order'])){
				$this->error('参数错误！');
			}
		//	if($infoadmin['list']){ 
				if(I('get.proid') != 'no' && I('get.proid') != ''){
					$where['proid'] = I('get.proid');
				}else{
					$where['proid']  = array('in',$infoadmin['list']);
				}
				
				$where['uid']  = array('eq',UID);
				
				$map['uid']  = array('eq',UID);
				$map['proid']  = array('in',$infoadmin['list']);
				
				$map['addtime'] = array(array('gt',$stime),array('lt',$etime));
				$totalwhere['proid']  = array('in',$infoadmin['list']);
				$totalwhere['uid']  = array('eq',UID);
				$pro['proid']  = array('in',$infoadmin['list']);
				$wfh['proid']  = array('in',$infoadmin['list']);
				$wfh['uid']  = array('eq',UID);
				$wfh['status']  = array('eq',1);
				$yfh['proid']  = array('in',$infoadmin['list']);
				$yfh['status']  = array('eq',2);
				$yfh['uid']  = array('eq',UID);
		//	}
		}else{
			$map['addtime'] = array(array('gt',$stime),array('lt',$etime));
			$wfh['status']  = array('eq',1);
			$yfh['status']  = array('eq',2);
			
			if(I('get.uid') != '0' && I('get.uid') != ''){
				$where['uid'] = I('get.uid');
			}
			
		}
		
		$member = M('member')->field('uid,nickname')->select();
		
		
		$table = $this->order_table();
		$table_1 = M('config')->where('id = 83')->getField('value');
		$table_1 = explode(',',$table_1);
		$table_title = array();
		foreach($table_1 as $k=>$v){
			$table_title[$v] = $table[$v];
		}
		
		$count = M('order')->where($where)->count();
		
		if(is_mobile()){
			$page = new Page($count,10);
		}else{
			$page = new Page($count,50);
		}
		$list = M('order')->where($where)->order('orderid desc')->limit($page->firstRow.','.$page->listRows)->select();
		
		foreach($list as $k=>$v){
			$list[$k]['gzname'] = M('gzname')->where('gzid = '.$v['gzid'])->getField('name');
			$list[$k]['title'] = M('product')->where('proid = '.$v['proid'])->getField('title').'<br/>'.$v['title'].' '.$v['size'].' '.$v['color'] .' X '.$v['num'];
			$list[$k]['exp_com'] = $ems[$v['exp_com']];
		}
		
		
		if(is_mobile()){
			$pages = $page->mshow();
		}else{
			$pages = $page->show();
		}
		
		$news_day_count = M('order')->where($map)->count();
		$wfh_count = M('order')->where($wfh)->count();
		$yfh_count = M('order')->where($yfh)->count();
		$total = M('order')->where($totalwhere)->sum('total');
		
		$pro_list = M('product')->where($pro)->field('proid,title')->select();
		$gzlist = M('gzname')->select();
		
		if($reclaim == 1){
			$this->assign('nav_type_li', 'order_del');
		}
		
		
		$this->assign('reclaim', $reclaim);
		$this->assign('member', $member);
		$this->assign('status', $status);
		$this->assign('phone', $where['phone']);
		$this->assign('ordernum', $where['ordernum']);
		$this->assign('_list', $table_list);
		$this->assign('list', $list);
		$this->assign('_page', $pages);
		$this->assign('table_title', $table_title);
		$this->assign('uid', UID);
		$this->assign(get_defined_vars());
		$this->meta_title = '订单管理';
		
		if(is_mobile()){
			$this->display('m-index');
		}else{
			$this->display();
		}
    }
	
	
	
	
	public function repeat(){
		$where['reclaim'] = array('eq',0);
		$mapphone['reclaim'] = array('eq',0);
		if(UID != 1){
			$infoadmin = $this->peradmin;
			if(!in_array("order_list",$infoadmin['order'])){
				$this->error('参数错误！');
			}
			$where['proid']  = array('in',$infoadmin['list']);
			$where['uid']  = array('eq',UID);
			$mapname['proid']  = array('in',$infoadmin['list']);
			$mapname['uid']  = array('eq',UID);
			$mapphone['proid']  = array('in',$infoadmin['list']);
			$mapphone['uid']  = array('eq',UID);

		}
		
		$name = M('order')->where($where)->field('name')->select();
		foreach($name as $k=>$v){
			$name[$k] = $v['name'];
		}
		$name = $this->FetchRepeatMemberInArray($name);
		$name = array_unique($name);
		
		$name_arr = array();
		foreach($name as $k=>$v){
			$mapname['name'] = array('eq',$v);
			$name_arr[$k]['count'] = M('order')->where($mapname)->count();
			$name_arr[$k]['name'] = $v;
		}
		
		
		$phone = M('order')->where($where)->field('phone')->select();
		foreach($phone as $k=>$v){
			$phone[$k] = $v['phone'];
		}
		$phone = $this->FetchRepeatMemberInArray($phone);
		$phone = array_unique($phone);
		
		$phone_arr = array();
		foreach($phone as $k=>$v){
			$mapphone['phone'] = array('eq',$v);
			$phone_arr[$k]['count'] = M('order')->where($mapphone)->count();
			$phone_arr[$k]['phone'] = $v;
		}
		
		$this->assign('name', $name_arr);
		$this->assign('phone', $phone_arr);
		$this->meta_title = '订单管理';
		$this->display();
		
	}
	
	public function FetchRepeatMemberInArray($array) { 
		// 获取去掉重复数据的数组 
		$unique_arr = array_unique ( $array ); 
		// 获取重复数据的数组 
		$repeat_arr = array_diff_assoc ( $array, $unique_arr ); 
		return $repeat_arr; 
	} 
	
	/**/
	public function gzlist(){
		$where['reclaim'] = array('eq',0);
		if(UID != 1){
			$infoadmin = $this->peradmin;
			if(!in_array("order_gz",$infoadmin['order'])){
				$this->error('参数错误！');
			}
			$where['proid']  = array('in',$infoadmin['list']);
			$where['uid']  = array('eq',UID);
		}
		$list = M('gzname')->select();
		$count = count($list);
		foreach($list as $k=>$v){
			$where['gzid']  = array('eq',$v['gzid']);
			$list[$k]['count'] = M('order')->where($where)->count();
			$list[$k]['total'] = M('order')->where($where)->sum('total');
		}
		
		$stime = strtotime(date('Ymd')); 
		$etime = strtotime(date('Ymd'))+86400;
		
		$zstime = strtotime(date('Ymd'))-86400;
		
		$nav_type_li = 'gzlist';
		$this->assign('nav_type_li', $nav_type_li);
		
		$this->assign('_list', $list);
		$this->assign('count', $count);
		$this->assign('stime', $stime);
		$this->assign('etime', $etime);
		$this->assign('zstime', $zstime);
		$this->meta_title = '推广统计';
		if(is_mobile()){
			$this->display('m-gzlist');
		}else{
			$this->display();
		}
	}
	
	
	public function gzinfo(){
		$gzid = I('get.gzid');
		if(UID != 1){
			$infoadmin = $this->peradmin;
			if(!in_array("order_gz",$infoadmin['order'])){
				$this->error('参数错误！');
			}
			$orderwhere['proid']  = array('in',$infoadmin['list']);
		}
		$orderwhere['gzid']  = array('eq',$gzid);
		$orderwhere['reclaim'] = array('eq',0);
		//p($orderwhere);
		$where = 'gzid = '.$gzid;
		$title = M('gzname')->where($where)->getField('name');
		$count = M('order')->where($orderwhere)->count();
		$list = M('order')->where($orderwhere)->field('proid')->select();
		
		$arr = array();
		$alist = array();
		foreach($list as $k=>$v){
			$arr[$v['proid']] = $v['proid'];
		}
		foreach($arr as $k=>$v){
			$alist[$k]['count'] = M('order')->where('proid = '.$v.' and gzid = '.$gzid.' and reclaim = 0')->count();
			$alist[$k]['title'] = M('product')->where('proid = '.$v)->getField('title');
		}
		
		$nav_type_li = 'gzlist';
		$this->assign('nav_type_li', $nav_type_li);
		$this->assign('count', $count);
		$this->assign('title', $title);
		$this->assign('_list', $alist);
		$this->meta_title = '推广统计';
		$this->display();
	}
	
	public function selectsum(){
		
		$this->assign('uid', UID);
		$this->display();
	}
	
	
	public function sumlist(){
		$pwhere['reclaim'] = array('eq',0);
		$paywhere['reclaim'] = array('eq',0);
		$orderwhere['reclaim'] = array('eq',0);
		$ywhere['reclaim'] = array('eq',0);
		$dwhere['reclaim'] = array('eq',0);
		$ypaywhere['reclaim'] = array('eq',0);
		$wpaywhere['reclaim'] = array('eq',0);
		if(UID != 1){
			$infoadmin = $this->peradmin;
			if(!in_array("order_sum",$infoadmin['order'])){
				$this->error('参数错误！');
			}
			$productwhere['proid']  = array('in',$infoadmin['list']);
			$productwhere['uid']  = array('eq',UID);
			$paywhere['proid']  = array('in',$infoadmin['list']);
			$paywhere['uid']  = array('eq',UID);
			$orderwhere['proid']  = array('in',$infoadmin['list']);
			$orderwhere['uid']  = array('eq',UID);
			$ywhere['proid']  = array('in',$infoadmin['list']);
			$ywhere['uid']  = array('eq',UID);
			$dwhere['proid']  = array('in',$infoadmin['list']);
			$dwhere['uid']  = array('eq',UID);
			
			$product = M('product')->where($productwhere)->field('proid,title')->select();
			foreach($product as $k=>$v){
				$pwhere['proid'] = array('eq',$v['proid']);
				$pwhere['uid'] = array('eq',UID);
				$product[$k]['count'] = M('order')->where($pwhere)->count();
				$product[$k]['total'] = M('order')->where($pwhere)->sum('total');
			}
			
		}else{
			$product = M('product')->where($productwhere)->field('proid,title')->select();
			foreach($product as $k=>$v){
				$pwhere['proid'] = array('eq',$v['proid']);
				$product[$k]['count'] = M('order')->where($pwhere)->count();
				$product[$k]['total'] = M('order')->where($pwhere)->sum('total');
			}
			
		}
		
		//p($product);
		$pay = array(
			'0' => 'huodao',
			'1' => 'alipay',
			'2' => 'wechat',
			'3' => 'alipaycode',
			'4' => 'wechatcode',
		);
		$paylist = array();
		foreach($pay as $k=>$v){
			if($v == 'huodao'){
				$paylist[$k]['title'] = '货到付款';
			}
			if($v == 'alipay'){
				$paylist[$k]['title'] = '支付宝';
				$wpaywhere['paytime'] = array('exp','is null');
				$ypaywhere['paytime'] = array('gt','1');
				$wpaywhere['paytype'] = array('eq',$v);
				$ypaywhere['paytype'] = array('eq',$v);
				$paylist[$k]['wtotal'] = M('order')->where($wpaywhere)->sum('total');
				$paylist[$k]['ytotal'] = M('order')->where($ypaywhere)->sum('total');
			}
			if($v == 'wechat'){
				$paylist[$k]['title'] = '微信';
				$wpaywhere['paytime'] = array('exp','is null');
				$ypaywhere['paytime'] = array('gt','1');
				$wpaywhere['paytype'] = array('eq',$v);
				$ypaywhere['paytype'] = array('eq',$v);
				$paylist[$k]['wtotal'] = M('order')->where($wpaywhere)->sum('total');
				$paylist[$k]['ytotal'] = M('order')->where($ypaywhere)->sum('total');
			}
			if($v == 'alipaycode'){
				$paylist[$k]['title'] = '支付宝二维码';
			}
			if($v == 'wechatcode'){
				$paylist[$k]['title'] = '微信二维码';
			}
			$paylist[$k]['type'] = $v;
			
			$paywhere['paytype'] = array('eq',$v);
			
			$paylist[$k]['count'] = M('order')->where($paywhere)->count();
			$paylist[$k]['total'] = M('order')->where($paywhere)->sum('total');
			
			
		}
	//	p($paylist);
		
		$address = M('order')->where($orderwhere)->field('province')->select();
		foreach($address as $k=>$v){
			$address[$k] = $v['province'];
		}
		//$address = $this->formatArray($address);
		$address = array_unique($address);
		
		$province = array();
		foreach($address as $k=>$v){
			$province[$k]['title'] = $v;
			$orderwhere['province'] = array('eq',$v);
			$province[$k]['count'] = M('order')->where($orderwhere)->count();
			$province[$k]['total'] = M('order')->where($orderwhere)->sum('total');
		}
		
		
		$t = time(); 
		$t4 = mktime(0,0,0,1,1,date('Y',$t)); 	//今年起点
		$e1 = mktime(23,59,59,date('m',$t),date('d',$t),date('Y',$t)); 	//今天终点
		
		$m_arr = array();
		for($i=0;$i<13;$i++){
			$m_arr[$i] = strtotime("+$i month",$t4);
		}
		$t_arr = array();
		foreach($m_arr as $k=>$v){
			$t_arr[$k] = array(
				'0' => $v,
				'1' => $m_arr[$k+1],
			);
		}
		$m_list = array();
		foreach($t_arr as $k=>$v){
			$ywhere['addtime']  = array(array('gt',$v[0]),array('lt',$v[1]));
			$m_list[$k+1]['count'] = M('order')->where($ywhere)->count();
			$m_list[$k+1]['total'] = M('order')->where($ywhere)->sum('total');
			$m_list[$k+1]['stime'] = $v[0];
			$m_list[$k+1]['etime'] = $v[1];
		}
		array_pop($m_list); 
		
		$d_arr = array();
		for($i=0;$i<13;$i++){
			$d_arr[$i] = strtotime("-$i day",$e1);
		}
		$td_arr = array();
		foreach($d_arr as $k=>$v){
			$td_arr[$k] = array(
				'0' => $v,
				'1' => $d_arr[$k+1],
			);
		}
		$d_list = array();
		foreach($td_arr as $k=>$v){
			$dwhere['addtime']  = array(array('gt',$v[1]),array('lt',$v[0]));
			$d_list[$k+1]['count'] = M('order')->where($dwhere)->count();
			$d_list[$k+1]['total'] = M('order')->where($dwhere)->sum('total');
			$d_list[$k+1]['stime'] = $v[1];
			$d_list[$k+1]['etime'] = $v[0];
			$d_list[$k+1]['day'] = date('d',$v[0]);
		}
		array_pop($d_list); 
		
		//P($d_list);
		$nav_type_li = 'sumlist';
		$this->assign('nav_type_li', $nav_type_li);
		$this->assign('product', $product);
		$this->assign('paylist', $paylist);
		$this->assign('province', $province);
		$this->assign('m_list', $m_list);
		$this->assign('d_list', $d_list);
		$this->assign('t', I('get.t'));
		$this->meta_title = '综合统计';
		
		if(is_mobile()){
			$this->display('m-sumlist');
		}else{
			$this->display();
		}
		
	}
	
	
	/*
	*员工统计
	*/
	public function user(){
		
		//所有员工订单统计
		$member = M('member')->field('uid,nickname')->select();
		foreach($member as $k=>$v){
			$map['uid'] = array('eq',$v['uid']); 
			$map['reclaim'] = array('eq',0);
			$member[$k]['count'] = M('order')->where($map)->count();
			$member[$k]['total'] = M('order')->where($map)->sum('total');
		}
		
		//今日员工订单统计
		$stime = strtotime(date('Ymd')); 
		$etime = strtotime(date('Ymd'))+86400;
		
		$day_order = array();
		foreach($member as $k=>$v){
			$where['addtime']  = array(array('gt',$stime),array('lt',$etime));
			$where['uid'] = array('eq',$v['uid']); 
			$where['reclaim'] = array('eq',0);
			$day_order[$k]['uid'] = $v['uid'];
			$day_order[$k]['nickname'] = $v['nickname'];
			$day_order[$k]['count'] = M('order')->where($where)->count();
			$day_order[$k]['total'] = M('order')->where($where)->sum('total');
			
		}
		
		$nav_type_li = 'users';
		$this->assign('nav_type_li', $nav_type_li);
		$this->assign('member', $member);
		$this->assign('day_order', $day_order);
		$this->assign('stime', $stime);
		$this->assign('etime', $etime);
		$this->meta_title = '员工统计';
		if(is_mobile()){
			$this->display('m-user');
		}else{
			$this->display();
		}
	}
	
	
	/*
	 *订单详情
	*/
	public function update(){
		
		if(IS_POST){
			$orderid = I('post.orderid');
			$status = I('post.status');
			
			$data = array(
				'orderid' => $orderid,
				'name' => I('post.name'),
				'phone' => I('post.phone'),
				'note' => I('post.note'),
				'status' => $status,
				'exp_com' => I('post.exp_com'),
				'exp_num' => trim(I('post.exp_num')),
			);
			
			if((I('post.area') != I('post.sarea')) && I('post.area') != '所属市、县级市'){
				$data['province'] = I('post.province');
				$data['city'] = I('post.city');
				$data['area'] = I('post.area');
			}
			if(I('post.address')){
				$data['address'] = I('post.address');
			}
			
			action_log('order_update', 'member', UID, UID);
			M('order')->save($data);
			$value = M('config')->where('id = 86')->getField('value');
			if($value == 1){
				if($data['status'] == 3){
					$content = M('config')->where('id = 87')->getField('value');
					$info = M('order')->where('orderid = '.$orderid)->find();
					$info['time'] = date('Y-m-d H:i',$info['addtime']);
					$html  = '';
					foreach($info as $k=>$v){
						$gkkarr[] = "{".$k."}";
						$kkvarr[] = $v;
					}
					$html = str_replace($gkkarr,$kkvarr,$content);
					sms($data['phone'],$html);
				}
			}
			
			$this->success('操作成功！');
			
		}else{
			if(UID != 1){
				$infoadmin = $this->peradmin;
				if(!in_array("order_update",$infoadmin['order'])){
					$this->error('参数错误！');
				}
			}
			$orderid = I('get.orderid');
			$info = M('order')->where('orderid = '.$orderid)->find();
			$info['protitle'] = M('product')->where('proid = '.$info['proid'])->getField('title');
			$info['gzname'] = M('gzname')->where('gzid = '.$info['gzid'])->getField('name');
			$info['temp'] = M('template')->where('tid = '.$info['tid'])->field('size_title,color_title')->find();
			
			$previous = M('order')->where('orderid > '. $orderid)->order('addtime desc')->getField('orderid');
			$next = M('order')->where('orderid < '. $orderid)->order('addtime desc')->getField('orderid');
			
			$ems = require './Application/Common/Conf/ems.php';
			$status = require './Application/Common/Conf/status.php';
			
			if($info['reclaim'] == 1){
				$this->assign('nav_type_li', 'order_del');
			}
			
			$this->assign('status', $status);
			$this->assign('ems', $ems);
			$this->assign('info', $info);
			$this->assign('next', $next);
			$this->assign('previous', $previous);
			$this->meta_title = '订单管理';
			$this->display();
		}
		
	}
	
	/*
	 *批量发货处理
	*/
	public function update_arr(){
		if(UID != 1){
			$infoadmin = $this->peradmin;
			if(!in_array("order_update",$infoadmin['order'])){
				$this->error('参数错误！');
			}
		}
		
		if(IS_POST){
			cookie('order',null);
			if(!I('post.orderid')){
				$this->error('请选择订单！');
			}else{
				$order = serialize(I('post.orderid'));
				cookie('order',$order,3600);
				$this->success('操作成功!');
			}
		}else{
			$order = cookie('order');
			$order = unserialize($order);
			foreach($order as $k=>$v){
				$order[$k] = M('order')->where('orderid = '.$v)->field('orderid,name,phone,ordernum,status')->find();
			}
			//p($order);
			$ems = require './Application/Common/Conf/ems.php';
			
			$this->assign('ems', $ems);
			$this->assign('order', $order);
			$this->meta_title = '订单管理';
			$this->display();
		}
		
		
		
	}
	
	public function json_update_arr(){
		
		if(IS_POST){
			if(I('post.status') == '0'){
				$this->error('请选择更改订单状态！');
			}
		//	p($_POST);exit;
			$value = M('config')->where('id = 86')->getField('value');
			$content = M('config')->where('id = 87')->getField('value');
			$order = cookie('order');
			$order = unserialize($order);
			foreach($order as $k=>$v){
				
				$data['status'] = I('post.status');
				
			//	p($data);exit;
				M('order')->where('orderid = '.$v)->save($data);
				if($data['status'] == '3'){
					if($value == 1){
						$info = M('order')->where('orderid = '.$v)->find();
						$info['time'] = date('Y-m-d H:i',$info['addtime']);
						$html  = '';
						foreach($info as $ks=>$vs){
							$gkkarr[] = "{".$ks."}";
							$kkvarr[] = $vs;
						}
						$html = str_replace($gkkarr,$kkvarr,$content);
						sms($info['phone'],$html);
						M('order')->where('orderid = '.$v)->save(array('sms' => 1));
					}
				}
					
				
				
			}
			$this->success('操作成功!');
			
		}
	}
	
	
	//批量发货处理
	public function delivery(){
		
		if(IS_POST){
			cookie('order',null);
			if(!I('post.orderid')){
				$this->error('请选择订单！');
			}else{
				$order = serialize(I('post.orderid'));
				cookie('order',$order,3600);
				$this->success('操作成功!');
			}
			
		}else{
			$order = cookie('order');
			$order = unserialize($order);
			foreach($order as $k=>$v){
				$order[$k] = M('order')->where('orderid = '.$v)->field('orderid,name,phone,ordernum,status')->find();
			}
			//p($order);
			$ems = require './Application/Common/Conf/ems.php';
			
			$this->assign('ems', $ems);
			$this->assign('order', $order);
			$this->meta_title = '订单管理';
			$this->display();
		}
		
	}
	
	/*
	 *订单发货处理
	*/
	public function json_delivery(){
		
		if(IS_POST){
			if(I('post.exp_com') == '0'){
				$this->error('请选择快递公司！');
			}
		//	p($_POST);exit;
			$value = M('config')->where('id = 86')->getField('value');
			$content = M('config')->where('id = 87')->getField('value');
			
			foreach(I('post.exp_num') as $k=>$v){
				
				$data['exp_num'] = $v;
				$data['exp_com'] = I('post.exp_com');
				if(I('post.status') == 'on'){
					$data['status'] = 2;
				}
			//	p($data);exit;
				M('order')->where('orderid = '.$k)->save($data);
				if($data['status'] == 3){
					if(I('post.sms') == 'on'){
						if($value == 1){
							$info = M('order')->where('orderid = '.$k)->find();
							$info['time'] = date('Y-m-d H:i',$info['addtime']);
							$html  = '';
							foreach($info as $ks=>$vs){
								$gkkarr[] = "{".$ks."}";
								$kkvarr[] = $vs;
							}
							$html = str_replace($gkkarr,$kkvarr,$content);
							sms($info['phone'],$html);
							M('order')->where('orderid = '.$k)->save(array('sms' => 1));
						}
					}
					
				}
				
				
			}
			$this->success('操作成功!');
			
		}
	}
	
	/*
	 *josn更新状态
	*/
	public function josn_status(){
		
		$orderid = I('post.orderid');
		$status = I('post.status');
		$data['status'] = $status;
		$value = M('config')->where('id = 86')->getField('value');
		$content = M('config')->where('id = 87')->getField('value');
		if($status == 2){
			if($value == 1){
				$data['sms'] = 1;
				$info = M('order')->where('orderid = '.$orderid)->find();
				$info['time'] = date('Y-m-d H:i',$info['addtime']);
				$html  = '';
				foreach($info as $ks=>$vs){
					$gkkarr[] = "{".$ks."}";
					$kkvarr[] = $vs;
				}
				$html = str_replace($gkkarr,$kkvarr,$content);
				sms($info['phone'],$html);
			}
			
		}
		
		M('order')->where('orderid ='.$orderid)->save($data);
		$this->success('操作成功!');
	}
	
	/*
	 *删除订单
	*/
	public function del(){
		if(UID != 1){
			$infoadmin = $this->peradmin;
			if(!in_array("order_del",$infoadmin['order'])){
				$this->error('参数错误！');
			}
		}
		$orderid = I('get.orderid');
		M('order')->delete($orderid);
		action_log('order_del', 'member', UID, UID);
		$this->success('删除成功！',U('index?r=1'));
		
	}
	
	
	
	/*
	 *批量删除订单
	*/
	public function del_arr(){
		if(UID != 1){
			$infoadmin = $this->peradmin;
			if(!in_array("order_del",$infoadmin['order'])){
				$this->error('参数错误！');
			}
		}
		if(IS_POST){
			foreach(I('post.orderid') as $k=>$v){
				M('order')->delete($v);
			}
			action_log('order_del', 'member', UID, UID);
			$this->success('删除成功！');
		}
	}
	
	/*
	 *批量删除订单
	*/
	public function reclaim_arr(){
		if(UID != 1){
			$infoadmin = $this->peradmin;
			if(!in_array("order_del",$infoadmin['order'])){
				$this->error('参数错误！');
			}
		}
		if(IS_POST){
			foreach(I('post.orderid') as $k=>$v){
				M('order')->where('orderid = '.$v)->save(array('reclaim' => 1));
			}
			action_log('order_del', 'member', UID, UID);
			$this->success('删除成功！');
		}
		
	}
	
	
	/*
	 *删除订单
	*/
	public function reclaim(){
		if(UID != 1){
			$infoadmin = $this->peradmin;
			if(!in_array("order_del",$infoadmin['order'])){
				$this->error('参数错误！');
			}
		}
		$orderid = I('get.orderid');
		M('order')->where('orderid = '.$orderid)->save(array('reclaim' => 1));
		action_log('order_del', 'member', UID, UID);
		$this->success('删除成功！',U('index?r=0'));
		
	}
	
	
	
	public function add_arr(){
		if(UID != 1){
			$infoadmin = $this->peradmin;
			if(!in_array("order_del",$infoadmin['order'])){
				$this->error('参数错误！');
			}
		}
		if(IS_POST){
			foreach(I('post.orderid') as $k=>$v){
				M('order')->where('orderid = '.$v)->save(array('reclaim' => 0));
			}
			action_log('order_del', 'member', UID, UID);
			$this->success('还原成功！');
		}
		
	}
	
	/*
	 *
	*/
	public function get_url(){
		
		p($_SERVER);
		
	}
	
	public function order_table(){
		
		$table = array(
			'ordernum' => '订单号',
			'proid' => '购买产品+规格+订购数量',
			'total' => '订单总价',
			'name' => '收货人',
			'phone' => '手机号码',
			'address' => '收货地址',
			'message' => '留言',
			'addtime' => '下单时间',
			'paytype' => '支付方式',
			'status' => '状态',
			'exp_com' => '快递公司',
			'exp_num' => '快递号',
			'ip' => 'ip地址',
			'gzid' => '订单来源',
			'num' => '订购数量',
			'sex' => '性别',
			'age' => '年龄',
			'height' => '身高',
			'weight' => '体重',
			'idnumber' => '身份证号',
			'tel' => '电话号码',
			'code' => '邮编',
			'qq' => 'QQ号',
			'wechat' => '微信号',
			'email' => '邮箱',
			'note' => '备注',
			'explain' => '补充说明',
			'uid' => '员工',
		);
		
		return $table;
	}
	
	public function order_table_list(){
		
		
		if(IS_POST){
			
			$table_1 = implode(',',I('post.table_1'));
			$table_2 = implode(',',I('post.table_2'));
		//	p(I('post.table_3'));exit;
			$text = "<?php return array(";
			foreach(I('post.table_3') as $k=>$v){
				$text .= "'".$k."' => '$v',";
			}
			$text .= ");?>";
			
			M('config')->where('id = 83')->save(array('value' => $table_1));
			M('config')->where('id = 84')->save(array('value' => $table_2));
			
			require(VENDOR_PATH."WxPayPubHelper/log_.php");
			$log_ = new \Log_();
			$ems = './Application/Common/Conf/ems.php';
			
			$log_->log_text($ems,"$text");
			action_log('order_table_list', 'member', UID, UID);
			$this->success('保存成功！');
			
			
		}else{
			$table = $this->order_table();
		
			$table_1 = M('config')->where('id = 83')->getField('value');
			$table_2 = M('config')->where('id = 84')->getField('value');
			
			$table_1 = explode(',',$table_1);
			$table_2 = explode(',',$table_2);
			
			$allems = require './Application/Common/Conf/allems.php';
			$ems = require './Application/Common/Conf/ems.php';
			//p($ems);
			$nav_type = 'system';
			$nav_type_li = 'order_table';
			$this->assign('nav_type', $nav_type);
			$this->assign('nav_type_li', $nav_type_li);
			$this->assign('allems', $allems);
			$this->assign('ems', $ems);
			$this->assign('table', $table);
			$this->assign('table_1', $table_1);
			$this->assign('table_2', $table_2);
			$this->meta_title = '订单管理';
			$this->display();
		}
		
	}
	
	public function import_order(){
		
		if(IS_POST){
			if(I('post.exp_com') == '0'){
				$this->error('请选择快递公司！');
			}
			if(!I('post.thumb')){
				$this->error('请上传快递单号！');
			}
			$value = M('config')->where('id = 86')->getField('value');
			$content = M('config')->where('id = 87')->getField('value');
			
			$filename = WEB_PATH.I('post.thumb');
			$ExcelToArray = get_excel_array($filename);
			foreach($ExcelToArray as $k=>$v){
				
				$data['exp_num'] = $v[1];
				$data['exp_com'] = I('post.exp_com');
				if(I('post.status') == 'on'){
					$data['status'] = 2;
				}
			
				M('order')->where('ordernum = "'.$v[0].'"')->save($data);
				if($data['status'] == 2){
					if(I('post.sms') == 'on'){
						if($value == 1){
							$info = M('order')->where('ordernum = "'.$v[0].'"')->find();
							$info['time'] = date('Y-m-d H:i',$info['addtime']);
							$html  = '';
							foreach($info as $ks=>$vs){
								$gkkarr[] = "{".$ks."}";
								$kkvarr[] = $vs;
							}
							$html = str_replace($gkkarr,$kkvarr,$content);
							sms($info['phone'],$html);
							M('order')->where('ordernum = "'.$v[0].'"')->save(array('sms' => 1));
						}
					}
				}
			}
			$this->success('保存成功！',U('index'));
		}else{
		
			$ems = require './Application/Common/Conf/ems.php';
			$this->assign('ems', $ems);
			$this->meta_title = '订单管理';
			$this->display();
		}
		
	}
	
	public function get_export(){
		
		
		action_log('order_export', 'member', UID, UID);
		$table = $this->order_table();
		$table_2 = M('config')->where('id = 84')->getField('value');
		$table_2 = explode(',',$table_2);
		$table_title = array();
		foreach($table_2 as $k=>$v){
			$table_title[$v] = $table[$v];
		}
		$columns = array();
		foreach($table_title as $k=>$v){
			$columns[] = array($k,$v,20);
		}
		
		$filename = date("Y-m-d H:i:s").'数据';
		
		$where = array();
		
		if(I('get.ordernum') != 'no' && I('get.ordernum') != ''){
			$where['ordernum'] = I('get.ordernum');
		}
		
		if(I('get.phone') != 'no' && I('get.phone') != ''){
			$where['phone'] = I('get.phone');
		}
		
		if(I('get.status') != '0' && I('get.status') != ''){
			$where['status'] = I('get.status');
		}
		
		if((I('get.starttime') != 'no' && I('get.starttime') != '') || (I('get.endtime') == 'no' && I('get.endtime') == '')){
			$where['addtime'] = array('gt',I('get.starttime'));
			$s = date('Y-m-d H:i',I('get.starttime'));
		}
		
		if((I('get.starttime') == 'no' && I('get.starttime') == '') || (I('get.endtime') != 'no' && I('get.endtime') != '')){
			$where['addtime'] = array('lt',I('get.endtime'));
			$e = date('Y-m-d H:i',I('get.endtime'));
		}
		
		if((I('get.starttime') != 'no' && I('get.starttime') != '') && (I('get.endtime') != 'no' && I('get.endtime') != '')){
			$where['addtime'] = array(array('gt',I('get.starttime')),array('lt',I('get.endtime')));
			$s = date('Y-m-d H:i',I('get.starttime'));
			$e = date('Y-m-d H:i',I('get.endtime'));
		}
		
		if(I('get.paytype') != 'no' && I('get.paytype') != ''){
			$where['paytype'] = I('get.paytype');
		}
		
		if(I('get.proid') != 'no' && I('get.proid') != ''){
			$where['proid'] = I('get.proid');
			$whereproid = 1;
		}
		if(I('get.gzid') != 'no' && I('get.gzid') != ''){
			$where['gzid'] = I('get.gzid');
		}
		
		if(I('get.paytime') != 'no'){
			if(I('get.paytime') == 1){
				$where['paytime'] = array('exp','is null');
			}else if(I('get.paytime') == 2){
				$where['paytime'] = array('gt',0);
			}
		}
		
		if(I('get.province') != '0' && I('get.province') != ''){
			$where['province'] = I('get.province');
		}
		
		if(I('get.name') != '0' && I('get.name') != ''){
			$where['name'] = I('get.name');
		}
		
		if(I('get.uid') != '0' && I('get.uid') != ''){
			$where['uid'] = I('get.uid');
		}
		
		
		$infoadmin = $this->peradmin;
		if(UID != 1){
			
			if(!in_array("order_list",$infoadmin['order'])){
				$this->error('参数错误！');
			}
			if($infoadmin['list']){ 
				if(I('get.proid') != 'no' && I('get.proid') != ''){
					$where['proid'] = I('get.proid');
				}else{
					$where['proid']  = array('in',$infoadmin['list']);
				}
			}
		}
		
		$list = M('order')->where($where)->order('orderid desc')->select();
		foreach($list as $k=>$v){
			$list[$k]['ordernum'] = $v['ordernum'].' ';
			$list[$k]['phone'] = $v['phone'].' ';
			$list[$k]['exp_num'] = $v['exp_num'].' ';
			$list[$k]['total'] = $v['total'].' ';
			$list[$k]['addtime'] = date('Y-m-d H:i',$v['addtime']);
			$list[$k]['paytime'] = date('Y-m-d H:i',$v['paytime']);
			$list[$k]['address'] = $v['province'].$v['city'].$v['area'].$v['address'];
			if($v['paytype'] == 'alipay'){
				$list[$k]['paytype'] = '支付宝';
			}else if($v['paytype'] == 'wechat'){
				$list[$k]['paytype'] = '微信';
			}else{
				$list[$k]['paytype'] = '货到付款';
			}
			if($v['sex'] == 1){
				$list[$k]['sex'] = '男';
			}else{
				$list[$k]['sex'] = '女';
			}
			$status = require './Application/Common/Conf/status.php';
			$list[$k]['status'] = $status[$v['status']];
			$ems = require './Application/Common/Conf/ems.php';
			$list[$k]['exp_com'] = $ems[$v['exp_com']];
			
			if($v['gzid'] != ''){
				$list[$k]['gzid'] = M('gzname')->where('gzid = '.$v['gzid'])->getField('name');
			}
			if($v['proid']){
				$list[$k]['proid'] =  $v['title'].' '.$v['size'].' '.$v['color'] .' X '.$v['num'];
			}
			if($v['ip']){
				$list[$k]['ip'] = $v['ip'].'('.$v['ipprovince'].$v['ipcity'].')';
			}
			if($v['uid']){
				$list[$k]['uid'] = M('member')->where('uid = '.$v['uid'])->getField('nickname');
			}
			
		}
		
		$this->exportExcel($filename,$columns,$list);
		
	}
	
	
	public function get_exportorder(){
		action_log('order_export', 'member', UID, UID);
		
		$columns = array(
			array('ordernum',订单号,'30'),
			array('Express','快递号','30'),
		);
		
	//	p($columns);exit;
		$filename = date("Y-m-d H:i:s").'订单号数据';
		
		$where = array();
		
		if(I('get.ordernum') != 'no' && I('get.ordernum') != ''){
			$where['ordernum'] = I('get.ordernum');
		}
		
		if(I('get.phone') != 'no' && I('get.phone') != ''){
			$where['phone'] = I('get.phone');
		}
		
		if(I('get.status') != '0' && I('get.status') != ''){
			$where['status'] = I('get.status');
		}
		
		if((I('get.starttime') != 'no' && I('get.starttime') != '') || (I('get.endtime') == 'no' && I('get.endtime') == '')){
			$where['addtime'] = array('gt',I('get.starttime'));
			$s = date('Y-m-d H:i',I('get.starttime'));
		}
		
		if((I('get.starttime') == 'no' && I('get.starttime') == '') || (I('get.endtime') != 'no' && I('get.endtime') != '')){
			$where['addtime'] = array('lt',I('get.endtime'));
			$e = date('Y-m-d H:i',I('get.endtime'));
		}
		
		if((I('get.starttime') != 'no' && I('get.starttime') != '') && (I('get.endtime') != 'no' && I('get.endtime') != '')){
			$where['addtime'] = array(array('gt',I('get.starttime')),array('lt',I('get.endtime')));
			$s = date('Y-m-d H:i',I('get.starttime'));
			$e = date('Y-m-d H:i',I('get.endtime'));
		}
		
		if(I('get.paytype') != 'no' && I('get.paytype') != ''){
			$where['paytype'] = I('get.paytype');
		}
		
		if(I('get.proid') != 'no' && I('get.proid') != ''){
			$where['proid'] = I('get.proid');
			$whereproid = 1;
		}
		if(I('get.gzid') != 'no' && I('get.gzid') != ''){
			$where['gzid'] = I('get.gzid');
		}
		
		if(I('get.paytime') != 'no'){
			if(I('get.paytime') == 1){
				$where['paytime'] = array('exp','is null');
			}else if(I('get.paytime') == 2){
				$where['paytime'] = array('gt',0);
			}
		}
		
		if(I('get.province') != '0' && I('get.province') != ''){
			$where['province'] = I('get.province');
		}
		
		if(I('get.name') != '0' && I('get.name') != ''){
			$where['name'] = I('get.name');
		}
		
		
		$infoadmin = $this->peradmin;
		if(UID != 1){
			
			if(!in_array("order_list",$infoadmin['order'])){
				$this->error('参数错误！');
			}
			if($infoadmin['list']){ 
				if(I('get.proid') != 'no' && I('get.proid') != ''){
					$where['proid'] = I('get.proid');
				}else{
					$where['proid']  = array('in',$infoadmin['list']);
				}
			}
		}
		
		$list = M('order')->where($where)->order('orderid desc')->select();
		foreach($list as $k=>$v){
			$list[$k]['ordernum'] = $v['ordernum'].' ';
			
		}
		
		$this->exportExcel($filename,$columns,$list);
		
	}
	
	public function exportExcel($expTitle,$expCellName,$expTableData){
		$xlsTitle = iconv('utf-8', 'gb2312', $expTitle);
        $fileName = date('YmdHis');
        $cellNum = count($expCellName);
        $dataNum = count($expTableData);
        
		require(VENDOR_PATH.'PHPExcel.php');
        $objPHPExcel = new \PHPExcel();
		
		$cellName = array();
		$cellName_j = "A";
		for($cellName_i = 0;$cellName_i<$cellNum;$cellName_i++){
			$cellName[$cellName_i] = $cellName_j;
			$cellName_j++;
		}
		
        for($i=0;$i<$cellNum;$i++){
			$objPHPExcel->getActiveSheet()->getColumnDimension($cellName[$i])->setWidth($expCellName[$i][2]);
            $objPHPExcel->setActiveSheetIndex(0)->setCellValue($cellName[$i].'1', $expCellName[$i][1]);
        }
		
        for($i=0;$i<$dataNum;$i++){
            for($j=0;$j<$cellNum;$j++){
                $objPHPExcel->getActiveSheet(0)->setCellValue($cellName[$j].($i+2), $expTableData[$i][$expCellName[$j][0]]);
            }
        }
        header('pragma:public');
        header('Content-type:application/vnd.ms-excel;charset=utf-8;name="'.$xlsTitle.'.xls"');
        header("Content-Disposition:attachment;filename=$xlsTitle.xls");
        $objWriter = \PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');
        $objWriter->save('php://output');
        exit;
    }

}
