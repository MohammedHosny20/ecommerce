<?php

include "../connect.php";

$coupon_name = filterRequest("coupon_name");
$now = date("Y-m-d H:i:s");

getData("SELECT  * FROM coupon WHERE coupon_name = ? AND coupon_expired_date > ? AND coupon_count > ?", array($coupon_name , $now , 0) , "Congratulations, Discount has been successfully" , "Coupon code is invalid!");
// getData("SELECT  * FROM coupon WHERE coupon_name = ? ", array($coupon_name) , "success" , "Coupon code is invalid!");

?>