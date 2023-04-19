<?php

include "../connect.php";

$search = filterRequest("text");
$category_id = filterRequest("category_id");

getAllData("productsView" , "product_category_id = $category_id AND product_name LIKE '%$search%' OR product_name_ar LIKE '%$search%' ");


?>