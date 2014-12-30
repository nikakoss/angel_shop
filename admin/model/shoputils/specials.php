<?php
/*
* Shoputils
 *
 * ПРИМЕЧАНИЕ К ЛИЦЕНЗИОННОМУ СОГЛАШЕНИЮ
 *
 * Этот файл связан лицензионным соглашением, которое можно найти в архиве,
 * вместе с этим файлом. Файл лицензии называется: LICENSE.1.4.x.RUS.txt
 * Так же лицензионное соглашение можно найти по адресу:
 * http://opencart.shoputils.ru/LICENSE.1.4.x.RUS.txt
 * 
 * =================================================================
 * OPENCART 1.4.x ПРИМЕЧАНИЕ ПО ИСПОЛЬЗОВАНИЮ
 * =================================================================
 *  Этот файл предназначен для Opencart 1.4.x. Shoputils не
 *  гарантирует правильную работу этого расширения на любой другой 
 *  версии Opencart, кроме Opencart 1.4.x. 
 *  Shoputils не поддерживает программное обеспечение для других 
 *  версий Opencart.
 * =================================================================
*/
class ModelShoputilsSpecials extends Model {

    public function getList(){
        return $this->db->query('SELECT * FROM '.DB_PREFIX.'shoputils_specials ORDER BY sort_order, name')->rows;
    }

    public function getSpecials($specials_id){
        return $this->db->query('SELECT * FROM '.DB_PREFIX.'shoputils_specials WHERE specials_id = "'.$specials_id.'"')->row;
    }

    public function addSpecials($data){
        $sql = "
            INSERT INTO
                " . DB_PREFIX . "shoputils_specials
            SET
                name = '" . $this->db->escape($data['name']) . "',
                customer_group_ids = '" . $this->db->escape(implode(',', isset($data['customer_group_ids']) ? $data['customer_group_ids'] : array() )) . "',
                manufacturers = '" . $this->db->escape(implode(',', isset($data['manufacturers']) ? $data['manufacturers'] : array() )) . "',
                priority = '" . (int)$data['priority'] . "',
                percent = '" . (float)$data['percent'] . "',
                date_start = '" . $this->db->escape($data['date_start']) . "',
                date_end = '" . $this->db->escape($data['date_end']) . "',
                objects_type = '" . (int)$data['objects_type'] . "',
                categories = '" . trim($data['categories'], ', ') . "',
                products = '" . trim($data['products'], ', ') . "',
                enabled = '" . (int)$data['enabled'] . "',
                sort_order = '" . (int)$data['sort_order'] ."'";
        $this->db->query($sql);
    }

    public function editSpecials($specials_id, $data){
        $sql = "
            UPDATE
                " . DB_PREFIX . "shoputils_specials
            SET
                name = '" . $this->db->escape($data['name']) . "',
                customer_group_ids = '" . $this->db->escape(implode(',', isset($data['customer_group_ids']) ? $data['customer_group_ids'] : array() )) . "',
                manufacturers = '" . $this->db->escape(implode(',', isset($data['manufacturers']) ? $data['manufacturers'] : array() )) . "',
                priority = '" . (int)$data['priority'] . "',
                percent = '" . (float)$data['percent'] . "',
                date_start = '" . $this->db->escape($data['date_start']) . "',
                date_end = '" . $this->db->escape($data['date_end']) . "',
                objects_type = '" . (int)$data['objects_type'] . "',
                categories = '" . trim($data['categories'], ', ') . "',
                products = '" . trim($data['products'], ', ') . "',
                enabled = '" . (int)$data['enabled'] . "',
                sort_order = '" . (int)$data['sort_order'] ."'
            WHERE
                specials_id='".$specials_id."'";
        $this->db->query($sql);
    }

    public function deleteSpecials($specials_id){
        $sql = "DELETE FROM ". DB_PREFIX . "shoputils_specials WHERE specials_id='".$specials_id."'";
        $this->db->query($sql);
    }

    public function applySpecials(){
        $cnt = 0;

        $sql = "DELETE FROM ". DB_PREFIX . "product_special";
        $this->db->query($sql);

        $sql = 'SELECT * FROM '.DB_PREFIX.'shoputils_specials WHERE enabled = 1 ORDER BY sort_order, name';
        $query = $this->db->query($sql);

        $this->load->model('catalog/product');

        foreach ($query->rows as $special){
            $products = array();
            if ($special['objects_type'] == 0){
                $category_ids = explode(',', $special['categories']);
                foreach ($category_ids as $category_id){
                    $products = array_merge($products, $this->model_catalog_product->getProductsByCategoryId($category_id));
                }
            } else if ($special['objects_type'] == 1){
                $this->load->model('shoputils/product');
                $products = $this->model_shoputils_product->getProducts(explode(',', $special['products']));
            } else if ($special['objects_type'] == 2){
                $this->load->model('shoputils/product');
                $products = $this->model_shoputils_product->getProductsByManufacturersId(explode(',', $special['manufacturers']));
            }

            $cnt += count($products);

            $customer_group_ids = explode(',', $special['customer_group_ids']);

            foreach ($customer_group_ids as $customer_group_id){
                foreach ($products as $product){
                    $price = $this->currency->format(round($product['price'] - $product['price'] * ($special['percent'] / 100), 2), '', '', false);
                    $sql = "INSERT INTO " .
                                DB_PREFIX . "product_special
                            SET
                                product_id = '" . $product['product_id'] . "',
                                customer_group_id = '" . (int)$customer_group_id . "',
                                priority = '" . (int)$special['priority'] . "',
                                price = '" . $price . "',
                                date_start = '" . $this->db->escape($special['date_start']) . "',
                                date_end = '" . $this->db->escape($special['date_end']) . "'";
                    $this->db->query($sql);
                }
            }
        }

        return $cnt;
    }

    function makeInstall(){
       $this->db->query('CREATE TABLE IF NOT EXISTS `'.DB_PREFIX.'shoputils_specials` (
          `specials_id` int(11) NOT NULL AUTO_INCREMENT,
          `name` varchar(512) NOT NULL,
          `customer_group_ids` text NOT NULL,
          `priority` int(5) NOT NULL,
          `percent` decimal(10,2) NOT NULL,
          `date_start` date NOT NULL,
          `date_end` date NOT NULL,
          `objects_type` int(1) NOT NULL,
          `categories` text NOT NULL,
          `products` text NOT NULL,
          `manufacturers` text NOT NULL,
          `enabled` int(1) NOT NULL DEFAULT 1,
          `sort_order` int(11) NOT NULL,
          PRIMARY KEY (`specials_id`)
        )');

        $query = $this->db->query('SHOW INDEXES FROM '.DB_PREFIX.'product');
        $found = false;
        foreach ($query->rows as $row){
            if ($row['Column_name'] == 'manufacturer_id'){
                $found = true;
                break;
            }
        }
        if (!$found){
            $this->db->query('ALTER TABLE '.DB_PREFIX.'product ADD INDEX IDX_manufacturer_id (manufacturer_id)');
        }
    }
}
?>