<?php
class ModelSaleSalesPromotion extends Model {

	public function serializeSalesPromotionOptions($data) {
		$option = array();
		$option['type'] = $data['type'];
		$option['discount'] = $data['discount'];
		$option['quantity_type'] = $data['quantity_type'];
		$option['quantity_sale'] = $data['quantity_sale'];
		$option['quantity_buy'] = $data['quantity_buy'];
		$option['quantity_total'] = $data['quantity_total'];
		$option['total'] = $data['total'];
		$option['logged'] = $data['logged'];
		$option['product_option'] = $data['product_option'];
		$option['shipping'] = $data['shipping'];
		$option['coupon_combine'] = $data['coupon_combine'];
		$option['uses_total'] = $data['uses_total'];
		$option['uses_customer'] = $data['uses_customer'];
		$option['special_combine'] = $data['special_combine'];
		$option['discount_combine'] = $data['discount_combine'];
		if (isset($data['product'])) {
			$option['product'] = $data['product'];	
		} else {
			$option['product'] = array();
		}
		if (isset($data['product_buy'])) {
			$option['product_buy'] = $data['product_buy'];	
		} else {
			$option['product_buy'] = array();
		}
		$option['store'] = $data['store'];
		$option['customer_group'] = $data['customer_group'];
		$option['currency'] = $data['currency'];
		$option['language'] = $data['language'];
		$option['day'] = $data['day'];
		$options = serialize($option);
		return $options;
		}

	public function addSalesPromotion($data) {
      	
		$options =  $this->model_sale_sales_promotion->serializeSalesPromotionOptions($data);
		
		$this->db->query("INSERT INTO " . DB_PREFIX . "sales_promotion SET name = '" . $this->db->escape($data['name']) . "', options = '" . $this->db->escape($options) . "', date_start = '" . $this->db->escape($data['date_start']) . "', date_end = '" . $this->db->escape($data['date_end']) . "', status = '" . (int)$data['status'] . "', date_added = NOW()");
		
		}

	public function editSalesPromotion($sales_promotion_id, $data) {
      	
		$options =  $this->model_sale_sales_promotion->serializeSalesPromotionOptions($data);
		
		$this->db->query("UPDATE " . DB_PREFIX . "sales_promotion SET name = '" . $this->db->escape($data['name']) . "', options = '" . $this->db->escape($options) . "', date_start = '" . $this->db->escape($data['date_start']) . "', date_end = '" . $this->db->escape($data['date_end']) . "', status = '" . (int)$data['status'] . "' WHERE sales_promotion_id = '" . (int)$sales_promotion_id . "'");
		
		}
	
	
	public function deleteSalesPromotion($sales_promotion_id) {
      	$this->db->query("DELETE FROM " . DB_PREFIX . "sales_promotion WHERE sales_promotion_id = '" . (int)$sales_promotion_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "sales_promotion_history WHERE sales_promotion_id = '" . (int)$sales_promotion_id . "'");		
		}
	
	public function getSalesPromotion($sales_promotion_id) {
      	$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "sales_promotion WHERE sales_promotion_id = '" . (int)$sales_promotion_id . "'");
		
		return $query->row;
	}
	
	public function validateSalesPromotionNameById($name,$sales_promotion_id) {
      	$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "sales_promotion WHERE name = '" . $name . "' AND sales_promotion_id != '" . (int)$sales_promotion_id . "'");
		
		return $query->row;
	}
	
	public function validateSalesPromotionName($name) {
      	$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "sales_promotion WHERE name = '" . $name . "'");
		
		return $query->row;
	}
	
	public function getSalesPromotions($data = array()) {
		$sql = "SELECT sales_promotion_id, name, options, date_start, date_end, status FROM " . DB_PREFIX . "sales_promotion";
		
		$sort_data = array(
			'name',
			'options',
			'date_start',
			'date_end',
			'status'
		);	
			
		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];	
		} else {
			$sql .= " ORDER BY name";	
		}
			
		if (isset($data['order']) && ($data['order'] == 'DESC')) {
			$sql .= " DESC";
		} else {
			$sql .= " ASC";
		}
		
		if (isset($data['start']) || isset($data['limit'])) {
			if ($data['start'] < 0) {
				$data['start'] = 0;
			}			

			if ($data['limit'] < 1) {
				$data['limit'] = 20;
			}	
			
			$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
		}		
		
		$query = $this->db->query($sql);
		
		return $query->rows;
	}
	
	public function getSalesPromotionProductsCategory($sales_promotion_id) {
			
			$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "sales_promotion WHERE sales_promotion_id = '" . (int)$sales_promotion_id . "'");
			
			$query_result = $query->row;
			$result = unserialize($query_result['options']);
			$result_products = $result['product'];
			
			$product_to_category_data = array();
			
			foreach ($result_products as $product_id) {
				
				$query_product_to_category = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_to_category WHERE product_id = '" . (int)$product_id . "'");
					
					foreach ($query_product_to_category->rows as $result_product_to_category) {
						$product_to_category_data[] = $result_product_to_category['category_id'];
					}
	
			}
	
			$sales_category_count =  array();
			$sales_category_count = array_count_values($product_to_category_data);
			
			$sales_category_ids = array();
			$sales_category_ids = array_unique($product_to_category_data);
						
			$match_category = array();
			foreach($sales_category_ids as $sales_category_id){
				
			$query_category_id_count = $this->db->query("SELECT count(*) as total_category_products FROM " . DB_PREFIX . "product_to_category WHERE category_id = '" . (int)$sales_category_id . "'");
					
					$total_category_products = $query_category_id_count->row['total_category_products'];
					
					if( $sales_category_count[$sales_category_id] == $total_category_products){
						$match_category[] = $sales_category_id;
					}
			}
			
			return $match_category;
		}
	
	public function getSalesPromotionProductsManufacturer($sales_promotion_id) {
			
			$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "sales_promotion WHERE sales_promotion_id = '" . (int)$sales_promotion_id . "'");
			
			$query_result = $query->row;
			$result = unserialize($query_result['options']);
			$result_products = $result['product'];
			
			$product_to_manufacturer_data = array();
			
			foreach ($result_products as $product_id) {
				
				$query_product_to_manufacturer = $this->db->query("SELECT * FROM " . DB_PREFIX . "product WHERE product_id = '" . (int)$product_id . "'");
					
					foreach ($query_product_to_manufacturer->rows as $result_product_to_manufacturer) {
						$product_to_manufacturer_data[] = $result_product_to_manufacturer['manufacturer_id'];
					}
	
			}
	
			$sales_manufacturer_count =  array();
			$sales_manufacturer_count = array_count_values($product_to_manufacturer_data);
			
			$sales_manufacturer_ids = array();
			$sales_manufacturer_ids = array_unique($product_to_manufacturer_data);
						
			$match_manufacturer = array();
			foreach($sales_manufacturer_ids as $sales_manufacturer_id){
				
			$query_manufacturer_id_count = $this->db->query("SELECT count(*) as total_manufacturer_products FROM " . DB_PREFIX . "product WHERE manufacturer_id = '" . (int)$sales_manufacturer_id . "'");
					
					$total_manufacturer_products = $query_manufacturer_id_count->row['total_manufacturer_products'];
					
					if( $sales_manufacturer_count[$sales_manufacturer_id] == $total_manufacturer_products){
						$match_manufacturer[] = $sales_manufacturer_id;
					}
			}
			
			return $match_manufacturer;
		}
	
	public function getSalesPromotionProductsCategoryBuy($sales_promotion_id) {
			
			$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "sales_promotion WHERE sales_promotion_id = '" . (int)$sales_promotion_id . "'");
			
			$query_result = $query->row;
			$result = unserialize($query_result['options']);
			$result_products = $result['product_buy'];
			
			$product_to_category_data = array();
			
			foreach ($result_products as $product_id) {
				
				$query_product_to_category = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_to_category WHERE product_id = '" . (int)$product_id . "'");
					
					foreach ($query_product_to_category->rows as $result_product_to_category) {
						$product_to_category_data[] = $result_product_to_category['category_id'];
					}
	
			}
	
			$sales_category_count =  array();
			$sales_category_count = array_count_values($product_to_category_data);
			
			$sales_category_ids = array();
			$sales_category_ids = array_unique($product_to_category_data);
						
			$match_category = array();
			foreach($sales_category_ids as $sales_category_id){
				
			$query_category_id_count = $this->db->query("SELECT count(*) as total_category_products FROM " . DB_PREFIX . "product_to_category WHERE category_id = '" . (int)$sales_category_id . "'");
					
					$total_category_products = $query_category_id_count->row['total_category_products'];
					
					if( $sales_category_count[$sales_category_id] == $total_category_products){
						$match_category[] = $sales_category_id;
					}
			}
			
			return $match_category;
		}
		
		public function getSalesPromotionProductsManufacturerBuy($sales_promotion_id) {
			
			$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "sales_promotion WHERE sales_promotion_id = '" . (int)$sales_promotion_id . "'");
			
			$query_result = $query->row;
			$result = unserialize($query_result['options']);
			$result_products = $result['product_buy'];
			
			$product_to_manufacturer_data = array();
			
			foreach ($result_products as $product_id) {
				
				$query_product_to_manufacturer = $this->db->query("SELECT * FROM " . DB_PREFIX . "product WHERE product_id = '" . (int)$product_id . "'");
					
					foreach ($query_product_to_manufacturer->rows as $result_product_to_manufacturer) {
						$product_to_manufacturer_data[] = $result_product_to_manufacturer['manufacturer_id'];
					}
	
			}
	
			$sales_manufacturer_count =  array();
			$sales_manufacturer_count = array_count_values($product_to_manufacturer_data);
			
			$sales_manufacturer_ids = array();
			$sales_manufacturer_ids = array_unique($product_to_manufacturer_data);
						
			$match_manufacturer = array();
			foreach($sales_manufacturer_ids as $sales_manufacturer_id){
				
			$query_manufacturer_id_count = $this->db->query("SELECT count(*) as total_manufacturer_products FROM " . DB_PREFIX . "product WHERE manufacturer_id = '" . (int)$sales_manufacturer_id . "'");
					
					$total_manufacturer_products = $query_manufacturer_id_count->row['total_manufacturer_products'];
					
					if( $sales_manufacturer_count[$sales_manufacturer_id] == $total_manufacturer_products){
						$match_manufacturer[] = $sales_manufacturer_id;
					}
			}
			
			return $match_manufacturer;
		}
	
	public function getSalesPromotionStores($sales_promotion_id) {
		$sales_promotion_store_data = array();
		
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "sales_promotion_to_store WHERE sales_promotion_id = '" . (int)$sales_promotion_id . "'");

		foreach ($query->rows as $result) {
			$sales_promotion_store_data[] = $result['store_id'];
		}
		
		return $sales_promotion_store_data;
	}

	public function getTotalSalesPromotion() {
      	$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "sales_promotion");
		
		return $query->row['total'];
	}	
	
	public function getSalesPromotionHistories($sales_promotion_id, $start = 0, $limit = 10) {
		$query = $this->db->query("SELECT ch.order_id, CONCAT(c.firstname, ' ', c.lastname) AS customer, ch.amount, ch.date_added FROM " . DB_PREFIX . "sales_promotion_history ch LEFT JOIN " . DB_PREFIX . "customer c ON (ch.customer_id = c.customer_id) WHERE ch.sales_promotion_id = '" . (int)$sales_promotion_id . "' ORDER BY ch.date_added ASC LIMIT " . (int)$start . "," . (int)$limit);

		return $query->rows;
	}
	
	public function getTotalSalesPromotionHistories($sales_promotion_id) {
	  	$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "sales_promotion_history WHERE sales_promotion_id = '" . (int)$sales_promotion_id . "'");

		return $query->row['total'];
	}		
	
	public function getSalesPromotionAutocompleteProducts($data = array()) {
		
		if ($data) {
			$sql = "SELECT *, pd.name as name FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id)"; 
		
		if (!empty($data['filter_category_id'])) {
				$sql .= " LEFT JOIN " . DB_PREFIX . "product_to_category p2c ON (p.product_id = p2c.product_id)";			
			}
			
		if (!empty($data['filter_manufacturer_id'])) {
				$sql .= " LEFT JOIN " . DB_PREFIX . "manufacturer m ON (p.manufacturer_id = m.manufacturer_id)";			
			}	
					
			$sql .= " WHERE pd.language_id = '" . (int)$this->config->get('config_language_id') . "'"; 
			
			if (!empty($data['filter_name'])) {
				$sql .= " AND LCASE(pd.name) LIKE '" . $this->db->escape(mb_strtolower($data['filter_name'], 'UTF-8')) . "%'";
			}
	
			if (!empty($data['filter_model'])) {
				$sql .= " AND LCASE(p.model) LIKE '" . $this->db->escape(mb_strtolower($data['filter_model'], 'UTF-8')) . "%'";
			}
			
			if (!empty($data['filter_price'])) {
				$sql .= " AND p.price LIKE '" . $this->db->escape($data['filter_price']) . "%'";
			}
			
			if (isset($data['filter_quantity']) && !is_null($data['filter_quantity'])) {
				$sql .= " AND p.quantity = '" . $this->db->escape($data['filter_quantity']) . "'";
			}
			
			if (isset($data['filter_status']) && !is_null($data['filter_status'])) {
				$sql .= " AND p.status = '" . (int)$data['filter_status'] . "'";
			}
			
			if (!empty($data['filter_manufacturer_id'])) {
				$sql .= " AND m.manufacturer_id = '" . (int)$data['filter_manufacturer_id'] . "'";
			}
	
			if (!empty($data['filter_category_id'])) {
							if (!empty($data['filter_sub_category'])) {
								$implode_data = array();
								
								$implode_data[] = "category_id = '" . (int)$data['filter_category_id'] . "'";
								
								$this->load->model('catalog/category');
								
								$categories = $this->model_catalog_category->getCategories($data['filter_category_id']);
								
								foreach ($categories as $category) {
									$implode_data[] = "p2c.category_id = '" . (int)$category['category_id'] . "'";
								}
								
								$sql .= " AND (" . implode(' OR ', $implode_data) . ")";			
							} else {
								$sql .= " AND p2c.category_id = '" . (int)$data['filter_category_id'] . "'";
							}
						}
						
			$sql .= " GROUP BY p.product_id";
						
			$sort_data = array(
				'pd.name',
				'p.model',
				'p.price',
				'p.quantity',
				'p.status',
				'p.sort_order'
			);	
			
			if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
				$sql .= " ORDER BY " . $data['sort'];	
			} else {
				$sql .= " ORDER BY pd.name";	
			}
			
			if (isset($data['order']) && ($data['order'] == 'DESC')) {
				$sql .= " DESC";
			} else {
				$sql .= " ASC";
			}
		
			if (isset($data['start']) || isset($data['limit'])) {
				if ($data['start'] < 0) {
					$data['start'] = 0;
				}				
	
				if ($data['limit'] < 1) {
					$data['limit'] = 20;
				}	
			
				$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
			}	
			
			$query = $this->db->query($sql);
		
			return $query->rows;
		} else {
			$product_data = $this->cache->get('product.' . $this->config->get('config_language_id'));
		
			if (!$product_data) {
				$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) WHERE pd.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY pd.name ASC");
	
				$product_data = $query->rows;
			
				$this->cache->set('product.' . $this->config->get('config_language_id'), $product_data);
			}	
	
			return $product_data;
			
		}
	}
		

	}
	
	