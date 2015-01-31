<?php

    class ModelModuleSeogen extends Model {
        private $keywords = false;
        private $manufr_desc = false;

        public function __construct($registry) {
            parent::__construct($registry);

            require_once(DIR_SYSTEM . 'library/URLify.php');

            $query = $this->db->query("SHOW TABLES LIKE '" . DB_PREFIX . "manufacturer_description'");
            $this->manufr_desc = $query->num_rows;
        }

        private function loadKeywords() {
            $this->keywords = array();
            $query = $this->db->query("SELECT LOWER(`keyword`) as 'keyword' FROM " . DB_PREFIX . "url_alias");
            foreach($query->rows as $row) {
                $this->keywords[] = $row['keyword'];
            }
            return $query;
        }

        public function urlifyCategory($category_id) {
            $category = $this->getCategories($category_id);
            $this->generateCategory($category[0], $this->config->get('seogen'));
        }

        public function urlifyProduct($product_id) {
            $product = $this->getProducts($product_id);
            $this->generateProduct($product[0], $this->config->get('seogen'));
        }

        public function urlifyManufacturer($manufacturer_id) {
            $manufacturer = $this->getManufacturers($manufacturer_id);
            $this->generateManufacturer($manufacturer[0], $this->config->get('seogen'));
        }

        public function urlifyInformation($information_id) {
            $information = $this->getInformations($information_id);
            $this->generateInformation($information[0], $this->config->get('seogen'));
        }

        public function generateCategories($data) {
            if(isset($data['categories_overwrite'])) {
                $this->db->query("DELETE FROM `" . DB_PREFIX . "url_alias` WHERE `query` LIKE ('category_id=%');");
            }
            $this->loadKeywords();
            foreach($this->getCategories() as $category) {
                $this->generateCategory($category, $data);
            }
        }

        public function generateProducts($data) {
            if(isset($data['products_overwrite'])) {
                $this->db->query("DELETE FROM `" . DB_PREFIX . "url_alias` WHERE `query` LIKE ('product_id=%');");
            }
            $this->loadKeywords();
            foreach($this->getProducts() as $product) {
                $this->generateProduct($product, $data);
            }
        }

        public function generateManufacturers($data) {
            if(isset($data['manufacturers_overwrite'])) {
                $this->db->query("DELETE FROM `" . DB_PREFIX . "url_alias` WHERE `query` LIKE ('manufacturer_id=%');");
            }
            $this->loadKeywords();
            foreach($this->getManufacturers() as $manufacturer) {
                $this->generateManufacturer($manufacturer, $data);
            }
        }

        public function generateInformations($data) {
            if(isset($data['informations_overwrite'])) {
                $this->db->query("DELETE FROM `" . DB_PREFIX . "url_alias` WHERE `query` LIKE ('information_id=%');");
            }
            $this->loadKeywords();
            foreach($this->getInformations() as $information) {
                $this->generateInformation($information, $data);
            }
        }

        private function generateCategory($category, $data) {
            $tags = array('[category_name]' => $category['name']);
            $parent_id = $this->getParentCategories($category['category_id']);

            if(isset($data['categories_overwrite']) || is_null($category['keyword'])) {
                $this->db->query("DELETE FROM `" . DB_PREFIX . "url_alias` WHERE `query`='category_id=" . (int)$category['category_id'] . "'");
                $keyword = $this->urlify($data['categories_template'], $tags);
                $this->db->query("INSERT INTO `" . DB_PREFIX . "url_alias` SET `query`='category_id=" . (int)$category['category_id'] . "', keyword='" . $this->db->escape($keyword) . "'");
            }

            /*ratkin - BEGIN*/
            /*
            $updates = array();
            if($category['name'] == 'Мужчинам'){
                $data['categories_title_template'] = "Мужчинам | Angel-moda";
                $data['categories_meta_keyword_template'] = "мужчинам, одежда, обувь, аксессуары, брендовая, итальянский, Италия, купить, цена, продажа, оптом";
                $data['categories_meta_description_template'] = "Мужская одежда, обувь, аксессуары мировых брендов по доступным ценам. Большой ассортимент товаров для мужчин из Италии оптом и в розницу. Принимаем заказы по тел. +7(929)580-08-10.";
            } elseif($category['name'] == 'Женщинам') {
                $data['categories_title_template'] = "Женщинам | Angel-moda";
                $data['categories_meta_keyword_template'] = "женщинам, одежда, обувь, аксессуары, итальянский, брендовая, Италия, купить, цена, продажа, оптом";
                $data['categories_meta_description_template'] = "Женская одежда, обувь, аксессуары мировых брендов по доступным ценам. Большой ассортимент товаров для женщин из Италии оптом и в розницу. Принимаем заказы по тел. +7(929)580-08-10.";
            } elseif($category['name'] == 'Бижутерия') {
                $data['categories_title_template'] = "Бижутерия | Angel-moda";
                $data['categories_meta_keyword_template'] = "бижутерия, брендовая, итальянский, Италия, купить, цена, продажа, оптом";
                $data['categories_meta_description_template'] = "Роскошная бижутерия мировых брендов по доступным ценам. Большой ассортимент товаров из Италии оптом и в розницу. Принимаем заказы по тел. +7(929)580-08-10.";
            } elseif($category['name'] == 'Товары за 1000 рублей') {
                $data['categories_title_template'] = "Товары за 1000 рублей | Angel-moda";
                $data['categories_meta_keyword_template'] = "Лучшие [category_name], брендовые, итальянский, из Италии, купить, цена, продажа, оптом";
                $data['categories_meta_description_template'] = "Лучшие [category_name] - купить оптом и в розницу в интернет магазине 'Angel-moda'. Самый большой ассортимент товаров из Италии по приемлимым ценам. Принимаем заказы по тел. +7(929)580-08-10.";
            } elseif($parent_id['parent_id'] == 25) {
                $data['categories_title_template'] = "Брендовые итальянские [category_name] - купить по доступным ценам | Angel-moda";
                $data['categories_meta_keyword_template'] = "[category_name], бижутерия, брендовые, итальянский, из Италии, купить, цена, продажа, оптом";
                $data['categories_meta_description_template'] = "[category_name] - купить оптом и в розницу в интернет магазине 'Angel-moda'. Большой ассортимент бижетерии из Италии по приемлимым ценам. Принимаем заказы по тел. +7(929)580-08-10.";
            } elseif($category['name'] == 'Спортивная одежда' || $category['name'] == 'Нижнее белье' || $category['name'] == 'Спортивная обувь') {
                $t = $this->getParentCategories($parent_id['parent_id']);
                $n = $this->getCategories($t['parent_id']);
                $n = $n[0]['name'];

                if($n == 'Мужчинам')
                    $gender = 'Мужская';
                elseif($n == 'Женщинам'){
                    if($category['name'] == 'Нижнее белье')
                        $gender = 'Женское';
                    else
                        $gender = 'Женская';
                } else
                    $gender = 'Лучшая';
                $data['categories_title_template'] = "$gender [category_name] из Италии - купить по доступным ценам | Angel-moda";
                $data['categories_meta_keyword_template'] = "$gender [category_name], брендовые, итальянский, из Италии, купить, цена, продажа, оптом";
                $data['categories_meta_description_template'] = "$gender [category_name] - купить оптом и в розницу в интернет магазине 'Angel-moda'. ". $n ." - большой ассортимент товаров из Италии по приемлимым ценам. Принимаем заказы по тел. +7(929)580-08-10.";
            } else {
                $t = $this->getParentCategories($parent_id['parent_id']);
                if($t['parent_id'] != 0)
                    $n = $this->getCategories($t['parent_id']);
                else
                    $n = $this->getCategories($parent_id['parent_id']);
                $n = $n[0]['name'];

                if($n == 'Мужчинам')
                    //if($category['name'] == 'Аксессуары')
                    $gender = 'мужские';
                //else
                //$gender = 'мужская';
                elseif($n == 'Женщинам'){
                    //if($category['name'] == 'Аксессуары')
                    $gender = 'женские';
                    //else
                    //$gender = 'женская';
                } else
                    $gender = 'лучшие';

                $parent_name = $this->getCategories($parent_id['parent_id']);
                $parent_name = $parent_name[0]['name'];

                $data['categories_title_template'] = "Итальянские $gender [category_name] - купить по доступным ценам | Angel-moda";
                $data['categories_meta_keyword_template'] = "$gender ". utf8_strtolower($parent_name) .", брендовые, итальянский, из Италии, купить, цена, продажа, оптом";
                $data['categories_meta_description_template'] = "$gender ". utf8_strtolower($parent_name) ." - купить оптом и в розницу в интернет магазине 'Angel-moda'. ". $n ." - большой ассортимент товаров из Италии по приемлимым ценам. Принимаем заказы по тел. +7(929)580-08-10.";
            }
            */
            /*ratkin - END*/

            if(isset($category['seo_h1']) && (isset($data['categories_h1_overwrite']) || (strlen(trim($category['seo_h1']))) == 0)) {
                $h1 = trim(strtr($data['categories_h1_template'], $tags));
                $updates[] = "`seo_h1`='" . $this->db->escape($h1) . "'";
            }
            if(isset($category['seo_title']) && (isset($data['categories_title_overwrite']) || (strlen(trim($category['seo_title']))) == 0)) {
                $title = trim(strtr($data['categories_title_template'], $tags));
                $updates[] = "`seo_title`='" . $this->db->escape($title) . "'";
            }
            if(isset($category['meta_keyword']) && (isset($data['categories_meta_keyword_overwrite']) || (strlen(trim($category['meta_keyword']))) == 0)) {
                $meta_keyword = trim(strtr($data['categories_meta_keyword_template'], $tags));
                $updates[] = "`meta_keyword`='" . $this->db->escape($meta_keyword) . "'";
            }
            if(isset($category['meta_description']) && (isset($data['categories_meta_description_overwrite']) || (strlen(trim($category['meta_description']))) == 0)) {
                $meta_description = trim(strtr($data['categories_meta_description_template'], $tags));
                $updates[] = "`meta_description`='" . $this->db->escape($meta_description) . "'";
            }

            if(count($updates)) {
                $this->db->query("UPDATE `" . DB_PREFIX . "category_description`" .
                    " SET " . implode(", ", $updates) .
                    " WHERE category_id='" . (int)$category['category_id'] . "' AND language_id='" . (int)$this->config->get('config_language_id') . "'");
            }
        }

        public function generateProduct($product, $data) {
            $tags = array(
                '[product_name]' => $product['name'],
                '[model_name]' => $product['model'],
                '[manufacturer_name]' => $product['manufacturer'],
                '[category_name]' => $product['category'],
                '[sku]' => $product['sku'],
                '[price]' => $this->currency->format($product['price']),
            );
            /**/
            //utf8_strtolower();
            /**/
            if(isset($data['products_overwrite']) || is_null($product['keyword'])) {
                $this->db->query("DELETE FROM `" . DB_PREFIX . "url_alias` WHERE `query`='product_id=" . (int)$product['product_id'] . "'");
                $keyword = $this->urlify($data['products_template'], $tags);
                $this->db->query("INSERT INTO `" . DB_PREFIX . "url_alias` SET `query`='product_id=" . (int)$product['product_id'] . "', keyword='" . $this->db->escape($keyword) . "'");
            }

            /*ratkin - BEGIN*/
            /*
            $category_id = $product['category_id'];

            for(;;){
                if($category_id == '20' || $category_id == '18' || $category_id == '25'){
                    $base_cat_id = $category_id;
                    break;
                } else{
                    $category_id = $this->getParentCategories($category_id);
                    $category_id = $category_id['parent_id'];
                } 
            }
            
            
            if($base_cat_id == '20'){
                $parent_category_id = $this->getParentCategories($product['category_id']);
                $n = $this->getCategories($parent_category_id['parent_id']);
                $n = $n[0]['name'];
                if($n == 'Аксессуары'){
                    $gender = "мужские";
                    switch (trim($product['category'])) {
                        case "Сумки":
                        case "Головные уборы":
                            $data['products_title_template'] = "[product_name] (10$product[product_id]) - купить за [price] | Angel-moda";
                            break;
                        default:
                            $data['products_title_template'] = "Купить [product_name] (10$product[product_id]) за [price] | Angel-moda";
                    }

                    //$data['products_title_template'] = "Купить [product_name] за [price] | Angel-moda";
                    $data['products_meta_keyword_template'] = "[product_name], 10$product[product_id], $gender ".utf8_strtolower($n)." ([category_name]), итальянский, брендовый, Италия, купить, цена, продажа, оптом";
                    $data['products_meta_description_template'] = "[product_name] (10$product[product_id]) - купить по доступной цене за [price] Брендовые $gender аксессуары из Италии в интернет магазине 'Angel Moda'. Принимаем заказы по тел. +7(929)580-08-10.";
                } 
                else {
                    $gender = "мужская";

                    switch (trim($product['category'])) {
                        case "Мужские рубашки":
                        case "Мужские куртки":
                        case "Футболки":
                            $data['products_title_template'] = "[product_name] (10$product[product_id]) - купить за [price] | Angel-moda";
                            break;
                        default:
                            $data['products_title_template'] = "Купить [product_name] (10$product[product_id]) за [price] | Angel-moda";
                    }


                    //$data['products_title_template'] = "Купить [product_name] за [price] | Angel-moda";
                    $data['products_meta_keyword_template'] = "[product_name], 10$product[product_id], $gender ".utf8_strtolower($n)." ([category_name]), итальянский, брендовый, Италия, купить, цена, продажа, оптом";
                    $data['products_meta_description_template'] = "[product_name] (10$product[product_id]) - купить по доступной цене за [price] Брендовая $gender ".utf8_strtolower($n)." из Италии в интернет магазине 'Angel Moda'. Принимаем заказы по тел. +7(929)580-08-10.";
                }
            } 
            elseif($base_cat_id == '18'){
                $parent_category_id = $this->getParentCategories($product['category_id']);
                $n = $this->getCategories($parent_category_id['parent_id']);
                $n = $n[0]['name'];
                if($n == 'Аксессуары'){
                    $gender = "женские";

                    switch (trim($product['category'])) {
                        case "Сумки":
                        case "Головные уборы":
                            $data['products_title_template'] = "[product_name] (10$product[product_id]) - купить за [price] | Angel-moda";
                            break;
                        default:
                            $data['products_title_template'] = "Купить [product_name] (10$product[product_id]) за [price] | Angel-moda";
                    }

                    //$data['products_title_template'] = "Купить [product_name] за [price] | Angel-moda";
                    $data['products_meta_keyword_template'] = "[product_name], 10$product[product_id], $gender ".utf8_strtolower($n)." ([category_name]), итальянский, брендовый, Италия, купить, цена, продажа, оптом";
                    $data['products_meta_description_template'] = "[product_name] (10$product[product_id]) - купить по доступной цене за [price] Брендовые $gender аксессуары из Италии в интернет магазине 'Angel Moda'. Принимаем заказы по тел. +7(929)580-08-10.";
                } 
                else {
                    $gender = "женская";
                    switch (trim($product['category'])) {
                        case "Рубашки":
                        case "Юбки":
                        case "Куртки":
                        case "Спортивная одежда":
                        case "Блузки":
                        case "Футболки":
                            $data['products_title_template'] = "[product_name] (10$product[product_id]) - купить за [price] | Angel-moda";
                            break;
                        default:
                            $data['products_title_template'] = "Купить [product_name] (10$product[product_id]) за [price] | Angel-moda";
                    }

                    //$data['products_title_template'] = "Купить [product_name] за [price] | Angel-moda";
                    $data['products_meta_keyword_template'] = "[product_name], 10$product[product_id], $gender ".utf8_strtolower($n)." ([category_name]), итальянский, брендовый, Италия, купить, цена, продажа, оптом";
                    $data['products_meta_description_template'] = "[product_name] (10$product[product_id]) - купить по доступной цене за [price] Брендовая $gender ".utf8_strtolower($n)." из Италии в интернет магазине 'Angel Moda'. Принимаем заказы по тел. +7(929)580-08-10.";
                }
            } 
            else {
                $n = $this->getCategories($product['category_id']);
                $n = $n[0]['name'];
                $data['products_title_template'] = "Купить [product_name] (10$product[product_id]) за [price] | Angel-moda";
                $data['products_meta_keyword_template'] = "[product_name], 10$product[product_id], бижутерия, [category_name], итальянский, брендовый, Италия, купить, цена, продажа, оптом";
                $data['products_meta_description_template'] = "[product_name] (10$product[product_id]) - купить по доступной цене за [price] Лучшие брендовые ".utf8_strtolower($n)." из Италии в интернет магазине 'Angel Moda'. Принимаем заказы по тел. +7(929)580-08-10.";
            }
            */
            /*ratkin - END*/

            //echo $gender.' | ';

            $updates = array();
            if(isset($product['seo_h1']) && (isset($data['products_h1_overwrite']) || (strlen(trim($product['seo_h1']))) == 0)) {
                $h1 = trim(strtr($data['products_h1_template'], $tags));
                $updates[] = "`seo_h1`='" . $this->db->escape($h1) . "'";
            }
            if(isset($product['seo_title']) && (isset($data['products_title_overwrite']) || (strlen(trim($product['seo_title']))) == 0)) {
                $title = trim(strtr($data['products_title_template'], $tags));
                $updates[] = "`seo_title`='" . $this->db->escape($title) . "'";
            }
            if(isset($product['meta_keyword']) && (isset($data['products_meta_keyword_overwrite']) || (strlen(trim($product['meta_keyword']))) == 0)) {
                $meta_keyword = trim(strtr($data['products_meta_keyword_template'], $tags));
                $updates[] = "`meta_keyword`='" . $this->db->escape($meta_keyword) . "'";
            }
            if(isset($product['meta_description']) && (isset($data['products_meta_description_overwrite']) || (strlen(trim($product['meta_description']))) == 0)) {
                $meta_description = trim(strtr($data['products_meta_description_template'], $tags));
                $updates[] = "`meta_description`='" . $this->db->escape($meta_description) . "'";
            }

            if(count($updates)) {
                $this->db->query("UPDATE `" . DB_PREFIX . "product_description`" .
                    " SET " . implode(", ", $updates) .
                    " WHERE product_id='" . (int)$product['product_id'] . "' AND language_id='" . (int)$this->config->get('config_language_id') . "'");
            }
        }

        private function generateManufacturer($manufacturer, $data) {
            $tags = array('[manufacturer_name]' => $manufacturer['name']);
            if(isset($data['manufacturers_overwrite']) || is_null($manufacturer['keyword'])) {
                $this->db->query("DELETE FROM `" . DB_PREFIX . "url_alias` WHERE `query`='manufacturer_id=" . (int)$manufacturer['manufacturer_id'] . "'");
                $keyword = $this->urlify($data['manufacturers_template'], $tags);
                $this->db->query("INSERT INTO `" . DB_PREFIX . "url_alias` SET `query`='manufacturer_id=" . (int)$manufacturer['manufacturer_id'] . "', keyword='" . $this->db->escape($keyword) . "'");
            }

            if($this->manufr_desc) {
                $updates = array();
                if(isset($manufacturer['seo_h1']) && (isset($data['manufacturers_h1_overwrite']) || (strlen(trim($manufacturer['seo_h1']))) == 0)) {
                    $h1 = trim(strtr($data['manufacturers_h1_template'], $tags));
                    $updates[] = "`seo_h1`='" . $this->db->escape($h1) . "'";
                }
                if(isset($manufacturer['seo_title']) && (isset($data['manufacturers_title_overwrite']) || (strlen(trim($manufacturer['seo_title']))) == 0)) {
                    $title = trim(strtr($data['manufacturers_title_template'], $tags));
                    $updates[] = "`seo_title`='" . $this->db->escape($title) . "'";
                }
                if(isset($manufacturer['meta_keyword']) && (isset($data['manufacturers_meta_keyword_overwrite']) || (strlen(trim($manufacturer['meta_keyword']))) == 0)) {
                    $meta_keyword = trim(strtr($data['manufacturers_meta_keyword_template'], $tags));
                    $updates[] = "`meta_keyword`='" . $this->db->escape($meta_keyword) . "'";
                }
                if(isset($manufacturer['meta_description']) && (isset($data['manufacturers_meta_description_overwrite']) || (strlen(trim($manufacturer['meta_description']))) == 0)) {
                    $meta_description = trim(strtr($data['manufacturers_meta_description_template'], $tags));
                    $updates[] = "`meta_description`='" . $this->db->escape($meta_description) . "'";
                }
                if(count($updates)) {
                    $this->db->query("UPDATE `" . DB_PREFIX . "manufacturer_description`" .
                        " SET " . implode(", ", $updates) .
                        " WHERE manufacturer_id='" . (int)$manufacturer['manufacturer_id'] . "' AND language_id='" . (int)$this->config->get('config_language_id') . "'");
                }
            }
        }

        public function generateInformation($information, $data) {
            $tags = array('[information_title]' => $information['title']);
            if(isset($data['informations_overwrite']) || is_null($information['keyword'])) {
                $this->db->query("DELETE FROM `" . DB_PREFIX . "url_alias` WHERE `query`='information_id=" . (int)$information['information_id'] . "'");
                $keyword = $this->urlify($data['informations_template'], $tags);
                $this->db->query("INSERT INTO `" . DB_PREFIX . "url_alias` SET `query`='information_id=" . (int)$information['information_id'] . "', keyword='" . $this->db->escape($keyword) . "'");
            }

            $updates = array();
            if(isset($information['seo_h1']) && (isset($data['informations_h1_overwrite']) || (strlen(trim($information['seo_h1']))) == 0)) {
                $h1 = trim(strtr($data['informations_h1_template'], $tags));
                $updates[] = "`seo_h1`='" . $this->db->escape($h1) . "'";
            }
            if(isset($information['seo_title']) && (isset($data['informations_title_overwrite']) || (strlen(trim($information['seo_title']))) == 0)) {
                $title = trim(strtr($data['informations_title_template'], $tags));
                $updates[] = "`seo_title`='" . $this->db->escape($title) . "'";
            }
            if(isset($information['meta_keyword']) && (isset($data['informations_meta_keyword_overwrite']) || (strlen(trim($information['meta_keyword']))) == 0)) {
                $meta_keyword = trim(strtr($data['informations_meta_keyword_template'], $tags));
                $updates[] = "`meta_keyword`='" . $this->db->escape($meta_keyword) . "'";
            }
            if(isset($information['meta_description']) && (isset($data['informations_meta_description_overwrite']) || (strlen(trim($information['meta_description']))) == 0)) {
                $meta_description = trim(strtr($data['informations_meta_description_template'], $tags));
                $updates[] = "`meta_description`='" . $this->db->escape($meta_description) . "'";
            }

            if(count($updates)) {
                $this->db->query("UPDATE `" . DB_PREFIX . "information_description`" .
                    " SET " . implode(", ", $updates) .
                    " WHERE information_id='" . (int)$information['information_id'] . "' AND language_id='" . (int)$this->config->get('config_language_id') . "'");
            }
        }


        private function getCategories($category_id = false) {
            $query = $this->db->query("SELECT cd.*, u.keyword FROM " . DB_PREFIX . "category_description cd" .
                " LEFT JOIN " . DB_PREFIX . "url_alias u ON (CONCAT('category_id=', cd.category_id) = u.query)" .
                " WHERE cd.language_id = '" . (int)$this->config->get('config_language_id') . "'" .
                ($category_id ? " AND cd.category_id='" . (int)$category_id . "'" : "") .
                " ORDER BY cd.category_id");
            return $query->rows;
        }

        /*ratkin - BEGIN*/
        /*
        private function getParentCategories($category_id = false) {
            if($category_id != '0'){
                $query = $this->db->query("SELECT c.* FROM " . DB_PREFIX . "category c WHERE c.category_id = " . (int)$category_id);
                $id = $query->rows;
                return $id[0];
            } else
                return $id[0] = 0;
        }
        */
        /*ratkin - END*/

        private function getProducts($product_id = false) {
            $seogen = $this->config->get('seogen');


            $query = $this->db->query("SELECT pd.*, u.keyword, m.name as 'manufacturer', p.model as 'model', p.sku, p.price, " .
                ($seogen['main_category_exists'] ? "ifnull(cd.name, '') as 'category', ifnull(cd.category_id, '') as 'category_id'" : "'' as 'category'") .
                " FROM `" . DB_PREFIX . "product` p" .
                " LEFT JOIN `" . DB_PREFIX . "product_description` pd ON ( pd.product_id = p.product_id )" .
                ($seogen['main_category_exists'] ?
                    " LEFT JOIN `" . DB_PREFIX . "product_to_category` p2c ON ( p.product_id = p2c.product_id )" .
                    " LEFT JOIN `" . DB_PREFIX . "category_description` cd ON ( cd.category_id = p2c.category_id )":"") .
                " LEFT JOIN `" . DB_PREFIX . "manufacturer` m ON ( m.manufacturer_id = p.manufacturer_id )" .
                " LEFT JOIN " . DB_PREFIX . "url_alias u ON (CONCAT('product_id=', p.product_id) = u.query)" .
                " WHERE pd.language_id ='" . (int)$this->config->get('config_language_id') . "'" .
                ($seogen['main_category_exists'] ?
                    " AND cd.language_id ='" . (int)$this->config->get('config_language_id') . "'" .
                    " AND p2c.main_category ='1'":"").
                ($product_id ? " AND p.product_id='" . (int)$product_id . "'" : "") .
                " ORDER BY p.product_id");
            return $query->rows;
        }

        private function getManufacturers($manufacturer_id = false) {
            if($this->manufr_desc) {
                $query = $this->db->query("SELECT md.*, u.keyword, m.name" .
                    " FROM `" . DB_PREFIX . "manufacturer` m" .
                    " LEFT JOIN `" . DB_PREFIX . "manufacturer_description` md ON (m.manufacturer_id=md.manufacturer_id)" .
                    " LEFT JOIN " . DB_PREFIX . "url_alias u ON (CONCAT('manufacturer_id=', m.manufacturer_id) = u.query)" .
                    " WHERE md.language_id='" . (int)$this->config->get('config_language_id') . "'" .
                    ($manufacturer_id ? " AND m.manufacturer_id='" . (int)$manufacturer_id . "'" : "") .
                    " ORDER BY m.manufacturer_id");
            } else {
                $query = $this->db->query("SELECT manufacturer_id, name, u.keyword" .
                    " FROM `" . DB_PREFIX . "manufacturer` m" .
                    " LEFT JOIN " . DB_PREFIX . "url_alias u ON (CONCAT('manufacturer_id=', m.manufacturer_id) = u.query)" .
                    ($manufacturer_id ? " WHERE m.manufacturer_id='" . (int)$manufacturer_id . "'" : "") .
                    " ORDER BY m.manufacturer_id");
            }
            return $query->rows;
        }

        private function getInformations($information_id = false) {
            $query = $this->db->query("SELECT id.*, u.keyword FROM " . DB_PREFIX . "information_description id" .
                " LEFT JOIN " . DB_PREFIX . "url_alias u ON (CONCAT('information_id=', id.information_id) = u.query)" .
                " WHERE id.language_id = '" . (int)$this->config->get('config_language_id') . "'" .
                ($information_id ? " AND id.information_id='" . (int)$information_id . "'" : "") .
                " ORDER BY id.information_id");
            return $query->rows;
        }


        private function checkDuplicate(&$keyword) {
            $counter = 0;
            $k = $keyword;
            if($this->keywords !== false) {
                while(in_array($keyword, $this->keywords)) {
                    $keyword = $k . '-' . ++$counter;
                }
                $this->keywords[] = $keyword;
            } else {
                do {
                    $query = $this->db->query("SELECT url_alias_id FROM " . DB_PREFIX . "url_alias WHERE keyword ='" . $this->db->escape($keyword) . "'");
                    if($query->num_rows > 0) {
                        $keyword = $k . '-' . ++$counter;
                    }
                } while($query->num_rows > 0);
            }
        }

        private function urlify($template, $tags) {
            $keyword = strtr($template, $tags);
            $keyword = trim(html_entity_decode($keyword, ENT_QUOTES, "UTF-8"));
            $urlify = URLify::filter($keyword);
            $this->checkDuplicate($urlify);
            return $urlify;
        }
}