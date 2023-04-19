<?php

include "../connect.php";


$product_id = filterRequest("product_id");
$user_id = filterRequest("user_id");

$data = array(
      "cart_product_id" => $product_id,
      "cart_user_id" => $user_id,
);
insertData("cart", $data, "Added to cart successfully");
// "success","There is no information, please try again"
?>