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
	
	$export_csv_all_details = $csv_enclosed . $this->language->get('column_order_order_id') . $csv_enclosed;
	$export_csv_all_details .= $csv_separator . $csv_enclosed . $this->language->get('column_order_date_added') . $csv_enclosed;
	isset($_POST['co1000']) ? $export_csv_all_details .= $csv_separator . $csv_enclosed . $this->language->get('column_order_inv_no') . $csv_enclosed : '';	
	isset($_POST['co1001']) ? $export_csv_all_details .= $csv_separator . $csv_enclosed . $this->language->get('column_order_customer_name') . $csv_enclosed : '';
	isset($_POST['co1002']) ? $export_csv_all_details .= $csv_separator . $csv_enclosed . $this->language->get('column_order_email') . $csv_enclosed : '';	
	isset($_POST['co1003']) ? $export_csv_all_details .= $csv_separator . $csv_enclosed . $this->language->get('column_order_customer_group') . $csv_enclosed : '';	
	isset($_POST['co1004']) ? $export_csv_all_details .= $csv_separator . $csv_enclosed . $this->language->get('column_prod_id') . $csv_enclosed : '';
	isset($_POST['co1005']) ? $export_csv_all_details .= $csv_separator . $csv_enclosed . $this->language->get('column_prod_sku') . $csv_enclosed : '';
	isset($_POST['co1006']) ? $export_csv_all_details .= $csv_separator . $csv_enclosed . $this->language->get('column_prod_model') . $csv_enclosed : '';
	isset($_POST['co1007']) ? $export_csv_all_details .= $csv_separator . $csv_enclosed . $this->language->get('column_prod_name') . $csv_enclosed : '';
	isset($_POST['co1008']) ? $export_csv_all_details .= $csv_separator . $csv_enclosed . $this->language->get('column_prod_option') . $csv_enclosed : '';
	isset($_POST['co1009']) ? $export_csv_all_details .= $csv_separator . $csv_enclosed . $this->language->get('column_prod_attributes') . $csv_enclosed : '';
	isset($_POST['co1010']) ? $export_csv_all_details .= $csv_separator . $csv_enclosed . $this->language->get('column_prod_manu') . $csv_enclosed : '';
	isset($_POST['co1011']) ? $export_csv_all_details .= $csv_separator . $csv_enclosed . $this->language->get('column_prod_category') . $csv_enclosed : '';	
	isset($_POST['co1012']) ? $export_csv_all_details .= $csv_separator . $csv_enclosed . $this->language->get('column_prod_currency') . $csv_enclosed : '';
	isset($_POST['co1013']) ? $export_csv_all_details .= $csv_separator . $csv_enclosed . $this->language->get('column_prod_price') . $csv_enclosed : '';
	isset($_POST['co1014']) ? $export_csv_all_details .= $csv_separator . $csv_enclosed . $this->language->get('column_prod_quantity') . $csv_enclosed : '';
	isset($_POST['co1016a']) ? $export_csv_all_details .= $csv_separator . $csv_enclosed . $this->language->get('column_prod_total_excl_vat') . $csv_enclosed : '';		
	isset($_POST['co1015']) ? $export_csv_all_details .= $csv_separator . $csv_enclosed . $this->language->get('column_prod_tax') . $csv_enclosed : '';
	isset($_POST['co1016b']) ? $export_csv_all_details .= $csv_separator . $csv_enclosed . $this->language->get('column_prod_total_incl_vat') . $csv_enclosed : '';
	isset($_POST['co1020']) ? $export_csv_all_details .= $csv_separator . $csv_enclosed . $this->language->get('column_order_sub_total') . $csv_enclosed : '';
	isset($_POST['co1023']) ? $export_csv_all_details .= $csv_separator . $csv_enclosed . $this->language->get('column_order_shipping') . $csv_enclosed : '';
	isset($_POST['co1027']) ? $export_csv_all_details .= $csv_separator . $csv_enclosed . $this->language->get('column_order_tax') . $csv_enclosed : '';
	isset($_POST['co1031']) ? $export_csv_all_details .= $csv_separator . $csv_enclosed . $this->language->get('column_order_value') . $csv_enclosed : '';
	isset($_POST['co1040']) ? $export_csv_all_details .= $csv_separator . $csv_enclosed . $this->language->get('column_order_shipping_method') . $csv_enclosed : '';
	isset($_POST['co1041']) ? $export_csv_all_details .= $csv_separator . $csv_enclosed . $this->language->get('column_order_payment_method') . $csv_enclosed : '';
	isset($_POST['co1042']) ? $export_csv_all_details .= $csv_separator . $csv_enclosed . $this->language->get('column_order_status') . $csv_enclosed : '';
	isset($_POST['co1043']) ? $export_csv_all_details .= $csv_separator . $csv_enclosed . $this->language->get('column_order_store') . $csv_enclosed : '';
	isset($_POST['co1044']) ? $export_csv_all_details .= $csv_separator . $csv_enclosed . $this->language->get('column_customer_cust_id') . $csv_enclosed : '';	
	isset($_POST['co1045']) ? $export_csv_all_details .= $csv_separator . $csv_enclosed . strip_tags($this->language->get('column_billing_name')) . $csv_enclosed : '';
	isset($_POST['co1046']) ? $export_csv_all_details .= $csv_separator . $csv_enclosed . strip_tags($this->language->get('column_billing_company')) . $csv_enclosed : '';				
	isset($_POST['co1047']) ? $export_csv_all_details .= $csv_separator . $csv_enclosed . strip_tags($this->language->get('column_billing_address_1')) . $csv_enclosed : '';
	isset($_POST['co1048']) ? $export_csv_all_details .= $csv_separator . $csv_enclosed . strip_tags($this->language->get('column_billing_address_2')) . $csv_enclosed : '';
	isset($_POST['co1049']) ? $export_csv_all_details .= $csv_separator . $csv_enclosed . strip_tags($this->language->get('column_billing_city')) . $csv_enclosed : '';
	isset($_POST['co1050']) ? $export_csv_all_details .= $csv_separator . $csv_enclosed . strip_tags($this->language->get('column_billing_zone')) . $csv_enclosed : '';
	isset($_POST['co1051']) ? $export_csv_all_details .= $csv_separator . $csv_enclosed . strip_tags($this->language->get('column_billing_postcode')) . $csv_enclosed : '';
	isset($_POST['co1052']) ? $export_csv_all_details .= $csv_separator . $csv_enclosed . strip_tags($this->language->get('column_billing_country')) . $csv_enclosed : '';
	isset($_POST['co1053']) ? $export_csv_all_details .= $csv_separator . $csv_enclosed . $this->language->get('column_customer_telephone') . $csv_enclosed : '';
	isset($_POST['co1054']) ? $export_csv_all_details .= $csv_separator . $csv_enclosed . strip_tags($this->language->get('column_shipping_name')) . $csv_enclosed : '';
	isset($_POST['co1055']) ? $export_csv_all_details .= $csv_separator . $csv_enclosed . strip_tags($this->language->get('column_shipping_company')) . $csv_enclosed : '';
	isset($_POST['co1056']) ? $export_csv_all_details .= $csv_separator . $csv_enclosed . strip_tags($this->language->get('column_shipping_address_1')) . $csv_enclosed : '';
	isset($_POST['co1057']) ? $export_csv_all_details .= $csv_separator . $csv_enclosed . strip_tags($this->language->get('column_shipping_address_2')) . $csv_enclosed : '';
	isset($_POST['co1058']) ? $export_csv_all_details .= $csv_separator . $csv_enclosed . strip_tags($this->language->get('column_shipping_city')) . $csv_enclosed : '';
	isset($_POST['co1059']) ? $export_csv_all_details .= $csv_separator . $csv_enclosed . strip_tags($this->language->get('column_shipping_zone')) . $csv_enclosed : '';
	isset($_POST['co1060']) ? $export_csv_all_details .= $csv_separator . $csv_enclosed . strip_tags($this->language->get('column_shipping_postcode')) . $csv_enclosed : '';
	isset($_POST['co1061']) ? $export_csv_all_details .= $csv_separator . $csv_enclosed . strip_tags($this->language->get('column_shipping_country')) . $csv_enclosed : '';
	isset($_POST['co1064']) ? $export_csv_all_details .= $csv_separator . $csv_enclosed . $this->language->get('column_order_comment') . $csv_enclosed : '';
	$export_csv_all_details .= $csv_row;
	
	foreach ($rows as $row) {	
	if ($row['product_id']) {
	$export_csv_all_details .= $csv_enclosed . $row['order_id'] . $csv_enclosed;
	$export_csv_all_details .= $csv_separator . $csv_enclosed . date($this->language->get('date_format_short'), strtotime($row['date_added'])) . $csv_enclosed;
	isset($_POST['co1000']) ? $export_csv_all_details .= $csv_separator . $csv_enclosed . $row['invoice_prefix'] . $row['invoice_no'] . $csv_enclosed : '';
	isset($_POST['co1001']) ? $export_csv_all_details .= $csv_separator . $csv_enclosed . $row['firstname'] . ' ' . $row['lastname'] . $csv_enclosed : '';	
	isset($_POST['co1002']) ? $export_csv_all_details .= $csv_separator . $csv_enclosed . $row['email'] . $csv_enclosed : '';	
	isset($_POST['co1003']) ? $export_csv_all_details .= $csv_separator . $csv_enclosed . $row['order_group'] . $csv_enclosed : '';	
	isset($_POST['co1004']) ? $export_csv_all_details .= $csv_separator . $csv_enclosed . $row['product_id'] . $csv_enclosed : '';
	isset($_POST['co1005']) ? $export_csv_all_details .= $csv_separator . $csv_enclosed . $row['product_sku'] . $csv_enclosed : '';
	isset($_POST['co1006']) ? $export_csv_all_details .= $csv_separator . $csv_enclosed . $row['product_model'] . $csv_enclosed : '';	
	isset($_POST['co1007']) ? $export_csv_all_details .= $csv_separator . $csv_enclosed . $row['product_name'] . $csv_enclosed : '';
	isset($_POST['co1008']) ? $export_csv_all_details .= $csv_separator . $csv_enclosed . html_entity_decode($row['product_option']) . $csv_enclosed : '';
	isset($_POST['co1009']) ? $export_csv_all_details .= $csv_separator . $csv_enclosed . html_entity_decode($row['product_attributes']) . $csv_enclosed : '';
	isset($_POST['co1010']) ? $export_csv_all_details .= $csv_separator . $csv_enclosed . html_entity_decode($row['product_manu']) . $csv_enclosed : '';
	isset($_POST['co1011']) ? $export_csv_all_details .= $csv_separator . $csv_enclosed . html_entity_decode($row['product_category']) . $csv_enclosed : '';	
	isset($_POST['co1012']) ? $export_csv_all_details .= $csv_separator . $csv_enclosed . $row['currency_code'] . $csv_enclosed : '';
	isset($_POST['co1013']) ? $export_csv_all_details .= $csv_separator . $csv_enclosed . round($row['product_price'], 2) . $csv_enclosed : '';
	isset($_POST['co1014']) ? $export_csv_all_details .= $csv_separator . $csv_enclosed . $row['product_quantity'] . $csv_enclosed : '';
	isset($_POST['co1016a']) ? $export_csv_all_details .= $csv_separator . $csv_enclosed . round($row['product_total_excl_vat'], 2) . $csv_enclosed : '';	
	isset($_POST['co1015']) ? $export_csv_all_details .= $csv_separator . $csv_enclosed . round($row['product_tax'], 2) . $csv_enclosed : '';		
	isset($_POST['co1016b']) ? $export_csv_all_details .= $csv_separator . $csv_enclosed . round($row['product_total_incl_vat'], 2) . $csv_enclosed : '';
	if ($row['order_sub_total'] != NULL) {		
	isset($_POST['co1020']) ? $export_csv_all_details .= $csv_separator . $csv_enclosed . round($row['order_sub_total'], 2) . $csv_enclosed : '';
	} else {
	isset($_POST['co1020']) ? $export_csv_all_details .= $csv_separator . $csv_enclosed . '0' . $csv_enclosed : '';
	}		
	if ($row['order_shipping'] != NULL) {		
	isset($_POST['co1023']) ? $export_csv_all_details .= $csv_separator . $csv_enclosed . round($row['order_shipping'], 2) . $csv_enclosed : '';
	} else {
	isset($_POST['co1023']) ? $export_csv_all_details .= $csv_separator . $csv_enclosed . '0' . $csv_enclosed : '';
	}
	if ($row['order_tax'] != NULL) {		
	isset($_POST['co1027']) ? $export_csv_all_details .= $csv_separator . $csv_enclosed . round($row['order_tax'], 2) . $csv_enclosed : '';
	} else {
	isset($_POST['co1027']) ? $export_csv_all_details .= $csv_separator . $csv_enclosed . '0' . $csv_enclosed : '';
	}	
	isset($_POST['co1031']) ? $export_csv_all_details .= $csv_separator . $csv_enclosed . round($row['order_value'], 2) . $csv_enclosed : '';
	isset($_POST['co1040']) ? $export_csv_all_details .= $csv_separator . $csv_enclosed . strip_tags($row['shipping_method']) . $csv_enclosed : '';
	isset($_POST['co1041']) ? $export_csv_all_details .= $csv_separator . $csv_enclosed . strip_tags($row['payment_method']) . $csv_enclosed : '';
	isset($_POST['co1042']) ? $export_csv_all_details .= $csv_separator . $csv_enclosed . $row['order_status'] . $csv_enclosed : '';
	isset($_POST['co1043']) ? $export_csv_all_details .= $csv_separator . $csv_enclosed . html_entity_decode($row['store_name']) . $csv_enclosed : '';
	isset($_POST['co1044']) ? $export_csv_all_details .= $csv_separator . $csv_enclosed . $row['customer_id'] . $csv_enclosed : '';	
	isset($_POST['co1045']) ? $export_csv_all_details .= $csv_separator . $csv_enclosed . $row['payment_firstname'] . ' ' . $row['payment_lastname'] . $csv_enclosed : '';
	isset($_POST['co1046']) ? $export_csv_all_details .= $csv_separator . $csv_enclosed . $row['payment_company'] . $csv_enclosed : '';
	isset($_POST['co1047']) ? $export_csv_all_details .= $csv_separator . $csv_enclosed . $row['payment_address_1'] . $csv_enclosed : '';
	isset($_POST['co1048']) ? $export_csv_all_details .= $csv_separator . $csv_enclosed . $row['payment_address_2'] . $csv_enclosed : '';
	isset($_POST['co1049']) ? $export_csv_all_details .= $csv_separator . $csv_enclosed . $row['payment_city'] . $csv_enclosed : '';
	isset($_POST['co1050']) ? $export_csv_all_details .= $csv_separator . $csv_enclosed . $row['payment_zone'] . $csv_enclosed : '';
	isset($_POST['co1051']) ? $export_csv_all_details .= $csv_separator . $csv_enclosed . $row['payment_postcode'] . $csv_enclosed : '';
	isset($_POST['co1052']) ? $export_csv_all_details .= $csv_separator . $csv_enclosed . $row['payment_country'] . $csv_enclosed : '';
	isset($_POST['co1053']) ? $export_csv_all_details .= $csv_separator . $csv_enclosed . $row['telephone'] . $csv_enclosed : '';
	isset($_POST['co1054']) ? $export_csv_all_details .= $csv_separator . $csv_enclosed . $row['shipping_firstname'] . ' ' . $row['shipping_lastname'] . $csv_enclosed : '';
	isset($_POST['co1055']) ? $export_csv_all_details .= $csv_separator . $csv_enclosed . $row['shipping_company'] . $csv_enclosed : '';
	isset($_POST['co1056']) ? $export_csv_all_details .= $csv_separator . $csv_enclosed . $row['shipping_address_1'] . $csv_enclosed : '';
	isset($_POST['co1057']) ? $export_csv_all_details .= $csv_separator . $csv_enclosed . $row['shipping_address_2'] . $csv_enclosed : '';
	isset($_POST['co1058']) ? $export_csv_all_details .= $csv_separator . $csv_enclosed . $row['shipping_city'] . $csv_enclosed : '';
	isset($_POST['co1059']) ? $export_csv_all_details .= $csv_separator . $csv_enclosed . $row['shipping_zone'] . $csv_enclosed : '';
	isset($_POST['co1060']) ? $export_csv_all_details .= $csv_separator . $csv_enclosed . $row['shipping_postcode'] . $csv_enclosed : '';
	isset($_POST['co1061']) ? $export_csv_all_details .= $csv_separator . $csv_enclosed . $row['shipping_country'] . $csv_enclosed : '';
	isset($_POST['co1064']) ? $export_csv_all_details .= $csv_separator . $csv_enclosed . html_entity_decode($row['comment']) . $csv_enclosed : '';
	$export_csv_all_details .= $csv_row;
	}
	}

$filename = "customer_order_report_all_details_".date("Y-m-d",time());
header('Pragma: public');
header('Expires: 0');
header('Content-Description: File Transfer');
header('Content-Type: text/csv; charset=utf-8');
header('Cache-Control: must-revalidate, post-check=0, pre-check=0');		
header('Content-Disposition: attachment; filename='.$filename.".csv");
print $export_csv_all_details;			
exit;
?>