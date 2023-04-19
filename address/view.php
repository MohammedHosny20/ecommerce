<?php

include "../connect.php";

$user_id = filterRequest("user_id");

getAllData("address", "address_user_id = ? ", array($user_id));

?>