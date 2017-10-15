<?php

require '../class/Db.php';

$room = $_POST[room];

$db = new Db();
$roomIdQuery = $db ->get_room_id($room);

while ($row = mysqli_fetch_array($roomIdQuery)){
    $roomId = $row[id];
}

$messagesQuery = $db->get_messages($roomId);

while ($row = mysqli_fetch_array($messagesQuery)){
    $arr = array(
        "timestamp" => $row['timestamp'],
        "user" => $row['user'],
        "message" => $row['message']);
    $arrMain[] = $arr;

}

echo json_encode($arrMain);


