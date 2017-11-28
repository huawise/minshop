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
class MailController extends HomeController {

	//系统首页
    public function index(){
		
		$email = M('config')->where('id = 60')->getField('value');
    	$return = send_email($email,'小蜜蜂邮箱配置测试','小蜜蜂邮箱配置测试','小蜜蜂邮箱配置测试');
		if($return['error'] == 1){
			$this->error('邮箱发送失败，请检查配置是否正确');exit;
		}else{
			$this->success('邮箱发送成功，请查看邮箱');exit;
		}
    }
	
	public function sms(){
		$statusStr = array(
			"0" => "短信发送成功",
			"-1" => "参数不全",
			"-2" => "服务器空间不支持,请确认支持curl或者fsocket，联系您的空间商解决或者更换空间！",
			"30" => "密码错误",
			"40" => "账号不存在",
			"41" => "余额不足",
			"42" => "帐户已过期",
			"43" => "IP地址限制",
			"50" => "内容含有敏感词"
		);
		$sms = M('config')->where('id = 98')->getField('value');
		$return = sms($sms,'短信接口测试，如果你收到该短信，说明接口对接成功！【小蜜蜂】');
		if($return == 0){
			$this->success($statusStr[$return]);exit;
		}else{
			$this->error($statusStr[$return]);exit;
		}
		
	}
}
