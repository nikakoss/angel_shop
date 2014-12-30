<?php  
class ControllerModuleCategory extends Controller {
	protected function index($setting) {
		$this->language->load('module/category');
		
    	$this->data['heading_title'] = $this->language->get('heading_title');
		
		if (isset($this->request->get['path'])) {
			$parts = explode('_', (string)$this->request->get['path']);
		} else {
			$parts = array();
		}
		if (isset($parts[0])) {
			$this->data['category_id'] = $parts[0];
		} else {
			$this->data['category_id'] = 0;
		}
		
		if (isset($parts[1])) {
			$this->data['child_id'] = $parts[1];
		} else {
			$this->data['child_id'] = 0;
		}
		
		if (isset($parts[2])) {
			$this->data['child2_id'] = $parts[2];
		} else {
			$this->data['child2_id'] = 0;
		}
		
		if (isset($parts[3])) {
			$this->data['child3_id'] = $parts[3];
		} else {
			$this->data['child3_id'] = 0;
		}
							
		$this->load->model('catalog/category');

		$this->load->model('catalog/product');

		$this->data['categories'] = array();
		
		$categories = $this->model_catalog_category->getCategories(0);	
		foreach ($categories as $category) {
			$total = (int)$this->model_catalog_product->getTotalProducts(array('filter_category_id'  => $category['category_id']));
			$children_data = array();
			$children = $this->model_catalog_category->getCategories($category['category_id']);
			foreach ($children as $child) {
				$data = array(
					'filter_category_id'  => $child['category_id'],
					'filter_sub_category' => true
				);
				
				
				//
					$children_data_level2 = array();
					$children_level2 = $this->model_catalog_category->getCategories($child['category_id']);				
					foreach ($children_level2 as $child_level2) {
							$data_level2 = array(
									'filter_category_id'  => $child_level2['category_id'],
									'filter_sub_category' => true
							);
						
						
						$children_data_level3 = array();
						$children_level3 = $this->model_catalog_category->getCategories($child_level2['category_id']);				
						foreach ($children_level3 as $child_level3) {
							$data_level3 = array(
									'filter_category_id'  => $child_level3['category_id'],
									'filter_sub_category' => true
							);
							
						//	$total33 = $this->model_catalog_product->getTotalProducts($data_level3);
							
							$children_data_level3[] = array(
									'category_id' => $child_level3['category_id'],
								//	'product_total' => $total33,
									'name'  =>  $child_level3['name'],
									'href'  => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id'] . '_' . $child_level2['category_id'] . '_' . $child_level3['category_id']),
									'id' => $category['category_id']. '_' . $child['category_id']. '_' . $child_level2['category_id'] . '_' . $child_level3['category_id']
							);
					}
						
							$data_level33 = array(
									'filter_category_id'  => $child_level2['category_id'],
									'filter_sub_category' => true
							);
							
							$total33 = (int)$this->model_catalog_product->getTotalProducts($data_level33);
						
							$children_data_level2[] = array(
									'category_id' => $child_level2['category_id'],
									'product_total' => $total33 ,
									'name'  =>  $child_level2['name'],
									'children3'    => $children_data_level3,
									'href'  => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id'] . '_' . $child_level2['category_id']),
									'id' => $category['category_id']. '_' . $child['category_id']. '_' . $child_level2['category_id']
							);
					}
					//

				$product_total = (int)$this->model_catalog_product->getTotalProducts($data);

				$total += $product_total;

				$children_data[] = array(
					'category_id' => $child['category_id'],
					'product_total' => $product_total,
					'name'        => $child['name'] . ($this->config->get('config_product_count') ? ' (' . $product_total . ')' : ''),
					'children2'    => $children_data_level2,
					'href'        => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id'])	
				);		
			}

			$this->data['categories'][] = array(
				'category_id' => $category['category_id'],
				'product_total' => $total,
				'name'        => $category['name'] . ($this->config->get('config_product_count') ? ' (' . $total . ')' : ''),
				'children'    => $children_data,				
				'href'        => $this->url->link('product/category', 'path=' . $category['category_id'])
			);	
		}
		
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/category.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/category.tpl';
		} else {
			$this->template = 'default/template/module/category.tpl';
		}
		
		$this->render();
  	}

}
?>