<?php

require '../class/Db.php';

$db = new Db();
$messagesQuery = $db->get_messages();

while ($row = mysqli_fetch_array($messagesQuery)){
    $arr = array(
        "timestamp" => $row['timestamp'],
        "user" => $row['user'],
        "message" => $row['message']);
    $arrMain[] = $arr;

}

echo json_encode($arrMain);


