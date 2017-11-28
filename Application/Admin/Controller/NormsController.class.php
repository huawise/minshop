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
class NormsController extends AdminController {


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
		$nav_type_li = 'pro';
		$this->assign('nav_type', $nav_type);
		$this->assign('nav_type_li', $nav_type_li);
		
	}

    /**
     * 产品列表
     * @author 麦当苗儿 <zuojiazi@vip.qq.com>
     */
    public function index(){
		
		$type = I('get.type',1);
		$proid = I('get.proid');
		
		$where = 'proid = '.$proid.' and type = '.$type;
		
		$count = M('product_norms')->where($where)->count();
		$page = new Page($count,50);
		$list = M('product_norms')->where($where)->order('def asc')->limit($page->firstRow.','.$page->listRows)->select();
		
		$pages = $page->show();
		
		$template = M('product')->where('proid = '.$proid)->getField('template');
		$info['temp'] = M('template')->where('tid = '.$template)->field('pro_title,size_title,color_title')->find();
		
        $this->assign('count', $count);
		$this->assign('_list', $list);
		$this->assign('_page', $pages);
		$this->assign('type', $type);
		$this->assign('proid', $proid);
		$this->assign('info', $info);
		$this->meta_title = '产品规格管理';
		$this->display();
    }
	
	
	public function add(){
		
		if(IS_POST){
			
			$data = array(
				'proid' => I('post.proid'),
				'title' => trim(I('post.title')),
				'thumb' => I('post.thumb'),
				'type' => I('post.type'),
				'number' => trim(I('post.number',0)),
				'price' => trim(I('post.price',0)),
			);
			
			M('product_norms')->add($data);
			$this->success('添加成功！',U('index?proid='.$data['proid'].'&type='.$data['type']));
			
		}else{
			
			$type = I('get.type',1);
			$proid = I('get.proid');
			
			$template = M('product')->where('proid = '.$proid)->getField('template');
			$info['temp'] = M('template')->where('tid = '.$template)->field('pro_title,size_title,color_title')->find();
			
			$this->assign('type', $type);
			$this->assign('proid', $proid);
			$this->assign('info', $info);
			$this->meta_title = '产品规格管理';
			$this->display();
		}
		
	}
	
	
	public function update(){
		
		if(IS_POST){
			
			$data = array(
				'nid' => I('post.nid'),
				'proid' => I('post.proid'),
				'title' => trim(I('post.title')),
				'thumb' => I('post.thumb'),
				'type' => I('post.type'),
				'number' => trim(I('post.number',0)),
				'price' => trim(I('post.price',0)),
			);
			
			M('product_norms')->save($data);
			$this->success('编辑成功！',U('index?proid='.$data['proid'].'&type='.$data['type']));
			
		}else{
			$nid = I('get.nid');
			$info = M('product_norms')->where('nid = '.$nid)->find();
			$type = $info['type'];
			
			$template = M('product')->where('proid = '.$info['proid'])->getField('template');
			$info['temp'] = M('template')->where('tid = '.$template)->field('pro_title,size_title,color_title')->find();
			
			
			$this->assign('info', $info);
			$this->assign('type', $type);
			$this->meta_title = '产品规格管理';
			$this->display();
		}
	}
	
	public function del(){
		$nid = I('get.nid');
		M('product_norms')->where('nid = '.$nid)->delete();
		$this->success('删除成功！');
	}
	
	public function del_arr(){
		
		if(IS_POST){
			
			foreach($_POST['nid'] as $k=>$v){
				M('product_norms')->where('nid = '.$v)->delete();
			}
			$this->success('删除成功！');
		}
	}
	
	public function sort_arr(){
		
		foreach($_POST['def'] as $k=>$v){
			M('product_norms')->where('nid = '.$k)->save(array('def' => $v));
		}
		
		$this->success('操作成功！');
	} 
	
}
