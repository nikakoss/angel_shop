<?php
ini_set("memory_limit","256M");

	$export_html_all_details ="<html><head>";
	$export_html_all_details .="<meta http-equiv='Content-Type' content='text/html; charset=utf-8'>";
	$export_html_all_details .="</head>";
	$export_html_all_details .="<body>";
	$export_html_all_details .="<style type='text/css'>
	.list_detail {
		width: 100%;
		font-family: Helvetica;
		padding: 3px;	
	}
	.list_detail thead td {
		border: 1px solid #DDDDDD;		
		background-color: #F0F0F0;
		padding: 0px 3px;
		font-size: 10px;
		font-weight: bold;
	}	
	.list_detail tbody td {
		border: 1px solid #DDDDDD;
		padding: 0px 3px;
		font-size: 10px;	
	}
	</style>";
	foreach ($results as $result) {	
	if ($result['product_pidc']) {	
	$export_html_all_details .= "<div style='border:1px solid #999; margin-bottom:10px; width:100%'>";
	$export_html_all_details .= "<table cellspacing='0' cellpadding='0' class='list_detail'>";
	$export_html_all_details .= "<thead><tr>";
	$export_html_all_details .= "<td align='left' nowrap='nowrap'>".$this->language->get('column_order_order_id')."</td>";
	$export_html_all_details .= "<td align='left' nowrap='nowrap'>".$this->language->get('column_order_date_added')."</td>";
	isset($_POST['co1000']) ? $export_html_all_details .= "<td align='left'>".$this->language->get('column_order_inv_no')."</td>" : '';
	isset($_POST['co1001']) ? $export_html_all_details .= "<td align='left'>".$this->language->get('column_order_customer')."</td>" : '';	
	isset($_POST['co1002']) ? $export_html_all_details .= "<td align='left'>".$this->language->get('column_order_email')."</td>" : '';
	isset($_POST['co1003']) ? $export_html_all_details .= "<td align='left'>".$this->language->get('column_order_customer_group')."</td>" : '';
	isset($_POST['co1040']) ? $export_html_all_details .= "<td align='left'>".$this->language->get('column_order_shipping_method')."</td>" : '';
	isset($_POST['co1041']) ? $export_html_all_details .= "<td align='left'>".$this->language->get('column_order_payment_method')."</td>" : '';
	isset($_POST['co1042']) ? $export_html_all_details .= "<td align='left'>".$this->language->get('column_order_status')."</td>" : '';
	isset($_POST['co1043']) ? $export_html_all_details .= "<td align='left'>".$this->language->get('column_order_store')."</td>" : '';
	isset($_POST['co1012']) ? $export_html_all_details .= "<td align='right'>".$this->language->get('column_order_currency')."</td>" : '';
	isset($_POST['co1062']) ? $export_html_all_details .= "<td align='right'>".$this->language->get('column_order_quantity')."</td>" : '';	
	isset($_POST['co1020']) ? $export_html_all_details .= "<td align='right'>".$this->language->get('column_order_sub_total')."</td>" : '';
	isset($_POST['co1023']) ? $export_html_all_details .= "<td align='right'>".$this->language->get('column_order_shipping')."</td>" : '';
	isset($_POST['co1027']) ? $export_html_all_details .= "<td align='right'>".$this->language->get('column_order_tax')."</td>" : '';
	isset($_POST['co1031']) ? $export_html_all_details .= "<td align='right'>".$this->language->get('column_order_value')."</td>" : '';	
	$export_html_all_details .="</tr></thead>";
	$export_html_all_details .="<tbody><tr>";
	$export_html_all_details .= "<td align='left' nowrap='nowrap' style='background-color:#FFC;'>".$result['order_ord_idc']."</td>";
	$export_html_all_details .= "<td align='left' nowrap='nowrap' style='background-color:#FFC;'>".$result['order_order_date']."</td>";
	isset($_POST['co1000']) ? $export_html_all_details .= "<td align='left' nowrap='nowrap'>".$result['order_inv_no']."</td>" : '';
	isset($_POST['co1001']) ? $export_html_all_details .= "<td align='left' nowrap='nowrap'>".$result['order_name']."</td>" : '';	
	isset($_POST['co1002']) ? $export_html_all_details .= "<td align='left' nowrap='nowrap'>".$result['order_email']."</td>" : '';
	isset($_POST['co1003']) ? $export_html_all_details .= "<td align='left' nowrap='nowrap'>".$result['order_group']."</td>" : '';
	isset($_POST['co1040']) ? $export_html_all_details .= "<td align='left' nowrap='nowrap'>".strip_tags($result['order_shipping_method'], '<br>')."</td>" : '';
	isset($_POST['co1041']) ? $export_html_all_details .= "<td align='left' nowrap='nowrap'>".strip_tags($result['order_payment_method'], '<br>')."</td>" : '';
	isset($_POST['co1042']) ? $export_html_all_details .= "<td align='left' nowrap='nowrap'>".$result['order_status']."</td>" : '';
	isset($_POST['co1043']) ? $export_html_all_details .= "<td align='left' nowrap='nowrap'>".$result['order_store']."</td>" : '';
	isset($_POST['co1012']) ? $export_html_all_details .= "<td align='right' nowrap='nowrap'>".$result['order_currency']."</td>" : '';
	isset($_POST['co1062']) ? $export_html_all_details .= "<td align='right' nowrap='nowrap'>".$result['order_products']."</td>" : '';	
	isset($_POST['co1020']) ? $export_html_all_details .= "<td align='right' nowrap='nowrap'>".$result['order_sub_total']."</td>" : '';
	isset($_POST['co1023']) ? $export_html_all_details .= "<td align='right' nowrap='nowrap'>".$result['order_shipping']."</td>" : '';
	isset($_POST['co1027']) ? $export_html_all_details .= "<td align='right' nowrap='nowrap'>".$result['order_tax']."</td>" : '';
	isset($_POST['co1031']) ? $export_html_all_details .= "<td align='right' nowrap='nowrap'>".$result['order_value']."</td>" : '';
	$export_html_all_details .="</tr></tbody></table>";		
	$export_html_all_details .="<table cellspacing='0' cellpadding='0' class='list_detail'>";
	$export_html_all_details .="<thead><tr>";
	isset($_POST['co1004']) ? $export_html_all_details .= "<td align='left'>".$this->language->get('column_prod_id')."</td>" : '';
	isset($_POST['co1005']) ? $export_html_all_details .= "<td align='left'>".$this->language->get('column_prod_sku')."</td>" : '';
	isset($_POST['co1006']) ? $export_html_all_details .= "<td align='left'>".$this->language->get('column_prod_model')."</td>" : '';	
	isset($_POST['co1007']) ? $export_html_all_details .= "<td align='left'>".$this->language->get('column_prod_name')."</td>" : '';
	isset($_POST['co1008']) ? $export_html_all_details .= "<td align='left'>".$this->language->get('column_prod_option')."</td>" : '';
	isset($_POST['co1009']) ? $export_html_all_details .= "<td align='left'>".$this->language->get('column_prod_attributes')."</td>" : '';	
	isset($_POST['co1010']) ? $export_html_all_details .= "<td align='left'>".$this->language->get('column_prod_manu')."</td>" : '';	
	isset($_POST['co1011']) ? $export_html_all_details .= "<td align='left'>".$this->language->get('column_prod_category')."</td>" : '';		
	isset($_POST['co1013']) ? $export_html_all_details .= "<td align='right'>".$this->language->get('column_prod_price')."</td>" : '';
	isset($_POST['co1014']) ? $export_html_all_details .= "<td align='right'>".$this->language->get('column_prod_quantity')."</td>" : '';
	isset($_POST['co1016a']) ? $export_html_all_details .= "<td align='right'>".$this->language->get('column_prod_total_excl_vat')."</td>" : '';	
	isset($_POST['co1015']) ? $export_html_all_details .= "<td align='right'>".$this->language->get('column_prod_tax')."</td>" : '';		
	isset($_POST['co1016b']) ? $export_html_all_details .= "<td align='right'>".$this->language->get('column_prod_total_incl_vat')."</td>" : '';
	$export_html_all_details .="</tr></thead>";
	$export_html_all_details .="<tbody><tr>";
	isset($_POST['co1004']) ? $export_html_all_details .= "<td align='left' nowrap='nowrap'>".$result['product_pidc']."</td>" : '';
	isset($_POST['co1005']) ? $export_html_all_details .= "<td align='left' nowrap='nowrap'>".$result['product_sku']."</td>" : '';
	isset($_POST['co1006']) ? $export_html_all_details .= "<td align='left' nowrap='nowrap'>".$result['product_model']."</td>" : '';	
	isset($_POST['co1007']) ? $export_html_all_details .= "<td align='left' nowrap='nowrap'>".$result['product_name']."</td>" : '';
	isset($_POST['co1008']) ? $export_html_all_details .= "<td align='left' nowrap='nowrap'>".$result['product_option']."</td>" : '';
	isset($_POST['co1009']) ? $export_html_all_details .= "<td align='left' nowrap='nowrap'>".$result['product_attributes']."</td>" : '';
	isset($_POST['co1010']) ? $export_html_all_details .= "<td align='left' nowrap='nowrap'>".$result['product_manu']."</td>" : '';	
	isset($_POST['co1011']) ? $export_html_all_details .= "<td align='left' nowrap='nowrap'>".$result['product_category']."</td>" : '';
	isset($_POST['co1013']) ? $export_html_all_details .= "<td align='right' nowrap='nowrap'>".$result['product_price']."</td>" : '';
	isset($_POST['co1014']) ? $export_html_all_details .= "<td align='right' nowrap='nowrap'>".$result['product_quantity']."</td>" : '';
	isset($_POST['co1016a']) ? $export_html_all_details .= "<td align='right' nowrap='nowrap'>".$result['product_total_excl_vat']."</td>" : '';
	isset($_POST['co1015']) ? $export_html_all_details .= "<td align='right' nowrap='nowrap'>".$result['product_tax']."</td>" : '';
	isset($_POST['co1016b']) ? $export_html_all_details .= "<td align='right' nowrap='nowrap'>".$result['product_total_incl_vat']."</td>" : '';
	$export_html_all_details .="</tr></tbody></table>";	
	$export_html_all_details .="<table cellspacing='0' cellpadding='0' class='list_detail'>";
	$export_html_all_details .="<thead><tr>";

	isset($_POST['co1044']) ? $export_html_all_details .= "<td align='left'>".strip_tags($this->language->get('column_customer_cust_id'))."</td>" : '';
	isset($_POST['co1045']) ? $export_html_all_details .= "<td align='left'>".strip_tags($this->language->get('column_billing_name'))."</td>" : '';	
	isset($_POST['co1046']) ? $export_html_all_details .= "<td align='left'>".strip_tags($this->language->get('column_billing_company'))."</td>" : '';
	isset($_POST['co1047']) ? $export_html_all_details .= "<td align='left'>".strip_tags($this->language->get('column_billing_address_1'))."</td>" : '';
	isset($_POST['co1048']) ? $export_html_all_details .= "<td align='left'>".strip_tags($this->language->get('column_billing_address_2'))."</td>" : '';
	isset($_POST['co1049']) ? $export_html_all_details .= "<td align='left'>".strip_tags($this->language->get('column_billing_city'))."</td>" : '';
	isset($_POST['co1050']) ? $export_html_all_details .= "<td align='left'>".strip_tags($this->language->get('column_billing_zone'))."</td>" : '';
	isset($_POST['co1051']) ? $export_html_all_details .= "<td align='left'>".strip_tags($this->language->get('column_billing_postcode'))."</td>" : '';
	isset($_POST['co1052']) ? $export_html_all_details .= "<td align='left'>".strip_tags($this->language->get('column_billing_country'))."</td>" : '';
	isset($_POST['co1053']) ? $export_html_all_details .= "<td align='left'>".$this->language->get('column_customer_telephone')."</td>" : '';
	isset($_POST['co1054']) ? $export_html_all_details .= "<td align='left'>".strip_tags($this->language->get('column_shipping_name'))."</td>" : '';
	isset($_POST['co1055']) ? $export_html_all_details .= "<td align='left'>".strip_tags($this->language->get('column_shipping_company'))."</td>" : '';
	isset($_POST['co1056']) ? $export_html_all_details .= "<td align='left'>".strip_tags($this->language->get('column_shipping_address_1'))."</td>" : '';
	isset($_POST['co1057']) ? $export_html_all_details .= "<td align='left'>".strip_tags($this->language->get('column_shipping_address_2'))."</td>" : '';
	isset($_POST['co1058']) ? $export_html_all_details .= "<td align='left'>".strip_tags($this->language->get('column_shipping_city'))."</td>" : '';
	isset($_POST['co1059']) ? $export_html_all_details .= "<td align='left'>".strip_tags($this->language->get('column_shipping_zone'))."</td>" : '';
	isset($_POST['co1060']) ? $export_html_all_details .= "<td align='left'>".strip_tags($this->language->get('column_shipping_postcode'))."</td>" : '';
	isset($_POST['co1061']) ? $export_html_all_details .= "<td align='left'>".strip_tags($this->language->get('column_shipping_country'))."</td>" : '';	
	$export_html_all_details .="</tr></thead>";
	$export_html_all_details .="<tbody><tr>";
	isset($_POST['co1044']) ? $export_html_all_details .= "<td align='left' nowrap='nowrap'>".$result['customer_cust_idc']."</td>" : '';
	isset($_POST['co1045']) ? $export_html_all_details .= "<td align='left' nowrap='nowrap'>".$result['billing_name']."</td>" : '';
	isset($_POST['co1046']) ? $export_html_all_details .= "<td align='left' nowrap='nowrap'>".$result['billing_company']."</td>" : '';
	isset($_POST['co1047']) ? $export_html_all_details .= "<td align='left' nowrap='nowrap'>".$result['billing_address_1']."</td>" : '';
	isset($_POST['co1048']) ? $export_html_all_details .= "<td align='left' nowrap='nowrap'>".$result['billing_address_2']."</td>" : '';
	isset($_POST['co1049']) ? $export_html_all_details .= "<td align='left' nowrap='nowrap'>".$result['billing_city']."</td>" : '';
	isset($_POST['co1050']) ? $export_html_all_details .= "<td align='left' nowrap='nowrap'>".$result['billing_zone']."</td>" : '';
	isset($_POST['co1051']) ? $export_html_all_details .= "<td align='left' nowrap='nowrap'>".$result['billing_postcode']."</td>" : '';
	isset($_POST['co1052']) ? $export_html_all_details .= "<td align='left' nowrap='nowrap'>".$result['billing_country']."</td>" : '';
	isset($_POST['co1053']) ? $export_html_all_details .= "<td align='left' nowrap='nowrap'>".$result['customer_telephone']."</td>" : '';
	isset($_POST['co1054']) ? $export_html_all_details .= "<td align='left' nowrap='nowrap'>".$result['shipping_name']."</td>" : '';
	isset($_POST['co1055']) ? $export_html_all_details .= "<td align='left' nowrap='nowrap'>".$result['shipping_company']."</td>" : '';
	isset($_POST['co1056']) ? $export_html_all_details .= "<td align='left' nowrap='nowrap'>".$result['shipping_address_1']."</td>" : '';
	isset($_POST['co1057']) ? $export_html_all_details .= "<td align='left' nowrap='nowrap'>".$result['shipping_address_2']."</td>" : '';
	isset($_POST['co1058']) ? $export_html_all_details .= "<td align='left' nowrap='nowrap'>".$result['shipping_city']."</td>" : '';
	isset($_POST['co1059']) ? $export_html_all_details .= "<td align='left' nowrap='nowrap'>".$result['shipping_zone']."</td>" : '';
	isset($_POST['co1060']) ? $export_html_all_details .= "<td align='left' nowrap='nowrap'>".$result['shipping_postcode']."</td>" : '';
	isset($_POST['co1061']) ? $export_html_all_details .= "<td align='left' nowrap='nowrap'>".$result['shipping_country']."</td>" : '';	
	$export_html_all_details .="</tr></tbody></table>";
	$export_html_all_details .="</div>";	
	}
	}	
	$export_html_all_details .="</body></html>";

$filename = "customer_order_report_all_details_".date("Y-m-d",time());
header('Expires: 0');
header('Cache-control: private');
header('Cache-Control: must-revalidate, post-check=0, pre-check=0');
header('Content-Description: File Transfer');			
header('Content-Disposition: attachment; filename='.$filename.".html");
print $export_html_all_details;			
exit;		
?>