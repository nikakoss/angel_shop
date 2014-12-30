<?php
class ModelTotalSalesPromotion extends Model {
	public function getTotal(&$total_data, &$total, &$taxes) {
	$this->load->language('total/sales_promotion');
			$this->load->model('checkout/sales_promotion');
			
			if(isset($this->session->data['sales_promotion_product'])){
				unset($this->session->data['sales_promotion_product']);
				}
			
			if ($this->customer->isLogged()) {
						$customer_group_id = $this->customer->getCustomerGroupId();
					} else {
						$customer_group_id = $this->config->get('config_customer_group_id');
			}
			
			$sales_promotion_info = $this->model_checkout_sales_promotion->getSalesPromotion();
							
				//if(isset($_COOKIE['logs'])){
				//echo "<pre>";
					//var_dump($sales_promotion_info);
					
					if(!$sales_promotion_info){
					
					
					$discount=0;
					foreach ($this->session->data['cart'] as $key => $quantity) {
						$product_id=$key;
						$product_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) WHERE p.product_id = '" . (int)$product_id . "' AND pd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND p.date_available <= NOW() AND p.status = '1'");
						
						$product_special_query = $this->db->query("SELECT price FROM " . DB_PREFIX . "product_special WHERE product_id = '" . (int)$product_id . "' AND customer_group_id = '" . (int)$customer_group_id . "' AND ((date_start = '0000-00-00' OR date_start < NOW()) AND (date_end = '0000-00-00' OR date_end > NOW())) ORDER BY priority ASC, price ASC LIMIT 1");
				
						if ($product_special_query->num_rows) {
							//$price = $product_query->row['price'] - (($product_query->row['price'] * 	$product_special_query->row['price']) / 100);
							$price = ($product_query->row['price'] * 	$product_special_query->row['price']) / 100;
							$discount+=$price*$quantity;
							
						}
		
					}
					
					if($discount>0){
					$total_data[] = array(
						'code'       => 1,
						'title'      => 'Скидка:',
						'text'       => '-'.$this->currency->format($discount),
						'value'      => $discount,
						'sort_order' => 4
						);
						}
					}
			//	echo "</pre>";	
				
				//}
				
				
			if ($sales_promotion_info) {
		
				foreach ($sales_promotion_info as $result) { 
				$discount_total = 0;
				$sp_discount = $result['discount'];
				$sp_quantity_total = $result['quantity_total'];
				$sp_quantity_sale = $result['quantity_sale'];
				$sp_quantity_buy = $result['quantity_buy'];
				$sp_base = $result['sp_base'];
				$sp_base_total = $result['sp_base_total'];
				$sp_base_quantity = $result['sp_base_quantity'];
				$sp_product = $result['sp_product'];
				$sp_product_total = $result['sp_product_total'];
				$sp_product_quantity = $result['sp_product_quantity'];
				$sp_product_buy = $result['sp_product_buy'];
				$sp_product_buy_total = $result['sp_product_buy_total'];
				$sp_product_buy_quantity = $result['sp_product_buy_quantity'];
				$sp_shipping = $result['shipping'];
				$sp_quantity_type = $result['quantity_type'];
				
				// Cart Products
				$sp_cart_product = $sp_base;
				$sp_cart_total = $sp_base_total;
				$sp_cart_quantity = $sp_base_quantity;		
								
				if($sp_quantity_buy && $sp_quantity_sale) {
				
					if($sp_product && $sp_product_buy) {
						if($sp_product == $sp_product_buy) {
							$discount_factor = floor($sp_product_quantity/($sp_quantity_sale+$sp_quantity_buy))*$sp_quantity_sale;	}
						else {
						$discount_factor = min(floor($sp_product_buy_quantity/$sp_quantity_buy), floor($sp_product_quantity/$sp_quantity_sale))*$sp_quantity_sale;	 }
					}
					
					else if($sp_product_buy){
						if($sp_product_buy == $sp_cart_product) {
							$discount_factor = floor($sp_product_buy_quantity/($sp_quantity_buy+$sp_quantity_sale))*$sp_quantity_sale;	}
						else {
							$discount_factor = min(floor($sp_product_buy_quantity/$sp_quantity_buy), floor(($sp_cart_quantity)/($sp_quantity_sale+$sp_quantity_buy)))*$sp_quantity_sale;
						}
					}
					
					else if($sp_product) {
						$discount_factor = min(floor($sp_product_quantity/$sp_quantity_sale), floor(($sp_cart_quantity)/($sp_quantity_buy+$sp_quantity_sale)))*$sp_quantity_sale;	
						}
					
					else {
						$discount_factor = ((floor($sp_cart_quantity/($sp_quantity_buy+$sp_quantity_sale)))*$sp_quantity_sale);
						}
					
					// Discount Multiplier 
					if($sp_quantity_type == 'F') {
						$discount_factor = $sp_quantity_sale;
						}	
					}
				
				else if($sp_product && (!$sp_quantity_sale)) {
					$discount_factor = $sp_product_quantity;
					}
				
				else if($sp_quantity_sale) {
					$discount_factor = $sp_quantity_sale;
					}
				
				else {
					$discount_factor = $sp_cart_quantity;
					}
								
				// Condition for Products On Sale
				if($sp_product) {
					$sp_discount_product = $sp_product;
					}
				else {
					$sp_discount_product = $sp_base;
					}
				
				$sp_product_discount_detail = array();
				if ($result['type'] == 'F') {
					$sp_product_discount_detail = false;
					if($sp_quantity_buy || $sp_quantity_sale) {
						$discount_total = $sp_discount*$discount_factor;
						}
					else {
						$discount_total = $sp_discount;
						}
					}
				else {
					if($sp_quantity_sale || $sp_product || $sp_quantity_buy || $sp_product_buy) {
						asort($sp_discount_product['price']);
						foreach ($sp_discount_product['price'] as $key => $val) {
							if($discount_factor>0) {
								if($discount_factor >= $sp_discount_product['quantity'][$key]) {
									$current_discount = (($sp_discount_product['total'][$key]*($sp_discount))/100);
									$discount_total += $current_discount;
									$sp_product_discount_detail[] = array('product_key'=>$sp_discount_product['product_key'][$key],'product_id'=>$sp_discount_product['product_id'][$key],'discount'=>$current_discount);
									$discount_factor -= $sp_discount_product['quantity'][$key];
									}	
								else{
									$current_discount =(((($sp_discount_product['price'][$key])*($discount_factor))*($sp_discount))/100);
									$discount_total += $current_discount;
									$sp_product_discount_detail[] = array('product_key'=>$sp_discount_product['product_key'][$key],'product_id'=>$sp_discount_product['product_id'][$key],'discount'=>$current_discount);
									$discount_factor -= $sp_discount_product['quantity'][$key];
									}
								}
							}
						}
					else {
						$sub_total = $sp_cart_total;
						$discount_total = ((($sub_total)*($sp_discount))/100);
						foreach ($sp_discount_product['price'] as $key => $val) {
							$current_discount = ((($sp_discount_product['total'][$key])*($sp_discount))/100);
							$sp_product_discount_detail[] = array('product_key'=>$sp_discount_product['product_key'][$key],'product_id'=>$sp_discount_product['product_id'][$key],'discount'=>$current_discount);
							}
						}
					}
				
				$total_promotion_sales_data[$result['sales_promotion_id']] = array(
					'code'       			   => 'sales_promotion',
					'sales_promotion_id'       => $result['sales_promotion_id'],
        			'title'                    => sprintf($this->language->get('text_sales_promotion'), $result['name']),
	    			'name'                     => $result['name'],
					'product_discount_detail'  => $sp_product_discount_detail,
					'value'                    => $discount_total,
					'shipping'                 => $result['shipping'],
					'product_option'           => $result['product_option'],
					'sort_order'               => $this->config->get('sales_promotion_sort_order')
					);
			}
	
			
	foreach ($total_promotion_sales_data as $key => $row) {
		$value[$key]  = $row['value'];
		}
	array_multisort($value, SORT_DESC, $total_promotion_sales_data);		
	
	$cartproducts = $this->cart->getProducts();
	
	if($this->config->get('sales_promotion_multiple') == 1) {
				
	// Multiple Promotions
		foreach ($total_promotion_sales_data as $key => $row) {
			$row_value = $row['value'];
			if($total >= $row_value) {		
				if($row['product_discount_detail']) {
					foreach ($row['product_discount_detail'] as $product_discount_detail) {
						if(!isset($sp_product_discount_sum[$product_discount_detail['product_key']])) {
							$sp_product_discount_sum[$product_discount_detail['product_key']]=0;
							}
						if(!isset($sp_product_promotion_sum[$row['sales_promotion_id']][$product_discount_detail['product_key']])) {
							$sp_product_promotion_sum[$row['sales_promotion_id']][$product_discount_detail['product_key']]=0;
							}
						$sp_product_discount_sum[$product_discount_detail['product_key']] += $product_discount_detail['discount'];
						$sp_product_promotion_sum[$row['sales_promotion_id']][$product_discount_detail['product_key']] +=$product_discount_detail['discount'];
						
						foreach ($cartproducts as $cartproduct) {
							if($cartproduct['key'] == $product_discount_detail['product_key']) {
								$cart_product_total = $cartproduct['total'];
								$cart_product_price = $cartproduct['price'];
								if(isset($cartproduct['tax_class_id'])) {
									$cart_product_tax_class_id = $cartproduct['tax_class_id'];
									}
								if (isset($row['product_option'])) {
									if(isset($cartproduct['option']) && $row['product_option']==0) {
										$option_price=0;
										foreach ($cartproduct['option'] as $option) {
											$option_price += $option['price'];	  	
											}
										$cart_product_price = $cartproduct['price']-$option_price;
										$cart_product_total = $cart_product_price*$cartproduct['quantity'];
										}	
									}
								}
							}
								
						if($sp_product_discount_sum[$product_discount_detail['product_key']] <= $cart_product_total) {	
							if(isset($cart_product_tax_class_id)) {	
								$product_tax_discount = 0;
								$product_fixed_tax_discount = 0;
								if(!isset($sp_fixed_tax_discount_factor[$product_discount_detail['product_key']])) {
									$sp_fixed_tax_discount_factor[$product_discount_detail['product_key']]=0;
									}
								$tax_rates = $this->tax->getRates($cart_product_total - ($cart_product_total - $sp_product_promotion_sum[$row['sales_promotion_id']][$product_discount_detail['product_key']]), $cart_product_tax_class_id);
								foreach ($tax_rates as $tax_rate) {
									if ($tax_rate['type'] == 'P') {
										$taxes[$tax_rate['tax_rate_id']] -= $tax_rate['amount'];
										$product_tax_discount += $tax_rate['amount'];
										}
									if (($tax_rate['type'] == 'F') && ($sp_product_discount_sum[$product_discount_detail['product_key']] >= $cart_product_price)) {
										if ($sp_product_promotion_sum[$row['sales_promotion_id']][$product_discount_detail['product_key']] >= $cart_product_price) {
											$tax_fixed_discount_factor = floor($sp_product_promotion_sum[$row['sales_promotion_id']][$product_discount_detail['product_key']]/$cart_product_price);
											$sp_fixed_tax_discount_factor[$product_discount_detail['product_key']] =+ $tax_fixed_discount_factor;
											$taxes[$tax_rate['tax_rate_id']] -= ($tax_rate['amount']*$tax_fixed_discount_factor);
											$product_fixed_tax_discount += ($tax_rate['amount']*$tax_fixed_discount_factor);	
											}
										else {
											$tax_fixed_discount_factor = floor($sp_product_discount_sum[$product_discount_detail['product_id']]/$cart_product_price)-$sp_fixed_tax_discount_factor[$product_discount_detail['product_key']];
											$sp_fixed_tax_discount_factor[$product_discount_detail['product_key']] =+ $tax_fixed_discount_factor;
											$taxes[$tax_rate['tax_rate_id']] -= ($tax_rate['amount']*$tax_fixed_discount_factor);
											$product_fixed_tax_discount += ($tax_rate['amount']*$tax_fixed_discount_factor);
											}
										}
									}
								
								if($this->config->get('config_tax')) {
									$product_discount_detail['discount'] += $product_tax_discount;
									$product_discount_detail['discount'] += $product_fixed_tax_discount;
									//$row_value += $product_tax_discount;
									//$row_value += $product_fixed_tax_discount;
									}
								}
							
							if($row['shipping'] && $row_value==0) {
								$sp_promotion_discount = array();
								}
							else {	
							$sp_product_discount[$product_discount_detail['product_key']][] = array('sales_promotion_id'=>$row['sales_promotion_id'], 'sales_promotion_name'=>$row['name'], 'discount'=>$product_discount_detail['discount'], 'discount_text'=>$this->currency->format(-$product_discount_detail['discount']));
							}
						}
						else {
							$sp_product_discount_sum[$product_discount_detail['product_key']] -= $product_discount_detail['discount'];
							$sp_product_promotion_sum[$row['sales_promotion_id']][$product_discount_detail['product_key']] -=$product_discount_detail['discount'];
							$row_value -= $product_discount_detail['discount'];
							}
						}
					}
				else {
					$sub_total = $this->cart->getSubTotal();
					if($sub_total>0) {
					$tax_discount_rate = $row_value/$sub_total;
					} else {
					$tax_discount_rate = 0;	
					}
					foreach ($cartproducts as $cart_product) {
						$tax_rates = $this->tax->getRates($cart_product['total'], $cart_product['tax_class_id']);
							foreach ($tax_rates as $tax_rate) {
								if ($tax_rate['type'] == 'P') {
									$taxes[$tax_rate['tax_rate_id']] -= ($tax_rate['amount']*$tax_discount_rate);
									}
								}
							}					
						}
						
												
				
				if(!isset($shipping_discounted)) {
					if ($row['shipping'] && isset($this->session->data['shipping_method'])) {
						if (!empty($this->session->data['shipping_method']['tax_class_id'])) {
							$tax_rates = $this->tax->getRates($this->session->data['shipping_method']['cost'], $this->session->data['shipping_method']['tax_class_id']);
							foreach ($tax_rates as $tax_rate) {
								$taxes[$tax_rate['tax_rate_id']] -= $tax_rate['amount'];
								}
							}
						$row_value += $this->session->data['shipping_method']['cost'];	
						$shipping_discounted = 1;
						}
					  }
				
				//
			//	if(isset($_COOKIE['logs'])){
				//echo "<pre>";
					//var_dump($sales_promotion_info);
					
					$discount=0;
					foreach ($this->session->data['cart'] as $key => $quantity) {
						$product_id=$key;
						$sales= $this->model_checkout_sales_promotion->getSalesPromotionProduct($product_id);
						if(!$sales){
						//var_dump($product_id);
							
							$product_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) WHERE p.product_id = '" . (int)$product_id . "' AND pd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND p.date_available <= NOW() AND p.status = '1'");
						
						$product_special_query = $this->db->query("SELECT price FROM " . DB_PREFIX . "product_special WHERE product_id = '" . (int)$product_id . "' AND customer_group_id = '" . (int)$customer_group_id . "' AND ((date_start = '0000-00-00' OR date_start < NOW()) AND (date_end = '0000-00-00' OR date_end > NOW())) ORDER BY priority ASC, price ASC LIMIT 1");
				
						if ($product_special_query->num_rows) {
							//$price = $product_query->row['price'] - (($product_query->row['price'] * 	$product_special_query->row['price']) / 100);
							$price = ($product_query->row['price'] * 	$product_special_query->row['price']) / 100;
							$discount+=$price*$quantity;
							
						}
							
						}
						
					}
					//var_dump($discount);
				//}	
				//
				
				if($row_value > 0 & ($total >= $row_value)) {		
					$total_data[] = array(
						'code'       => $row['code'],
						'title'      => 'Скидка:',
						'text'       => "-".$this->currency->format($row_value+$discount),
						'value'      => $row_value,
						'sort_order' => $row['sort_order']
						);
						
					$total -= $row_value;
					if(isset($sp_product_discount)) {
						$this->session->data['sales_promotion_product'] = $sp_product_discount;
						}
					}
				}
				}
						
			}
		else {
		
		// Single Promotion
		$row_value = $total_promotion_sales_data[0]['value'];
		if($total >= $row_value) {	
			if($total_promotion_sales_data[0]['product_discount_detail']) {
					foreach ($total_promotion_sales_data[0]['product_discount_detail'] as $product_discount_detail) {
						if(isset($cartproducts[$product_discount_detail['product_key']]['tax_class_id'])) {	
							$product_tax_discount = 0;
							$product_fixed_tax_discount = 0;
							$tax_rates = $this->tax->getRates($cartproducts[$product_discount_detail['product_key']]['total'] - ($cartproducts[$product_discount_detail['product_key']]['total'] - $product_discount_detail['discount']), $cartproducts[$product_discount_detail['product_key']]['tax_class_id']);
							foreach ($tax_rates as $tax_rate) {
								if ($tax_rate['type'] == 'P') {
									$taxes[$tax_rate['tax_rate_id']] -= $tax_rate['amount'];
									$product_tax_discount += $tax_rate['amount'];
									}
								if (($tax_rate['type'] == 'F') && ($product_discount_detail['discount'] >= $cartproducts[$product_discount_detail['product_key']]['price'])) {												
									$tax_fixed_discount_factor = floor($product_discount_detail['discount']/$cartproducts[$product_discount_detail['product_key']]['price']);
									$taxes[$tax_rate['tax_rate_id']] -= ($tax_rate['amount']*$tax_fixed_discount_factor);
									$product_fixed_tax_discount += ($tax_rate['amount']*$tax_fixed_discount_factor);
									}
								}
							if($this->config->get('config_tax')) {
								$product_discount_detail['discount'] += $product_tax_discount;
								$product_discount_detail['discount'] += $product_fixed_tax_discount;
								}
							}
						
						if($total_promotion_sales_data[0]['shipping'] && $row_value==0) {
								$sp_promotion_discount = array();
								}
							else {	
						$sp_product_discount[$product_discount_detail['product_key']][] = array('sales_promotion_id'=>$total_promotion_sales_data[0]['sales_promotion_id'], 'sales_promotion_name'=>$total_promotion_sales_data[0]['name'], 'discount'=>$product_discount_detail['discount'], 'discount_text'=>$this->currency->format(-$product_discount_detail['discount']));						}
						}
					}	
				else {
					$sub_total = $this->cart->getSubTotal();
					if($sub_total>0) {
					$tax_discount_rate = $row_value/$sub_total;
					} else {
					$tax_discount_rate = 0;	
					}
					foreach ($cartproducts as $cart_product) {
						$tax_rates = $this->tax->getRates($cart_product['total'], $cart_product['tax_class_id']);
							foreach ($tax_rates as $tax_rate) {
								if ($tax_rate['type'] == 'P') {
									$taxes[$tax_rate['tax_rate_id']] -= ($tax_rate['amount']*$tax_discount_rate);
									}
								}
							}					
						}
			
				if ($total_promotion_sales_data[0]['shipping'] && isset($this->session->data['shipping_method'])) {
					if (!empty($this->session->data['shipping_method']['tax_class_id'])) {
						$tax_rates = $this->tax->getRates($this->session->data['shipping_method']['cost'], $this->session->data['shipping_method']['tax_class_id']);
						foreach ($tax_rates as $tax_rate) {
							$taxes[$tax_rate['tax_rate_id']] -= $tax_rate['amount'];
							}
						}
					$row_value += $this->session->data['shipping_method']['cost'];	
					}
					
				if($row_value > 0 & ($total >= $row_value)) {	
					$total_data[] = array(
						'code'       => $total_promotion_sales_data[0]['code'],
						'title'      => $total_promotion_sales_data[0]['title'],
						'text'       => $this->currency->format(-$row_value),
						'value'      => $row_value,
						'sort_order' => $total_promotion_sales_data[0]['sort_order']
						);
					$total -= $row_value;		
					
					if(isset($sp_product_discount)) {
						$this->session->data['sales_promotion_product'] = $sp_product_discount;
						}
					}
				}
			}
		}	
	} 
	
		
	public function confirm($order_info, $order_total) {
		$code = '';
		
		$start = strpos($order_total['title'], '(') + 1;
		$end = strrpos($order_total['title'], ')');
		
		if ($start && $end) {  
			$code = substr($order_total['title'], $start, $end - $start);
		}	
		
		$this->load->model('checkout/sales_promotion');
		
		$sales_promotion_id = $this->model_checkout_sales_promotion->getSalesPromotionId($code);
		
		if ($sales_promotion_id) {
			$this->model_checkout_sales_promotion->redeem($sales_promotion_id, $order_info['order_id'], $order_info['customer_id'], $order_total['value']);	
		    }						
	    }
		
}
?>
