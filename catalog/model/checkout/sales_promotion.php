<?php
class ModelCheckoutSalesPromotion extends Model {
	
	public function getSalesPromotion() {
			
		$sales_promotion_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "sales_promotion c WHERE ((c.date_start = '0000-00-00' OR c.date_start < NOW()) AND (c.date_end = '0000-00-00' OR c.date_end > NOW())) AND c.status = '1'");
		
		//c2s.store_id = '" . (int)$this->config->get('config_store_id')
		
		if ($sales_promotion_query->num_rows) {
		foreach ($sales_promotion_query->rows as $sales_promotion_result) { 
			$status = true;
			
			$sales_promotion_options = unserialize($sales_promotion_result['options']);
		
			unset($sales_promotion_result['options']);
		
			$result = array_merge($sales_promotion_result, $sales_promotion_options);
			
			// Condition to display promotion when user logged in
			if ($result['logged'] && !$this->customer->getId()) {
				$status = false;
			}
			
			// Condition for store
			if(isset($result['store'])) {
			if (!(in_array((int)$this->config->get('config_store_id'), $result['store']))) {
				$status = false;
				}
			}
			
			// Condition For Customer Group
			if($this->customer->getId()) {	
				if(isset($result['customer_group'])) {
					if (!(in_array((int)$this->customer->getCustomerGroupId(), $result['customer_group']))) {
					$status = false;
					}
				}
			}
			
			// Condition For Currency
			if(isset($result['currency'])) {
			if (!(in_array((int)$this->currency->getId(), $result['currency']))) {
				$status = false;
				}
			}
						
			// Condition For Language
			if(isset($result['language'])) {
			if (!(in_array((int)$this->getLanguageId($this->session->data['language']), $result['language']))) {
				$status = false;
				}
			}
						
			// Condition For Day
			if(isset($result['day'])) {
			if (!(in_array(date("l"), $result['day']))) {
				$status = false;
				}
			}
					
			
			// Condition for total uses of promotion
			$sales_promotion_history_query = $this->db->query("SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "sales_promotion_history` ch WHERE ch.sales_promotion_id = '" . (int)$result['sales_promotion_id'] . "'");

				if ($result['uses_total'] > 0 && ($sales_promotion_history_query->row['total'] >= $result['uses_total'])) {
					$status = false;
				}
			
			// Condition for total uses of promotion per customer							
			if ($this->customer->getId()) {
				$sales_promotion_history_query = $this->db->query("SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "sales_promotion_history` ch WHERE ch.sales_promotion_id = '" . (int)$result['sales_promotion_id'] . "' AND ch.customer_id = '" . (int)$this->customer->getId() . "'");
				
				if ($result['uses_customer'] > 0 && ($sales_promotion_history_query->row['total'] >= $result['uses_customer'])) {
					$status = false;
				}
			}
			
			// Works With Coupon or Not
			if($result['coupon_combine'] == 0 && isset($this->session->data['coupon'])){
			$status = false;	
			}
			
			// Special Products
			$sp_special_product = array();
			if($result['special_combine'] == 0) {
			$sp_special_products = $this->getSalesPromotionProductSpecials();	
			foreach($sp_special_products as $key=>$value)
				{
                $sp_special_product[$key] = $value['product_id'];
				}
			 }
			
			// Discounted Products
			$sp_discount_product = array();
			if($result['discount_combine'] == 0) {
			$sp_discount_products = $this->getSalesPromotionProductDiscounts();	
			foreach($sp_discount_products as $key=>$value)
				{
                $sp_discount_product[$key] = $value['product_id'];
				}
			}
			
			$sp_base_quantity = 0;
			$sp_base_total = 0;
			$sp_product_quantity = 0;
			$sp_product_total = 0;
			$sp_product_buy_quantity = 0;
			$sp_product_buy_total = 0;
			
			unset($sp_base);
			unset($sp_product);
			unset($sp_product_buy);
									
			$sp=0;
			$sp_total=0;
			$sp_buy=0;
			$option_price=0;
			$sp_base = array();
			$sp_product = array();
			$sp_product_buy = array();
			
			foreach ($this->cart->getProducts() as $product) {
					
					// Condition For Special Products
					if($sp_special_product) {
						if (in_array($product['product_id'], $sp_special_product)) {
							continue;	
						}
					}
					
					// Condition For Discounted Products					
					if($sp_discount_product) {
						if (in_array($product['product_id'], $sp_discount_product)) {
							continue;	
						}
					}
															
					$base_quantity = $product['quantity'];
					$base_product_id = $product['product_id'];
					$base_total = $product['total'];
					$base_price = $product['price'];
					$base_tax_class_id = $product['tax_class_id'];
					$base_product_key = $product['key'];
					
					//Deduct Options Price From Discount 
					if($product['key']!=$product['product_id']) {
						if (isset($result['product_option'])) {
							if(isset($product['option']) && $result['product_option']==0) {
								foreach ($product['option'] as $option) {
									$option_price += $option['price'];	  	
									}
								$base_price = $product['price']-$option_price;
								$base_total = $base_price*$base_quantity;
							}
						}
					}
					
					$sp_base['quantity'][$sp] = $base_quantity;
					$sp_base['total'][$sp] = $base_total;
					$sp_base['price'][$sp] = $base_price;	
					$sp_base['tax_class_id'][$sp] = $base_tax_class_id;
					$sp_base['product_id'][$sp] = $base_product_id;
					$sp_base['product_key'][$sp] = $base_product_key;
					$sp_base_quantity += $base_quantity;
					$sp_base_total += $base_total;
					$sp++;
					
					if($result['product']) {
						// Selected Products in Cart		
						if (in_array($base_product_id, $result['product'])) {
								$sp_product['quantity'][$sp_total] = $base_quantity;
								$sp_product['total'][$sp_total] = $base_total;
								$sp_product['price'][$sp_total] = $base_price;
								$sp_product['tax_class_id'][$sp_total] = $base_tax_class_id;
								$sp_product['product_id'][$sp_total] = $base_product_id;
								$sp_product['product_key'][$sp_total] = $base_product_key;
								$sp_product_quantity += $base_quantity;
								$sp_product_total += $base_total;
								$sp_total++;
								}
							}
									
					if($result['product_buy']) {
						// Selected Buy Products in Cart		
						if (in_array($base_product_id, $result['product_buy'])) {
								$sp_product_buy['quantity'][$sp_buy] = $base_quantity;
								$sp_product_buy['total'][$sp_buy] = $base_total;
								$sp_product_buy['price'][$sp_buy] = $base_price;
								$sp_product_buy['tax_class_id'][$sp_buy] = $base_tax_class_id;
								$sp_product_buy['product_id'][$sp_buy] = $base_product_id;
								$sp_product_buy['product_key'][$sp_buy] = $base_product_key;
								$sp_product_buy_quantity += $base_quantity;
								$sp_product_buy_total += $base_total;
								$sp_buy++;
								}
							}			
					
				}
			
			
			// Condition for Total Amount
			$sp_total = $result['total'];
			$cart_subtotal = $sp_base_total;
		
			if(strpos($sp_total,"-") !== false) {
     			$sp_total_limit = explode("-", $sp_total);
    			if (($sp_total_limit[0] > $cart_subtotal) || ($sp_total_limit[1] <  $cart_subtotal)) {
				$status = false;
				}     
   			}
			else {
  				if ($sp_total >= $cart_subtotal) {
				$status = false;
       			}
			}	
			
			// Condition for Total Quantity
			$sp_quantity_total = $result['quantity_total'];
			$cart_quantity_total = $sp_base_quantity;
			
			if(strpos($sp_quantity_total,"-") !== false) {
     			$sp_quantity_total_limit = explode("-", $sp_quantity_total);
    			if (($sp_quantity_total_limit[0] > $cart_quantity_total) || ($sp_quantity_total_limit[1] <  $cart_quantity_total)) {
				$status = false;
				}     
   			}
			else {
  				if ($sp_quantity_total >= $cart_quantity_total) {
				$status = false;
       			}
			}	
			
			//Condition for Sale Quantity and Buy Quantity Without Selected Products
			if (($result['quantity_sale'] + $result['quantity_buy']) > ($cart_quantity_total)) {
					$status = false;
				}
			
			// Condition For Sale Quantity With Selected Products
			if ($result['product']) {
					if (($sp_product_quantity < $result['quantity_sale']) || ($sp_product_quantity < 1)) {
						$status = false;
					}	
				}
			
			// Condition For Buy Quantity With Selected Products
			if ($result['product_buy']) {
					if (($sp_product_buy_quantity < $result['quantity_buy']) || ($sp_product_buy_quantity < 1)) {
						$status = false;
					}	
				}
			
			//Condition for Buy Quantity and Sale Quantity With Selected Products
			if($result['product'] && $result['product_buy']) {
				if($sp_product == $sp_product_buy) {
					if($sp_product_quantity < ($result['quantity_buy']+$result['quantity_sale'])) {
						$status = false;	
						}
					}
					
				if (($sp_product_quantity + $sp_product_buy_quantity) < ($result['quantity_sale'] + $result['quantity_buy'])) {
					$status = false;
				}		
			}
			
			if($status == false)
			if($result['shipping'] && $result['discount']==0) {
			$status = true;	
			}
			
							
		if ($status) {
			 	$sales_promotion_data[] = array(
					'sales_promotion_id' 		=> $result['sales_promotion_id'],
					'code'           			=> $result['sales_promotion_id'],
					'name'           			=> $result['name'],
					'type'           			=> $result['type'],
					'quantity_type'           	=> $result['quantity_type'],
					'discount'       			=> $result['discount'],
					'total'          			=> $result['total'],
					'quantity_total' 			=> $result['quantity_total'],
					'quantity_sale'  			=> $result['quantity_sale'],
					'quantity_buy'   			=> $result['quantity_buy'],
					'quantity_type'  			=> $result['quantity_type'],
					'shipping'       			=> $result['shipping'],
					'product_option'			=> $result['product_option'],
					'sp_base'     				=> $sp_base,
					'sp_base_quantity'       	=> $sp_base_quantity,
					'sp_base_total'       	    => $sp_base_total,
					'sp_product'     			=> $sp_product,
					'sp_product_quantity'       => $sp_product_quantity,
					'sp_product_total'          => $sp_product_total,
					'sp_product_buy' 			=> $sp_product_buy,
					'sp_product_buy_quantity'   => $sp_product_buy_quantity,
					'sp_product_buy_total'      => $sp_product_buy_total,
					'date_start'     			=> $result['date_start'],
					'date_end'       			=> $result['date_end'],
					'uses_total'     			=> $result['uses_total'],
					'uses_customer'  			=> $result['uses_customer'],
					'status'         			=> $result['status'],
					'date_added'     			=> $result['date_added']
				);
			  } 
		}
		
		if(isset($sales_promotion_data)) {
			return $sales_promotion_data;
			}
		}
				
		
	}
	
	
	public function redeem($sales_promotion_id, $order_id, $customer_id, $amount) {
		$this->db->query("INSERT INTO `" . DB_PREFIX . "sales_promotion_history` SET sales_promotion_id = '" . (int)$sales_promotion_id . "', order_id = '" . (int)$order_id . "', customer_id = '" . (int)$customer_id . "', amount = '" . (float)$amount . "', date_added = NOW()");
	}
	
	public function getSalesPromotionId($code) {
	
		$sales_promotion_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "sales_promotion WHERE name = '" . $this->db->escape($code) . "' AND ((date_start = '0000-00-00' OR date_start < NOW()) AND (date_end = '0000-00-00' OR date_end > NOW())) AND status = '1'");
	
	    if ($sales_promotion_query->num_rows) {
			$sales_promotion_id = $sales_promotion_query->row['sales_promotion_id'];
			}
		return $sales_promotion_id;
		}
	
	public function getSalesPromotionName($sales_promotion_id) {
	
		$sales_promotion_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "sales_promotion c WHERE c.sales_promotion_id = '" . $sales_promotion_id . "' AND ((c.date_start = '0000-00-00' OR c.date_start < NOW()) AND c.status = '1' AND (c.date_end = '0000-00-00' OR c.date_end > NOW()))");
		
		if ($sales_promotion_query->num_rows) {
			$sales_promotion_options = unserialize($sales_promotion_query->row['options']);
			// Condition for store
			if ((in_array((int)$this->config->get('config_store_id'), $sales_promotion_options['store']))) {
				$sales_promotion_name = $sales_promotion_query->row['name'];	
			}
		} 
		else {
			$sales_promotion_name = ""; 
			}
		
		return $sales_promotion_name;
	
	}
	
	public function getSalesPromotionProducts($sales_promotion_id,$sales_promotion_product_setting) {
		$product_data = array();
		
		$sales_promotion_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "sales_promotion c WHERE c.sales_promotion_id = '" . $sales_promotion_id . "' AND ((c.date_start = '0000-00-00' OR c.date_start < NOW()) AND c.status = '1' AND (c.date_end = '0000-00-00' OR c.date_end > NOW()))");
	
		if ($sales_promotion_query->num_rows) {
			$sales_promotion_options = unserialize($sales_promotion_query->row['options']);
			
			if($sales_promotion_product_setting == 'product') {
				$sales_promotion_products = $sales_promotion_options['product'];	
			} else if($sales_promotion_product_setting == 'product_buy') {
				$sales_promotion_products = $sales_promotion_options['product_buy'];
			} else {
				$sales_promotion_products = array_merge($sales_promotion_options['product'],$sales_promotion_options['product_buy']);
				$sales_promotion_products = array_unique($sales_promotion_products);		
				}
		
			// Condition for store
			if ((in_array((int)$this->config->get('config_store_id'), $sales_promotion_options['store']))) {
				foreach ($sales_promotion_products as $product_id) { 
				$product_data[$product_id] = $this->model_catalog_product->getProduct($product_id);
				}
			} 
			
		}
		return $product_data;
	}
		
	public function getSalesPromotionProductDiscounts() {
		$query = $this->db->query("SELECT DISTINCT product_id FROM " . DB_PREFIX . "product_discount ORDER BY quantity, priority, price");
		return $query->rows;
		}
	
	public function getSalesPromotionProductSpecials() {
		$query = $this->db->query("SELECT DISTINCT product_id FROM " . DB_PREFIX . "product_special ORDER BY priority, price");
		return $query->rows;
		}
	
	public function getLanguageId($code) {
	
		$language_query = $this->db->query("SELECT language_id FROM " . DB_PREFIX . "language WHERE code = '" . $this->db->escape($code) . "' AND status = '1'");
	
	    if ($language_query->num_rows) {
			$language_id = $language_query->row['language_id'];
			}
		return $language_id;
		}
	
	
	public function getSalesPromotionProductDetails($product_id) {
		$sp_product_details = array();
		
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "sales_promotion c WHERE ((c.date_start = '0000-00-00' OR c.date_start < NOW()) AND c.status = '1' AND (c.date_end = '0000-00-00' OR c.date_end > NOW()))");
	
		foreach ($query->rows as $result) { 
			$sales_promotion_options = unserialize($result['options']);
			
			$sales_promotion_products = array_merge($sales_promotion_options['product'],$sales_promotion_options['product_buy']);	
			$sales_promotion_products  = array_unique($sales_promotion_products);					
			
			// Condition for store
			if ((in_array((int)$this->config->get('config_store_id'), $sales_promotion_options['store']))) {
				if ((in_array((int)$product_id, $sales_promotion_products))) {
				$sp_product_details[] = $result['name'];
				}
			} 
			
		}
		return $sp_product_details;
	}
	
		public function getSalesPromotionProduct($product_id) {
		$sp_product_details = array();
		
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "sales_promotion c WHERE ((c.date_start = '0000-00-00' OR c.date_start < NOW()) AND c.status = '1' AND (c.date_end = '0000-00-00' OR c.date_end > NOW()))");
	
		foreach ($query->rows as $result) { 
			$sales_promotion_options = unserialize($result['options']);
			
			$sales_promotion_products = array_merge($sales_promotion_options['product'],$sales_promotion_options['product_buy']);	
			$sales_promotion_products  = array_unique($sales_promotion_products);					
			
			// Condition for store
			if ((in_array((int)$this->config->get('config_store_id'), $sales_promotion_options['store']))) {
				if ((in_array((int)$product_id, $sales_promotion_products))) {
				$options=unserialize($result['options']);				
				return array(
					'name'=>$result['name'],
					'sales_promotion_id'=>$result['sales_promotion_id'],
					'discount'=>$options['discount'],
					'type'=>$options['type']
				);
				}
			} 
			
		}
		return false;
		//return $sp_product_details;
	}
	
	
}
?>