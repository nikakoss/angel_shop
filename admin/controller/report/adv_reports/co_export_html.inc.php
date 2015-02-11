<?php
ini_set("memory_limit","256M");
	
	$export_html ="<html><head>";
	$export_html .="<meta http-equiv='Content-Type' content='text/html; charset=utf-8'>";
	$export_html .="</head>";
	$export_html .="<body>";
	$export_html .="<style type='text/css'>
	.list_main {
		border-collapse: collapse;
		width: 100%;
		border-top: 1px solid #DDDDDD;
		border-left: 1px solid #DDDDDD;	
		font-family: Arial, Helvetica, sans-serif;
		font-size: 12px;
	}
	.list_main td {
		border-right: 1px solid #DDDDDD;
		border-bottom: 1px solid #DDDDDD;	
	}
	.list_main thead td {
		background-color: #E5E5E5;
		padding: 3px;
		font-weight: bold;
	}
	.list_main tbody a {
		text-decoration: none;
	}
	.list_main tbody td {
		vertical-align: middle;
		padding: 3px;
	}

	.total {
		background-color: #E7EFEF;
		color: #003A88;
		font-weight: bold;
	}
	</style>";
	$export_html .="<table class='list_main'>";
	$export_html .="<thead>";
	$export_html .="<tr>";
	if ($filter_group == 'year') {				
	$export_html .= "<td colspan='2' align='left' nowrap='nowrap'>".$this->language->get('column_year')."</td>";
	} elseif ($filter_group == 'quarter') {
	$export_html .= "<td align='left' nowrap='nowrap'>".$this->language->get('column_year')."</td>";
	$export_html .= "<td align='left' nowrap='nowrap'>".$this->language->get('column_quarter')."</td>";				
	} elseif ($filter_group == 'month') {
	$export_html .= "<td align='left' nowrap='nowrap'>".$this->language->get('column_year')."</td>";
	$export_html .= "<td align='left' nowrap='nowrap'>".$this->language->get('column_month')."</td>";
	} elseif ($filter_group == 'day') {
	$export_html .= "<td colspan='2' align='left' nowrap='nowrap'>".$this->language->get('column_date')."</td>";
	} elseif ($filter_group == 'order') {
	$export_html .= "<td align='left' nowrap='nowrap'>".$this->language->get('column_order_order_id')."</td>";
	$export_html .= "<td align='left' nowrap='nowrap'>".$this->language->get('column_order_date_added')."</td>";	
	} else {
	$export_html .= "<td align='left' width='80' nowrap='nowrap'>".$this->language->get('column_date_start')."</td>";
	$export_html .= "<td align='left' width='80' nowrap='nowrap'>".$this->language->get('column_date_end')."</td>";	
	}
	isset($_POST['co20']) ? $export_html .= "<td align='right'>".$this->language->get('column_id')."</td>" : '';
	isset($_POST['co21']) ? $export_html .= "<td align='left'>".$this->language->get('column_customer')." / ".$this->language->get('column_company')."</td>" : '';
	isset($_POST['co22']) ? $export_html .= "<td align='left'>".$this->language->get('column_email')."</td>" : '';
	isset($_POST['co35']) ? $export_html .= "<td align='left'>".$this->language->get('column_telephone')."</td>" : '';
	isset($_POST['co34']) ? $export_html .= "<td align='left'>".$this->language->get('column_country')."</td>" : '';
	isset($_POST['co23']) ? $export_html .= "<td align='left'>".$this->language->get('column_customer_group')."</td>" : '';
	isset($_POST['co24']) ? $export_html .= "<td align='left'>".$this->language->get('column_status')."</td>" : '';
	isset($_POST['co25']) ? $export_html .= "<td align='left'>".$this->language->get('column_ip')."</td>" : '';
	isset($_POST['co26']) ? $export_html .= "<td align='left'>".$this->language->get('column_mostrecent')."</td>" : '';
	isset($_POST['co27']) ? $export_html .= "<td align='right'>".$this->language->get('column_orders')."</td>" : '';
	isset($_POST['co28']) ? $export_html .= "<td align='right'>".$this->language->get('column_products')."</td>" : '';
	isset($_POST['co30']) ? $export_html .= "<td align='right'>".$this->language->get('column_value')."</td>" : '';
	$export_html .="</tr>";
	$export_html .="</thead><tbody>";
	foreach ($results as $result) {
	$export_html .="<tr>";
	if ($filter_group == 'year') {				
	$export_html .= "<td colspan='2' align='left' nowrap='nowrap' style='background-color:#F0F0F0;'>".$result['year']."</td>";
	} elseif ($filter_group == 'quarter') {
	$export_html .= "<td align='left' nowrap='nowrap' style='background-color:#F0F0F0;'>".$result['year']."</td>";	
	$export_html .= "<td align='left' nowrap='nowrap' style='background-color:#F0F0F0;'>".'Q' . $result['quarter']."</td>";						
	} elseif ($filter_group == 'month') {
	$export_html .= "<td align='left' nowrap='nowrap' style='background-color:#F0F0F0;'>".$result['year']."</td>";	
	$export_html .= "<td align='left' nowrap='nowrap' style='background-color:#F0F0F0;'>".$result['month']."</td>";	
	} elseif ($filter_group == 'day') {
	$export_html .= "<td colspan='2' align='left' nowrap='nowrap' style='background-color:#F0F0F0;'>".date($this->language->get('date_format_short'), strtotime($result['date_start']))."</td>";
	} elseif ($filter_group == 'order') {
	$export_html .= "<td align='left' nowrap='nowrap' style='background-color:#F0F0F0;'>".$result['order_id']."</td>";	
	$export_html .= "<td align='left' nowrap='nowrap' style='background-color:#F0F0F0;'>".date($this->language->get('date_format_short'), strtotime($result['date_start']))."</td>";	
	} else {
	$export_html .= "<td align='left' nowrap='nowrap' style='background-color:#F0F0F0;'>".date($this->language->get('date_format_short'), strtotime($result['date_start']))."</td>";
	$export_html .= "<td align='left' nowrap='nowrap' style='background-color:#F0F0F0;'>".date($this->language->get('date_format_short'), strtotime($result['date_end']))."</td>";
	}
	isset($_POST['co20']) ? $export_html .= "<td align='right'>".$result['customer_id']."</td>" : '';
	isset($_POST['co21']) ? $export_html .= "<td align='left' style='color:#03C;'><b>".$result['cust_name']."</b><br>".$result['cust_company']."</td>" : '';
	isset($_POST['co22']) ? $export_html .= "<td align='left'>".$result['cust_email']."</td>" : '';
	isset($_POST['co35']) ? $export_html .= "<td align='left'>".$result['cust_telephone']."</td>" : '';		
	isset($_POST['co34']) ? $export_html .= "<td align='left'>".$result['cust_country']."</td>" : '';
	isset($_POST['co23']) ? $export_html .= "<td align='left'>" : '';
	if ($result['customer_id'] == 0) {
		isset($_POST['co23']) ? $export_html .= "".$result['cust_group_guest']."" : '';
	} else {
		isset($_POST['co23']) ? $export_html .= "".$result['cust_group_reg']."" : '';
	}
	isset($_POST['co23']) ? $export_html .= "</td>" : '';
	isset($_POST['co24']) ? $export_html .= "<td align='left'>" : '';
	if (!$result['customer_id'] == 0) {
		isset($_POST['co24']) ? $export_html .= "".($result['cust_status'] ? $this->language->get('text_enabled') : $this->language->get('text_disabled'))."" : '';
	}
	isset($_POST['co24']) ? $export_html .= "</td>" : '';
	isset($_POST['co25']) ? $export_html .= "<td align='left'>".$result['cust_ip']."</td>" : '';
	isset($_POST['co26']) ? $export_html .= "<td align='left'>".date($this->language->get('date_format_short'), strtotime($result['mostrecent']))."</td>" : '';
	isset($_POST['co27']) ? $export_html .= "<td align='right' nowrap='nowrap'>".$result['orders']."</td>" : '';
	isset($_POST['co28']) ? $export_html .= "<td align='right' nowrap='nowrap'>".$result['products']."</td>" : '';
	isset($_POST['co30']) ? $export_html .= "<td align='right' nowrap='nowrap'>".$this->currency->format($result['total'], $this->config->get('config_currency'))."</td>" : '';						
	$export_html .="</tr>";
	}
	$export_html .="</tbody><tbody><tr>";
	$export_html .= "<td colspan='2' align='right' style='background-color:#E7EFEF; font-weight:bold;'>".$this->language->get('text_filter_total')."</td>";
	isset($_POST['co20']) ? $export_html .= "<td class='total'></td>" : '';
	isset($_POST['co21']) ? $export_html .= "<td class='total'></td>" : '';
	isset($_POST['co22']) ? $export_html .= "<td class='total'></td>" : '';
	isset($_POST['co35']) ? $export_html .= "<td class='total'></td>" : '';	
	isset($_POST['co34']) ? $export_html .= "<td class='total'></td>" : '';
	isset($_POST['co23']) ? $export_html .= "<td class='total'></td>" : '';
	isset($_POST['co24']) ? $export_html .= "<td class='total'></td>" : '';
	isset($_POST['co25']) ? $export_html .= "<td class='total'></td>" : '';
	isset($_POST['co26']) ? $export_html .= "<td class='total'></td>" : '';	
	isset($_POST['co27']) ? $export_html .= "<td align='right' nowrap='nowrap' class='total'>".$result['orders_total']."</td>" : '';
	isset($_POST['co28']) ? $export_html .= "<td align='right' nowrap='nowrap' class='total'>".$result['products_total']."</td>" : '';
	isset($_POST['co30']) ? $export_html .= "<td align='right' nowrap='nowrap' class='total'>".$this->currency->format($result['value_total'], $this->config->get('config_currency'))."</td>" : '';
	$export_html .="</tr></tbody></table>";	
	$export_html .="</body></html>";

$filename = "customer_order_report_".date("Y-m-d",time());
header('Expires: 0');
header('Cache-control: private');
header('Cache-Control: must-revalidate, post-check=0, pre-check=0');
header('Content-Description: File Transfer');			
header('Content-Disposition: attachment; filename='.$filename.".html");
print $export_html;			
exit;
?>