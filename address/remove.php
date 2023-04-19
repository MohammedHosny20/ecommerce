<?php

include "../connect.php";


$address_id = filterRequest("address_id");
$user_id = filterRequest("user_id");

deleteData("address", "address_id = '$address_id' AND address_user_id = '$user_id' ", "The address has been deleted successfully");
?>