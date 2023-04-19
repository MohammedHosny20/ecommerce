<?php
include "../../connect.php";

$order_id = filterRequest("order_id");

$data = array("order_status" => 1);
updateData("orders" , $data , "order_id = $order_id");

?>