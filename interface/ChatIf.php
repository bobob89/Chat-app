<?php

interface ChatIF {
    public function get_rooms();
    public function get_room_id($roomName);
    public function send_message($user, $message, $dateTimeNow, $roomId);
    public function get_messages($roomId);
    public function online_user();
    public function set_user_online($user, $dateTimeNow);
    public function throw_offline_user();
    public function block_user($user);
    public function get_blocked_user ($user);
}