<?php

require '../class/Db.php';

$dateTimeNow = date('Y-m-d H:i:s');
$username = $_POST[username];

$db = new Db();
$db->set_user_online($username, $dateTimeNow);

$arr['username'] = "$username";

echo json_encode($arr);