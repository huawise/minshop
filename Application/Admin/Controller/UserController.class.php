<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: 麦当苗儿 <zuojiazi@vip.qq.com> <http://www.zjzit.cn>
// +----------------------------------------------------------------------

namespace Admin\Controller;
use User\Api\UserApi;

/**
 * 后台用户控制器
 * @author 麦当苗儿 <zuojiazi@vip.qq.com>
 */

class UserController extends AdminController {

    static protected $allow = array( 'updatePassword','updateNickname','submitPassword','submitNickname');
	
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
		$nav_type_li = 'user';
		$this->assign('nav_type', $nav_type);
		$this->assign('nav_type_li', $nav_type_li);
		
	}

    /**
     * 用户管理首页
     * @author 麦当苗儿 <zuojiazi@vip.qq.com>
     */
    public function index(){
		
		if(UID != 1){
			$infoadmin = $this->peradmin;
			if(!in_array("user",$infoadmin['system'])){
				$this->error('参数错误！');
			}
		}
		
    	$nickname = I('nickname');
    	$map = array('status'=>array('egt',0));
    	if(isset($nickname)){
    		if(intval($nickname) !== 0){
    			$map['uid'] = intval($nickname);
    		}else{
    			$map['nickname']  = array('like', '%'.(string)$nickname.'%');
    		}
    	}
        $list   = $this->lists('Member', $map);
		foreach($list as $k=>$v){
			$list[$k]['username'] = M('ucenter_member')->where('id = '.$v['uid'])->getField('username');
		}
		$count = M('Member')->count();
        int_to_string($list);
        $this->assign('_list', $list);
		$this->assign('count', $count);
		$this->assign('uid', UID);
        $this->meta_title = '管理员管理';
        $this->display();
    }
	
	
	public function add($username = '', $password = '', $repassword = '', $email = ''){
		
		if(UID != 1){
			$infoadmin = $this->peradmin;
			if(!in_array("user_add",$infoadmin['system'])){
				$this->error('参数错误！');
			}
		}
		
		
        if(IS_POST){
			
			$nickname = I('post.nickname');
			$username = I('post.username');
			$password = I('post.password');
			$repassword = I('post.repassword');
            /* 检测密码 */
            if($password != $repassword){
                $this->error('密码和重复密码不一致！');
            }

            /* 调用注册接口注册用户 */
            $User = new UserApi;
            $uid = $User->register($username, $password, time().'@qq.com');
            if(0 < $uid){ //注册成功
                $user = array('uid' => $uid, 'nickname' => $nickname, 'status' => 1,'perid' => I('post.perid'));
				action_log('user_add', 'member', UID, UID);
                if(!M('Member')->add($user)){
                    $this->error('用户添加失败！');
                } else {
					
                    $this->success('用户添加成功！',U('index'));
                }
            } else { //注册失败，显示错误信息
                $this->error($this->showRegError($uid));
            }
        } else {
			$list = M('permissions')->select();
			
			$this->assign('list', $list);
			$this->meta_title = '管理员管理';
            $this->display();
        }
    }
	
	public function update(){
		if(UID != 1){
			$infoadmin = $this->peradmin;
			if(!in_array("user_update",$infoadmin['system'])){
				$this->error('参数错误！');
			}
		}
		$uid = I('get.uid');
		if(IS_POST){
			
			$password   =   I('post.old');
			$id = I('post.uid');
			if($password){
				empty($password) && $this->error('请输入原密码');
				$data['password'] = I('post.password');
				empty($data['password']) && $this->error('请输入新密码');
				$repassword = I('post.repassword');
				empty($repassword) && $this->error('请输入确认密码');
				
				if($data['password'] !== $repassword){
					$this->error('您输入的新密码与确认密码不一致');
				}

				$Api = new UserApi();
				$res = $Api->updateInfo($id, $password, $data);
				if($res['status']){
					$this->success('修改密码成功！');
				}else{
					$this->error($res['info']);
				}
			}
			
			$nickname = I('post.nickname');
			empty($nickname) && $this->error('请输入昵称');
			if($id != 1){
				$data = array('nickname'=>$nickname,'perid' => I('post.perid'));
			}else{
				$data = array('nickname'=>$nickname);
			}
			
			//p($data);exit;
			action_log('user_update', 'member', UID, UID);
			$res = M('member')->where('uid = '.$id)->save($data);
			
			$this->success('修改成功！');
			
		}else{
			
			
			$user = M('ucenter_member')->where('id = '.$uid)->find();
			$user['nickname'] = M('member')->where('uid = '.$uid)->getField('nickname');
			$user['perid'] = M('member')->where('uid = '.$uid)->getField('perid');
			$list = M('permissions')->select();
			
			$this->assign('user', $user);
			$this->assign('list', $list);
			$this->assign('uid', $uid);
			$this->meta_title = '管理员管理';
			
			if(is_mobile()){
				$this->display('m-update');
			}else{
				$this->display();
			}
		}
		
	}
	
	public function del(){
		if(UID != 1){
			$infoadmin = $this->peradmin;
			if(!in_array("user_del",$infoadmin['system'])){
				$this->error('参数错误！');
			}
		}
		$uid = I('get.uid');
		if($uid != 1){
			M('member')->where('uid = '.$uid)->delete();
			M('ucenter_member')->where('id = '.$uid)->delete();
			action_log('user_del', 'member', UID, UID);
			$this->success('删除成功！',U('index'));
		}
	}
	
	public function del_arr(){
		if(UID != 1){
			$infoadmin = $this->peradmin;
			if(!in_array("user_del",$infoadmin['system'])){
				$this->error('参数错误！');
			}
		}
		if(IS_POST){
			foreach($_POST['uid'] as $k=>$v){
				M('member')->where('uid = '.$v)->delete();
				M('ucenter_member')->where('id = '.$v)->delete();
			}
			action_log('user_del', 'member', UID, UID);
			$this->success('删除成功！');
		}
	}
	
	public function permissions(){
		
		if(UID != 1){
			$infoadmin = $this->peradmin;
			if(!in_array("per",$infoadmin['system'])){
				$this->error('参数错误！');
			}
		}
		$list = M('permissions')->select();
		$count = count($list);
		
		$nav_type_li = 'permissions';
		$this->assign('nav_type_li', $nav_type_li);
		$this->assign('list', $list);
		$this->assign('count', $count);
		$this->meta_title = '管理员权限';
		$this->display();
	}
	
	public function delpermissions(){
		if(UID != 1){
			$infoadmin = $this->peradmin;
			if(!in_array("per_del",$infoadmin['system'])){
				$this->error('参数错误！');
			}
		}
		$perid = I('get.perid');
		if($perid != 1){
			M('permissions')->where('perid = '.$perid)->delete();
			action_log('per_del', 'member', UID, UID);
			$this->success('删除成功！',U('permissions'));
		}
	}
	
	public function addpermissions(){
		
		if(IS_POST){
			$data = array(
				'name' => I('post.name'),
				'system' => implode(',',I('post.system')),
				'order' => implode(',',I('post.order')),
				'product' => implode(',',I('post.product')),
				'list' => implode(',',I('post.list')),
			);
			
			if(I('post.perid')){
				if(UID != 1){
					$infoadmin = $this->peradmin;
					if(!in_array("per_update",$infoadmin['system'])){
						$this->error('参数错误！');
					}
				}
				action_log('per_update', 'member', UID, UID);
				M('permissions')->where('perid = '.I('post.perid'))->save($data);
			}else{
				if(UID != 1){
					$infoadmin = $this->peradmin;
					if(!in_array("per_add",$infoadmin['system'])){
						$this->error('参数错误！');
					}
				}
				action_log('per_add', 'member', UID, UID);
				M('permissions')->add($data);
			}
			
			
			$this->success('操作成功！',U('permissions'));
		}else{
			$system = array(
				'system' => '系统配置',
				'source' => '推广渠道管理',
				'source_add' => '推广渠道添加',
				'source_del' => '推广渠道删除',
				'source_update' => '推广渠道修改',
				'order_field' => '订单字段管理',
				'user' => '管理员管理',
				'user_add' => '管理员添加',
				'user_del' => '管理员删除',
				'user_update' => '管理员修改',
				'per' => '权限管理',
				'per_add' => '权限添加',
				'per_del' => '权限删除',
				'per_update' => '权限修改',
				'database' => '数据库管理',
				'paycode' => '支付二维码',
				'paycode_add' => '支付二维码添加',
				'paycode_del' => '支付二维码删除',
				'paycode_update' => '支付二维码修改',
				'actionlog' => '日志记录管理',
			);
			
			
			$order = array(
				'order_list' => '订单列表',
				'order_add' => '添加订单',
				'order_del' => '删除订单',
				'order_update' => '修改订单',
				'order_export' => '导出订单',
				'order_gz' => '推广统计',
				'order_sum' => '综合统计',
			);
			
			$product = array(
				'template' => '模板管理',
				'template_add' => '模板添加',
				'template_del' => '模板删除',
				'template_update' => '模板修改',
				'pro' => '产品管理',
				'pro_add' => '产品添加',
				'pro_del' => '产品删除',
				'pro_update' => '产品修改',
				'domain' => '域名管理',
			);
			
			$list = M('product')->field('proid,title')->select();
			$perid = I('get.perid');
			$perinfo = M('permissions')->where('perid = '.$perid)->find();
			$perinfo['system'] = explode(',',$perinfo['system']);
			$perinfo['order'] = explode(',',$perinfo['order']);
			$perinfo['product'] = explode(',',$perinfo['product']);
			$perinfo['list'] = explode(',',$perinfo['list']);
			//p($perinfo);
			
			$nav_type_li = 'permissions';
			$this->assign('nav_type_li', $nav_type_li);
			$this->assign('system', $system);
			$this->assign('order', $order);
			$this->assign('product', $product);
			$this->assign('list', $list);
			$this->assign('perinfo', $perinfo);
			$this->meta_title = '管理员权限';
			$this->display();
		}
		
	}

    /**
     * 修改昵称初始化
     * @author huajie <banhuajie@163.com>
     */
    public function updateNickname(){
        $nickname = M('Member')->getFieldByUid(UID, 'nickname');
        $this->assign('nickname', $nickname);
        $this->meta_title = '修改昵称';
        $this->display();
    }

    /**
     * 修改昵称提交
     * @author huajie <banhuajie@163.com>
     */
    public function submitNickname(){
        //获取参数
        $uid = UID;
        $nickname = I('post.nickname');
        $password = I('post.password');
        empty($nickname) && $this->error('请输入昵称');
        empty($password) && $this->error('请输入密码');

        //密码验证
        $User = new UserApi();
        $uid = $User->login($uid, $password, 4);
        ($uid == -2) && $this->error('密码不正确');

        $Member = D('Member');
        $data = $Member->create(array('nickname'=>$nickname));
        if(!$data){
            $this->error($Member->getError());
        }

        $res = $Member->where(array('uid'=>$uid))->save($data);

        if($res){
        	$user = session('user_auth');
        	$user['username'] = $data['nickname'];
        	session('user_auth', $user);
        	session('user_auth_sign', data_auth_sign($user));
            $this->success('修改昵称成功！');
        }else{
            $this->error('修改昵称失败！');
        }
    }

    /**
     * 修改密码初始化
     * @author huajie <banhuajie@163.com>
     */
    public function updatePassword(){
    	$this->meta_title = '修改密码';
        $this->display();
    }

    /**
     * 修改密码提交
     * @author huajie <banhuajie@163.com>
     */
    public function submitPassword(){
        //获取参数
        $uid        =   UID;
        $password   =   I('post.old');
        empty($password) && $this->error('请输入原密码');
        $data['password'] = I('post.password');
        empty($data['password']) && $this->error('请输入新密码');
        $repassword = I('post.repassword');
        empty($repassword) && $this->error('请输入确认密码');

        if($data['password'] !== $repassword){
            $this->error('您输入的新密码与确认密码不一致');
        }

        $Api = new UserApi();
        $res = $Api->updateInfo($uid, $password, $data);
        if($res['status']){
            $this->success('修改密码成功！');
        }else{
            $this->error($res['info']);
        }
    }

    /**
     * 用户行为列表
     * @author huajie <banhuajie@163.com>
     */
    public function action(){
        //获取列表数据
        $Action = M('Action')->where(array('status'=>array('gt',-1)));
        $list   = $this->lists($Action);
        int_to_string($list);
        $this->assign('_list', $list);
        $this->meta_title = '用户行为';
        $this->display();
    }

    /**
     * 新增行为
     * @author huajie <banhuajie@163.com>
     */
    public function addAction(){
        $this->meta_title = '新增行为';
        $this->display('editaction');
    }

    /**
     * 编辑行为
     * @author huajie <banhuajie@163.com>
     */
    public function editAction(){
        $id = I('get.id');
        empty($id) && $this->error('参数不能为空！');
        $data = M('Action')->field(true)->find($id);

        $this->assign($data);
        $this->meta_title = '编辑行为';
        $this->display();
    }

    /**
     * 更新行为
     * @author huajie <banhuajie@163.com>
     */
    public function saveAction(){
        $res = D('Action')->update();
        if(!$res){
            $this->error(D('Action')->getError());
        }else{
            if($res['id']){
                $this->success('更新行为成功！', U('action'));
            }else{
                $this->success('新增行为成功！', U('action'));
            }
        }
    }

    /**
     * 设置一条或者多条数据的状态
     * @author huajie <banhuajie@163.com>
     */
    public function setStatus(){
        /*参数过滤*/
        $ids = I('request.ids');
        $status = I('request.status');
        if(empty($ids) || !isset($status)){
            $this->error('请选择要操作的数据');
        }
        //删除缓存
        S('action_list', null);

        /*拼接参数并修改状态*/
        $Model = 'Action';
        $map = array();
        if(is_array($ids)){
            $map['id'] = array('in', implode(',', $ids));
        }elseif (is_numeric($ids)){
            $map['id'] = $ids;
        }
        switch ($status){
            case -1 : $this->delete($Model, $map, array('success'=>'删除成功','error'=>'删除失败'));break;
            case 0 : $this->forbid($Model, $map, array('success'=>'禁用成功','error'=>'禁用失败'));break;
            case 1 : $this->resume($Model, $map, array('success'=>'启用成功','error'=>'启用失败'));break;
            default : $this->error('参数错误');break;
        }
    }

    /**
     * 会员状态修改
     * @author 朱亚杰 <zhuyajie@topthink.net>
     */
    public function changeStatus($method=null){
        $id = array_unique((array)I('id',0));
        if( in_array(C('USER_ADMINISTRATOR'), $id)){
            $this->error("不允许对超级管理员执行该操作!");
        }
        $id = is_array($id) ? implode(',',$id) : $id;
        if ( empty($id) ) {
            $this->error('请选择要操作的数据!');
        }
        switch ( strtolower($method) ){
            case 'forbiduser':
                $this->forbid('Member', array('uid'=>array('in',$id)) );
                break;
            case 'resumeuser':
                $this->resume('Member', array('uid'=>array('in',$id)) );
                break;
            case 'deleteuser':
                $this->delete('Member', array('uid'=>array('in',$id)) );
                break;
            default:
                $this->error('参数非法');
        }
    }

    

    /**
     * 获取用户注册错误信息
     * @param  integer $code 错误编码
     * @return string        错误信息
     */
    private function showRegError($code = 0){
        switch ($code) {
            case -1:  $error = '用户名长度必须在16个字符以内！'; break;
            case -2:  $error = '用户名被禁止注册！'; break;
            case -3:  $error = '用户名被占用！'; break;
            case -4:  $error = '密码长度必须在6-30个字符之间！'; break;
            case -5:  $error = '邮箱格式不正确！'; break;
            case -6:  $error = '邮箱长度必须在1-32个字符之间！'; break;
            case -7:  $error = '邮箱被禁止注册！'; break;
            case -8:  $error = '邮箱被占用！'; break;
            case -9:  $error = '手机格式不正确！'; break;
            case -10: $error = '手机被禁止注册！'; break;
            case -11: $error = '手机号被占用！'; break;
            default:  $error = '未知错误';
        }
        return $error;
    }

}
