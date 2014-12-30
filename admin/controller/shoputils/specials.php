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

class ControllerShoputilsSpecials extends Controller {
    public function __construct($registry) {
        parent::__construct($registry);
        $this->load->language('shoputils/specials');
        $this->load->model('shoputils/specials');
    }

    public function index() {
        $this->id = 'menu_shoputils_specials';

        $this->data['menu_specials'] = $this->language->get('menu_specials');
        $this->data['menu_specials_href'] = $this->makeUrl('index.php?route=shoputils/specials/settings');

        $this->template = 'shoputils/specials_menu.tpl';
        $this->render();
    }

    public function settings() {
        $this->getList();
    }

    private function getList() {
        $this->model_shoputils_specials->makeInstall();

        $this->load->model('catalog/category');

        $this->document->breadcrumbs = array();

        $this->document->breadcrumbs[] = array(
            'href' => $this->makeUrl('index.php?route=common/home'),
            'text' => $this->language->get('text_home'),
            'separator' => FALSE
        );

        $this->document->breadcrumbs[] = array(
            'href' => $this->makeUrl('index.php?route=shoputils/specials/settings'),
            'text' => $this->language->get('heading_title'),
            'separator' => ' :: '
        );

        $this->document->title = $this->language->get('heading_title');

        $this->_setData(array(
            'heading_title' => $this->document->title,
            'insert' => $this->makeUrl('index.php?route=shoputils/specials/insert'),
            'delete' => $this->makeUrl('index.php?route=shoputils/specials/delete'),
            'apply' => $this->makeUrl('index.php?route=shoputils/specials/apply'),
            'button_insert',
            'button_delete',
            'button_apply',
            'question_apply',
            'column_name',
            'column_enabled',
            'column_objects',
            'column_percent',
            'column_date_start',
            'column_date_end',
            'column_sort_order',
            'column_action',
            'text_no_results',
            'text_success' => '',
            'text_info',
        ));

        if (!isset($this->data['text_error'])){
            $this->data['text_error'] = '';
        }

        $this->data['specials'] = array();

        $results = $this->model_shoputils_specials->getList();

        foreach ($results as $result) {
            $action = array();

            $action[] = array(
                'text' => $this->language->get('text_edit'),
                'href' => $this->makeUrl('index.php?route=shoputils/specials/update&specials_id=' . $result['specials_id'])
            );

            $this->data['specials'][] = array(
                'specials_id' => $result['specials_id'],
                'name' => $result['name'],
                'enabled' => (int) $result['enabled'] == 1 ? $this->language->get('text_enabled') : $this->language->get('text_disabled'),
                'objects_type' => $this->getObjectTypeText($result['objects_type']),
                'percent' => $result['percent'],
                'date_start' => $result['date_start'],
                'date_end' => $result['date_end'],
                'sort_order' => $result['sort_order'],
                'action' => $action
            );
        }

        if (isset($this->session->data['success'])) {
            $this->data['text_success'] = $this->session->data['success'];
            unset($this->session->data['success']);
        }

        $this->template = 'shoputils/specials_settings.tpl';
        $this->children = array(
            'common/header',
            'common/footer'
        );
        $this->response->setOutput($this->render(TRUE), $this->config->get('config_compression'));
    }

    private function getForm() {
        $this->document->breadcrumbs = array();

        $this->document->breadcrumbs[] = array(
            'href' => $this->makeUrl('index.php?route=common/home'),
            'text' => $this->language->get('text_home'),
            'separator' => FALSE
        );

        $this->document->breadcrumbs[] = array(
            'href' => $this->makeUrl('index.php?route=shoputils/specials/settings'),
            'text' => $this->language->get('heading_title'),
            'separator' => ' :: '
        );

        if (!isset($this->request->get['specials_id'])) {
            $this->data['action'] = $this->makeUrl('index.php?route=shoputils/specials/insert');

            $this->document->title = $this->language->get('heading_title_insert');

            $this->document->breadcrumbs[] = array(
                'href' => $this->makeUrl('index.php?route=shoputils/specials/insert'),
                'text' => $this->language->get('heading_title_insert'),
                'separator' => ' :: '
            );

            $specials = array();
        } else {
            $this->document->title = $this->language->get('heading_title_update');

            $this->data['action'] = $this->makeUrl('index.php?route=shoputils/specials/update&specials_id=' . $this->request->get['specials_id']);

            $this->document->breadcrumbs[] = array(
                'href' => $this->makeUrl('index.php?route=shoputils/specials/update'),
                'text' => $this->language->get('heading_title_update'),
                'separator' => ' :: '
            );

            $specials = $this->model_shoputils_specials->getSpecials($this->request->get['specials_id']);
        }
        $this->data['heading_title'] = $this->document->title;

        if (isset($specials['customer_group_ids'])) {
            $specials['customer_group_ids'] = explode(',', $specials['customer_group_ids']);
        } else {
            $specials['customer_group_ids'] = array();
        }

        if (isset($specials['products'])) {
            $specials['products_array'] = explode(',', $specials['products']);
        } else {
            $specials['products'] = '';
            $specials['products_array'] = array();
        }

        if (isset($specials['manufacturers'])) {
            $specials['manufacturers_array'] = explode(',', $specials['manufacturers']);
        } else {
            $specials['manufacturers_array'] = array();
        }
        $this->load->model('catalog/manufacturer');

        $specials['manufacturers'] = $this->model_catalog_manufacturer->getManufacturers();

        if (isset($specials['categories'])) {
            $specials['categories_array'] = explode(',', $specials['categories']);
        } else {
            $specials['categories'] = '';
            $specials['categories_array'] = array();
        }

        $this->_setData(array(
            'categories_dialog' => $this->makeUrl('index.php?route=shoputils/categories_selector/index'),
            'products_dialog' => $this->makeUrl('index.php?route=shoputils/products_selector/index'),
            'products_table' => $this->makeUrl('index.php?route=shoputils/products_selector/table&field=products_input&selected={selected}'),
            'categories_table' => $this->makeUrl('index.php?route=shoputils/categories_selector/table&field=categories_input&selected={selected}'),
            'cancel' => $this->makeUrl('index.php?route=shoputils/specials/settings'),
            'entry_name',
            'entry_name_help',
            'entry_status',
            'entry_status_help',
            'entry_sort_order',
            'entry_sort_order_help',
            'entry_percent',
            'entry_percent_help',
            'entry_priority',
            'entry_priority_help',
            'entry_customer_group_ids',
            'entry_customer_group_ids_help',
            'entry_date_start',
            'entry_date_start_help',
            'entry_date_end',
            'entry_date_end_help',
            'entry_objects_type',
            'entry_objects_type_help',
            'entry_objects_categories',
            'entry_objects_categories_help',
            'entry_objects_products',
            'entry_objects_products_help',
            'entry_objects_manufacturers',
            'entry_objects_manufacturers_help',
            'column_objects_product_sku',
            'column_objects_product_name',
            'column_objects_product_price',
            'column_objects_category_name',
            'button_save',
            'button_cancel',
            'button_change',
            'text_enabled',
            'text_disabled',
            'text_no_categories',
            'text_no_products',
            'text_select_categories',
            'text_select_products',
        ));

        $this->_updateData(array(
            'name',
            'enabled',
            'percent',
            'sort_order',
            'priority',
            'customer_group_ids',
            'date_start',
            'date_end',
            'objects_type',
            'products',
            'categories',
            'manufacturers',
            'products_array',
            'categories_array',
            'manufacturers_array',
        ), $specials);

        $this->load->model('sale/customer_group');

        $this->data['customer_groups'] = $this->model_sale_customer_group->getCustomerGroups();

        $this->template = 'shoputils/specials_form.tpl';
        $this->children = array(
            'common/header',
            'common/footer'
        );
        $this->response->setOutput($this->render(TRUE), $this->config->get('config_compression'));
    }

    public function insert() {
        $this->data['text_error'] = '';

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
            $this->model_shoputils_specials->addSpecials($this->request->post);

            $this->session->data['success'] = $this->language->get('text_success_insert');

            $this->redirect($this->makeUrl('index.php?route=shoputils/specials/settings'));
        }

        $this->getForm();
    }

    public function delete() {
        if (isset($this->request->post['selected']) && $this->validateDelete()) {
            foreach ($this->request->post['selected'] as $specials_id) {
                $this->model_shoputils_specials->deleteSpecials($specials_id);
            }

            $this->session->data['success'] = $this->language->get('text_success_delete');

            $this->redirect($this->makeUrl('index.php?route=shoputils/specials/settings'));
        }

        $this->getList();
    }

    public function update() {
        $this->data['text_error'] = '';

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
            $this->model_shoputils_specials->editSpecials($this->request->get['specials_id'], $this->request->post);

            $this->session->data['success'] = $this->language->get('text_success_update');

            $this->redirect($this->makeUrl('index.php?route=shoputils/specials/settings'));
        }

        $this->getForm();
    }

    function apply() {
        if ($this->validateApply()){
            $this->session->data['success'] = sprintf(
                $this->language->get('text_success_apply'),
                $this->model_shoputils_specials->applySpecials()
            );
        }
        $this->getList();
    }

    private function validateForm() {
        if (!$this->user->hasPermission('modify', 'shoputils/specials')) {
            $this->data['text_error'] = $this->language->get('error_permission');
            return false;
        } elseif (trim($this->request->post['name']) == '') {
            $this->data['text_error'] = $this->language->get('error_name');
            return false;
        }
        return true;
    }

    private function validateDelete() {
        if (!$this->user->hasPermission('modify', 'shoputils/specials')) {
            $this->data['text_error'] = $this->language->get('error_permission');
            return false;
        }
        return true;
    }

    private function validateApply() {
        if (!$this->user->hasPermission('modify', 'shoputils/specials')) {
            $this->data['text_error'] = $this->language->get('error_permission');
            return false;
        }
        return true;
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

    private function _setData($keys) {
        foreach ($keys as $key => $value) {
            if (is_int($key)) {
                $this->data[$value] = $this->language->get($value);
            } else {
                $this->data[$key] = $value;
            }
        }
    }

    private function getObjectTypeText($object_type_id) {
        switch ((int) $object_type_id) {
            case 0:
                return $this->language->get('entry_objects_categories');
            case 1:
                return $this->language->get('entry_objects_products');
            case 2:
                return $this->language->get('entry_objects_manufacturers');
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