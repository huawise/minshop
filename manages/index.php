<?php 
session_start();
$_SESSION['bw_login'] = 1;
header('location:../index.php?s=/admin/public/login.html');