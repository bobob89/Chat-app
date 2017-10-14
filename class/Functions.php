<?php

class Functions {
    public static function clean ($string){
        $string = htmlspecialchars($string);
        return $string;
    }
}