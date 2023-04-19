<?php

include "../connect.php";


$phone = filterRequest("address_user_phone");
$userId = filterRequest("address_user_id");
$address_id = filterRequest("address_id");
$address_city = filterRequest("address_city");
$address_street = filterRequest("address_street");
$address_lat = filterRequest("address_lat");
$address_lng = filterRequest("address_lng");
$address_type = filterRequest("address_type");
$address_note = filterRequest("address_note");

$data = array(
      "address_id" => $address_id,
      "address_user_phone" => $phone,
      "address_user_id" => $userId,
      "address_city" => $address_city,
      "address_street" => $address_street,
      "address_lat" => $address_lat,
      "address_lng" => $address_lng,
      "address_type" => $address_type,
      "address_note" => $address_note,
);

updateData("address", $data, "address_id = $address_id" ,"The address has been updated successfully" ,"Please change the information to update");
?>