<?php

include "../connect.php";

$order_user_id = filterRequest("order_user_id");

getAllData("orders" , "order_user_id = ?", array($order_user_id));

?>