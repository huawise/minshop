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

/**
 * 后台首页控制器
 * @author 麦当苗儿 <zuojiazi@vip.qq.com>
 */
class IndexController extends AdminController {

    static protected $allow = array( 'verify');

    /**
     * 后台首页
     * @author 麦当苗儿 <zuojiazi@vip.qq.com>
     */
    public function index(){
		
        if(UID){
			if(is_mobile()){
				$this->redirect('mindex');
			}
			$sysinfo = get_sysinfo();
			$sysinfo['mysqlv'] = mysql_get_server_info();
			//p($sysinfo);
			$nav_type = 'index';
			$nav_type_li = 'index';
			$this->meta_title = '管理后台';
			$this->assign(get_defined_vars());
			$this->display();
        } else {
            $this->redirect('Public/login');
        }
    }
	
	public function mindex(){
		
		$stime = strtotime(date('Ymd')); 
		$etime = strtotime(date('Ymd'))+86400;
		$shangmonth=mktime(0,0,0,date('m')-1,1,date('Y'));
		$beginThismonth=mktime(0,0,0,date('m'),1,date('Y'));
		$endThismonth=mktime(23,59,59,date('m'),date('t'),date('Y'));
		
		if(UID != 1){
			$infoadmin = $this->peradmin;
			if(!in_array("order_sum",$infoadmin['order'])){
				$this->error('参数错误！');
			}
			
			$dwhere['proid']  = array('in',$infoadmin['list']);
			$dwhere['uid']  = array('eq',UID);
			$map['proid']  = array('in',$infoadmin['list']);
			$map['addtime'] = array(array('gt',$stime),array('lt',$etime));
			$map['uid']  = array('eq',UID);
			
			$zmap['proid']  = array('in',$infoadmin['list']);
			$zmap['addtime'] = array(array('gt',$stime-86400),array('lt',$stime));
			$zmap['uid']  = array('eq',UID);
			
			$mdmap['proid']  = array('in',$infoadmin['list']);
			$mdmap['addtime'] = array(array('gt',$beginThismonth),array('lt',$endThismonth));
			$mdmap['uid']  = array('eq',UID);
			
			$zmdmap['proid']  = array('in',$infoadmin['list']);
			$zmdmap['addtime'] = array(array('gt',$shangmonth),array('lt',$beginThismonth));
			$zmdmap['uid']  = array('eq',UID);
			
		}else{
			$map['addtime'] = array(array('gt',$stime),array('lt',$etime));
			$zmap['addtime'] = array(array('gt',$stime-86400),array('lt',$stime));
			$mdmap['addtime'] = array(array('gt',$beginThismonth),array('lt',$endThismonth));
			$zmdmap['addtime'] = array(array('gt',$shangmonth),array('lt',$beginThismonth));
		}
		
		$news_day_count = M('order')->where($map)->count();
		$zuo_day_count = M('order')->where($zmap)->count();
		$news_month_count = M('order')->where($mdmap)->count();
		$zuo_month_count = M('order')->where($zmdmap)->count();
		
		
		$t = time(); 
		$t4 = mktime(0,0,0,1,1,date('Y',$t)); 	//今年起点
		$e1 = mktime(23,59,59,date('m',$t),date('d',$t),date('Y',$t)); 	//今天终点
		
		$d_arr = array();
		for($i=0;$i<8;$i++){
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
				
		$this->assign('d_list', $d_list);
		$this->assign('news_day_count', $news_day_count);
		$this->assign('zuo_day_count', $zuo_day_count);
		$this->assign('news_month_count', $news_month_count);
		$this->assign('zuo_month_count', $zuo_month_count);
		$this->assign(get_defined_vars());
		$this->display();
	}
	
	public function deldir(){
		
		delDirAndFile('Runtime');
		$this->success('清除成功！',U('index'));
	}

}
