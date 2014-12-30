<?php
class ControllerTotalSalesPromotion extends Controller {
	private $error = array(); 
	 
	public function index() { 
		$this->load->language('total/sales_promotion');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('setting/setting');
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && ($this->validate())) {
			$this->model_setting_setting->editSetting('sales_promotion', $this->request->post);
		
			$this->session->data['success'] = $this->language->get('text_success');
			
			$this->redirect($this->url->link('extension/total', 'token=' . $this->session->data['token'], 'SSL'));
		}
		
		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['text_enabled'] = $this->language->get('text_enabled');
		$this->data['text_disabled'] = $this->language->get('text_disabled');
		
		$this->data['text_yes'] = $this->language->get('text_yes');
    	$this->data['text_no'] = $this->language->get('text_no');
		
		$this->data['entry_status'] = $this->language->get('entry_status');
		$this->data['entry_multiple'] = $this->language->get('entry_multiple');
		$this->data['entry_product_display'] = $this->language->get('entry_product_display');
		$this->data['entry_cart_display'] = $this->language->get('entry_cart_display');
		$this->data['entry_sort_order'] = $this->language->get('entry_sort_order');
					
		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_cancel'] = $this->language->get('button_cancel');

 		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}

   		$this->data['breadcrumbs'] = array();

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => false
   		);

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_total'),
			'href'      => $this->url->link('extension/total', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('total/sales_promotion', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
		$this->data['action'] = $this->url->link('total/sales_promotion', 'token=' . $this->session->data['token'], 'SSL');
		
		$this->data['cancel'] = $this->url->link('extension/total', 'token=' . $this->session->data['token'], 'SSL');

		if (isset($this->request->post['sales_promotion_status'])) {
			$this->data['sales_promotion_status'] = $this->request->post['sales_promotion_status'];
		} else {
			$this->data['sales_promotion_status'] = $this->config->get('sales_promotion_status');
		}
		
		if (isset($this->request->post['sales_promotion_multiple'])) {
			$this->data['sales_promotion_multiple'] = $this->request->post['sales_promotion_multiple'];
		} else {
			$this->data['sales_promotion_multiple'] = $this->config->get('sales_promotion_multiple');
		}
		
		if (isset($this->request->post['sales_promotion_cart_display'])) {
			$this->data['sales_promotion_cart_display'] = $this->request->post['sales_promotion_cart_display'];
		} else {
			$this->data['sales_promotion_cart_display'] = $this->config->get('sales_promotion_cart_display');
		}
		
		if (isset($this->request->post['sales_promotion_product_display'])) {
			$this->data['sales_promotion_product_display'] = $this->request->post['sales_promotion_product_display'];
		} else {
			$this->data['sales_promotion_product_display'] = $this->config->get('sales_promotion_product_display');
		} 

		if (isset($this->request->post['sales_promotion_sort_order'])) {
			$this->data['sales_promotion_sort_order'] = $this->request->post['sales_promotion_sort_order'];
		} else {
			$this->data['sales_promotion_sort_order'] = $this->config->get('sales_promotion_sort_order');
		} 

		$this->template = 'total/sales_promotion.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
				
		$this->response->setOutput($this->render());
	}

	private function validate() {
		if (!$this->user->hasPermission('modify', 'total/sales_promotion')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		if (!$this->error) {
			return true;
		} else {
			return false;
		}	
	}
}
?>