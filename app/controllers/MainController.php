<?php

namespace app\controllers;

use app\core\View;
use app\models\ShopModel;


class MainController
{
    public $shopModel;

    public function __construct()
    {
        $this->shopModel = new ShopModel();
    }

    public function indexAction()
    {
        $product = $this->shopModel->getProduct(3);
        View::render('main', ['product' => $product]);
    }
}