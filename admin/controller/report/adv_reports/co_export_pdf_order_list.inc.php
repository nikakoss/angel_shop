<?php
ini_set("memory_limit","256M");

	$export_pdf_order_list = "<html><head>";			
	$export_pdf_order_list .= "</head>";
	$export_pdf_order_list .= "<body>";
	$export_pdf_order_list .= "<style type='text/css'>
	.list_main {
		width: 100%;
		font-family: Helvetica;
		margin-bottom: 5px;
	}
	.list_main thead td {
		border: 1px solid #DDDDDD;			
		background-color: #E5E5E5;
		padding: 0px 3px;
		font-size: 11px;
		font-weight: bold;
	}	
	.list_main tbody a {
		text-decoration: none;
	}
	.list_main tbody td {
		border: 1px solid #DDDDDD;
		padding: 3px;
		font-size: 11px;	
	}

	.list_detail {
		width: 100%;
		font-family: Helvetica;			
	}
	.list_detail thead td {
		border: 1px solid #DDDDDD;		
		background-color: #F0F0F0;
		padding: 0px 3px;
		font-size: 9px;
		font-weight: bold;
	}	
	.list_detail tbody td {
		border: 1px solid #DDDDDD;
		padding: 0px 3px;
		font-size: 9px;	
	}
	
	.total {
		background-color: #E7EFEF;
		color: #003A88;
		font-weight: bold;
	}
	</style>";
	foreach ($results as $result) {	
	$export_pdf_order_list .= "<div style='border:1px solid #999; padding: 3px; margin-bottom:10px; width:100%;'>";
	$export_pdf_order_list .= "<table cellspacing='0' cellpadding='0' class='list_main'>";	
	$export_pdf_order_list .="<thead><tr>";	
	if ($filter_group == 'year') {				
	$export_pdf_order_list .= "<td colspan='2' align='left' nowrap='nowrap'>".$this->language->get('column_year')."</td>";
	} elseif ($filter_group == 'quarter') {
	$export_pdf_order_list .= "<td align='left' nowrap='nowrap'>".$this->language->get('column_year')."</td>";
	$export_pdf_order_list .= "<td align='left' nowrap='nowrap'>".$this->language->get('column_quarter')."</td>";				
	} elseif ($filter_group == 'month') {
	$export_pdf_order_list .= "<td align='left' nowrap='nowrap'>".$this->language->get('column_year')."</td>";
	$export_pdf_order_list .= "<td align='left' nowrap='nowrap'>".$this->language->get('column_month')."</td>";
	} elseif ($filter_group == 'day') {
	$export_pdf_order_list .= "<td colspan='2' align='left' nowrap='nowrap'>".$this->language->get('column_date')."</td>";
	} elseif ($filter_group == 'order') {
	$export_pdf_order_list .= "<td align='left' nowrap='nowrap'>".$this->language->get('column_order_order_id')."</td>";
	$export_pdf_order_list .= "<td align='left' nowrap='nowrap'>".$this->language->get('column_order_date_added')."</td>";	
	} else {
	$export_pdf_order_list .= "<td align='left' nowrap='nowrap'>".$this->language->get('column_date_start')."</td>";
	$export_pdf_order_list .= "<td align='left' nowrap='nowrap'>".$this->language->get('column_date_end')."</td>";	
	}
	isset($_POST['co20']) ? $export_pdf_order_list .= "<td align='right'>".$this->language->get('column_id')."</td>" : '';
	isset($_POST['co21']) ? $export_pdf_order_list .= "<td align='left'>".$this->language->get('column_customer')." / ".$this->language->get('column_company')."</td>" : '';
	isset($_POST['co22']) ? $export_pdf_order_list .= "<td align='left'>".$this->language->get('column_email')."</td>" : '';
	isset($_POST['co35']) ? $export_pdf_order_list .= "<td align='left'>".$this->language->get('column_telephone')."</td>" : '';	
	isset($_POST['co34']) ? $export_pdf_order_list .= "<td align='left'>".$this->language->get('column_country')."</td>" : '';
	isset($_POST['co23']) ? $export_pdf_order_list .= "<td align='left'>".$this->language->get('column_customer_group')."</td>" : '';
	isset($_POST['co24']) ? $export_pdf_order_list .= "<td align='left'>".$this->language->get('column_status')."</td>" : '';
	isset($_POST['co25']) ? $export_pdf_order_list .= "<td align='left'>".$this->language->get('column_ip')."</td>" : '';
	isset($_POST['co26']) ? $export_pdf_order_list .= "<td align='left'>".$this->language->get('column_mostrecent')."</td>" : '';
	isset($_POST['co27']) ? $export_pdf_order_list .= "<td align='right'>".$this->language->get('column_orders')."</td>" : '';
	isset($_POST['co28']) ? $export_pdf_order_list .= "<td align='right'>".$this->language->get('column_products')."</td>" : '';
	isset($_POST['co30']) ? $export_pdf_order_list .= "<td align='right'>".$this->language->get('column_value')."</td>" : '';
	$export_pdf_order_list .= "</tr></thead>";
	$export_pdf_order_list .= "<tbody><tr>";
	if ($filter_group == 'year') {				
	$export_pdf_order_list .= "<td colspan='2' align='left' nowrap='nowrap'>".$result['year']."</td>";
	} elseif ($filter_group == 'quarter') {
	$export_pdf_order_list .= "<td align='left' nowrap='nowrap'>".$result['year']."</td>";	
	$export_pdf_order_list .= "<td align='left' nowrap='nowrap'>".'Q' . $result['quarter']."</td>";						
	} elseif ($filter_group == 'month') {
	$export_pdf_order_list .= "<td align='left' nowrap='nowrap'>".$result['year']."</td>";	
	$export_pdf_order_list .= "<td align='left' nowrap='nowrap'>".$result['month']."</td>";	
	} elseif ($filter_group == 'day') {
	$export_pdf_order_list .= "<td colspan='2' align='left' nowrap='nowrap'>".date($this->language->get('date_format_short'), strtotime($result['date_start']))."</td>";
	} elseif ($filter_group == 'order') {
	$export_pdf_order_list .= "<td align='left' nowrap='nowrap'>".$result['order_id']."</td>";	
	$export_pdf_order_list .= "<td align='left' nowrap='nowrap'>".date($this->language->get('date_format_short'), strtotime($result['date_start']))."</td>";		
	} else {
	$export_pdf_order_list .= "<td align='left' nowrap='nowrap'>".date($this->language->get('date_format_short'), strtotime($result['date_start']))."</td>";
	$export_pdf_order_list .= "<td align='left' nowrap='nowrap'>".date($this->language->get('date_format_short'), strtotime($result['date_end']))."</td>";
	}
	isset($_POST['co20']) ? $export_pdf_order_list .= "<td align='right'>".$result['customer_id']."</td>" : '';
	isset($_POST['co21']) ? $export_pdf_order_list .= "<td align='left' style='color:#03C;'><b>".$result['cust_name']."</b><br>".$result['cust_company']."</td>" : '';
	isset($_POST['co22']) ? $export_pdf_order_list .= "<td align='left'>".$result['cust_email']."</td>" : '';
	isset($_POST['co35']) ? $export_pdf_order_list .= "<td align='left'>".$result['cust_telephone']."</td>" : '';
	isset($_POST['co34']) ? $export_pdf_order_list .= "<td align='left'>".$result['cust_country']."</td>" : '';
	isset($_POST['co23']) ? $export_pdf_order_list .= "<td align='left'>" : '';
	if ($result['customer_id'] == 0) {
		isset($_POST['co23']) ? $export_pdf_order_list .= "".$result['cust_group_guest']."" : '';
	} else {
		isset($_POST['co23']) ? $export_pdf_order_list .= "".$result['cust_group_reg']."" : '';
	}
	isset($_POST['co23']) ? $export_pdf_order_list .= "</td>" : '';
	isset($_POST['co24']) ? $export_pdf_order_list .= "<td align='left'>" : '';
	if (!$result['customer_id'] == 0) {
		isset($_POST['co24']) ? $export_pdf_order_list .= "".($result['cust_status'] ? $this->language->get('text_enabled') : $this->language->get('text_disabled'))."" : '';
	}
	isset($_POST['co24']) ? $export_pdf_order_list .= "</td>" : '';
	isset($_POST['co25']) ? $export_pdf_order_list .= "<td align='left'>".$result['cust_ip']."</td>" : '';
	isset($_POST['co26']) ? $export_pdf_order_list .= "<td align='left'>".date($this->language->get('date_format_short'), strtotime($result['mostrecent']))."</td>" : '';
	isset($_POST['co27']) ? $export_pdf_order_list .= "<td align='right' nowrap='nowrap'>".$result['orders']."</td>" : '';
	isset($_POST['co28']) ? $export_pdf_order_list .= "<td align='right' nowrap='nowrap'>".$result['products']."</td>" : '';
	isset($_POST['co30']) ? $export_pdf_order_list .= "<td align='right' nowrap='nowrap'>".$this->currency->format($result['total'], $this->config->get('config_currency'))."</td>" : '';
	$export_pdf_order_list .= "</tr></tbody></table>";
	$export_pdf_order_list .="<table cellspacing='0' cellpadding='0' cellspacing='0' cellpadding='0' class='list_detail'>";
	$export_pdf_order_list .="<thead><tr>";
		isset($_POST['co40']) ? $export_pdf_order_list .= "<td align='left'>".$this->language->get('column_order_order_id')."</td>" : '';
		isset($_POST['co41']) ? $export_pdf_order_list .= "<td align='left'>".$this->language->get('column_order_date_added')."</td>" : '';
		isset($_POST['co42']) ? $export_pdf_order_list .= "<td align='left'>".$this->language->get('column_order_inv_no')."</td>" : '';
		isset($_POST['co43']) ? $export_pdf_order_list .= "<td align='left'>".$this->language->get('column_order_customer')."</td>" : '';
		isset($_POST['co44']) ? $export_pdf_order_list .= "<td align='left'>".$this->language->get('column_order_email')."</td>" : '';
		isset($_POST['co45']) ? $export_pdf_order_list .= "<td align='left'>".$this->language->get('column_order_customer_group')."</td>" : '';
		isset($_POST['co46']) ? $export_pdf_order_list .= "<td align='left'>".$this->language->get('column_order_shipping_method')."</td>" : '';
		isset($_POST['co47']) ? $export_pdf_order_list .= "<td align='left'>".$this->language->get('column_order_payment_method')."</td>" : '';
		isset($_POST['co48']) ? $export_pdf_order_list .= "<td align='left'>".$this->language->get('column_order_status')."</td>" : '';
		isset($_POST['co49']) ? $export_pdf_order_list .= "<td align='left'>".$this->language->get('column_order_store')."</td>" : '';
		isset($_POST['co50']) ? $export_pdf_order_list .= "<td align='right'>".$this->language->get('column_order_currency')."</td>" : '';
		isset($_POST['co51']) ? $export_pdf_order_list .= "<td align='right'>".$this->language->get('column_order_quantity')."</td>" : '';
		isset($_POST['co52']) ? $export_pdf_order_list .= "<td align='right'>".$this->language->get('column_order_sub_total')."</td>" : '';
		isset($_POST['co54']) ? $export_pdf_order_list .= "<td align='right'>".$this->language->get('column_order_shipping')."</td>" : '';
		isset($_POST['co55']) ? $export_pdf_order_list .= "<td align='right'>".$this->language->get('column_order_tax')."</td>" : '';
		isset($_POST['co56']) ? $export_pdf_order_list .= "<td align='right'>".$this->language->get('column_order_value')."</td>" : '';
		$export_pdf_order_list .="</tr></thead>";
		$export_pdf_order_list .="<tbody><tr>";
		isset($_POST['co40']) ? $export_pdf_order_list .= "<td align='left' nowrap='nowrap'>".$result['order_ord_idc']."</td>" : '';
		isset($_POST['co41']) ? $export_pdf_order_list .= "<td align='left' nowrap='nowrap'>".$result['order_order_date']."</td>" : '';
		isset($_POST['co42']) ? $export_pdf_order_list .= "<td align='left' nowrap='nowrap'>".$result['order_inv_no']."</td>" : '';
		isset($_POST['co43']) ? $export_pdf_order_list .= "<td align='left' nowrap='nowrap'>".$result['order_name']."</td>" : '';
		isset($_POST['co44']) ? $export_pdf_order_list .= "<td align='left' nowrap='nowrap'>".$result['order_email']."</td>" : '';
		isset($_POST['co45']) ? $export_pdf_order_list .= "<td align='left' nowrap='nowrap'>".$result['order_group']."</td>" : '';
		isset($_POST['co46']) ? $export_pdf_order_list .= "<td align='left' nowrap='nowrap'>".strip_tags($result['order_shipping_method'], '<br>')."</td>" : '';
		isset($_POST['co47']) ? $export_pdf_order_list .= "<td align='left' nowrap='nowrap'>".strip_tags($result['order_payment_method'], '<br>')."</td>" : '';
		isset($_POST['co48']) ? $export_pdf_order_list .= "<td align='left' nowrap='nowrap'>".$result['order_status']."</td>" : '';
		isset($_POST['co49']) ? $export_pdf_order_list .= "<td align='left' nowrap='nowrap'>".$result['order_store']."</td>" : '';
		isset($_POST['co50']) ? $export_pdf_order_list .= "<td align='right' nowrap='nowrap'>".$result['order_currency']."</td>" : '';
		isset($_POST['co51']) ? $export_pdf_order_list .= "<td align='right' nowrap='nowrap'>".$result['order_products']."</td>" : '';
		isset($_POST['co52']) ? $export_pdf_order_list .= "<td align='right' nowrap='nowrap'>".$result['order_sub_total']."</td>" : '';
		isset($_POST['co54']) ? $export_pdf_order_list .= "<td align='right' nowrap='nowrap'>".$result['order_shipping']."</td>" : '';
		isset($_POST['co55']) ? $export_pdf_order_list .= "<td align='right' nowrap='nowrap'>".$result['order_tax']."</td>" : '';
		isset($_POST['co56']) ? $export_pdf_order_list .= "<td align='right' nowrap='nowrap'>".$result['order_value']."</td>" : '';
		$export_pdf_order_list .= "</tr></tbody></table>";
		$export_pdf_order_list .="</div>";			
	}	
	$export_pdf_order_list .="<table cellspacing='0' cellpadding='0' class='list_main'>";
	$export_pdf_order_list .="<thead><tr>";
	$export_pdf_order_list .= "<td colspan='2'></td>";
	isset($_POST['co27']) ? $export_pdf_order_list .= "<td align='right'>".$this->language->get('column_orders')."</td>" : '';
	isset($_POST['co28']) ? $export_pdf_order_list .= "<td align='right'>".$this->language->get('column_products')."</td>" : '';
	isset($_POST['co30']) ? $export_pdf_order_list .= "<td align='right'>".$this->language->get('column_value')."</td>" : '';
	$export_pdf_order_list .="</tr></thead>";
	$export_pdf_order_list .="<tbody><tr>";
	$export_pdf_order_list .= "<td colspan='2' align='right' style='background-color:#E7EFEF; font-weight:bold;'>".$this->language->get('text_filter_total')."</td>";	
	isset($_POST['co27']) ? $export_pdf_order_list .= "<td align='right' nowrap='nowrap' class='total'>".$result['orders_total']."</td>" : '';
	isset($_POST['co28']) ? $export_pdf_order_list .= "<td align='right' nowrap='nowrap' class='total'>".$result['products_total']."</td>" : '';
	isset($_POST['co30']) ? $export_pdf_order_list .= "<td align='right' nowrap='nowrap' class='total'>".$this->currency->format($result['value_total'], $this->config->get('config_currency'))."</td>" : '';
	$export_pdf_order_list .="</tr></tbody></table>";
	$export_pdf_order_list .="</body></html>";

ini_set('mbstring.substitute_character', "none"); 
$dompdf_pdf_order_list = mb_convert_encoding($export_pdf_order_list, 'ISO-8859-1', 'UTF-8'); 
$dompdf = new DOMPDF();
$dompdf->load_html($dompdf_pdf_order_list);
$dompdf->set_paper("a3", "landscape");
$dompdf->render();
$dompdf->stream("customer_order_report_order_list_".date("Y-m-d",time()).".pdf");
?>