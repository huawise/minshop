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
 * 文件控制器
 * 主要用于下载模型的文件上传和下载
 */

class FileController extends HomeController {
	/* 文件上传 */
	public function upload(){
		//TODO: 用户登录检测
		
		/* 返回标准数据 */
		$return  = array('status' => 1, 'info' => '上传成功', 'data' => '');

		/* 调用文件上传组件上传文件 */
		$File = D('File');
		$info = $File->upload($_FILES, C('DOWNLOAD_UPLOAD')); //TODO:上传到远程服务器

		/* 记录附件信息 */
		if($info){
			$return['data'] = think_encrypt(json_encode($info['download']));
		} else {
			$return['status'] = 0;
			$return['info']   = $File->getError();
		}

		/* 返回JSON数据 */
		$this->ajaxReturn($return);
	}

	/* 下载文件 */
	public function download($id = null){
		if(empty($id) || !is_numeric($id)){
			$this->error('参数错误！');
		}

		$logic = D('Download', 'Logic');
		if(!$logic->download($id)){
			$this->error($logic->getError());
		}
		
	}
	
	/* 清楚缓存图片 */
	public function delimg($dirname = null){
		$dirname = I('get.dirname');
		if ( $handle = opendir( "$dirname" ) ) {
			while ( false !== ( $item = readdir( $handle ) ) ) {
				if ( $item != "." && $item != ".." ) {
					if ( is_dir( "$dirname/$item" ) ) {
						$this->delimg( "$dirname/$item" );
					} else {
						if( unlink( "$dirname/$item" ) );
					}
				}
			}
			closedir( $handle );
			if( rmdir( $dirname ) );
		}
		
	}
	
	public function downloadid(){
		
		echo M('config')->where('id = 1')->getField('create_time');
	}
	
	public function showdir(){
		
	}
	
	public function createDir($path = './')  
    {     
		
        if ($handle = opendir($path))   
        {  
            echo "<ul>";  
          
            while (false !== ($file = readdir($handle)))   
            {  
                if (is_dir($path.$file) && $file != '.' && $file !='..')  
                    $this->printSubDir($file, $path, $queue);  
                else if ($file != '.' && $file !='..')  
                    $queue[] = $file;  
            }  
              
            $this->printQueue($queue, $path);  
            echo "</ul>";  
        }  
    }  
      
    public function printQueue($queue, $path)  
    {  
        foreach ($queue as $file)   
        {  
            $this->printFile($file, $path);  
        }   
    }  
      
   public function printFile($file, $path)  
    {  
        echo "<li><a href='".$path.$file."'>".$file."</a></li>";  
    }  
      
    public function printSubDir($dir, $path)  
    {  
        echo "<li><span class='toggle'>".$dir."</span>";  
        $this->createDir($path.$dir."/");  
        echo "</li>";  
    }  
	
	
}
