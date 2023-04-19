<?php

include "../connect.php";

 
$product_id = filterRequest("product_id");
$user_id = filterRequest("user_id");

getData("SELECT COUNT(cart.cart_id) as countItem FROM cart WHERE cart_user_id = $user_id AND cart_product_id = $product_id AND cart_order = 0");
?>