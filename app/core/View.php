<?php

namespace app\core;

class View
{
    /**
     * @param string $tpl
     * @param array $vars
     * Отображаем шаблон
     */
    public static function render(string $tpl, array $vars)
    {
        extract($vars);
        $path = 'app/views/master.php';
        if (file_exists($path)) {
            ob_start();
            require $path;
            $content = ob_get_clean();
            require 'app/views/' . $tpl . '.php';
        }
    }

    public static function errorCode($code) {
        http_response_code($code);
        $path = 'app/views/errors/'.$code.'.php';
        if (file_exists($path)) {
            require $path;
        }
        exit;
    }
}