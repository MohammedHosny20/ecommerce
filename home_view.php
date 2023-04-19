<?php

include "connect.php";

$allData = array();
$status = "success";
$categories = getAllData("categories", null, null, false);
/*
$products = getAllData("favoriteView", "product_discount != 0", null, false);
$products = getAllData("favoriteView", null, null, false);
*/
$user_id = filterRequest("user_id");

$stmt = $con->prepare("SELECT productsView.* , 1 as favorite , (product_price - (product_price * product_discount / 100)) as discount FROM productsView 
INNER JOIN favorite ON favorite.favorite_product_id = productsView.product_id
UNION ALL
SELECT * , 0 as favorite ,  (product_price - (product_price * product_discount / 100)) as discount FROM productsView
WHERE product_id NOT IN ( SELECT productsView.product_id FROM productsView
INNER JOIN favorite ON favorite.favorite_product_id = productsView.product_id AND favorite.favorite_user_id = $user_id)");


$stmt->execute();
$products = $stmt->fetchAll(PDO::FETCH_ASSOC);

$allData["status"] = $status;
$allData["categories"] = $categories;
$allData["products"] = $products;

echo json_encode($allData);
?>