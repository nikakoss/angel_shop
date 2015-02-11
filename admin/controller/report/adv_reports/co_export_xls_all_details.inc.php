<?php
ini_set("memory_limit","256M");

		// we use our own error handler
		global $config;
		global $log;
		$config = $this->config;
		$log = $this->log;
		set_error_handler('error_handler_for_export',E_ALL);
		register_shutdown_function('fatal_error_shutdown_handler_for_export');
		
		// Creating a workbook
		$workbook = new Spreadsheet_Excel_Writer();
		$workbook->setTempDir(DIR_CACHE);
		$workbook->setVersion(8); // Use Excel97/2000 BIFF8 Format

		// Formating a workbook
		$textFormat =& $workbook->addFormat(array('Align' => 'left', 'NumFormat' => "@"));
		
		$numberFormat =& $workbook->addFormat(array('Align' => 'left'));	

		$priceFormat =& $workbook->addFormat(array('Align' => 'right'));
		$priceFormat->setNumFormat('0.00');
		
		$boxFormatText =& $workbook->addFormat(array('bold' => 1));
		$boxFormatNumber =& $workbook->addFormat(array('Align' => 'right', 'bold' => 1));
		
		// sending HTTP headers
		$workbook->send('customer_order_report_all_details_'.date("Y-m-d",time()).'.xls');
		
		$worksheet =& $workbook->addWorksheet('Customer Orders Report');
		$worksheet->setInputEncoding('UTF-8');
		$worksheet->setZoom(90);

		// Set the column widths
		$j = 0;
		$worksheet->setColumn($j,$j++,10); // A
		$worksheet->setColumn($j,$j++,13); // B
		isset($_POST['co1000']) ? $worksheet->setColumn($j,$j++,15) : ''; // C
		isset($_POST['co1001']) ? $worksheet->setColumn($j,$j++,20) : ''; // D
		isset($_POST['co1002']) ? $worksheet->setColumn($j,$j++,20) : ''; // E
		isset($_POST['co1003']) ? $worksheet->setColumn($j,$j++,15) : ''; // F
		isset($_POST['co1004']) ? $worksheet->setColumn($j,$j++,10) : ''; // G
		isset($_POST['co1005']) ? $worksheet->setColumn($j,$j++,13) : ''; // H
		isset($_POST['co1006']) ? $worksheet->setColumn($j,$j++,13) : ''; // I
		isset($_POST['co1007']) ? $worksheet->setColumn($j,$j++,25) : ''; // J
		isset($_POST['co1008']) ? $worksheet->setColumn($j,$j++,20) : ''; // K
		isset($_POST['co1009']) ? $worksheet->setColumn($j,$j++,20) : ''; // L
		isset($_POST['co1010']) ? $worksheet->setColumn($j,$j++,20) : ''; // M
		isset($_POST['co1011']) ? $worksheet->setColumn($j,$j++,20) : ''; // N
		isset($_POST['co1012']) ? $worksheet->setColumn($j,$j++,10) : ''; // O
		isset($_POST['co1013']) ? $worksheet->setColumn($j,$j++,13) : ''; // P
		isset($_POST['co1014']) ? $worksheet->setColumn($j,$j++,15) : ''; // Q
		isset($_POST['co1016a']) ? $worksheet->setColumn($j,$j++,13) : ''; // R
		isset($_POST['co1015']) ? $worksheet->setColumn($j,$j++,13) : ''; // S	
		isset($_POST['co1016b']) ? $worksheet->setColumn($j,$j++,13) : ''; // T
		isset($_POST['co1020']) ? $worksheet->setColumn($j,$j++,13) : ''; // U
		isset($_POST['co1023']) ? $worksheet->setColumn($j,$j++,13) : ''; // V
		isset($_POST['co1027']) ? $worksheet->setColumn($j,$j++,13) : ''; // W
		isset($_POST['co1031']) ? $worksheet->setColumn($j,$j++,13) : ''; // X
		isset($_POST['co1040']) ? $worksheet->setColumn($j,$j++,18) : ''; // Y
		isset($_POST['co1041']) ? $worksheet->setColumn($j,$j++,18) : ''; // Z
		isset($_POST['co1042']) ? $worksheet->setColumn($j,$j++,13) : ''; // AA
		isset($_POST['co1043']) ? $worksheet->setColumn($j,$j++,18) : ''; // AB
		isset($_POST['co1044']) ? $worksheet->setColumn($j,$j++,11) : ''; // AC
		isset($_POST['co1045']) ? $worksheet->setColumn($j,$j++,20) : ''; // AD
		isset($_POST['co1046']) ? $worksheet->setColumn($j,$j++,20) : ''; // AE
		isset($_POST['co1047']) ? $worksheet->setColumn($j,$j++,20) : ''; // AF
		isset($_POST['co1048']) ? $worksheet->setColumn($j,$j++,20) : ''; // AG
		isset($_POST['co1049']) ? $worksheet->setColumn($j,$j++,20) : ''; // AH
		isset($_POST['co1050']) ? $worksheet->setColumn($j,$j++,21) : ''; // AI
		isset($_POST['co1051']) ? $worksheet->setColumn($j,$j++,17) : ''; // AJ
		isset($_POST['co1052']) ? $worksheet->setColumn($j,$j++,20) : ''; // AK
		isset($_POST['co1053']) ? $worksheet->setColumn($j,$j++,15) : ''; // AL
		isset($_POST['co1054']) ? $worksheet->setColumn($j,$j++,20) : ''; // AM
		isset($_POST['co1055']) ? $worksheet->setColumn($j,$j++,20) : ''; // AN
		isset($_POST['co1056']) ? $worksheet->setColumn($j,$j++,20) : ''; // AO
		isset($_POST['co1057']) ? $worksheet->setColumn($j,$j++,20) : ''; // AP
		isset($_POST['co1058']) ? $worksheet->setColumn($j,$j++,20) : ''; // AQ
		isset($_POST['co1059']) ? $worksheet->setColumn($j,$j++,21) : ''; // AR
		isset($_POST['co1060']) ? $worksheet->setColumn($j,$j++,17) : ''; // AS
		isset($_POST['co1061']) ? $worksheet->setColumn($j,$j++,20) : ''; // AT
		isset($_POST['co1064']) ? $worksheet->setColumn($j,$j++,15) : ''; // AU
		
		// The order headings row
		$i = 0;
		$j = 0;	
		$worksheet->writeString($i, $j++, $this->language->get('column_order_order_id'), $boxFormatText); // A
		$worksheet->writeString($i, $j++, $this->language->get('column_order_date_added'), $boxFormatText); // B
		isset($_POST['co1000']) ? $worksheet->writeString($i, $j++, $this->language->get('column_order_inv_no'), $boxFormatText) : ''; // C
		isset($_POST['co1001']) ? $worksheet->writeString($i, $j++, $this->language->get('column_order_customer_name'), $boxFormatText) : ''; // D
		isset($_POST['co1002']) ? $worksheet->writeString($i, $j++, $this->language->get('column_order_email'), $boxFormatText) : ''; // E
		isset($_POST['co1003']) ? $worksheet->writeString($i, $j++, $this->language->get('column_order_customer_group'), $boxFormatText) : ''; // F
		isset($_POST['co1004']) ? $worksheet->writeString($i, $j++, $this->language->get('column_prod_id'), $boxFormatText) : ''; // G
		isset($_POST['co1005']) ? $worksheet->writeString($i, $j++, $this->language->get('column_prod_sku'), $boxFormatText) : ''; // H
		isset($_POST['co1006']) ? $worksheet->writeString($i, $j++, $this->language->get('column_prod_model'), $boxFormatText) : ''; // I
		isset($_POST['co1007']) ? $worksheet->writeString($i, $j++, $this->language->get('column_prod_name'), $boxFormatText) : ''; // J
		isset($_POST['co1008']) ? $worksheet->writeString($i, $j++, $this->language->get('column_prod_option'), $boxFormatText) : ''; // K
		isset($_POST['co1009']) ? $worksheet->writeString($i, $j++, $this->language->get('column_prod_attributes'), $boxFormatText) : ''; // L
		isset($_POST['co1010']) ? $worksheet->writeString($i, $j++, $this->language->get('column_prod_manu'), $boxFormatText) : ''; // M
		isset($_POST['co1011']) ? $worksheet->writeString($i, $j++, $this->language->get('column_prod_category'), $boxFormatText) : ''; // N
		isset($_POST['co1012']) ? $worksheet->writeString($i, $j++, $this->language->get('column_prod_currency'), $boxFormatText) : ''; // O
		isset($_POST['co1013']) ? $worksheet->writeString($i, $j++, $this->language->get('column_prod_price'), $boxFormatNumber) : ''; // P
		isset($_POST['co1014']) ? $worksheet->writeString($i, $j++, $this->language->get('column_prod_quantity'), $boxFormatNumber) : ''; // Q
		isset($_POST['co1016a']) ? $worksheet->writeString($i, $j++, $this->language->get('column_prod_total_excl_vat'), $boxFormatNumber) : ''; // R		
		isset($_POST['co1015']) ? $worksheet->writeString($i, $j++, $this->language->get('column_prod_tax'), $boxFormatNumber) : ''; // S
		isset($_POST['co1016b']) ? $worksheet->writeString($i, $j++, $this->language->get('column_prod_total_incl_vat'), $boxFormatNumber) : ''; // T
		isset($_POST['co1020']) ? $worksheet->writeString($i, $j++, $this->language->get('column_order_sub_total'), $boxFormatNumber) : ''; // U
		isset($_POST['co1023']) ? $worksheet->writeString($i, $j++, $this->language->get('column_order_shipping'), $boxFormatNumber) : ''; // V
		isset($_POST['co1027']) ? $worksheet->writeString($i, $j++, $this->language->get('column_order_tax'), $boxFormatNumber) : ''; // W
		isset($_POST['co1031']) ? $worksheet->writeString($i, $j++, $this->language->get('column_order_value'), $boxFormatNumber) : ''; // X
		isset($_POST['co1040']) ? $worksheet->writeString($i, $j++, $this->language->get('column_order_shipping_method'), $boxFormatText) : ''; // X
		isset($_POST['co1041']) ? $worksheet->writeString($i, $j++, $this->language->get('column_order_payment_method'), $boxFormatText) : ''; // Z
		isset($_POST['co1042']) ? $worksheet->writeString($i, $j++, $this->language->get('column_order_status'), $boxFormatText) : ''; // AA
		isset($_POST['co1043']) ? $worksheet->writeString($i, $j++, $this->language->get('column_order_store'), $boxFormatText) : ''; // AB
		isset($_POST['co1044']) ? $worksheet->writeString($i, $j++, $this->language->get('column_customer_cust_id'), $boxFormatText) : ''; // AC
		isset($_POST['co1045']) ? $worksheet->writeString($i, $j++, strip_tags($this->language->get('column_billing_name')), $boxFormatText) : ''; // AD
		isset($_POST['co1046']) ? $worksheet->writeString($i, $j++, strip_tags($this->language->get('column_billing_company')), $boxFormatText) : ''; // AE
		isset($_POST['co1047']) ? $worksheet->writeString($i, $j++, strip_tags($this->language->get('column_billing_address_1')), $boxFormatText) : ''; // AF
		isset($_POST['co1048']) ? $worksheet->writeString($i, $j++, strip_tags($this->language->get('column_billing_address_2')), $boxFormatText) : ''; // AG
		isset($_POST['co1049']) ? $worksheet->writeString($i, $j++, strip_tags($this->language->get('column_billing_city')), $boxFormatText) : ''; // AH
		isset($_POST['co1050']) ? $worksheet->writeString($i, $j++, strip_tags($this->language->get('column_billing_zone')), $boxFormatText) : ''; // AI
		isset($_POST['co1051']) ? $worksheet->writeString($i, $j++, strip_tags($this->language->get('column_billing_postcode')), $boxFormatText) : ''; // AJ
		isset($_POST['co1052']) ? $worksheet->writeString($i, $j++, strip_tags($this->language->get('column_billing_country')), $boxFormatText) : ''; // AK
		isset($_POST['co1053']) ? $worksheet->writeString($i, $j++, $this->language->get('column_customer_telephone'), $boxFormatText) : ''; // AL
		isset($_POST['co1054']) ? $worksheet->writeString($i, $j++, strip_tags($this->language->get('column_shipping_name')), $boxFormatText) : ''; // AM
		isset($_POST['co1055']) ? $worksheet->writeString($i, $j++, strip_tags($this->language->get('column_shipping_company')), $boxFormatText) : ''; // AN
		isset($_POST['co1056']) ? $worksheet->writeString($i, $j++, strip_tags($this->language->get('column_shipping_address_1')), $boxFormatText) : ''; // AO
		isset($_POST['co1057']) ? $worksheet->writeString($i, $j++, strip_tags($this->language->get('column_shipping_address_2')), $boxFormatText) : ''; // AP
		isset($_POST['co1058']) ? $worksheet->writeString($i, $j++, strip_tags($this->language->get('column_shipping_city')), $boxFormatText) : ''; // AQ
		isset($_POST['co1059']) ? $worksheet->writeString($i, $j++, strip_tags($this->language->get('column_shipping_zone')), $boxFormatText) : ''; // AR
		isset($_POST['co1060']) ? $worksheet->writeString($i, $j++, strip_tags($this->language->get('column_shipping_postcode')), $boxFormatText) : ''; // AS
		isset($_POST['co1061']) ? $worksheet->writeString($i, $j++, strip_tags($this->language->get('column_shipping_country')), $boxFormatText) : ''; // AT
		isset($_POST['co1064']) ? $worksheet->writeString($i, $j++, $this->language->get('column_order_comment'), $boxFormatText) : ''; // AU

		// The actual orders data
		$i += 1;
		$j = 0;
		
			foreach ($rows as $row) {		
			$excelRow = $i+1;			
				$worksheet->write($i, $j++, $row['order_id'], $numberFormat); // A
				$worksheet->write($i, $j++, date($this->language->get('date_format_short'), strtotime($row['date_added'])), $textFormat); // B
				isset($_POST['co1000']) ? $worksheet->write($i, $j++, $row['invoice_prefix'] . $row['invoice_no'], $textFormat) : ''; // C
				isset($_POST['co1001']) ? $worksheet->write($i, $j++, $row['firstname'] . ' ' . $row['lastname'], $textFormat) : ''; // D
				isset($_POST['co1002']) ? $worksheet->write($i, $j++, $row['email'], $textFormat) : ''; // E
				isset($_POST['co1003']) ? $worksheet->write($i, $j++, $row['order_group'], $textFormat) : ''; // F
				isset($_POST['co1004']) ? $worksheet->write($i, $j++, $row['product_id'], $numberFormat) : ''; // G
				isset($_POST['co1005']) ? $worksheet->write($i, $j++, $row['product_sku'], $textFormat) : ''; // H
				isset($_POST['co1006']) ? $worksheet->write($i, $j++, $row['product_model'], $textFormat) : ''; // I
				isset($_POST['co1007']) ? $worksheet->write($i, $j++, html_entity_decode($row['product_name']), $textFormat) : ''; // J
				isset($_POST['co1008']) ? $worksheet->write($i, $j++, html_entity_decode($row['product_option']), $textFormat) : ''; // K
				isset($_POST['co1009']) ? $worksheet->write($i, $j++, html_entity_decode($row['product_attributes']), $textFormat) : ''; // L
				isset($_POST['co1010']) ? $worksheet->write($i, $j++, html_entity_decode($row['product_manu']), $textFormat) : ''; // M
				isset($_POST['co1011']) ? $worksheet->write($i, $j++, html_entity_decode($row['product_category']), $textFormat) : ''; // N
				isset($_POST['co1012']) ? $worksheet->write($i, $j++, $row['currency_code'], $textFormat) : ''; // O
				isset($_POST['co1013']) ? $worksheet->write($i, $j++, $row['product_price'], $priceFormat) : ''; // P
				isset($_POST['co1014']) ? $worksheet->write($i, $j++, $row['product_quantity']) : ''; // Q
				isset($_POST['co1016a']) ? $worksheet->write($i, $j++, $row['product_total_excl_vat'], $priceFormat) : ''; // R
				isset($_POST['co1015']) ? $worksheet->write($i, $j++, $row['product_tax'], $priceFormat) : ''; // S
				isset($_POST['co1016b']) ? $worksheet->write($i, $j++, $row['product_total_incl_vat'], $priceFormat) : ''; // T
				isset($_POST['co1020']) ? $worksheet->write($i, $j++, $row['order_sub_total'], $priceFormat) : ''; // U
				isset($_POST['co1023']) ? $worksheet->write($i, $j++, $row['order_shipping'] != NULL ? $row['order_shipping'] : '0.00', $priceFormat) : ''; // V
				isset($_POST['co1027']) ? $worksheet->write($i, $j++, $row['order_tax'] != NULL ? $row['order_tax'] : '0.00', $priceFormat) : ''; // W
				isset($_POST['co1031']) ? $worksheet->write($i, $j++, $row['order_value'], $priceFormat) : ''; // X
				isset($_POST['co1040']) ? $worksheet->write($i, $j++, strip_tags($row['shipping_method']), $textFormat) : ''; // Y
				isset($_POST['co1041']) ? $worksheet->write($i, $j++, strip_tags($row['payment_method']), $textFormat) : ''; // Z
				isset($_POST['co1042']) ? $worksheet->write($i, $j++, $row['order_status'], $textFormat) : ''; // AA
				isset($_POST['co1043']) ? $worksheet->write($i, $j++, html_entity_decode($row['store_name']), $textFormat) : ''; // AB
				isset($_POST['co1044']) ? $worksheet->write($i, $j++, $row['customer_id'], $numberFormat) : ''; // AC
				isset($_POST['co1045']) ? $worksheet->write($i, $j++, $row['payment_firstname'] . ' ' . $row['payment_lastname'], $textFormat) : ''; // AD
				isset($_POST['co1046']) ? $worksheet->write($i, $j++, $row['payment_company'], $textFormat) : ''; // AE
				isset($_POST['co1047']) ? $worksheet->write($i, $j++, $row['payment_address_1'], $textFormat) : ''; // AF
				isset($_POST['co1048']) ? $worksheet->write($i, $j++, $row['payment_address_2'], $textFormat) : ''; // AG
				isset($_POST['co1049']) ? $worksheet->write($i, $j++, $row['payment_city'], $textFormat) : ''; // AH
				isset($_POST['co1050']) ? $worksheet->write($i, $j++, $row['payment_zone'], $textFormat) : ''; // AI
				isset($_POST['co1051']) ? $worksheet->write($i, $j++, $row['payment_postcode'], $textFormat) : ''; // AJ
				isset($_POST['co1052']) ? $worksheet->write($i, $j++, $row['payment_country'], $textFormat) : ''; // AK
				isset($_POST['co1053']) ? $worksheet->write($i, $j++, $row['telephone'], $textFormat) : ''; // AL
				isset($_POST['co1054']) ? $worksheet->write($i, $j++, $row['shipping_firstname'] . ' ' . $row['shipping_lastname'], $textFormat) : ''; // AM
				isset($_POST['co1055']) ? $worksheet->write($i, $j++, $row['shipping_company'], $textFormat) : ''; // AN
				isset($_POST['co1056']) ? $worksheet->write($i, $j++, $row['shipping_address_1'], $textFormat) : ''; // AO
				isset($_POST['co1057']) ? $worksheet->write($i, $j++, $row['shipping_address_2'], $textFormat) : ''; // AP
				isset($_POST['co1058']) ? $worksheet->write($i, $j++, $row['shipping_city'], $textFormat) : ''; // AQ
				isset($_POST['co1059']) ? $worksheet->write($i, $j++, $row['shipping_zone'], $textFormat) : ''; // AR
				isset($_POST['co1060']) ? $worksheet->write($i, $j++, $row['shipping_postcode'], $textFormat) : ''; // AS
				isset($_POST['co1061']) ? $worksheet->write($i, $j++, $row['shipping_country'], $textFormat) : ''; // AT
				isset($_POST['co1064']) ? $worksheet->write($i, $j++, html_entity_decode($row['comment']), $textFormat) : ''; // AU

				$i += 1;
				$j = 0;
			}
		
		$worksheet->freezePanes(array(1, 1, 1, 1));
		
		// Let's send the file		
		$workbook->close();
		
		// Clear the spreadsheet caches
		$this->clearSpreadsheetCache();
		exit;
?>