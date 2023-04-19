<?php

include "../connect.php";

$search = filterRequest("text");

getAllData("productsView" , "product_name LIKE '%$search%' OR product_name_ar LIKE '%$search%' ");


?>