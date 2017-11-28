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
class SourceController extends AdminController {


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
		$nav_type_li = 'source';
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
			if(!in_array("source",$infoadmin['system'])){
				$this->error('参数错误！');
			}
		}
		
		$count = M('gzname')->count();
		$page = new Page($count,50);
		$list = M('gzname')->limit($page->firstRow.','.$page->listRows)->select();
		
		$pages = $page->show();
		
        $this->assign('count', $count);
		$this->assign('_list', $list);
		$this->assign('_page', $pages);
		$this->meta_title = '推广渠道管理';
		$this->display();
    }
	
	public function add(){
		
		if(UID != 1){
			$infoadmin = $this->peradmin;
			if(!in_array("source_add",$infoadmin['system'])){
				$this->error('参数错误！');
			}
		}
		if(IS_POST){
			
			$data = array(
				'name' => trim(I('post.name')),
			);
			
			if(I('post.gzid')){
				
				if(UID != 1){
					$infoadmin = $this->peradmin;
					if(!in_array("source_update",$infoadmin['system'])){
						$this->error('参数错误！');
					}
				}
				action_log('source_update', 'member', UID, UID);
				M('gzname')->where('gzid = '.I('post.gzid'))->save($data);
				$this->success('编辑成功！',U('index'));
			}else{
				if(UID != 1){
					$infoadmin = $this->peradmin;
					if(!in_array("source_add",$infoadmin['system'])){
						$this->error('参数错误！');
					}
				}
				M('gzname')->add($data);
				action_log('source_add', 'member', UID, UID);
				$this->success('添加成功！',U('index'));
			}
			
		}else{
			
			$gzid = I('get.gzid');
			$info = M('gzname')->where('gzid = '.$gzid)->find();
			$this->assign('info', $info);
			$this->meta_title = '推广渠道管理';
			$this->display();
		}
		
	}
	
	public function del(){
		if(UID != 1){
			$infoadmin = $this->peradmin;
			if(!in_array("source_del",$infoadmin['system'])){
				$this->error('参数错误！');
			}
		}
		$gzid = I('get.gzid');
		M('gzname')->where('gzid = '.$gzid)->delete();
		action_log('source_del', 'member', UID, UID);
		$this->success('删除成功！',U('index'));
	}
	
	public function del_arr(){
		if(IS_POST){
			foreach($_POST['gzid'] as $k=>$v){
				M('gzname')->where('gzid = '.$v)->delete();
			}
			action_log('source_del', 'member', UID, UID);
			$this->success('删除成功！');
		}
	}
}
