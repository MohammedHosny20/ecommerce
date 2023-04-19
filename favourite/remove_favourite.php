<?php

include "../connect.php";


$favorite_id = filterRequest("favorite_id");

deleteData("favorite", "favorite_id = '$favorite_id' ", "Removed from favorites successfully");
?>