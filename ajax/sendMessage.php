<?php

require '../class/Db.php';

$dateTimeNow = date('Y-m-d H:i:s');
$username = $_POST[username];
$message = $_POST[message];

$db = new Db();
$db->put_message($username,$message,$dateTimeNow);

$arr['timestamp'] = "$dateTimeNow";
$arr['username'] = "$username";
$arr['message'] = "$message";

echo json_encode($arr);