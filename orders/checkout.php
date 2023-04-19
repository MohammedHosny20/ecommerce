<?php

include "../connect.php";

$order_user_id = filterRequest("order_user_id");
$order_address = filterRequest("order_address");
$order_delivery_type = filterRequest("order_delivery_type");
$order_delivery_price = filterRequest("order_delivery_price");
$order_price = filterRequest("order_price");
$order_coupon = filterRequest("order_coupon");
$order_coupon_discount = filterRequest("order_coupon_discount");
$order_payment_method = filterRequest("order_payment_method");

if($order_delivery_type == 1){
      $order_delivery_price = 0;
}

$total_price = $order_price + $order_delivery_price;

// Check Coupon

$now = date("Y-m-d H:i:s");
$count = getData("SELECT  * FROM coupon WHERE coupon_id = ? AND coupon_expired_date > ? AND coupon_count > ?", array($order_coupon , $now , 0) , null , null , false);

if($count > 0 ){
      // لو اكبر من صفر معناه ان الكوبون موجود
      $total_price = $total_price - $order_price * $order_coupon_discount / 100;
      $stmt =$con->prepare("UPDATE coupon SET coupon_count = coupon_count - 1  WHERE coupon_id = '$order_coupon'");
      $stmt ->execute();

}



$data = array(
      "order_user_id" => $order_user_id,
      "order_address" => $order_address,
      "order_delivery_type" => $order_delivery_type,
      "order_delivery_price" => $order_delivery_price,
      "order_price" => $order_price,
      "order_total_price" => $total_price,
      "order_coupon" => $order_coupon,
      "order_payment_method" => $order_payment_method,
);
$count = insertData("orders" , $data , null , false);

if($count > 0){
       $stmt = $con->prepare("SELECT MAX(order_id) from orders");
       $stmt->execute();
       $maxOrderId = $stmt->fetchColumn();
       $data = array("cart_order" =>   $maxOrderId);
       updateData("cart" , $data , "cart_user_id = $order_user_id AND cart_order = 0");
}
?>