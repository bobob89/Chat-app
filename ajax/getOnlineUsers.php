<?php

require '../class/Db.php';

$db = new Db();
$onlineUsersQuery = $db->online_user();

if ($onlineUsersQuery->num_rows > 0) {
    while ($row = mysqli_fetch_array($onlineUsersQuery)) {
        $onlineUsers[] = $row['user'];
     }
}
echo json_encode($onlineUsers);

