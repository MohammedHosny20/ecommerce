<?php


define("MB", 1048576);

function filterRequest($requestname)
{
  return  htmlspecialchars(strip_tags($_POST[$requestname]));
}

function getAllData($table, $where = null, $values = null, $json = true)
{
    global $con;
    $data = array();
    if($where == null){
    $stmt = $con->prepare("SELECT  * FROM $table  ");
    }else{
    $stmt = $con->prepare("SELECT  * FROM $table WHERE   $where ");
    }
    $stmt->execute($values);
    $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
    $count  = $stmt->rowCount();
    if($json == true){
        if ($count > 0){
            echo json_encode(array("status" => "success", "data" => $data));
        } else {
            echo json_encode(array("status" => "failure"));
        }
    }else{
        if($count > 0){
            return $data;
        }else{
           return json_encode(array("status" => "failure"));
        }
    }
    return $count;
    
}
function getData($where = null, $values = null, $success = "success", $failure = "failure" , $json = true)
{
    global $con;
    $data = array();
    $stmt = $con->prepare($where);
    $stmt->execute($values);
    $data = $stmt->fetch(PDO::FETCH_ASSOC);
    $count  = $stmt->rowCount();
    if($json == true){
        if ($count > 0){
            echo json_encode(array("status" => "success", "message" => $success ,"data" => $data));
        } else {
            echo json_encode(array("status" => "failure" , "message" => $failure));
        }
    }
    return $count;
}

function insertData($table, $data, $success, $json = true)
{
    global $con;
    foreach ($data as $field => $v)
        $ins[] = ':' . $field;
    $ins = implode(',', $ins);
    $fields = implode(',', array_keys($data));
    $sql = "INSERT INTO $table ($fields) VALUES ($ins)";

    $stmt = $con->prepare($sql);
    foreach ($data as $f => $v) {
        $stmt->bindValue(':' . $f, $v);
    }
    $stmt->execute();
    $count = $stmt->rowCount();
    if ($json == true) {
    if ($count > 0) {
        message("success", $success);
    } else {
        message("failure", "failure");
    }
  }
    return $count;
}


function updateData($table, $data, $where, $success = "success" ,$failure ="failure" ,$json = true)
{
    global $con;
    $cols = array();
    $vals = array();

    foreach ($data as $key => $val) {
        $vals[] = "$val";
        $cols[] = "`$key` =  ? ";
    }
    $sql = "UPDATE $table SET " . implode(', ', $cols) . " WHERE $where";

    $stmt = $con->prepare($sql);
    $stmt->execute($vals);
    $count = $stmt->rowCount();
    if ($json == true) {
    if ($count > 0) {
        message("success", $success);
    } else {
        message("failure", $failure);
    }
    }
    return $count;
}

function deleteData($table, $where, $message, $json = true)
{
    global $con;
    $stmt = $con->prepare("DELETE FROM $table WHERE $where");
    $stmt->execute();
    $count = $stmt->rowCount();
    if ($json == true) {
        if ($count > 0) {
            message("success", $message);
        } else {
            message("failure", "failure");
        }
    }
    return $count;
}

function uploadImage($imageRequest)
{
  global $msgError;
  $imagename  = rand(1000, 10000) . $_FILES[$imageRequest]['name'];
  $imagetmp   = $_FILES[$imageRequest]['tmp_name'];
  $imagesize  = $_FILES[$imageRequest]['size'];
  $allowExt   = array("jpg", "png", "gif", "mp3", "pdf");
  $strToArray = explode(".", $imagename);
  $ext        = end($strToArray);
  $ext        = strtolower($ext);

  if (!empty($imagename) && !in_array($ext, $allowExt)) {
    $msgError = "EXT";
  }
  if ($imagesize > 2 * MB) {
    $msgError = "size";
  }
  if (empty($msgError)) {
    move_uploaded_file($imagetmp,  "../upload/" . $imagename);
    return $imagename;
  } else {
    return "fail";
  }
}



function deleteFile($dir, $imagename)
{
    if (file_exists($dir . "/" . $imagename)) {
        unlink($dir . "/" . $imagename);
    }
}

function isCheckAuthenticate()
{
    if (isset($_SERVER['PHP_AUTH_USER'])  && isset($_SERVER['PHP_AUTH_PW'])) {
        if ($_SERVER['PHP_AUTH_USER'] != "admin" ||  $_SERVER['PHP_AUTH_PW'] != "admin") {
            header('WWW-Authenticate: Basic realm="My Realm"');
            header('HTTP/1.0 401 Unauthorized');
            echo 'Page Not Found';
            exit;
        }
    } else {
        exit;
    }

}
function message($status, $message = ""){
    echo  json_encode(array("status" => $status, "message"=> $message));
}

function sendmail($to , $title, $body){
    $header = "From: support@gmail.com" . "\n" . "CC: mohammed003@gmail.com";
    mail($to, $title, $body, $header);
}

function sendFcm($title , $body , $topic , $pageId , $pagename){
    $url = 'https://fcm.googleapis.com/fcm/send';
    
    $fields = array(
        "to" => '/topics/' . $topic,
        'priority' => 'high',
        'content_available' => true,

        'notification' => array(
            "title" =>  $title,
            "body" =>  $body,
            "click_action" => "FLUTTER_NOTIFICATION_CLICK",
            "sound" => "default"

        ),
        'data' => array(
            "pageid" => $pageId,
            "pagename" => $pagename
        )

    );


    $fields = json_encode($fields);
    $headers = array(
        'Authorization: key=' . "AAAATAKX7AQ:APA91bFc1U2SZIzub0A69RIBDnR2pDar5PgIwPdeaK0tssu5E_ZYgMW8SHp8YQHYc4GOdPdJKM_T0tva1DhxnHy3qAZdQXzsgGy2vmDLqvxpq1SuYj60YJe93-oAQhQAPI-Xi2uLVNSX",
        'Content-Type: application/json'
    );

    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_POST, true);
    curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_POSTFIELDS, $fields);

    $result = curl_exec($ch);
    return $result;
    curl_close($ch);
}