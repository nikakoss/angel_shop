<?php
class ControllerPaymentPayanyway extends Controller {
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
		$this->data['paymentSystemUnitId'] = 0;
		$this->data['mnt_success_url'] = $this->url->link('payment/payanyway/success');
		$this->data['mnt_fail_url'] = $this->url->link('checkout/checkout', '', 'SSL');

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/payment/payanyway.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/payment/payanyway.tpl';
		} else {
			$this->template = 'default/template/payment/payanyway.tpl';
		}

		$this->render();
	}


	public function callback() {
        if(isset($_REQUEST['MNT_ID']) && isset($_REQUEST['MNT_TRANSACTION_ID']) && isset($_REQUEST['MNT_OPERATION_ID'])
           && isset($_REQUEST['MNT_AMOUNT']) && isset($_REQUEST['MNT_CURRENCY_CODE']) && isset($_REQUEST['MNT_TEST_MODE'])
           && isset($_REQUEST['MNT_SIGNATURE']))
        {
            $mnt_dataintegrity_code = $this->config->get('payanyway_mnt_dataintegrity_code');
            $MNT_SIGNATURE = md5("{$_REQUEST['MNT_ID']}{$_REQUEST['MNT_TRANSACTION_ID']}{$_REQUEST['MNT_OPERATION_ID']}{$_REQUEST['MNT_AMOUNT']}{$_REQUEST['MNT_CURRENCY_CODE']}{$_REQUEST['MNT_TEST_MODE']}".$mnt_dataintegrity_code);

            if ($_REQUEST['MNT_SIGNATURE'] == $MNT_SIGNATURE) {
                $order_id = $_REQUEST['MNT_TRANSACTION_ID'];
                $this->load->model('checkout/order');
                $order_info = $this->model_checkout_order->getOrder($order_id);
                if ($order_info){
                    $message = "MNT_ID = {$_REQUEST['MNT_ID']}; ";
                    $message .= "MNT_TRANSACTION_ID = {$_REQUEST['MNT_TRANSACTION_ID']}; ";
                    $message .= "MNT_OPERATION_ID = {$_REQUEST['MNT_OPERATION_ID']}; ";
                    $message .= "MNT_AMOUNT = {$_REQUEST['MNT_AMOUNT']}; ";
                    $message .= "MNT_CURRENCY_CODE = {$_REQUEST['MNT_CURRENCY_CODE']}; ";
                    $message .= "MNT_TEST_MODE = {$_REQUEST['MNT_TEST_MODE']}; ";
                    $message .= "MNT_SIGNATURE = {$_REQUEST['MNT_SIGNATURE']}; ";
                    if (!$order_info['order_status_id']) {
                        $this->model_checkout_order->confirm($order_id, $this->config->get('payanyway_payed_order_status_id'), 'Payment complete');
                    } else {
                        $this->model_checkout_order->update($order_id, $this->config->get('payanyway_payed_order_status_id'), 'Payment complete', true);
                    }
                    echo 'SUCCESS';
                } else {
                    echo 'FAIL';
                }
            } else {
                echo 'FAIL';
            }
        } else {
            echo 'FAIL';
        }
	}
    
    public function success()
    {
        $this->load->model('checkout/order');
        /* set pending status if not payed yet order will be confirmed otherway confirm will do nothing */
        $status = $this->config->get('payanyway_order_status_id');
        $this->model_checkout_order->confirm($_REQUEST['MNT_TRANSACTION_ID'], $status, 'Order confirmed');
        $this->redirect($this->url->link('checkout/success'));
    }
    
    public function check()
    {
        $this->load->model('checkout/order');
        $mnt_dataintegrity_code = $this->config->get('payanyway_mnt_dataintegrity_code');
        $result_code = 500;
        
        $mnt_command        = isset($this->request->get['MNT_COMMAND']) ? $this->request->get['MNT_COMMAND'] : '';
        $mnt_id             = isset($this->request->get['MNT_ID']) ? $this->request->get['MNT_ID'] : '';
        $mnt_transaction_id = isset($this->request->get['MNT_TRANSACTION_ID']) ? $this->request->get['MNT_TRANSACTION_ID'] : '';
        $mnt_operation_id   = isset($this->request->get['MNT_OPERATION_ID']) ? $this->request->get['MNT_OPERATION_ID'] : '';
        $mnt_amount         = isset($this->request->get['MNT_AMOUNT']) ? $this->request->get['MNT_AMOUNT'] : '';
        $mnt_currency_code  = isset($this->request->get['MNT_CURRENCY_CODE']) ? $this->request->get['MNT_CURRENCY_CODE'] : '';
        $mnt_test_mode      = isset($this->request->get['MNT_TEST_MODE']) ? $this->request->get['MNT_TEST_MODE'] : '';
        $signature          = md5($mnt_command.$mnt_id.$mnt_transaction_id.$mnt_operation_id.$mnt_amount.$mnt_currency_code.$mnt_test_mode.$mnt_dataintegrity_code);
        
        $order = $this->model_checkout_order->getOrder($mnt_transaction_id);
        if (!$order || $order['order_status_id'] !== '0') {
            /* order does not exist or its already confirmed with some non zero status*/
            $result_code = 500;
        }
        if ($order['order_status_id'] == $this->config->get('payanyway_order_status_id') || $order['order_status_id'] == '0') {
            /* order is ready and waiting for payment */
            $result_code = 402;
        }
        if ($order['order_status_id'] == $this->config->get('payanyway_payed_order_status_id')) {
            /* order is already payed */
            $result_code = 200;
        }
        
        $signature = md5($result_code.$mnt_id.$mnt_transaction_id.$mnt_dataintegrity_code);
        $amount = $this->currency->format($order['total'], $order['currency_code'], $order['currency_value'], false);
		$amount = number_format($amount, 2, '.', '');
        
        header("Content-type: application/xml");
        echo "<?xml version=\"1.0\" encoding=\"UTF-8\"?>";
        echo "<MNT_RESPONSE>";
        echo "<MNT_ID>".$mnt_id."</MNT_ID>";
        echo "<MNT_TRANSACTION_ID>".$mnt_transaction_id."</MNT_TRANSACTION_ID>";
        echo "<MNT_RESULT_CODE>".$result_code."</MNT_RESULT_CODE>";
        echo "<MNT_AMOUNT>".$amount."</MNT_AMOUNT>";
        echo "<MNT_SIGNATURE>".$signature."</MNT_SIGNATURE>";
        echo "</MNT_RESPONSE>";
    }

    public function invoice()
    {
		$payment_method = $this->session->data['payment_method']['code'];
		$this->load->language("payment/{$payment_method}");
		$this->load->language('checkout/success');
        $this->load->model('checkout/order');

//		if (isset($this->session->data['order_id'])) {
//			$this->cart->clear();
//
//			unset($this->session->data['shipping_method']);
//			unset($this->session->data['shipping_methods']);
//			unset($this->session->data['payment_method']);
//			unset($this->session->data['payment_methods']);
//			unset($this->session->data['guest']);
//			unset($this->session->data['comment']);
//			unset($this->session->data['order_id']);
//			unset($this->session->data['coupon']);
//			unset($this->session->data['voucher']);
//			unset($this->session->data['vouchers']);
//		}

		$this->data['breadcrumbs'] = array();

      	$this->data['breadcrumbs'][] = array(
        	'href'      => $this->url->link('common/home'),
        	'text'      => $this->language->get('text_home'),
        	'separator' => false
      	);

      	$this->data['breadcrumbs'][] = array(
        	'href'      => $this->url->link('checkout/cart'),
        	'text'      => $this->language->get('text_basket'),
        	'separator' => $this->language->get('text_separator')
      	);

		$this->data['breadcrumbs'][] = array(
			'href'      => $this->url->link('checkout/checkout', '', 'SSL'),
			'text'      => $this->language->get('text_checkout'),
			'separator' => $this->language->get('text_separator')
		);

      	$this->data['breadcrumbs'][] = array(
        	'text'      => $this->language->get('text_error'),
        	'separator' => $this->language->get('text_separator')
      	);

        require_once (DIR_SYSTEM . 'library/MonetaAPI/MonetaWebService.php');
        $login = $this->config->get('payanyway_username');
        $password = $this->config->get('payanyway_password');
        switch ($this->config->get('payanyway_mnt_server'))
        {
            case "demo.moneta.ru":
                $service = new MonetaWebService("https://demo.moneta.ru/services.wsdl", $login, $password);
                break;
            case "www.payanyway.ru":
                $service = new MonetaWebService("https://www.moneta.ru/services.wsdl", $login, $password);
                break;
        }

        try
        {
			$totalAmount = $_REQUEST['MNT_AMOUNT']." ".$_REQUEST['MNT_CURRENCY_CODE'];
			$fee = "-";
			
			if ($_REQUEST['paymentSystem_accountId']) {
				$transactionRequestType = new MonetaForecastTransactionRequest();
				$transactionRequestType->payer = $_REQUEST['paymentSystem_accountId'];
				$transactionRequestType->payee = $_REQUEST['MNT_ID'];
				$transactionRequestType->amount = $_REQUEST['MNT_AMOUNT'];
				$transactionRequestType->clientTransaction = $_REQUEST['MNT_TRANSACTION_ID'];
				$forecast = $service->ForecastTransaction($transactionRequestType);

				$totalAmount = number_format($forecast->payerAmount,2,'.','')." ".$forecast->payerCurrency;
				$fee = number_format($forecast->payerFee,2,'.','')." ".$forecast->payerCurrency;
			}
			
            $request = new MonetaInvoiceRequest();
			if ($_REQUEST['paymentSystem_accountId'])
				$request->payer = $_REQUEST['paymentSystem_accountId'];
            $request->payee = $_REQUEST['MNT_ID'];
            $request->amount = $_REQUEST['MNT_AMOUNT'];
            $request->clientTransaction = $_REQUEST['MNT_TRANSACTION_ID'];
			if ($payment_method == 'payanyway_post')
			{
				$operationInfo = new MonetaOperationInfo();
				$a = new MonetaKeyValueAttribute();
				$a->key = 'mailofrussiaindex';
				$a->value = $_REQUEST['additionalParameters_mailofrussiaSenderIndex'];
				$operationInfo->addAttribute($a);
				$a1 = new MonetaKeyValueAttribute();
				$a1->key = 'mailofrussiaregion';
				$a1->value = $_REQUEST['additionalParameters_mailofrussiaSenderRegion'];
				$operationInfo->addAttribute($a1);
				$a2 = new MonetaKeyValueAttribute();
				$a2->key = 'mailofrussiaaddress';
				$a2->value = $_REQUEST['additionalParameters_mailofrussiaSenderAddress'];
				$operationInfo->addAttribute($a2);
				$a3 = new MonetaKeyValueAttribute();
				$a3->key = 'mailofrussianame';
				$a3->value = $_REQUEST['additionalParameters_mailofrussiaSenderName'];
				$operationInfo->addAttribute($a3);
				$request->operationInfo = $operationInfo;
			}
			elseif ($payment_method == 'payanyway_euroset')
			{
				$operationInfo = new MonetaOperationInfo();
				$a1 = new MonetaKeyValueAttribute();
				$a1->key = 'rapidamphone';
				$a1->value = $_REQUEST['additionalParameters_rapidaPhone'];
				$operationInfo->addAttribute($a1);
				$request->operationInfo = $operationInfo;
			}

            $response = $service->Invoice($request);
			if ($payment_method == 'payanyway_euroset')
			{
				$response1 = $service->GetOperationDetailsById($response->transaction);
				foreach ($response1->operation->attribute as $attr)
				{
					if ($attr->key == 'rapidatid')
					{
						$transaction_id = $attr->value;
					}
				}
			}
			else
			{
				$transaction_id = $response->transaction;
			}

            $this->document->setTitle($this->language->get('invoice_title_created'));
            $this->data['heading_title'] = $this->language->get('invoice_title_created');
			
			$this->data['text_message'] = $this->language->get('invoice_created');
			$this->data['invoice'] = array( 'status' => $response->status,
											'system' => $payment_method,
											'unitid' => $_REQUEST['paymentSystem_unitId'],
											'payment_url' => $this->config->get('payanyway_mnt_server'),
											'transaction' => str_pad($transaction_id, 10, "0", STR_PAD_LEFT),
											'amount' => $_REQUEST['MNT_AMOUNT']." ".$_REQUEST['MNT_CURRENCY_CODE'],
											'fee' => $fee,
											'payerAmount' => $totalAmount
					);
            $status = $this->config->get('payanyway_order_status_id');
            $this->model_checkout_order->confirm($_REQUEST['MNT_TRANSACTION_ID'], $status, 'Order confirmed');
        }
        catch (Exception $e)
        {
            $this->document->setTitle($this->language->get('invoice_title_error'));
            $this->data['heading_title'] = $this->language->get('invoice_title_error');
			$this->data['invoice'] = array( 'status' => 'FAILED',
											'error_message' => $e->getMessage());
        }

    	$this->data['button_continue'] = $this->language->get('button_continue');
    	$this->data['continue'] = $this->url->link('common/home');
		$this->children = array(
			'common/column_left',
			'common/column_right',
			'common/content_top',
			'common/content_bottom',
			'common/footer',
			'common/header'
		);
        $this->template = 'default/template/payment/payanyway_invoice.tpl';
        $this->response->setOutput($this->render());
    }

}
?>