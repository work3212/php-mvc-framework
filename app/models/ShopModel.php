<?php

namespace app\models;

use app\core\Model;

class ShopModel extends Model
{
    public function getProduct(int $id)
    {
        $product = $this->db->query('SELECT * FROM `products` WHERE id = :id;',
            [
                'id' => $id
            ]);

        return $product;
    }
}