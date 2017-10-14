<?php

interface ChatIF {

    public function put_message($user, $message, $dateTimeNow);
    public function get_messages();
    public function online_user();
    public function set_user_online($user, $dateTimeNow);
    public function throw_offline_user();

}