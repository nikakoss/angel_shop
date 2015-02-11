<?php
class ControllerModuleRelatedOptions extends Controller {
	private $error = array();
	
  public function index()
  {
    
    $this->load->language('module/related_options');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('setting/setting');
    $this->load->model('module/related_options');
				
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
      
      if (isset($this->request->post['variants'])) {
        $this->model_module_related_options->set_variants_options($this->request->post['variants']);
        unset($this->request->post['variants']);
      } else {
				$this->model_module_related_options->set_variants_options(array());
			}
      
			$this->model_setting_setting->editSetting('related_options', $this->request->post);		
			
			$this->session->data['success'] = $this->language->get('text_success');
						
			$this->redirect($this->url->link('module/related_options', 'token=' . $this->session->data['token'], 'SSL'));
      
		}
    
    //$this->redirect($this->url->link('catalog/product', 'token=' . $this->session->data['token'], 'SSL'));
		$this->data['export'] = $this->model_setting_setting->getSetting('related_options_export');
    
    $this->data['entry_update_quantity']      		= $this->language->get('entry_update_quantity');
    $this->data['entry_update_quantity_help'] 		= $this->language->get('entry_update_quantity_help');
		$this->data['entry_stock_control']      			= $this->language->get('entry_stock_control');
    $this->data['entry_stock_control_help'] 			= $this->language->get('entry_stock_control_help');
    $this->data['entry_update_options']       		= $this->language->get('entry_update_options');
    $this->data['entry_update_options_help']  		= $this->language->get('entry_update_options_help');
		$this->data['entry_hide_inaccessible']    		= $this->language->get('entry_hide_inaccessible');
    $this->data['entry_hide_inaccessible_help'] 	= $this->language->get('entry_hide_inaccessible_help');
		$this->data['entry_spec_model']    						= $this->language->get('entry_spec_model');
    $this->data['entry_spec_model_help'] 					= $this->language->get('entry_spec_model_help');
		$this->data['entry_spec_price']    						= $this->language->get('entry_spec_price');
    $this->data['entry_spec_price_help'] 					= $this->language->get('entry_spec_price_help');
		$this->data['entry_spec_price_discount']			= $this->language->get('entry_spec_price_discount');
    $this->data['entry_spec_price_discount_help'] = $this->language->get('entry_spec_price_discount_help');
		$this->data['entry_select_first'] 						= $this->language->get('entry_select_first');
		$this->data['entry_select_first_help'] 				= $this->language->get('entry_select_first_help');
		$this->data['entry_step_by_step'] 						= $this->language->get('entry_step_by_step');
		$this->data['entry_step_by_step_help'] 				= $this->language->get('entry_step_by_step_help');
		$this->data['entry_allow_zero_select']				= $this->language->get('entry_allow_zero_select');
		$this->data['entry_allow_zero_select_help']		= $this->language->get('entry_allow_zero_select_help');
		
		$this->data['entry_settings']									= $this->language->get('entry_settings');
		$this->data['entry_export']										= $this->language->get('entry_export');
		$this->data['entry_export_description']				= $this->language->get('entry_export_description');
		$this->data['entry_export_get_file']					= $this->language->get('entry_export_get_file');
		$this->data['entry_export_fields']						= $this->language->get('entry_export_fields');
		$this->data['entry_import']										= $this->language->get('entry_import');
		$this->data['entry_import_description']				= $this->language->get('entry_import_description');
		$this->data['entry_upload']										= $this->language->get('entry_upload');
		$this->data['button_upload']									= $this->language->get('button_upload');
		$this->data['button_upload_help']							= $this->language->get('button_upload_help');
		$this->data['entry_server_response']					= $this->language->get('entry_server_response');
		$this->data['entry_import_result']						= $this->language->get('entry_import_result');
		$this->data['entry_PHPExcel_not_found']				= $this->language->get('entry_PHPExcel_not_found');
		
		$PHPExcelPath = $this->PHPExcelPath();
		$this->data['PHPExcelPath'] = str_replace(DIR_SYSTEM,"./system",$PHPExcelPath);
		$this->data['PHPExcelExists'] = file_exists($PHPExcelPath);
		
		$this->data['token'] = $this->session->data['token'];
    
    if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}
    
    if (isset($this->session->data['success'])) {
      $this->data['success'] = $this->session->data['success'];
      unset($this->session->data['success']);
    } 
		
		if (isset($this->error['image'])) {
			$this->data['error_image'] = $this->error['image'];
		} else {
			$this->data['error_image'] = array();
		}
		
  		$this->data['breadcrumbs'] = array();

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => false
   		);

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_module'),
			'href'      => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('module/related_options', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
		$this->data['action'] = $this->url->link('module/related_options', 'token=' . $this->session->data['token'], 'SSL');
		$this->data['action_export'] = $this->url->link('module/related_options/export', '&token=' . $this->session->data['token'], 'SSL');
		
		$this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

    
		$this->data['modules'] = array();
    if (isset($this->request->post['related_options'])) {
			$this->data['modules'] = $this->request->post['related_options'];
		} elseif ($this->config->get('related_options')) {
			$this->data['modules'] = $this->config->get('related_options');
		}
		
		$current_version = $this->model_module_related_options->current_version();
		if ( !isset($this->data['modules']['related_options_version']) || $this->data['modules']['related_options_version'] < $current_version
				|| "".$this->data['modules']['related_options_version'] == ("".$current_version."b")) {
			$this->model_module_related_options->install_additional_tables();
			$this->data['modules']['related_options_version'] = $current_version;
			$this->model_setting_setting->editSetting('related_options', array('related_options' => $this->data['modules']) );
			$this->data['updated'] = $this->language->get('text_ro_updated_to')." ".($current_version);
		} 
    
    
    $this->data['heading_title']                  = $this->language->get('heading_title');
    $this->data['button_save']                    = $this->language->get('button_save');
		$this->data['button_cancel']                  = $this->language->get('button_cancel');
		$this->data['entry_ro_version']               = $this->language->get('entry_ro_version');
		$this->data['text_ro_support']                = $this->language->get('text_ro_support');
    $this->data['entry_ro_use_variants']          = $this->language->get('entry_ro_use_variants');
    $this->data['entry_ro_add_variant']           = $this->language->get('entry_ro_add_variant');
    $this->data['entry_ro_delete_variant']        = $this->language->get('entry_ro_delete_variant');
    $this->data['entry_ro_add_option']            = $this->language->get('entry_ro_add_option');
    $this->data['entry_ro_delete_option']         = $this->language->get('entry_ro_delete_option');
    $this->data['text_ro_clear_options']          = $this->language->get('text_ro_clear_options');
    $this->data['entry_ro_variant_name']          = $this->language->get('entry_ro_variant_name');
    $this->data['entry_ro_options']               = $this->language->get('entry_ro_options');
		$this->data['entry_show_clear_options']       = $this->language->get('entry_show_clear_options');
    $this->data['entry_show_clear_options_help']  = $this->language->get('entry_show_clear_options_help');
		$this->data['option_show_clear_options_not']  = $this->language->get('option_show_clear_options_not');
		$this->data['option_show_clear_options_top']  = $this->language->get('option_show_clear_options_top');
		$this->data['option_show_clear_options_bot']  = $this->language->get('option_show_clear_options_bot');
		$this->data['entry_edit_columns']       			= $this->language->get('entry_edit_columns');
		$this->data['entry_edit_columns_0']       		= $this->language->get('entry_edit_columns_0');
		$this->data['entry_edit_columns_2']       		= $this->language->get('entry_edit_columns_2');
		$this->data['entry_edit_columns_3']       		= $this->language->get('entry_edit_columns_3');
		$this->data['entry_edit_columns_4']       		= $this->language->get('entry_edit_columns_4');
		$this->data['entry_edit_columns_5']       		= $this->language->get('entry_edit_columns_5');
		$this->data['entry_edit_columns_100']    			= $this->language->get('entry_edit_columns_100');
		$this->data['entry_edit_columns_help']       	= $this->language->get('entry_edit_columns_help');
    
    $this->data['options'] = $this->model_module_related_options->get_compatible_options();
    $this->data['variants_options'] = $this->model_module_related_options->get_variants_options();
    
    
    $this->template = 'module/related_options.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
				
		$this->response->setOutput($this->render());
    
  }
  
	private function PHPExcelPath() {
		return DIR_SYSTEM . '/PHPExcel/Classes/PHPExcel.php';
	}
	
	public function export() {
		
		//ini_set('display_errors', 1);
		//error_reporting(E_ERROR|E_PARSE);
	
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && isset($this->request->post['export']) && is_array($this->request->post['export']) && count($this->request->post['export'])>0) {
			
			$this->load->model('setting/setting');
			$this->model_setting_setting->editSetting('related_options_export', $this->request->post['export']);
			$export_settings = $this->request->post['export'];
			
			
			$this->load->model('module/related_options');
			$data = $this->model_module_related_options->getExportData();
			
			
			
			require_once $this->PHPExcelPath();
			
			$cacheMethod = PHPExcel_CachedObjectStorageFactory:: cache_to_phpTemp; //PHPExcel_CachedObjectStorageFactory::cache_to_discISAM ; //
			$cacheSettings = array( 'memoryCacheSize' => '32MB');
			PHPExcel_Settings::setCacheStorageMethod($cacheMethod, $cacheSettings);
			
			$objPHPExcel = new PHPExcel();
			$objPHPExcel->setActiveSheetIndex(0);
			
			$show_settings = array();
			foreach ($data as $data_str) {
				
				foreach ($data_str as $data_key => $data_value) {
					foreach ($export_settings as $setting => $setting_on) {
						if ($setting_on) {
							if (($data_key == $setting) || (substr($data_key, 0, strlen($setting)) == $setting) ) {
								if (!in_array($data_key, $show_settings)) {
									$show_settings[] = $data_key;
								}
							}
						}
					}
				}
			}
			
			
			$column = 0;
			foreach ($show_settings as $setting) {
				$objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow($column, 1, $setting);
				$column++;
			}
			
			$current_data = array();
			foreach ($data as $data_str) {
				$current_str = array();
				foreach ($show_settings as $setting) {
					$current_str[$setting] = isset($data_str[$setting]) ? $data_str[$setting] : "";
				}
				$current_data[] = $current_str;
			}
			
			$objPHPExcel->getActiveSheet()->fromArray($current_data, null, 'A2');
			//$objPHPExcel->getActiveSheet()->fromArray($data,null,'A2');
			
			
			$objWriter = new PHPExcel_Writer_Excel5($objPHPExcel);
			
			$file = DIR_CACHE."/roexport.xls";
			
			$objWriter->save($file);
			
			
			
			header('Content-Description: File Transfer');
			header('Content-Type: application/octet-stream');
			header('Content-Disposition: attachment; filename=' . basename($file));
			header('Content-Transfer-Encoding: binary');
			header('Expires: 0');
			header('Cache-Control: must-revalidate');
			header('Pragma: public');
			header('Content-Length: ' . filesize($file));
			// читаем файл и отправляем его пользователю
			readfile($file);
			exit;
			
		}
	}
  
	public function import() {
		
		
		
		$json = array();
		
		if (!empty($this->request->files['file']['name'])) {
			
			//ini_set('display_errors', 1);
			//error_reporting(E_ERROR|E_PARSE);
			
			require_once $this->PHPExcelPath();
			
			$cacheMethod = PHPExcel_CachedObjectStorageFactory:: cache_to_phpTemp; //PHPExcel_CachedObjectStorageFactory::cache_to_discISAM ; //
			$cacheSettings = array( 'memoryCacheSize' => '32MB');
			PHPExcel_Settings::setCacheStorageMethod($cacheMethod, $cacheSettings);
			
			$excel = PHPExcel_IOFactory::load($this->request->files['file']['tmp_name']); // PHPExcel
			$sheet = $excel->getSheet(0);
			
			$data = $sheet->toArray();
			
			//$this->log->write( print_r($data,true) );
			
			if (count($data) > 1) {
				
				$head = array_flip($data[0]);
				
				if (!isset($head['product_id'])) {
					$json['error'] = "product_id not found";
				}
				
				if (!isset($head['quantity'])) {
					$json['error'] = "quantity not found";
				}
				
				if (!isset($head['option_id1'])) {
					$json['error'] = "option_id1 not found";
				}
				
				if (!isset($head['option_value_id1'])) {
					$json['error'] = "option_value_id1 not found";
				}
				
				if (!isset($json['error'])) {
					
					$f_options = array();
					for ($i=1;$i<=100;$i++) {
						if ( isset($head['option_id'.$i]) && isset($head['option_value_id'.$i]) ) {
							$f_options[] = $i;
						}
					}
					
					
					$products = array();
					
					for ($i=1;$i<count($data);$i++) {
						
						$row = $data[$i];
						
						$product_id = (int)$row[$head['product_id']];
						if (!isset($products[$product_id])) {
							$products[$product_id] = array('relatedoptions'=>array(), 'related_options_use'=>true, 'related_options_variant_search'=>true);
						}
						
						$options = array();
						foreach ($f_options as $opt_num) {
							if ((int)$row[$head['option_id'.$opt_num]]!=0) {
								$options[(int)$row[$head['option_id'.$opt_num]]] = (int)$row[$head['option_value_id'.$opt_num]];
							}
						}
						
						$products[$product_id]['relatedoptions'][] = array(	'options'=>$options
																															, 'quantity'=>$row[(int)$head['quantity']]
																															, 'price'=> isset($head['price']) ? $row[(float)$head['price']] : 0
																															, 'model'=> isset($head['relatedoptions_model']) ? $row[(float)$head['relatedoptions_model']] : 0
																															);
						
						
					}
					
					//$this->log->write( print_r($products,true) );
					
					$this->load->model('module/related_options');
					
					$this->model_module_related_options->delete_all_related_options();
					
					$ro_cnt = 0;
					foreach ($products as $product_id => $product) {
						$ro_cnt+= count($product['relatedoptions']);
						$this->model_module_related_options->editRelatedOptions($product_id, $product);
						
					}
					$json['products'] = count($products);
					$json['relatedoptions'] = $ro_cnt;
					
				}
				
			} else {
				$json['error'] = "empty table";
			}
			
			
			
		} else {
			$json['error'] = "file not uploaded";
		}
		
		$this->response->setOutput(json_encode($json));
	}
	
	public function install()
  {
    $this->load->model('module/related_options');
    $this->model_module_related_options->install();
		
		$this->load->model('setting/setting');
		$msettings = array('related_options'=>array('update_quantity'=>1,'update_options'=>1,'related_options_version'=>$this->model_module_related_options->current_version()));
		$this->model_setting_setting->editSetting('related_options', $msettings);
		
		
  }
  
  public function uninstall()
  {
    $this->load->model('module/related_options');
    $this->model_module_related_options->uninstall();
  }
  
  private function validate() {
    if (!$this->user->hasPermission('modify', 'module/related_options')) {
      $this->error['warning'] = $this->language->get('error_permission');
    }
    
    if (!$this->error) {
      return true;
    } else {
      return false;
    }	
  }
  
}