<?php

namespace app\core;

use app\core\View;

class Router
{
    protected $routes = [];
    protected $params = [];

    public function __construct()
    {
        $configs = require $_SERVER['DOCUMENT_ROOT'] . '/config/routes.php';
        foreach ($configs as $url => $val) {
            $this->addRoutes($url, $val);
        }
    }

    /**
     * @param string $url
     * @param array $params
     * Формируем массив маршрутов
     */
    private function addRoutes(string $url, array $params)
    {
        $route = '#^' . $url . '$#';
        $this->routes[$route] = $params;
    }

    /**
     * @return bool
     * Проверка на существования маршрута
     * Сохраняем параметры маршрута action и controller
     */
    private function match(): bool
    {
        $url = trim($_SERVER['REQUEST_URI'], '/');

        foreach ($this->routes as $route => $params) {
            if (preg_match($route, $url, $matches)) {
                $this->params = $params;
                return true;
            }
        }

        return false;
    }

    /**
     * Запуск контроллера и метода
     * Обработка ошибок при несуществующем методе или классе
     */
    public function run()
    {
        if ($this->match()) {
            $path = 'app\controllers\\' . ucfirst($this->params['controller']) . 'Controller';

            if (class_exists($path)) {
                $action = $this->params['action'] . 'Action';
                if (method_exists($path, $action)) {
                    $controller = new $path();
                    $controller->$action();
                } else {
                    View::errorCode(404);
                }
            } else {
                View::errorCode(404);
            }
        } else {
            View::errorCode(404);
        }
    }
}