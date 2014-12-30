<?php
/*
* Shoputils
 *
 * ���������� � ������������� ����������
 *
 * ���� ���� ������ ������������ �����������, ������� ����� ����� � ������,
 * ������ � ���� ������. ���� �������� ����������: LICENSE.1.4.x.RUS.txt
 * ��� �� ������������ ���������� ����� ����� �� ������:
 * http://opencart.shoputils.ru/LICENSE.1.4.x.RUS.txt
 * 
 * =================================================================
 * OPENCART 1.4.x ���������� �� �������������
 * =================================================================
 *  ���� ���� ������������ ��� Opencart 1.4.x. Shoputils ��
 *  ����������� ���������� ������ ����� ���������� �� ����� ������ 
 *  ������ Opencart, ����� Opencart 1.4.x. 
 *  Shoputils �� ������������ ����������� ����������� ��� ������ 
 *  ������ Opencart.
 * =================================================================
*/

class ModelShoputilsCategory extends Model {

    public function getRootCategories($parent_id = 0){
        $category_data = $this->cache->get('category.' . $this->config->get('config_language_id') . '._' . $parent_id);

        $this->load->model('catalog/category');

        if (!$category_data) {
            $category_data = array();

            $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "category c LEFT JOIN " . DB_PREFIX . "category_description cd ON (c.category_id = cd.category_id) WHERE c.parent_id = '" . (int)$parent_id . "' AND cd.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY c.sort_order, cd.name ASC");

            foreach ($query->rows as $result) {
                $category_data[] = array(
                    'category_id' => $result['category_id'],
                    'name'        => $this->model_catalog_category->getPath($result['category_id'], $this->config->get('config_language_id')),
                    'status'  	  => $result['status'],
                    'sort_order'  => $result['sort_order']
                );
            }

            $this->cache->set('category.' . $this->config->get('config_language_id') . '._' . $parent_id, $category_data);
        }

        return $category_data;
    }

}
?>