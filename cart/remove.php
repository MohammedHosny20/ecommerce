<?php

include "../connect.php";


$product_id = filterRequest("product_id");
$user_id = filterRequest("user_id");

deleteData("cart", "cart_id =  (SELECT cart_id FROM cart WHERE cart_user_id = '$user_id' AND cart_product_id ='$product_id' AND cart_order = 0 LIMIT 1)", "Removed from cart successfully");
?>