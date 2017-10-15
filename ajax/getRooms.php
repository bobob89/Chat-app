<?php

require '../class/Db.php';

$db = new Db();
$result = $db->get_rooms();

while ($row = mysqli_fetch_array($result)) {
    $arrMain[] = $row['room_name'];
}

echo json_encode($arrMain);
