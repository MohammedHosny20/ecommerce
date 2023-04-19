<?php

include "../connect.php";

$email = filterRequest('email');
$verify_code = rand(10000 , 99999);

$stmt = $con->prepare("SELECT * FROM users WHERE email = ?");
$stmt-> execute(array($email));
$count = $stmt->rowCount();

if($count > 0){
      $data = array("verify_code" => $verify_code);
      updateData("users", $data , "email = '$email'" , "A verification code has been sent to your email");
       /*
       to send verify code to email
      */
      sendmail($email, "Verify Code From Ecommerce", $verify_code);

}else{
      message("failure","This e-mail is unauthorized");     
}