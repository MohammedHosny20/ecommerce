<?php

include "../connect.php";


$email = filterRequest('email');
$verify_code = rand(10000 , 99999);

sendmail($email, "Verify Code From Ecommerce", $verify_code);

$data = array("verify_code" => $verify_code);
updateData("users", $data, "email = '$email' " , "Logged in successfully");