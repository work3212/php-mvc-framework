<?php

//Вывод всех ошибок на экран
ini_set('display_errors', 1);
error_reporting(E_ALL);


//Автозагрузка классов
spl_autoload_register(function ($class) {
    $path = str_replace('\\', '/', $class . '.php');
    if (file_exists($path)) {
        require $path;
    }
});

//Дебаг
function dd($info)
{
    echo "<pre>";
    var_dump($info);
    echo "</pre>";
}