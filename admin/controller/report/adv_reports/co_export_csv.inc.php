<?php
ini_set("memory_limit","256M");

	$this->data['decimal_point'] = $this->language->get('decimal_point');
	if ($this->data['decimal_point'] == ',') {
	$csv_separator = ";";
	} else {
	$csv_separator = ",";
	}
	$csv_enclosed = '"';
	$csv_row = "\n";	

	if ($filter_group == 'year') {
	$export_csv = $csv_enclosed . $this->language->get('column_year') . $csv_enclosed;
	} elseif ($filter_group == 'quarter') {
	$export_csv = $csv_enclosed . $this->language->get('column_year') . $csv_enclosed;				
	$export_csv .= $csv_separator . $csv_enclosed . $this->language->get('column_quarter') . $csv_enclosed;			
	} elseif ($filter_group == 'month') {
	$export_csv = $csv_enclosed . $this->language->get('column_year') . $csv_enclosed;			
	$export_csv .= $csv_separator . $csv_enclosed . $this->language->get('column_month') . $csv_enclosed;	
	} elseif ($filter_group == 'day') {
	$export_csv = $csv_enclosed . $this->language->get('column_date') . $csv_enclosed;
	} elseif ($filter_group == 'order') {
	$export_csv = $csv_enclosed . $this->language->get('column_order_order_id') . $csv_enclosed;				
	$export_csv .= $csv_separator . $csv_enclosed . $this->language->get('column_order_date_added') . $csv_enclosed;	
	} else {
	$export_csv = $csv_enclosed . $this->language->get('column_date_start') . $csv_enclosed;					
	$export_csv .= $csv_separator . $csv_enclosed . $this->language->get('column_date_end') . $csv_enclosed;	
	}
	isset($_POST['co20']) ? $export_csv .= $csv_separator . $csv_enclosed . $this->language->get('column_id') . $csv_enclosed : '';
	isset($_POST['co21']) ? $export_csv .= $csv_separator . $csv_enclosed . $this->language->get('column_customer')." / ".$this->language->get('column_company') . $csv_enclosed : '';
	isset($_POST['co22']) ? $export_csv .= $csv_separator . $csv_enclosed . $this->language->get('column_email') . $csv_enclosed : '';
	isset($_POST['co35']) ? $export_csv .= $csv_separator . $csv_enclosed . $this->language->get('column_telephone') . $csv_enclosed : '';
	isset($_POST['co34']) ? $export_csv .= $csv_separator . $csv_enclosed . $this->language->get('column_country') . $csv_enclosed : '';
	isset($_POST['co23']) ? $export_csv .= $csv_separator . $csv_enclosed . $this->language->get('column_customer_group') . $csv_enclosed : '';
	isset($_POST['co24']) ? $export_csv .= $csv_separator . $csv_enclosed . $this->language->get('column_status') . $csv_enclosed : '';	
	isset($_POST['co25']) ? $export_csv .= $csv_separator . $csv_enclosed . $this->language->get('column_ip') . $csv_enclosed : '';
	isset($_POST['co26']) ? $export_csv .= $csv_separator . $csv_enclosed . $this->language->get('column_mostrecent') . $csv_enclosed : '';
	isset($_POST['co27']) ? $export_csv .= $csv_separator . $csv_enclosed . $this->language->get('column_orders') . $csv_enclosed : '';
	isset($_POST['co28']) ? $export_csv .= $csv_separator . $csv_enclosed . $this->language->get('column_products') . $csv_enclosed : '';
	isset($_POST['co30']) ? $export_csv .= $csv_separator . $csv_enclosed . $this->language->get('column_value') . $csv_enclosed : '';
	$export_csv .= $csv_row;

	foreach ($results as $result) {
	if ($filter_group == 'year') {				
	$export_csv .= $csv_enclosed . $result['year'] . $csv_enclosed;
	} elseif ($filter_group == 'quarter') {
	$export_csv .= $csv_enclosed . $result['year'] . $csv_enclosed;				
	$export_csv .= $csv_separator . $csv_enclosed . 'Q' . $result['quarter'] . $csv_enclosed;			
	} elseif ($filter_group == 'month') {
	$export_csv .= $csv_enclosed . $result['year'] . $csv_enclosed;			
	$export_csv .= $csv_separator . $csv_enclosed . $result['month'] . $csv_enclosed;	
	} elseif ($filter_group == 'day') {
	$export_csv .= $csv_enclosed . date($this->language->get('date_format_short'), strtotime($result['date_start'])) . $csv_enclosed;
	} elseif ($filter_group == 'order') {
	$export_csv .= $csv_enclosed . $result['order_id'] . $csv_enclosed;				
	$export_csv .= $csv_separator . $csv_enclosed . date($this->language->get('date_format_short'), strtotime($result['date_start'])) . $csv_enclosed;	
	} else {
	$export_csv .= $csv_enclosed . date($this->language->get('date_format_short'), strtotime($result['date_start'])) . $csv_enclosed;					
	$export_csv .= $csv_separator . $csv_enclosed . date($this->language->get('date_format_short'), strtotime($result['date_end'])) . $csv_enclosed;	
	}
	isset($_POST['co20']) ? $export_csv .= $csv_separator . $csv_enclosed . ($result['customer_id'] > 0 ? $result['customer_id'] : $this->language->get('text_guest')) . $csv_enclosed : '';
	isset($_POST['co21']) ? $export_csv .= $csv_separator . $csv_enclosed . ($result['cust_company'] ? $result['cust_name']." / ".$result['cust_company'] : $result['cust_name']) . $csv_enclosed : '';
	isset($_POST['co22']) ? $export_csv .= $csv_separator . $csv_enclosed . $result['cust_email'] . $csv_enclosed : '';
	isset($_POST['co35']) ? $export_csv .= $csv_separator . $csv_enclosed . $result['cust_telephone'] . $csv_enclosed : '';
	isset($_POST['co34']) ? $export_csv .= $csv_separator . $csv_enclosed . $result['cust_country'] . $csv_enclosed : '';
	if ($result['customer_id'] == 0) {
		isset($_POST['co23']) ? $export_csv .= $csv_separator . $csv_enclosed . $result['cust_group_guest'] . $csv_enclosed : '';
	} else {
		isset($_POST['co23']) ? $export_csv .= $csv_separator . $csv_enclosed . $result['cust_group_reg'] . $csv_enclosed : '';
	}
	if (!$result['customer_id'] == 0) {
		isset($_POST['co24']) ? $export_csv .= $csv_separator . $csv_enclosed . ($result['cust_status'] ? $this->language->get('text_enabled') : $this->language->get('text_disabled')) . $csv_enclosed : '';
	} else {
		isset($_POST['co24']) ? $export_csv .= $csv_separator . $csv_enclosed . "" . $csv_enclosed : '';
	}	
	isset($_POST['co25']) ? $export_csv .= $csv_separator . $csv_enclosed . $result['cust_ip'] . $csv_enclosed : '';
	isset($_POST['co26']) ? $export_csv .= $csv_separator . $csv_enclosed . date($this->language->get('date_format_short'), strtotime($result['mostrecent'])) . $csv_enclosed : '';
	isset($_POST['co27']) ? $export_csv .= $csv_separator . $csv_enclosed . number_format($result['orders']) . $csv_enclosed : '';
	isset($_POST['co28']) ? $export_csv .= $csv_separator . $csv_enclosed . number_format($result['products']) . $csv_enclosed : '';
	isset($_POST['co30']) ? $export_csv .= $csv_separator . $csv_enclosed . number_format($result['total'], 2) . $csv_enclosed : '';	
	$export_csv .= $csv_row;
	}

$filename = "customer_order_report_".date("Y-m-d",time());
header('Pragma: public');
header('Expires: 0');
header('Content-Description: File Transfer');
header('Content-Type: text/csv; charset=utf-8');
header('Cache-Control: must-revalidate, post-check=0, pre-check=0');		
header('Content-Disposition: attachment; filename='.$filename.".csv");
print $export_csv;			
exit;
?>