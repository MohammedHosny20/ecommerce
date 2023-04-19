<?php

include "../connect.php";
/*
include "../connect.php";

getAllData("products");
*/
$category_id = filterRequest("category_id");
$user_id = filterRequest("user_id");


$stmt = $con->prepare("SELECT productsView.* , 1 as favorite , (product_price - (product_price * product_discount / 100)) as discount FROM productsView 
INNER JOIN favorite ON favorite.favorite_product_id = productsView.product_id AND favorite.favorite_user_id =$user_id
WHERE category_id = $category_id
UNION ALL
SELECT * , 0 as favorite , (product_price - (product_price * product_discount / 100)) as discount FROM productsView
WHERE category_id = $category_id AND product_id NOT IN ( SELECT productsView.product_id FROM productsView
INNER JOIN favorite ON favorite.favorite_product_id = productsView.product_id AND favorite.favorite_user_id = $user_id)");


$stmt->execute();
$data = $stmt->fetchAll(PDO::FETCH_ASSOC);
$count  = $stmt->rowCount();

if($count >0){
      echo json_encode(array("status"=> "success", "data"=> $data));
}else{
      echo json_encode(array("status"=> "failure"));
}

