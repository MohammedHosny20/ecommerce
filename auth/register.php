<?php

include "../connect.php";

$username = filterRequest('user_name');
$email = filterRequest('email');
$phone = filterRequest('phone');
$password = sha1($_POST['password']);
$verify_code = rand(10000 , 99999);

$stmt = $con->prepare("SELECT * FROM users WHERE email = ? OR phone = ?");
$stmt-> execute(array($email, $phone));

$count = $stmt->rowCount();
if($count >0){
      message("failure","This e-mail or phone is already registered");
}else{
      $data = array(
            "user_name" => $username,
            "email" => $email,
            "password" => $password,
            "phone" => $phone,
            "verify_code" => $verify_code,
      );
      /*
       to send verify code to email
      */
      sendmail($email, "Verify Code From Ecommerce", $verify_code);
      insertData("users" , $data , "A verification code has been sent to your email");
      
}