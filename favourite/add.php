<?php

include "../connect.php";


$product_id = filterRequest("product_id");
$user_id = filterRequest("user_id");

$data = array(
      "favorite_product_id" => $product_id,
      "favorite_user_id" => $user_id,
);

insertData("favorite", $data, "Added to favorites successfully");
?>