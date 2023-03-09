<?php

namespace app\core;

use lib\Db;

abstract class Model
{
    public $db;

    public function __construct()
    {
        $this->db = Db::getInstance();
    }
}