<?php
class ControllerPaymentPayanywayPsb extends Controller {
	protected function index() {
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

		$this->data['action'] = "https://{$this->config->get('payanyway_mnt_server')}/assistant.htm";
		$this->data['mnt_id'] = $mnt_id;
		$this->data['order_id'] = $order_id;
		$this->data['currency'] = $currency;
		$this->data['amount'] = $amount;
		$this->data['mnt_signature'] = $signature;
		$this->data['mnt_test_mode'] = $mnt_test_mode;
		$this->data['paymentSystemUnitId'] = 661709;
		$this->data['mnt_success_url'] = $this->url->link('payment/payanyway/success');
		$this->data['mnt_fail_url'] = $this->url->link('checkout/checkout', '', 'SSL');

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/payment/payanyway_psb.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/payment/payanyway_psb.tpl';
		} else {
			$this->template = 'default/template/payment/payanyway_psb.tpl';
		}	
		
		$this->render();
	}
	
}
?>