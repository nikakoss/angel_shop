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

class ControllerShoputilsProductsSelector extends Controller {
    public function __construct($registry) {
        parent::__construct($registry);
        $this->load->language('shoputils/products_selector');
    }

    public function index() {
        $this->load->model('catalog/product');

        if (isset($this->request->get['page'])) {
            $page = $this->request->get['page'];
        } else {
            $page = 1;
        }

        $this->data['title'] = $this->language->get('heading_title');

        if (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1'))) {
            $this->data['base'] = HTTPS_SERVER;
        } else {
            $this->data['base'] = HTTP_SERVER;
        }

        $url = '';

        if (isset($this->request->get['page'])) {
            $url .= '&page=' . $this->request->get['page'];
        }

        $this->_setData(array(
            'button_cancel',
            'button_select',
            'button_filter',
            'entry_filter_name',
            'action_filter' => $this->makeUrl('index.php?route=shoputils/products_selector/index' . $url),
            'column_id',
            'column_sku',
            'column_name',
            'column_price',
            'text_no_products',
            'text_products_selected',
            'dialog_id' => $_COOKIE['dialogID'],
            'field_id' => $_COOKIE['fieldID'],
        ));

        $parameters = array();
        $this->_updateData(array(
            'filter_name',
        ), $parameters);
        $filter = trim(isset($_COOKIE['filter']) ? $_COOKIE['filter'] : '');
        $this->data['filter'] = $filter;

        $limit = 16;
        $result = array();
        $products_data = array(
            'sort' => 'name',
            'order' => 'desc',
            'start' => ($page - 1) * $limit,
            'limit' => $limit
        );
        if ($filter != '') {
            $products_data['filter_name'] = $filter;
        }

        $products = $this->model_catalog_product->getProducts($products_data);
        foreach ($products as $product) {
            $result[] = array(
                'product_id' => $product['product_id'],
                'sku' => $product['sku'],
                'name' => $product['name'],
                'price' => $this->currency->format($product['price']),
            );
        }
        $this->data['products'] = $result;

        $pagination = new Pagination();
        $pagination->total = $this->model_catalog_product->getTotalProducts($products_data);

        $pagination->page = $page;
        $pagination->limit = $limit;
        $pagination->text = $this->language->get('text_pagination');
        $pagination->url = $this->makeUrl('index.php?route=shoputils/products_selector/index' . $url . '&page={page}');

        $this->data['pagination'] = $pagination->render();

        $this->template = 'shoputils/products_selector.tpl';
        $this->children = array(
            'common/header',
            'common/footer'
        );
        $this->response->setOutput($this->render(TRUE), $this->config->get('config_compression'));
    }

    public function table() {
        $this->_setData(array(
            'column_id',
            'column_sku',
            'column_name',
            'column_price',
            'button_delete',
            'text_no_products',
            'text_delete',
            'text_edit',
        ));
        $this->load->model('shoputils/product');

        $selected = explode(',', trim(isset($this->request->get['selected']) ? $this->request->get['selected'] : '', ','));
        $products = $this->model_shoputils_product->getProducts($selected);

        $result = array();
        foreach ($products as $product) {
            $result[] = array(
                'product_id' => $product['product_id'],
                'sku' => $product['sku'],
                'name' => $product['name'],
                'price' => $this->currency->format($product['price']),
                'href' => $this->makeUrl('index.php?route=catalog/product/update&product_id=' . $product['product_id']),
            );
        }
        $this->data['selected'] = $result;
        $this->data['field'] = isset($this->request->get['field']) ? $this->request->get['field'] : null;

        $this->template = 'shoputils/products_selector_table.tpl';
        $this->response->setOutput($this->render(TRUE), $this->config->get('config_compression'));
    }

    public function table_by_category() {
        $this->_setData(array(
            'column_id',
            'column_sku',
            'column_name',
            'column_price',
            'text_no_products',
            'text_delete',
            'text_edit',
            'button_delete',
        ));
        $this->load->model('catalog/product');

        $category_id = isset($this->request->get['category_id']) ? $this->request->get['category_id'] : -1;
        $products = $this->model_catalog_product->getProductsByCategoryId($category_id);

        $result = array();
        foreach ($products as $product) {
            $result[] = array(
                'product_id' => $product['product_id'],
                'sku' => $product['sku'],
                'name' => $product['name'],
                'price' => $this->currency->format($product['price']),
                'href' => $this->makeUrl('index.php?route=catalog/product/update&product_id=' . $product['product_id']),
            );
        }
        $this->data['selected'] = $result;
        $this->data['field'] = isset($this->request->get['field']) ? $this->request->get['field'] : null;

        $this->template = 'shoputils/products_selector_table.tpl';
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