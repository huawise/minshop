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
class DomainController extends AdminController {


	public function __construct(){
		parent::__construct();  
		$perid = M('member')->where('uid = '.UID)->getField('perid');
		
		$infoadmin = M('permissions')->where('perid = '.$perid)->field('product,list')->find();
		
		if($infoadmin['product']){
			$infoadmin['product'] = explode(',',$infoadmin['product']);
		}
		if($infoadmin['list']){
			$infoadmin['list'] = explode(',',$infoadmin['list']);
		}
		
		if(!$infoadmin['product']){
			$this->error('参数错误！');
		}
		$this->infoadmin = $infoadmin;
		$nav_type = 'product';
		$nav_type_li = 'domain';
		$this->assign('nav_type', $nav_type);
		$this->assign('nav_type_li', $nav_type_li);
		
	}

   public function index(){
	   
	    $domain = M('config')->where('id = 101')->getField('value');
	   
	    if(UID != 1){
			$infoadmin = $this->peradmin;
			if($infoadmin['list']){ 
				$where['proid']  = array('in',$infoadmin['list']);
				$count = M('product')->where($where)->count();
				$page = new Page($count,500);
				$list = M('product')->where($where)->order('sort asc,proid desc')->limit($page->firstRow.','.$page->listRows)->select();
			}
			if(!in_array("domain",$infoadmin['product'])){
				$this->error('参数错误！');
			}
		}else{
			$count = M('product')->where($where)->count();
			$page = new Page($count,500);
			$list = M('product')->where($where)->order('sort asc,proid desc')->limit($page->firstRow.','.$page->listRows)->select();
		}
		
		foreach($list as $k=>$v){
			$list[$k]['domain'] = M('domain')->where('proid='.$v['proid'])->getField('domain');
		}
	
		$value = M('config')->where('id = 88')->getField('value');
		$zdomain = M('config')->where('id = 102')->getField('value');
		
		$this->assign('_list', $list);
	    $this->assign('value', $value);
	    $this->assign('domain', $domain);
		$this->assign('zdomain', $zdomain);
	    $nav_type = 'product';
		$nav_type_li = 'pro';
		
		$this->meta_title = '域名管理';
	    $this->display();
   }
   
   public function domain_json(){
	   
	   if(IS_POST){
		   $data = array(
				'proid' => I('post.proid'),
				'domain' => I('post.domain'),
		   );
		   $info = M('domain')->where('proid = '.$data['proid'])->getField('proid');
		   if($info){
			   M('domain')->save($data);
		   }else{
			   M('domain')->add($data);
		   }
		   $this->success('保存成功！',U('index'));
	   }
	   
   }
   
   public function zdomain_json(){
	   
	   if(IS_POST){
		   $data = array(
				'value' => I('post.domain'),
		   );
			M('config')->where('id = 102')->save($data);
		   $this->success('保存成功！',U('index'));
	   }
	   
   }
   
   
   public function domain(){
	   
		$t = I('get.t','0');
		M('config')->where('id = 101')->save(array('value'=>$t));
		$this->success('操作成功！',U('index'));
   }
}
