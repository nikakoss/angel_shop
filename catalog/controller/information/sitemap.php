<?php  
class ControllerInformationSitemap extends Controller {
	public function index() {
    	$this->language->load('information/sitemap');
 
      $this->document->setTitle($this->language->get('heading_title'));
      $this->document->setDescription("Карта сайта компании Angel-Moda. Краткая информация о разделах сайта. Вопросы по тел. +7(929)580-08-10.");
      $this->document->setKeywords("карта сайта, интернет магазин, angel-moda");    

      $this->data['breadcrumbs'] = array();

      $this->data['breadcrumbs'][] = array(
        'text'      => $this->language->get('text_home'),
        'href'      => $this->url->link('common/home'),
        'separator' => false
      );

      $this->data['breadcrumbs'][] = array(
        'text'      => $this->language->get('heading_title'),
        'href'      => $this->url->link('information/sitemap'),      	
        'separator' => $this->language->get('text_separator')
      );	
		
    	$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['text_special'] = $this->language->get('text_special');
		$this->data['text_account'] = $this->language->get('text_account');
    $this->data['text_edit'] = $this->language->get('text_edit');
    $this->data['text_password'] = $this->language->get('text_password');
    $this->data['text_address'] = $this->language->get('text_address');
    $this->data['text_history'] = $this->language->get('text_history');
    $this->data['text_download'] = $this->language->get('text_download');
    $this->data['text_cart'] = $this->language->get('text_cart');
    $this->data['text_checkout'] = $this->language->get('text_checkout');
    $this->data['text_search'] = $this->language->get('text_search');
    $this->data['text_information'] = $this->language->get('text_information');
    $this->data['text_contact'] = $this->language->get('text_contact');
			
		$this->load->model('catalog/category');
		$this->load->model('catalog/product');
		
		$this->data['categories'] = array();
					
		$categories_1 = $this->model_catalog_category->getCategories(0);
		
		foreach ($categories_1 as $category_1) {
			$level_2_data = array();
			
			$categories_2 = $this->model_catalog_category->getCategories($category_1['category_id']);
			
			foreach ($categories_2 as $category_2) {
				$level_3_data = array();
				
				$data_level2 = array(
									'filter_category_id'  => $category_2['category_id'],
									'filter_sub_category' => true
				);
				$total_level2 = (int)$this->model_catalog_product->getTotalProducts($data_level2);
				if($total_level2>0){ // total product level 2
				
				$categories_3 = $this->model_catalog_category->getCategories($category_2['category_id']);
				
				foreach ($categories_3 as $category_3) {
					
					$data_level3 = array(
									'filter_category_id'  => $category_3['category_id'],
									'filter_sub_category' => true
					);
					$total_level3 = (int)$this->model_catalog_product->getTotalProducts($data_level3);
					if($total_level3>0){
						$total_level3 = (int)$this->model_catalog_product->getTotalProducts($data_level2);
				
						$level_3_data[] = array(
							'name' => $category_3['name'],
							'href' => $this->url->link('product/category', 'path=' . $category_1['category_id'] . '_' . $category_2['category_id'] . '_' . $category_3['category_id'])
						);
					} // level 3
				}
				
				$level_2_data[] = array(
					'name'     => $category_2['name'],
					'children' => $level_3_data,
					'href'     => $this->url->link('product/category', 'path=' . $category_1['category_id'] . '_' . $category_2['category_id'])	
				);
				
				} //end total product level 2
				
				
			}
			
			$this->data['categories'][] = array(
				'name'     => $category_1['name'],
				'children' => $level_2_data,
				'href'     => $this->url->link('product/category', 'path=' . $category_1['category_id'])
			);
		}
		
		
		 //start blogs sitemap
			$blogs_map=array();
			$sql="SELECT c.category_id,cd.title from oc_pavblog_category c,oc_pavblog_category_description cd WHERE  c.category_id=cd.category_id and cd.language_id=1 and c.parent_id=1";
			$blogs = $this->db->query( $sql )->rows;
			foreach($blogs as $blog){
				
				$blog_level_2=array();				
				$blog_pages = $this->db->query(" select b.blog_id,bd.title from oc_pavblog_blog b,oc_pavblog_blog_description bd WHERE b.blog_id=bd.blog_id and bd.language_id=1 and b.category_id=".$blog['category_id'])->rows;
				
				foreach($blog_pages as $blog_page){
					$blog_level_2[]=array(
					'href'=>$this->url->link('pavblog/blog', 'pavblog/blog=' .  $blog_page['blog_id']),
					'name'=>$blog_page['title']
					);
				}				
				$blogs_map[]=array(
				'href'=>$this->url->link( 'pavblog/category', "pavblog/category=".$blog['category_id'] ),
				'name'=>$blog['title'],
				'children'=>$blog_level_2
				);
				
			}
		
		$this->data['blogs_map'][]=array(
			'href'=>$this->url->link('common/home').'blogs',
			'name'=>'Блог',
			'children'=>$blogs_map
		);
		// end blogs sitemap	
		
		$this->data['special'] = $this->url->link('product/special');
		$this->data['account'] = $this->url->link('account/account', '', 'SSL');
    	$this->data['edit'] = $this->url->link('account/edit', '', 'SSL');
    	$this->data['password'] = $this->url->link('account/password', '', 'SSL');
    	$this->data['address'] = $this->url->link('account/address', '', 'SSL');
    	$this->data['history'] = $this->url->link('account/order', '', 'SSL');
    	$this->data['download'] = $this->url->link('account/download', '', 'SSL');
    	$this->data['cart'] = $this->url->link('checkout/cart');
    	$this->data['checkout'] = $this->url->link('checkout/checkout', '', 'SSL');
    	$this->data['search'] = $this->url->link('product/search');
    	$this->data['contact'] = $this->url->link('information/contact');
		
		$this->load->model('catalog/information');
		
		$this->data['informations'] = array();
    	
		foreach ($this->model_catalog_information->getInformations() as $result) {
      		$this->data['informations'][] = array(
        		'title' => $result['title'],
        		'href'  => $this->url->link('information/information', 'information_id=' . $result['information_id']) 
      		);
    	}

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/information/sitemap.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/information/sitemap.tpl';
		} else {
			$this->template = 'default/template/information/sitemap.tpl';
		}
		
		$this->children = array(
			'common/column_left',
			'common/column_right',
			'common/content_top',
			'common/content_bottom',
			'common/footer',
			'common/header'
		);
				
 		$this->response->setOutput($this->render());		
	}
	
	public function getModel($model='category'){
			return $this->{"model_pavblog_{$model}"};
	}
}
?>