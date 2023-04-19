<?php

include "../connect.php";


$user_id = filterRequest("address_user_id");
$phone = filterRequest("address_user_phone");
$address_city = filterRequest("address_city");
$address_street = filterRequest("address_street");
$address_lat = filterRequest("address_lat");
$address_lng = filterRequest("address_lng");
$address_type = filterRequest("address_type");
$address_note = filterRequest("address_note");


$data = array(
      "address_user_id" => $user_id,
      "address_user_phone" => $phone,
      "address_city" => $address_city,
      "address_street" => $address_street,
      "address_lat" => $address_lat,
      "address_lng" => $address_lng,
      "address_type" => $address_type,
      "address_note" => $address_note,
);

insertData("address", $data, "The address has been added successfully");
?>