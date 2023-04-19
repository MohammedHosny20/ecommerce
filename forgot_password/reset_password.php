<?php

include "../connect.php";

$email = filterRequest("email");
$password = sha1($_POST["password"]);

$data = array("password" => $password);

updateData("users", $data ,"email = '$email'", "The password has been successfully changed");