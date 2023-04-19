<?php

include "../connect.php";

$email = filterRequest('email');
$password = sha1($_POST['password']);
// getData("SELECT  * FROM users WHERE email = ? AND password = ? ", array($email, $password), "Logged in successfully", "This e-mail is unauthorized");
getData("SELECT  * FROM users WHERE email = ? AND password = ? ", array($email, $password), "Logged in successfully", "This e-mail is unauthorized");
