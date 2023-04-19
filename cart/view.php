<?php
include "../connect.php";


$user_id = filterRequest("user_id");

$data =  getAllData("cartView", "cart_user_id = $user_id", null , false);

$stmt = $con->prepare("SELECT SUM(priceItems) as totalPrice , SUM(countItems) as totalCount FROM cartView
WHERE cartView.cart_user_id = '$user_id'
GROUP BY cartView.cart_user_id");

$stmt-> execute();
// count(countItems)
$totalCountPrice = $stmt->fetch(PDO::FETCH_ASSOC);

echo json_encode(array(
      "status" => "success",
      "data" => $data,
      "totalCountPrice" => $totalCountPrice,
));
?>