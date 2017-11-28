<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: 麦当苗儿 <zuojiazi@vip.qq.com> <http://www.zjzit.cn>
// +----------------------------------------------------------------------

namespace Admin\Controller;

/**
 * 后台配置控制器
 * @author 麦当苗儿 <zuojiazi@vip.qq.com>
 */

class ConfigController extends AdminController {

    /**
     * 配置管理
     * @author 麦当苗儿 <zuojiazi@vip.qq.com>
     */
    public function index(){
    	/* 查询条件初始化 */
    	$map = array();
        $map  = array('status' => 1);
        if(isset($_GET['name'])){
        	$map['name']  = array('like', '%'.(string)I('name').'%');
        }

		$list = $this->lists('Config', $map);

        $this->assign('list', $list);
        $this->meta_title = '配置管理';
        $this->display();
    }

    /**
     * 新增配置
     * @author 麦当苗儿 <zuojiazi@vip.qq.com>
     */
    public function add(){
        if(IS_POST){
            $Config = D('Config');
            $data = $Config->create();
            if($data){
                if($Config->add()){
					S('DB_CONFIG_DATA',null);
                    $this->success('新增成功', U('index'));
                } else {
                    $this->error('新增失败');
                }
            } else {
                $this->error($Config->getError());
            }
        } else {
            $this->meta_title = '新增配置';
            $this->display('edit');
        }
    }

    /**
     * 编辑配置
     * @author 麦当苗儿 <zuojiazi@vip.qq.com>
     */
    public function edit($id = 0){
        if(IS_POST){
            $Config = D('Config');
            $data = $Config->create();
            if($data){
                if($Config->save()){
					S('DB_CONFIG_DATA',null);
					//记录行为
					action_log('update_config','config',$data['id'],UID);
                    $this->success('更新成功', U('index'));
                } else {
                    $this->error('更新失败');
                }
            } else {
                $this->error($Config->getError());
            }
        } else {
            $info = array();
            /* 获取数据 */
            $info = M('Config')->field(true)->find($id);

            if(false === $info){
                $this->error('获取配置信息错误');
            }
            $this->assign('info', $info);
            $this->meta_title = '编辑配置';
            $this->display();
        }
    }

    /**
     * 批量保存配置
     * @author 麦当苗儿 <zuojiazi@vip.qq.com>
     */
    public function save($config){
		
        if($config && is_array($config)){
            $Config = M('Config');
            foreach ($config as $name => $value) {
                $map = array('name' => $name);
				if($name == 'WX_APICERT' OR $name == 'WX_APIKEY' OR $name == 'WX_ROOTCA'){
					if(!empty($value)){
						$Config->where($map)->setField('value', $value);
					}
				}else if($name == 'SMS_DX'){
					if(!empty($value)){
						$Config->where($map)->setField('value', serialize($value));
					}
				}else{
					if(!empty($value) || $value == '0'){
					$Config->where($map)->setField('value', $value);
					}
				}
            }
        }
		
		require(VENDOR_PATH."WxPayPubHelper/log_.php");
		$log_ = new \Log_();
		if($config['WX_APPID']){
			action_log('weixin', 'member', UID, UID);
			$log_name = VENDOR_PATH."WxPayPubHelper/WxPay.pub.config.php";//log文件路径
			$log_name2 = VENDOR_PATH."WxPayNotify/lib/WxPay.Config.php";//log文件路径
			
			$save_APPID = M('config')->where('id = 53')->getField('value');
			$save_MCHID = M('config')->where('id = 56')->getField('value');
			$save_KEY = M('config')->where('id = 55')->getField('value');
			$save_APPSECRET = M('config')->where('id = 54')->getField('value');
			
			$text = "<?php 
class WxPayConf_pub{
	const APPID = '".$save_APPID."';
	const MCHID = '".$save_MCHID."';
	const KEY = '".$save_KEY."';
	const APPSECRET = '".$save_APPSECRET."';
	const JS_API_CALL_URL = '"._SERVER_NAME_."/WeChat.php';
	const SSLCERT_PATH = 'cacert/apiclient_cert.pem';
	const SSLKEY_PATH = 'cacert/apiclient_key.pem';
	const NOTIFY_URL = '"._SERVER_NAME_."/wxnotify_url.php';
	const CURL_TIMEOUT = 30;
	}
?>";
		
			$notify_url = _SERVER_NAME_.'/ThinkPHP/Library/Vendor/WxPayNotify/example/';
			$text2 = "<?php
class WxPayConfig
{
	const APPID = '".$save_APPID."';
	const MCHID = '".$save_MCHID."';
	const TITLEURL = '"._SERVER_NAME_."/proname.php';
	const TOTALURL = '"._SERVER_NAME_."/prototal.php';
	const SAVEURL = '"._SERVER_NAME_."/savewxpay.php';
	const NOTIFYURL = '".$notify_url."';
	const KEY = '".$save_KEY."';
	const APPSECRET = '".$save_APPSECRET."';
	const SSLCERT_PATH = '../../WxPayPubHelper/cacert/apiclient_cert.pem';
	const SSLKEY_PATH = '../../WxPayPubHelper/cacert/apiclient_key.pem';
	const CURL_PROXY_HOST = '0.0.0.0';
	const CURL_PROXY_PORT = 0;
	const REPORT_LEVENL = 1;
}
?>";
		
			$log_->log_text($log_name,"$text");
			$log_->log_text($log_name2,"$text2");
		
			if($config['WX_APICERT']){
				$log_cert = VENDOR_PATH."WxPayPubHelper/cacert/apiclient_cert.pem";
				$log_key = VENDOR_PATH."WxPayPubHelper/cacert/apiclient_key.pem";
				$log_rootca = VENDOR_PATH."WxPayPubHelper/cacert/rootca.pem";
				
				$save_log_cert = M('config')->where('id = 61')->getField('value');
				$save_log_key = M('config')->where('id = 62')->getField('value');
				$save_log_rootca = M('config')->where('id = 63')->getField('value');
				
				$log_->log_text($log_cert,"$save_log_cert");
				$log_->log_text($log_key,"$save_log_key");
				$log_->log_text($log_rootca,"$save_log_rootca");
			}
		
		}
		
		if($config['EMAIL_SERVER']){
			action_log('email', 'member', UID, UID);
			$email_url = 'Application/Common/Conf/email.php';
			$email_name = M('config')->where('id = 68')->getField('value');
			$email_smtp = M('config')->where('id = 65')->getField('value');
			$email_user = M('config')->where('id = 67')->getField('value');
			$email_password = M('config')->where('id = 69')->getField('value');
			$email_post = M('config')->where('id = 66')->getField('value');
			$email_title = M('config')->where('id = 70')->getField('value');
			$email = "<?php
return array(
	'EMAIL_FROM_NAME'        => '".$email_name."', 
    'EMAIL_SMTP'             => '".$email_smtp."',
    'EMAIL_USERNAME'         => '".$email_user."',
    'EMAIL_PASSWORD'         => '".$email_password."', 
	'EMAIL_POST'         	 => '".$email_post."', 
	'EMAIL_TITLE'         	 => '".$email_title."', 
);
?>";
			$log_->log_text($email_url,"$email");
		}
		
		if($config['SMS_DX']){
			action_log('sms', 'member', UID, UID);
			$sms_url = 'Application/Common/Conf/sms.php';
			$sms_user = M('config')->where('id = 72')->getField('value');
			$sms_password = M('config')->where('id = 73')->getField('value');
			$sms = "<?php
return array(
    'SMS_USERNAME'         => '".$sms_user."',
    'SMS_PASSWORD'         => '".$sms_password."', 
);
?>";
			$log_->log_text($sms_url,"$sms");
			
		}
		if($config['ALI_PARTNER']){
			action_log('alipay', 'member', UID, UID);
		}		
		
		if($config['EMS_APPKEY']){
			$exp_url = 'Application/Common/Conf/exp.php';
			$ebid = M('config')->where('id = 93')->getField('value');
			$appkey = M('config')->where('id = 94')->getField('value');
			$exp = "<?php
return array(
    'EBusinessID'         => '".$ebid."',
    'AppKey'         => '".$appkey."', 
	'ReqURL'         => 'http://api.kdniao.cc/Ebusiness/EbusinessOrderHandle.aspx', 
);
?>";
			$log_->log_text($exp_url,"$exp");
		}
		
		S('DB_CONFIG_DATA',null);
        $this->success('保存成功！');
		
    }

    /**
     * 删除配置
     * @author 麦当苗儿 <zuojiazi@vip.qq.com>
     */
    public function del(){
        $id = array_unique((array)I('id',0));

        if ( empty($id) ) {
            $this->error('请选择要操作的数据!');
        }

        $map = array('id' => array('in', $id) );
        if(M('Config')->where($map)->delete()){
			S('DB_CONFIG_DATA',null);
			//记录行为
			action_log('update_config','config',$id,UID);
            $this->success('删除成功');
        } else {
            $this->error('删除失败！');
        }
    }

    // 获取某个标签的配置参数
    public function group() {
		
		if(UID != 1){
			$perid = M('member')->where('uid = '.UID)->getField('perid');
			$infoadmin = M('permissions')->where('perid = '.$perid)->field('system')->find();
			if($infoadmin['system']){
				$infoadmin['system'] = explode(',',$infoadmin['system']);
			}
			if(!in_array("system",$infoadmin['system'])){
				$this->error('参数错误！');
			}
			
		}
		
        $id     =   I('get.id',1);
        $type   =   C('CONFIG_GROUP_LIST');
        $list   =   M("Config")->where(array('status'=>1,'group'=>$id))->field('id,name,title,extra,value,remark,type')->order('sort')->select();
		
        if($list) {
			if($list[6]){
				$smsarr = parse_config_attr($list[6]['extra']);
				$smsvalue = unserialize($list[6]['value']);
				$this->assign('smsvalue',$smsvalue);
				$this->assign('smsarr',$smsarr);
			}
			//p($list);
            $this->assign('list',$list);
        }
		$nav_type = 'system';
		$nav_type_li = 'group';
		$this->assign('nav_type', $nav_type);
		$this->assign('nav_type_li', $nav_type_li);
		$this->assign('id',$id);
        $this->meta_title = $type[$id].'设置';
        $this->display();
    }
	
	public function upload_test(){
		
		$this->display();
	}
	
	public function upload_verify(){
		
		if ($_FILES["download"]["error"] > 0){
			$return = array(
				'status' => 0,
				'info' => '请上传正确的文件类型，TXT文件！',
			);
		}else{
			$file = explode('.',$_FILES["download"]["name"]);
			if($file[1] == 'txt'){
				move_uploaded_file($_FILES["download"]["tmp_name"],$_FILES["download"]["name"]);
				$return = array(
					'status' => 1,
					'info' => '上传正确成功！',
				);
			}else{
				$return = array(
					'status' => 0,
					'info' => '请上传正确的文件类型，TXT文件！',
				);
			}
			
		}
	//	echo json_encode($return);exit;
	//	$this->ajaxReturn($return);
		
	}

}
