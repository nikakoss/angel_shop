<?php
ini_set("memory_limit","256M");

	$this->objPHPExcel = new PHPExcel();
	$this->objPHPExcel->getActiveSheet()->setTitle('Customer Orders Report');
	$this->mainCounter = 1;
	if ($this->mainCounter == 1) {
		 $this->objPHPExcel->getProperties()->setCreator("ADV Reports & Statistics")
										 	->setLastModifiedBy("ADV Reports & Statistics")
										 	->setTitle("ADV Customer Orders Report")
										 	->setSubject("ADV Customer Orders Report")
										 	->setDescription("Export of ADV Customer Orders Report without details.")
										 	->setKeywords("office 2007 excel")
										 	->setCategory("www.opencartreports.com");
											   
		 $this->objPHPExcel->setActiveSheetIndex(0);

		 if ($filter_group == 'year') {
		 $this->objPHPExcel->getActiveSheet()->mergeCells('A' . $this->mainCounter.":".'B' . $this->mainCounter);
		 $this->objPHPExcel->getActiveSheet()->getStyle('A' . $this->mainCounter)->getFont()->setBold(true);
		 $this->objPHPExcel->getActiveSheet()->getStyle('A' . $this->mainCounter)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_RIGHT);		 
		 $this->objPHPExcel->getActiveSheet()->setCellValue('A' . $this->mainCounter, $this->language->get('column_year'));
		 $this->objPHPExcel->getActiveSheet()->getColumnDimension('A')->setAutoSize(true);		 
		 } elseif ($filter_group == 'quarter') {
		 $this->objPHPExcel->getActiveSheet()->setCellValue('A' . $this->mainCounter, $this->language->get('column_year'));
		 $this->objPHPExcel->getActiveSheet()->getStyle('A' . $this->mainCounter)->getFont()->setBold(true);
		 $this->objPHPExcel->getActiveSheet()->getStyle('A' . $this->mainCounter)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_RIGHT);		 
		 $this->objPHPExcel->getActiveSheet()->getColumnDimension('A')->setAutoSize(true);		 
		 $this->objPHPExcel->getActiveSheet()->setCellValue('B' . $this->mainCounter, $this->language->get('column_quarter'));
		 $this->objPHPExcel->getActiveSheet()->getStyle('B' . $this->mainCounter)->getFont()->setBold(true);		 
		 $this->objPHPExcel->getActiveSheet()->getColumnDimension('B')->setAutoSize(true);		 
		 } elseif ($filter_group == 'month') {
		 $this->objPHPExcel->getActiveSheet()->setCellValue('A' . $this->mainCounter, $this->language->get('column_year'));
		 $this->objPHPExcel->getActiveSheet()->getStyle('A' . $this->mainCounter)->getFont()->setBold(true);
		 $this->objPHPExcel->getActiveSheet()->getStyle('A' . $this->mainCounter)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_RIGHT);		 
		 $this->objPHPExcel->getActiveSheet()->getColumnDimension('A')->setAutoSize(true);		 
		 $this->objPHPExcel->getActiveSheet()->setCellValue('B' . $this->mainCounter, $this->language->get('column_month'));
		 $this->objPHPExcel->getActiveSheet()->getStyle('B' . $this->mainCounter)->getFont()->setBold(true);		 
		 $this->objPHPExcel->getActiveSheet()->getColumnDimension('B')->setAutoSize(true);		 
		 } elseif ($filter_group == 'day') {
		 $this->objPHPExcel->getActiveSheet()->mergeCells('A' . $this->mainCounter.":".'B' . $this->mainCounter);
		 $this->objPHPExcel->getActiveSheet()->getStyle('A' . $this->mainCounter)->getFont()->setBold(true);		 
		 $this->objPHPExcel->getActiveSheet()->setCellValue('A' . $this->mainCounter, $this->language->get('column_date'));
		 $this->objPHPExcel->getActiveSheet()->getColumnDimension('A')->setAutoSize(true);		 
		 } elseif ($filter_group == 'order') {
		 $this->objPHPExcel->getActiveSheet()->setCellValue('A' . $this->mainCounter, $this->language->get('column_order_order_id'));
		 $this->objPHPExcel->getActiveSheet()->getStyle('A' . $this->mainCounter)->getFont()->setBold(true);
		 $this->objPHPExcel->getActiveSheet()->getStyle('A' . $this->mainCounter)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_RIGHT);		 
		 $this->objPHPExcel->getActiveSheet()->getColumnDimension('A')->setAutoSize(true);		 
		 $this->objPHPExcel->getActiveSheet()->setCellValue('B' . $this->mainCounter, $this->language->get('column_order_date_added'));
		 $this->objPHPExcel->getActiveSheet()->getStyle('B' . $this->mainCounter)->getFont()->setBold(true);		 
		 $this->objPHPExcel->getActiveSheet()->getColumnDimension('B')->setAutoSize(true);		 
		 } else {
		 $this->objPHPExcel->getActiveSheet()->setCellValue('A' . $this->mainCounter, $this->language->get('column_date_start'));
		 $this->objPHPExcel->getActiveSheet()->getStyle('A' . $this->mainCounter)->getFont()->setBold(true);		 
		 $this->objPHPExcel->getActiveSheet()->getColumnDimension('A')->setAutoSize(true);		 
		 $this->objPHPExcel->getActiveSheet()->setCellValue('B' . $this->mainCounter, $this->language->get('column_date_end'));	
		 $this->objPHPExcel->getActiveSheet()->getStyle('B' . $this->mainCounter)->getFont()->setBold(true);		 
		 $this->objPHPExcel->getActiveSheet()->getColumnDimension('B')->setAutoSize(true);		 
		 }
		 
		 $this->objPHPExcel->getActiveSheet()->setCellValue('C' . $this->mainCounter, $this->language->get('column_id'));
		 $this->objPHPExcel->getActiveSheet()->getStyle('C' . $this->mainCounter)->getFont()->setBold(true);
		 $this->objPHPExcel->getActiveSheet()->getColumnDimension('C')->setAutoSize(true);	
		  
		 $this->objPHPExcel->getActiveSheet()->setCellValue('D' . $this->mainCounter, $this->language->get('column_customer')." / ".$this->language->get('column_company'));
		 $this->objPHPExcel->getActiveSheet()->getStyle('D' . $this->mainCounter)->getFont()->setBold(true);
		 $this->objPHPExcel->getActiveSheet()->getColumnDimension('D')->setAutoSize(true);	
		 
		 $this->objPHPExcel->getActiveSheet()->setCellValue('E' . $this->mainCounter, $this->language->get('column_email'));
		 $this->objPHPExcel->getActiveSheet()->getStyle('E' . $this->mainCounter)->getFont()->setBold(true);
		 $this->objPHPExcel->getActiveSheet()->getColumnDimension('E')->setAutoSize(true);
		 
		 $this->objPHPExcel->getActiveSheet()->setCellValue('F' . $this->mainCounter, $this->language->get('column_telephone'));
		 $this->objPHPExcel->getActiveSheet()->getStyle('F' . $this->mainCounter)->getFont()->setBold(true);
		 $this->objPHPExcel->getActiveSheet()->getColumnDimension('F')->setAutoSize(true);
		 
		 $this->objPHPExcel->getActiveSheet()->setCellValue('G' . $this->mainCounter, $this->language->get('column_country'));
		 $this->objPHPExcel->getActiveSheet()->getStyle('G' . $this->mainCounter)->getFont()->setBold(true);
		 $this->objPHPExcel->getActiveSheet()->getColumnDimension('G')->setAutoSize(true);
		 
		 $this->objPHPExcel->getActiveSheet()->setCellValue('H' . $this->mainCounter, $this->language->get('column_customer_group'));
		 $this->objPHPExcel->getActiveSheet()->getStyle('H' . $this->mainCounter)->getFont()->setBold(true);
		 $this->objPHPExcel->getActiveSheet()->getColumnDimension('H')->setAutoSize(true);
		 
		 $this->objPHPExcel->getActiveSheet()->setCellValue('I' . $this->mainCounter, $this->language->get('column_status'));
		 $this->objPHPExcel->getActiveSheet()->getStyle('I' . $this->mainCounter)->getFont()->setBold(true);
		 $this->objPHPExcel->getActiveSheet()->getColumnDimension('I')->setAutoSize(true);
		 
		 $this->objPHPExcel->getActiveSheet()->setCellValue('J' . $this->mainCounter, $this->language->get('column_ip'));
		 $this->objPHPExcel->getActiveSheet()->getStyle('J' . $this->mainCounter)->getFont()->setBold(true);
		 $this->objPHPExcel->getActiveSheet()->getColumnDimension('J')->setAutoSize(true);
		 
		 $this->objPHPExcel->getActiveSheet()->setCellValue('K' . $this->mainCounter, $this->language->get('column_mostrecent'));
		 $this->objPHPExcel->getActiveSheet()->getStyle('K' . $this->mainCounter)->getFont()->setBold(true);
		 $this->objPHPExcel->getActiveSheet()->getColumnDimension('K')->setAutoSize(true);
		 
		 $this->objPHPExcel->getActiveSheet()->setCellValue('L' . $this->mainCounter, $this->language->get('column_orders'));
		 $this->objPHPExcel->getActiveSheet()->getStyle('L' . $this->mainCounter)->getFont()->setBold(true);
		 $this->objPHPExcel->getActiveSheet()->getStyle('L' . $this->mainCounter)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_RIGHT);		 
		 $this->objPHPExcel->getActiveSheet()->getColumnDimension('L')->setAutoSize(true);
		 
		 $this->objPHPExcel->getActiveSheet()->setCellValue('M' . $this->mainCounter, $this->language->get('column_products'));
		 $this->objPHPExcel->getActiveSheet()->getStyle('M' . $this->mainCounter)->getFont()->setBold(true);
		 $this->objPHPExcel->getActiveSheet()->getStyle('M' . $this->mainCounter)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_RIGHT);		 
		 $this->objPHPExcel->getActiveSheet()->getColumnDimension('M')->setAutoSize(true);
		 
		 $this->objPHPExcel->getActiveSheet()->setCellValue('N' . $this->mainCounter, $this->language->get('column_value'));
		 $this->objPHPExcel->getActiveSheet()->getStyle('N' . $this->mainCounter)->getFont()->setBold(true);
		 $this->objPHPExcel->getActiveSheet()->getStyle('N' . $this->mainCounter)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_RIGHT);		 
		 $this->objPHPExcel->getActiveSheet()->getColumnDimension('N')->setAutoSize(true);

		$this->objPHPExcel->getActiveSheet()->freezePane('A2');		 
	}
	
	$counter  = $this->mainCounter+1;
		
	foreach ($results as $result) {

		if ($filter_group == 'year') {
		$this->objPHPExcel->getActiveSheet()->mergeCells('A' . $counter.":".'B' . $counter);
		$this->objPHPExcel->getActiveSheet()->setCellValue('A' . $counter, $result['year']);
		} elseif ($filter_group == 'quarter') {
		$this->objPHPExcel->getActiveSheet()->setCellValue('A' . $counter, $result['year']);
		$this->objPHPExcel->getActiveSheet()->setCellValue('B' . $counter, 'Q' . $result['quarter']);			
		} elseif ($filter_group == 'month') {
		$this->objPHPExcel->getActiveSheet()->setCellValue('A' . $counter, $result['year']);
		$this->objPHPExcel->getActiveSheet()->setCellValue('B' . $counter, $result['month']);
		} elseif ($filter_group == 'day') {
		$this->objPHPExcel->getActiveSheet()->mergeCells('A' . $counter.":".'B' . $counter);
		$this->objPHPExcel->getActiveSheet()->setCellValue('A' . $counter, date($this->language->get('date_format_short'), strtotime($result['date_start'])));
		} elseif ($filter_group == 'order') {
		$this->objPHPExcel->getActiveSheet()->setCellValue('A' . $counter, $result['order_id']);
		$this->objPHPExcel->getActiveSheet()->setCellValue('B' . $counter, date($this->language->get('date_format_short'), strtotime($result['date_start'])));
		} else {
		$this->objPHPExcel->getActiveSheet()->setCellValue('A' . $counter, date($this->language->get('date_format_short'), strtotime($result['date_start'])));
		$this->objPHPExcel->getActiveSheet()->setCellValue('B' . $counter, date($this->language->get('date_format_short'), strtotime($result['date_end'])));			 
		}

		$this->objPHPExcel->getActiveSheet()->getStyle('C' . $counter)->getNumberFormat()->setFormatCode(PHPExcel_Style_NumberFormat::FORMAT_TEXT);
		$this->objPHPExcel->getActiveSheet()->setCellValue('C' . $counter, ($result['customer_id'] > 0 ? $result['customer_id'] : $this->language->get('text_guest')));

		$this->objPHPExcel->getActiveSheet()->setCellValue('D' . $counter, ($result['cust_company'] ? $result['cust_name']." / ".$result['cust_company'] : $result['cust_name']));
		
		$this->objPHPExcel->getActiveSheet()->setCellValue('E' . $counter, $result['cust_email']);
		
		$this->objPHPExcel->getActiveSheet()->getStyle('F' . $counter)->getNumberFormat()->setFormatCode(PHPExcel_Style_NumberFormat::FORMAT_TEXT);
		$this->objPHPExcel->getActiveSheet()->setCellValue('F' . $counter, $result['cust_telephone']);
		
		$this->objPHPExcel->getActiveSheet()->setCellValue('G' . $counter, $result['cust_country']);

		if ($result['customer_id'] == 0) {
			$this->objPHPExcel->getActiveSheet()->setCellValue('H' . $counter, $result['cust_group_guest']);
		} else {
			$this->objPHPExcel->getActiveSheet()->setCellValue('H' . $counter, $result['cust_group_reg']);
		}
				
		if (!$result['customer_id'] == 0) {
		$this->objPHPExcel->getActiveSheet()->setCellValue('I' . $counter, ($result['cust_status'] ? $this->language->get('text_enabled') : $this->language->get('text_disabled')));
		} else {
		$this->objPHPExcel->getActiveSheet()->setCellValue('I' . $counter, "");
		}
		
		$this->objPHPExcel->getActiveSheet()->setCellValue('J' . $counter, $result['cust_ip']);
		
		$this->objPHPExcel->getActiveSheet()->setCellValue('K' . $counter, date($this->language->get('date_format_short'), strtotime($result['mostrecent'])));
		
		$this->objPHPExcel->getActiveSheet()->setCellValue('L' . $counter, $result['orders']);
		
		$this->objPHPExcel->getActiveSheet()->setCellValue('M' . $counter, $result['products']);
		
		$this->objPHPExcel->getActiveSheet()->getStyle('N' . $counter)->getNumberFormat()->setFormatCode('0.00');
		$this->objPHPExcel->getActiveSheet()->setCellValue('N' . $counter, $result['total']);
		
		$counter++;
		$this->mainCounter++;
	}
	
	if (!isset($_POST['co30'])) {
		$this->objPHPExcel->getActiveSheet()->removeColumn('N');	
	}
	
	if (!isset($_POST['co28'])) {
		$this->objPHPExcel->getActiveSheet()->removeColumn('M');	
	}
	
	if (!isset($_POST['co27'])) {
		$this->objPHPExcel->getActiveSheet()->removeColumn('L');	
	}
	
	if (!isset($_POST['co26'])) {
		$this->objPHPExcel->getActiveSheet()->removeColumn('K');	
	}
	
	if (!isset($_POST['co25'])) {
		$this->objPHPExcel->getActiveSheet()->removeColumn('J');	
	}
	
	if (!isset($_POST['co24'])) {
		$this->objPHPExcel->getActiveSheet()->removeColumn('I');	
	}
	
	if (!isset($_POST['co23'])) {
		$this->objPHPExcel->getActiveSheet()->removeColumn('H');	
	}
	
	if (!isset($_POST['co34'])) {
		$this->objPHPExcel->getActiveSheet()->removeColumn('G');	
	}
	
	if (!isset($_POST['co35'])) {
		$this->objPHPExcel->getActiveSheet()->removeColumn('F');
	}
	
	if (!isset($_POST['co22'])) {
		$this->objPHPExcel->getActiveSheet()->removeColumn('E');	
	}
	
	if (!isset($_POST['co21'])) {
		$this->objPHPExcel->getActiveSheet()->removeColumn('D');	
	}
	
	if (!isset($_POST['co20'])) {
		$this->objPHPExcel->getActiveSheet()->removeColumn('C');	
	}

	if (!isset($_POST['co30'])) {
		$lastCellA = $this->objPHPExcel->getActiveSheet()->getHighestDataColumn();	
		$lastCellB = $this->objPHPExcel->getActiveSheet()->getHighestDataRow();
		$this->objPHPExcel->getActiveSheet()->getCellCacheController()->deleteCacheData($lastCellA . $lastCellB);
	}
	
$filename = "customer_order_report_".date("Y-m-d",time());
header('Expires: 0');
header('Cache-control: private');
header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet; charset=UTF-8; encoding=UTF-8');
header('Content-Disposition: attachment;filename='.$filename.".xlsx");
header('Content-Transfer-Encoding: UTF-8');
header('Cache-Control: max-age=0');

$objWriter = PHPExcel_IOFactory::createWriter($this->objPHPExcel, 'Excel2007');
$objWriter->save('php://output');
exit();
?>