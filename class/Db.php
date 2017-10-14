<?php

define('__ROOT__', dirname(dirname(__FILE__)));
require_once (__ROOT__.'/interface/ChatIf.php');
require_once ('Functions.php');

class Db implements ChatIF {

    protected $db, $result;

    public function __construct() {
        $this -> db = new mysqli('localhost', 'root', '', 'chat' );

        if (mysqli_connect_errno()) {
            printf("Connect failed: %s\n", mysqli_connect_error());
            exit();
        }
    }

    public function put_message($user, $message, $dateTimeNow) {
        $user = Functions::clean($user);
        $message = Functions::clean($message);
        $this->db->query("INSERT INTO `messages` VALUES('','$user','$message','$dateTimeNow')");
    }

    public function get_messages() {
        return $this->db->query("SELECT * FROM (SELECT * FROM `messages` ORDER BY `id` DESC LIMIT 8) sub ORDER BY `id`");
    }

    public function online_user (){
        return $this->db->query("SELECT * FROM `onlineUsers`" );
    }

    public function set_user_online($user, $dateTimeNow){

        $user = Functions::clean($user);

        $userAlreadyOnline = $this->db->query("SELECT `user` FROM `onlineUsers` WHERE `user` = '$user'");
        if ($userAlreadyOnline->num_rows > 0){
            $this->db->query("UPDATE `onlineUsers` SET `last_seen` = '$dateTimeNow' WHERE `user` = '$user'" );
        }
        else {
            $this->db->query("INSERT INTO `onlineUsers` VALUES ('','$user', '$dateTimeNow')" );
        }
    }

    public function throw_offline_user() {
        $this->db->query("DELETE FROM `onlineUsers` WHERE `last_seen` < CURRENT_TIME () - INTERVAL 2 MINUTE");
    }

}

