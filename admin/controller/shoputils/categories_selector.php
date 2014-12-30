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

class ControllerShoputilsCategoriesSelector extends Controller {
    public function __construct($registry) {
        parent::__construct($registry);
        $this->load->model('catalog/category');
        $this->load->language('shoputils/categories_selector');
    }

    public function index() {
        $this->data['title'] = $this->language->get('heading_title');

        if (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1'))) {
            $this->data['base'] = HTTPS_SERVER;
        } else {
            $this->data['base'] = HTTP_SERVER;
        }

        $this->_setData(array(
            'button_select',
            'button_cancel',
            'button_filter',
            'entry_filter_name',
            'action_filter' => $this->makeUrl('index.php?route=shoputils/categories_selector/index'),
            'column_name',
            'text_no_categories',
            'text_categories_selected',
            'dialog_id' => $_COOKIE['dialogID'],
            'field_id' => $_COOKIE['fieldID'],
        ));

        $parameters = array();
        $this->_updateData(array(
            'filter_name',
        ), $parameters);
        $filter = trim(isset($_COOKIE['filter']) ? $_COOKIE['filter'] : '');
        $this->data['filter'] = $filter;
        $this->data['selected'] = explode(',', isset($_COOKIE['selected']) ? $_COOKIE['selected'] : '');

        if ($filter != '') {
            $filter = mb_strtolower($filter, 'utf-8');
            $categories = $this->model_catalog_category->getCategories(0);
            $result = array();
            foreach ($categories as $category) {
                if (mb_strpos(mb_strtolower($category['name'], 'utf-8'), $filter, 0, 'utf-8') !== false) {
                    $result[] = $category;
                }
            }
            $this->data['categories'] = $result;
        } else {
            $this->data['categories'] = $this->model_catalog_category->getCategories(0);
        }

        $this->template = 'shoputils/categories_selector.tpl';
        $this->children = array(
            'common/header',
            'common/footer'
        );
        $this->response->setOutput($this->render(TRUE), $this->config->get('config_compression'));
    }

    public function table() {
        $this->_setData(array(
            'column_name',
            'button_delete',
            'text_no_categories',
            'text_delete',
            'text_edit',
        ));

        $selected = explode(',', trim(isset($this->request->get['selected']) ? $this->request->get['selected'] : '', ','));
        $categories = $this->model_catalog_category->getCategories(0);
        $result = array();
        foreach ($categories as $category) {
            if (in_array($category['category_id'], $selected)) {
                $result[] = array_merge($category, array(
                    'href' => $this->makeUrl('index.php?route=catalog/category/update&category_id=' . $category['category_id'])
                ));
            }
        }
        $this->data['selected'] = $result;
        $this->data['field'] = isset($this->request->get['field']) ? $this->request->get['field'] : null;

        $this->template = 'shoputils/categories_selector_table.tpl';
        $this->response->setOutput($this->render(TRUE), $this->config->get('config_compression'));
    }

    private function _setData($keys) {
        foreach ($keys as $key => $value) {
            if (is_int($key)) {
                $this->data[$value] = $this->language->get($value);
            } else {
                $this->data[$key] = $value;
            }
        }
    }

    private function _updateData($keys, $info) {
        foreach ($keys as $key) {
            if (isset($this->request->post[$key])) {
                $this->data[$key] = $this->request->post[$key];
            } elseif (isset($info[$key])) {
                $this->data[$key] = $info[$key];
            } else {
                $this->data[$key] = $this->config->get($key);
            }
        }
    }

    function makeUrl($url) {
        if (isset($this->session->data['token'])) {
            return HTTPS_SERVER . $url . '&token=' . $this->session->data['token'];
        } else {
            return HTTPS_SERVER . $url;
        }
    }

}
?>