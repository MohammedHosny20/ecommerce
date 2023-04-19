<?php

include "../connect.php";
// here the code will be checked to ensure that the code entered by the user matches the one in backend
$email = filterRequest('email');
$verify_code = filterRequest('verify_code');

$stmt = $con->prepare("SELECT * FROM users WHERE email = '$email' AND verify_code = '$verify_code' ");

$stmt->execute();

$count = $stmt->rowCount();
if($count > 0){
      message("success" , "Verification completed successfully, Enter a new password");
     
}else{
      message("failure" , "The verification code you entered is incorrect");
}

?>