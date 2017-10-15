<?php

require '../class/Db.php';

$user = $_POST[user];

$db = new Db();
$db->block_user($user);

