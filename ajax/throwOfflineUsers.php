<?php

require '../class/Db.php';
$db = new Db();
$db->throw_offline_user();