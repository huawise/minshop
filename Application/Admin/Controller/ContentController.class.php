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

class ContentController extends AdminController {


   
    public function contact(){
		
		if(IS_POST){
			
			M('config')->where('id = 42')->save(array('value' => I('post.content')));
			$this->success('操作成功！');
			
		}else{
			
			$contact = M('config')->where('id = 42')->getField('value');
			$this->assign('contact', $contact);
			$this->meta_title = '联系我们';
			$this->display();
		}
		
		
    }
	
	
	public function about(){
		
		if(IS_POST){
			
			M('config')->where('id = 43')->save(array('value' => I('post.content')));
			$this->success('操作成功！');
			
			
		}else{
			
			$contact = M('config')->where('id = 43')->getField('value');
			$this->assign('contact', $contact);
			$this->meta_title = '关于我们';
			$this->display();
		}
		
		
    }
	
	
}
