<?php

define('__ROOT__', dirname(dirname(__FILE__)));

require_once (__ROOT__.'/interface/ChatIf.php');
require_once ('Settings.php');
require_once ('Functions.php');

class Db implements ChatIF {

    protected $db;

    public function __construct() {
        $this -> db = new mysqli(HOST, DB_ADMIN, PASSWORD, DB_NAME );
    }

    public function get_rooms(){
        return $this->db->query("SELECT * FROM `rooms`");
    }

    public function get_room_id($roomName){
        return $this->db->query("SELECT `id` FROM `rooms` AS `roomId` WHERE `room_name` = '$roomName'");
    }

    public function send_message($user, $message, $dateTimeNow, $roomId) {
        $user = Functions::clean($user);
        $message = Functions::clean($message);
        $this->db->query("INSERT INTO `messages` VALUES('','$user','$message','$dateTimeNow', '$roomId')");
    }

    public function get_messages($roomId) {
        return $this->db->query("SELECT * FROM (SELECT * FROM `messages` WHERE `room_id` = '$roomId' ORDER BY `id` DESC LIMIT 8) sub ORDER BY `id`");
    }

    public function online_user (){
        return $this->db->query("SELECT * FROM `online_users`" );
    }

    public function set_user_online($user, $dateTimeNow){

        $user = Functions::clean($user);

        $userAlreadyOnline = $this->db->query("SELECT `user` FROM `online_users` WHERE `user` = '$user'");
        if ($userAlreadyOnline->num_rows > 0){
            $this->db->query("UPDATE `online_users` SET `last_seen` = '$dateTimeNow' WHERE `user` = '$user'" );
        }
        else {
            $this->db->query("INSERT INTO `online_users` VALUES ('','$user', '$dateTimeNow')" );
        }
    }

    public function throw_offline_user() {
        $this->db->query("DELETE FROM `online_users` WHERE `last_seen` < CURRENT_TIME () - INTERVAL 2 MINUTE");
    }

    public function block_user($user) {
        $user = Functions::clean($user);
        $this->db->query("DELETE FROM `online_users` WHERE `user` = '$user'");
        $this->db->query("INSERT INTO `blocked_user` VALUES ('','$user')" );
    }

    public function get_blocked_user ($user){
        $user = Functions::clean($user);
        $userBlocked = $this->db->query("SELECT * FROM `blocked_user` WHERE `user` = '$user'");
        if ($userBlocked ->num_rows > 0){
            return true;
        }
        else {
            return false;
        }
    }
}

