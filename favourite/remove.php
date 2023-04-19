<?php

include "../connect.php";


$product_id = filterRequest("product_id");
$user_id = filterRequest("user_id");

deleteData("favorite", "favorite_product_id = '$product_id' AND favorite_user_id = '$user_id' ", "Removed from favorites successfully");
?>