<?php
class ControllerPaymentPayanywayQiwi extends Controller {
	protected function index() {
		$this->load->language('payment/payanyway_qiwi');
		
    	$this->data['button_confirm'] = $this->language->get('button_confirm');

		$this->data['continue'] = $this->url->link('checkout/success');

		$this->load->model('checkout/order');
		$order_info = $this->model_checkout_order->getOrder($this->session->data['order_id']);

        $mnt_id = $this->config->get('payanyway_mnt_id');
        $order_id = $this->session->data['order_id'];
        $currency = $this->config->get('payanyway_mnt_currency_code');
        $mnt_test_mode = $this->config->get('payanyway_mnt_test_mode');
        $mnt_dataintegrity_code = $this->config->get('payanyway_mnt_dataintegrity_code');
		
        $amount = $this->currency->format($order_info['total'], $currency, '', false);
		$amount = number_format($amount, 2, '.', '');
        $signature = md5("{$mnt_id}{$order_id}{$amount}{$currency}{$mnt_test_mode}{$mnt_dataintegrity_code}");

		$this->data['action'] = $this->url->link('payment/payanyway/invoice');
		$this->data['mnt_id'] = $mnt_id;
		$this->data['order_id'] = $order_id;
		$this->data['currency'] = $currency;
		$this->data['amount'] = $amount;
		$this->data['mnt_signature'] = $signature;
		$this->data['mnt_test_mode'] = $mnt_test_mode;
		$this->data['paymentSystemUnitId'] = 822360;
		$this->data['mnt_success_url'] = $this->url->link('payment/payanyway/success');
		$this->data['mnt_fail_url'] = $this->url->link('checkout/checkout', '', 'SSL');

		$this->data['entry_additionalParameters'] = $this->language->get('entry_additionalParameters');
		$this->data['entry_qiwiUser'] = $this->language->get('entry_qiwiUser');
		$this->data['entry_qiwiComment'] = $this->language->get('entry_qiwiComment');
		$this->data['entry_qiwiUserHelp'] = $this->language->get('entry_qiwiUserHelp');
		$this->data['entry_qiwiUserError'] = $this->language->get('entry_qiwiUserError');
		

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/payment/payanyway_qiwi.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/payment/payanyway_qiwi.tpl';
		} else {
			$this->template = 'default/template/payment/payanyway_qiwi.tpl';
		}	
		
		$this->render();
	}
}
?>