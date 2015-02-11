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
		$workbook->send('customer_order_report_'.date("Y-m-d",time()).'.xls');
		
		$worksheet =& $workbook->addWorksheet('Customer Orders Report');
		$worksheet->setInputEncoding('UTF-8');
		$worksheet->setZoom(90);

		// Set the column widths
		$j = 0;
		if ($filter_group == 'year') {	
		$worksheet->setMerge(0, 1, 0, 1);
		$worksheet->setColumn($j,$j++,10); // A,B
		} elseif ($filter_group == 'quarter') {
		$worksheet->setColumn($j,$j++,10); // A
		$worksheet->setColumn($j,$j++,10); // B			
		} elseif ($filter_group == 'month') {
		$worksheet->setColumn($j,$j++,10); // A
		$worksheet->setColumn($j,$j++,13); // B
		} elseif ($filter_group == 'day') {
		$worksheet->setMerge(0, 1, 0, 1);
		$worksheet->setColumn($j,$j++,13); // A,B
		} elseif ($filter_group == 'order') {
		$worksheet->setColumn($j,$j++,10); // A
		$worksheet->setColumn($j,$j++,13); // B
		} else {
		$worksheet->setColumn($j,$j++,13); // A
		$worksheet->setColumn($j,$j++,13); // B
		}
		isset($_POST['co20']) ? $worksheet->setColumn($j,$j++,10) : ''; // C
		isset($_POST['co21']) ? $worksheet->setColumn($j,$j++,25) : ''; // D
		isset($_POST['co22']) ? $worksheet->setColumn($j,$j++,20) : ''; // E
		isset($_POST['co35']) ? $worksheet->setColumn($j,$j++,15) : ''; // F
		isset($_POST['co34']) ? $worksheet->setColumn($j,$j++,20) : ''; // G
		isset($_POST['co23']) ? $worksheet->setColumn($j,$j++,15) : ''; // H
		isset($_POST['co24']) ? $worksheet->setColumn($j,$j++,15) : ''; // I
		isset($_POST['co25']) ? $worksheet->setColumn($j,$j++,13) : ''; // J
		isset($_POST['co26']) ? $worksheet->setColumn($j,$j++,13) : ''; // K
		isset($_POST['co27']) ? $worksheet->setColumn($j,$j++,10) : ''; // L
		isset($_POST['co28']) ? $worksheet->setColumn($j,$j++,10) : ''; // M
		isset($_POST['co30']) ? $worksheet->setColumn($j,$j++,13) : ''; // N
		
		// The order headings row
		$i = 0;
		$j = 0;	
		if ($filter_group == 'year') {	
		$worksheet->writeString($i, $j++, $this->language->get('column_year'), $boxFormatText); // A,B
		} elseif ($filter_group == 'quarter') {
		$worksheet->writeString($i, $j++, $this->language->get('column_year'), $boxFormatText); // A
		$worksheet->writeString($i, $j++, $this->language->get('column_quarter'), $boxFormatText); // B		
		} elseif ($filter_group == 'month') {
		$worksheet->writeString($i, $j++, $this->language->get('column_year'), $boxFormatText); // A
		$worksheet->writeString($i, $j++, $this->language->get('column_month'), $boxFormatText); // B
		} elseif ($filter_group == 'day') {
		$worksheet->writeString($i, $j++, $this->language->get('column_date'), $boxFormatText); // A,B
		} elseif ($filter_group == 'order') {
		$worksheet->writeString($i, $j++, $this->language->get('column_order_order_id'), $boxFormatText); // A
		$worksheet->writeString($i, $j++, $this->language->get('column_order_date_added'), $boxFormatText); // B
		} else {
		$worksheet->writeString($i, $j++, $this->language->get('column_date_start'), $boxFormatText); // A
		$worksheet->writeString($i, $j++, $this->language->get('column_date_end'), $boxFormatText); // B
		}
		isset($_POST['co20']) ? $worksheet->writeString($i, $j++, $this->language->get('column_id'), $boxFormatText) : ''; // C
		isset($_POST['co21']) ? $worksheet->writeString($i, $j++, $this->language->get('column_customer')." / ".$this->language->get('column_company'), $boxFormatText) : ''; // D
		isset($_POST['co22']) ? $worksheet->writeString($i, $j++, $this->language->get('column_email'), $boxFormatText) : ''; // E
		isset($_POST['co35']) ? $worksheet->writeString($i, $j++, $this->language->get('column_telephone'), $boxFormatText) : ''; // F
		isset($_POST['co34']) ? $worksheet->writeString($i, $j++, $this->language->get('column_country'), $boxFormatText) : ''; // G
		isset($_POST['co23']) ? $worksheet->writeString($i, $j++, $this->language->get('column_customer_group'), $boxFormatText) : ''; // H
		isset($_POST['co24']) ? $worksheet->writeString($i, $j++, $this->language->get('column_status'), $boxFormatText) : ''; // I
		isset($_POST['co25']) ? $worksheet->writeString($i, $j++, $this->language->get('column_ip'), $boxFormatText) : ''; // J
		isset($_POST['co26']) ? $worksheet->writeString($i, $j++, $this->language->get('column_mostrecent'), $boxFormatText) : ''; // K
		isset($_POST['co27']) ? $worksheet->writeString($i, $j++, $this->language->get('column_orders'), $boxFormatNumber) : ''; // L
		isset($_POST['co28']) ? $worksheet->writeString($i, $j++, $this->language->get('column_products'), $boxFormatNumber) : ''; // M
		isset($_POST['co30']) ? $worksheet->writeString($i, $j++, $this->language->get('column_value'), $boxFormatNumber) : ''; // N
		
		// The actual orders data
		$i += 1;
		$j = 0;
		
			foreach ($results as $result) {		
			$excelRow = $i+1;
				if ($filter_group == 'year') {	
				$worksheet->write($i, $j++, $result['year'], $textFormat); // A,B
				} elseif ($filter_group == 'quarter') {
				$worksheet->write($i, $j++, $result['year'], $textFormat); // A
				$worksheet->write($i, $j++, 'Q' . $result['quarter'], $textFormat); // B				
				} elseif ($filter_group == 'month') {
				$worksheet->write($i, $j++, $result['year'], $textFormat); // A
				$worksheet->write($i, $j++, $result['month'], $textFormat); // B
				} elseif ($filter_group == 'day') {
				$worksheet->write($i, $j++, date($this->language->get('date_format_short'), strtotime($result['date_start'])), $textFormat); // A,B
				} elseif ($filter_group == 'order') {
				$worksheet->write($i, $j++, $result['order_id'], $textFormat); // A
				$worksheet->write($i, $j++, date($this->language->get('date_format_short'), strtotime($result['date_start'])), $textFormat); // B
				} else {
				$worksheet->write($i, $j++, date($this->language->get('date_format_short'), strtotime($result['date_start'])), $textFormat); // A
				$worksheet->write($i, $j++, date($this->language->get('date_format_short'), strtotime($result['date_end'])), $textFormat); // B	
				}			
				isset($_POST['co20']) ? $worksheet->write($i, $j++, ($result['customer_id'] > 0 ? $result['customer_id'] : $this->language->get('text_guest')), $textFormat) : ''; // C
				isset($_POST['co21']) ? $worksheet->write($i, $j++, ($result['cust_company'] ? $result['cust_name']." / ".$result['cust_company'] : $result['cust_name'])) : ''; // D
				isset($_POST['co22']) ? $worksheet->write($i, $j++, $result['cust_email']) : ''; // E
				isset($_POST['co35']) ? $worksheet->write($i, $j++, $result['cust_telephone'], $textFormat) : ''; // F
				isset($_POST['co34']) ? $worksheet->write($i, $j++, $result['cust_country']) : ''; // G
				if ($result['customer_id'] == 0) {
					isset($_POST['co23']) ? $worksheet->write($i, $j++, $result['cust_group_guest']) : ''; // H
				} else {
					isset($_POST['co23']) ? $worksheet->write($i, $j++, $result['cust_group_reg']) : ''; // H
				}
				if (!$result['customer_id'] == 0) {
					isset($_POST['co24']) ? $worksheet->write($i, $j++, ($result['cust_status'] ? $this->language->get('text_enabled') : $this->language->get('text_disabled'))) : ''; // I
				} else {
					isset($_POST['co24']) ? $worksheet->write($i, $j++, "") : ''; // I
				}					
				isset($_POST['co25']) ? $worksheet->write($i, $j++, $result['cust_ip']) : ''; // J
				isset($_POST['co26']) ? $worksheet->write($i, $j++, date($this->language->get('date_format_short'), strtotime($result['mostrecent']))) : ''; // K
				isset($_POST['co27']) ? $worksheet->write($i, $j++, $result['orders']) : ''; // L
				isset($_POST['co28']) ? $worksheet->write($i, $j++, $result['products']) : ''; // M
				isset($_POST['co30']) ? $worksheet->write($i, $j++, $result['total'], $priceFormat) : ''; // N

				$i += 1;
				$j = 0;
			}
		
		$worksheet->freezePanes(array(1, 0, 1, 0));
		
		// Let's send the file		
		$workbook->close();
		
		// Clear the spreadsheet caches
		$this->clearSpreadsheetCache();
		exit;
?>