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
class PaycodeController extends AdminController {


	public $infoadmin = array();

	public function __construct(){
		parent::__construct();  
		
		$perid = M('member')->where('uid = '.UID)->getField('perid');
		
		$infoadmin = M('permissions')->where('perid = '.$perid)->field('system')->find();
		
		if($infoadmin['system']){
			$infoadmin['system'] = explode(',',$infoadmin['system']);
		}
		
		if(!$infoadmin['system']){
			$this->error('参数错误！');
		}
		$this->infoadmin = $infoadmin;
		
	
		$nav_type = 'system';
		$nav_type_li = 'paycode';
		$this->assign('nav_type', $nav_type);
		$this->assign('nav_type_li', $nav_type_li);
		
	}

    /**
     * 产品列表
     * @author 麦当苗儿 <zuojiazi@vip.qq.com>
     */
    public function index(){
		
		if(UID != 1){
			$infoadmin = $this->peradmin;
			if(!in_array("paycode",$infoadmin['system'])){
				$this->error('参数错误！');
			}
		}
		
		$type = I('get.type')?I('get.type'):'alipaycode';
		$where['type'] = array('eq',$type);
		
		$count = M('paycode')->count();
		$page = new Page($count,50);
		$list = M('paycode')->where($where)->limit($page->firstRow.','.$page->listRows)->select();
		
		$pages = $page->show();
		
		$this->assign('type', $type);
        $this->assign('count', $count);
		$this->assign('_list', $list);
		$this->assign('_page', $pages);
		$this->meta_title = '支付二维码';
		$this->display();
    }
	
	public function add(){
		
		if(UID != 1){
			$infoadmin = $this->peradmin;
			if(!in_array("paycode_add",$infoadmin['system'])){
				$this->error('参数错误！');
			}
		}
		
		if(IS_POST){
			
			$data = array(
				'price' => trim(I('post.price')),
				'thumb' => I('post.thumb'),
			);
			
			
			if(I('post.pid')){
				
				if(UID != 1){
					$infoadmin = $this->peradmin;
					if(!in_array("paycode_update",$infoadmin['system'])){
						$this->error('参数错误！');
					}
				}
				action_log('paycode_update', 'member', UID, UID);
				M('paycode')->where('pid = '.I('post.pid'))->save($data);
				$this->success('编辑成功！',U('index?type='.I('post.type')));
			}else{
				if(UID != 1){
					$infoadmin = $this->peradmin;
					if(!in_array("paycode_add",$infoadmin['system'])){
						$this->error('参数错误！');
					}
				}
				$type = I('post.type')?I('post.type'):'alipaycode';
				$data['type'] = $type;
				M('paycode')->add($data);
				action_log('paycode_add', 'member', UID, UID);
				$this->success('添加成功！',U('index?type='.$type));
			}
			
		}else{
			$type = I('get.type')?I('get.type'):'alipaycode';
			$pid = I('get.pid');
			if($pid){
				$info = M('paycode')->where('pid = '.$pid)->find();
				$type = $info['type'];
			}
			
			$this->assign('info', $info);
			$this->assign('type', $type);
			$this->meta_title = '支付二维码';
			$this->display();
		}
		
	}
	
	public function del(){
		if(UID != 1){
			$infoadmin = $this->peradmin;
			if(!in_array("paycode_del",$infoadmin['system'])){
				$this->error('参数错误！');
			}
		}
		$pid = I('get.pid');
		action_log('paycode_del', 'member', UID, UID);
		M('paycode')->where('pid = '.$pid)->delete();
		$this->success('删除成功！');
	}
	
	public function del_arr(){
		if(IS_POST){
			foreach($_POST['pid'] as $k=>$v){
				M('paycode')->where('pid = '.$v)->delete();
			}
			action_log('paycode_del', 'member', UID, UID);
			$this->success('删除成功！');
		}
	}
}
