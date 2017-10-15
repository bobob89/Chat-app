<?php

require '../class/Db.php';

$dateTimeNow = date('Y-m-d H:i:s');
$username = $_POST[username];
$message = $_POST[message];
$room = $_POST[room];

$db = new Db();

$areBlocked =$db->get_blocked_user($username);

if ($areBlocked){
    $arr['username'] = "Blocked";
}

else {

$roomIdQuery = $db ->get_room_id($room);

    while ($row = mysqli_fetch_array($roomIdQuery)){
        $roomId = $row[id];
    }

    $db->send_message($username,$message,$dateTimeNow,$roomId);

    $arr['timestamp'] = "$dateTimeNow";
    $arr['username'] = "$username";
    $arr['message'] = "$message";
    $arr['room'] = "$roomId";
}


echo json_encode($arr);