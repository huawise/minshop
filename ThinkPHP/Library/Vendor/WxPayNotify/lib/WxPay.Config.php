<?php
class WxPayConfig
{
	const APPID = 'APPIDAPPID';
	const MCHID = 'MCHIDMCHID';
	const TITLEURL = 'http://127.0.0.1/xinxiadan/proname.php';
	const TOTALURL = 'http://127.0.0.1/xinxiadan/prototal.php';
	const SAVEURL = 'http://127.0.0.1/xinxiadan/savewxpay.php';
	const NOTIFYURL = 'http://127.0.0.1/xinxiadan/ThinkPHP/Library/Vendor/WxPayNotify/example/';
	const KEY = 'KEYKEY';
	const APPSECRET = 'APPSECRETAPPSECRET';
	const SSLCERT_PATH = '../../WxPayPubHelper/cacert/apiclient_cert.pem';
	const SSLKEY_PATH = '../../WxPayPubHelper/cacert/apiclient_key.pem';
	const CURL_PROXY_HOST = '0.0.0.0';
	const CURL_PROXY_PORT = 0;
	const REPORT_LEVENL = 1;
}
?>