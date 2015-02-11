<?php echo $header; ?>
<?php if (!defined('_JEXEC')) { ?>
<script type="text/javascript">
$(document).ready(function() { 
  $("#content_report").hide(); 
  $(window).load(function() { 
    	$("#content_report").show(); 
    	$("#content-loading").hide(); 
  	});
});
</script>
<div id="content-loading" style="position: absolute; background-color:white; layer-background-color:white; height:100%; width:100%; text-align:center;"><img src="view/image/adv_reports/page_loading.gif" border="0"></div>
<?php } ?>
<style type="text/css">
.box > .content_report {
	padding: 10px;
	border-left: 1px solid #CCCCCC;
	border-right: 1px solid #CCCCCC;
	border-bottom: 1px solid #CCCCCC;
	min-height: 300px;
}
.list_main {
	border-collapse: collapse;
	width: 100%;
	border-top: 1px solid #DDDDDD;
	border-left: 1px solid #DDDDDD;	
	margin-bottom: 10px;
}
.list_main td {
	border-right: 1px solid #DDDDDD;
	border-bottom: 1px solid #DDDDDD;	
}
.list_main thead td {
	background-color: #E5E5E5;
	padding: 0px 5px;
	font-weight: bold;	
}
.list_main tbody td {
	vertical-align: middle;
	padding: 0px 5px;
}
.list_main .left {
	text-align: left;
	padding: 7px;
}
.list_main .right {
	text-align: right;
	padding: 7px;
}
.list_main .center {
	text-align: center;
	padding: 3px;
}
.list_main .noresult {
	text-align: center;
	padding: 7px;
}

.list_detail {
	border-collapse: collapse;
	width: 100%;
	border-top: 1px solid #DDDDDD;
	border-left: 1px solid #DDDDDD;
	margin-top: 10px;
	margin-bottom: 10px;
}
.list_detail td {
	border-right: 1px solid #DDDDDD;
	border-bottom: 1px solid #DDDDDD;
}
.list_detail thead td {
	background-color: #F0F0F0;
	padding: 0px 3px;
	font-size: 11px;
	font-weight: bold;
}
.list_detail tbody td {
	padding: 0px 3px;
	font-size: 11px;	
}
.list_detail .left {
	text-align: left;
	padding: 3px;
}
.list_detail .right {
	text-align: right;
	padding: 3px;
}
.list_detail .center {
	text-align: center;
	padding: 3px;
}

.columns_setting {
	float: left; 
	margin: 1px;
	padding: 1px;
	padding-right: 3px; 	
	border: thin dotted #666;
    -moz-border-radius: 3px; 
    border-radius: 3px;	
}
.set_unchecked {
	background-color: #ffcc99;
}

.export_item {
  text-decoration: none;
  cursor: pointer;
}
.export_item a {
  text-decoration: none;
}
.export_item :hover {
  opacity: 0.7;
  -moz-opacity: 0.7;
  -ms-filter: "alpha(opacity=70)"; /* IE 8 */
  filter: alpha(opacity=70); /* IE < 8 */
} 
.noexport_item {
  opacity: 0.5;
  -moz-opacity: 0.5;
  -ms-filter: "alpha(opacity=50)"; /* IE 8 */
  filter: alpha(opacity=50); /* IE < 8 */
} 

a.cbutton {
	text-decoration: none;
	color: #FFF;
	display: inline-block;
	padding: 5px 15px 5px 15px;
	-webkit-border-radius: 5px 5px 5px 5px;
	-moz-border-radius: 5px 5px 5px 5px;
	-khtml-border-radius: 5px 5px 5px 5px;
	border-radius: 5px 5px 5px 5px;
}

.pagination_report {
	padding:3px;
	margin:3px;
	text-align:right;
	margin-top:10px;
}
.pagination_report a {
	padding: 4px 8px 4px 8px;
	margin-right: 2px;
	border: 1px solid #ddd;
	text-decoration: none; 
	color: #666;
}
.pagination_report a:hover, .pagination_report a:active {
	padding: 4px 8px 4px 8px;
	margin-right: 2px;
	border: 1px solid #c0c0c0;
}
.pagination_report span.current {
	padding: 4px 8px 4px 8px;
	margin-right: 2px;
	border: 1px solid #a0a0a0;
	font-weight: bold;
	background-color: #f0f0f0;
	color: #666;
}
.pagination_report span.disabled {
	padding: 4px 8px 4px 8px;
	margin-right: 2px;
	border: 1px solid #f3f3f3;
	color: #ccc;
}

.ui-dialog .ui-dialog-content {
  background: #f3f3f3 !important;
} 

.styled-select-type {
	background-color: #ffcc99;
	padding: 3px;
 	border: 1px solid #BBB;
    -moz-border-radius: 3px; 
    border-radius: 3px;
}
.styled-select {
	background-color: #E7EFEF;
	padding: 3px;
 	border: 1px solid #BBB;
    -moz-border-radius: 3px; 
    border-radius: 3px;
}
.styled-select-range {
	background-color: #F9F9F9;
 	border: 1px solid #BBB;
	padding: 2px;
	margin-top: 5px;
    -moz-border-radius: 3px; 
    border-radius: 3px;
}
.styled-input {
	margin-top: 4px;
	height: 17px;
	border: solid 1px #BBB;
	color: #F90;
	background-color: #F9F9F9;
    -moz-border-radius: 3px; 
    border-radius: 3px;	
}
.styled-input-range {
	margin-top: 4px;
	height: 17px;
	border: solid 1px #BBB;
	color: #F90;
    -moz-border-radius: 3px; 
    border-radius: 3px;	
}

a.multiSelect {
	background: #F9F9F9 url(view/image/adv_reports/dropdown.png) right center no-repeat;
	border: solid 1px #BBB;
	padding: 1px;
	padding-right: 19px;
	margin-top: 4px;
	height: 18px;
	position: relative;
	cursor: default;
	text-decoration: none;
	color: black;
	display: -moz-inline-stack;
	display: inline-block;
	vertical-align: middle;
    -moz-border-radius: 3px; 
    border-radius: 3px;	
}
a.multiSelect:link, a.multiSelect:visited, a.multiSelect:hover, a.multiSelect:active {
	color: black;
	text-decoration: none;
	padding-top: 2px;	
}
a.multiSelect span {
	margin: 1px 0px 2px 4px;
	overflow: hidden;
	display: -moz-inline-stack;
	display: inline-block;
	min-width: 105px;
	max-width: 210px;	
}
.multiSelectOptions {
	margin-top: 2px;	
	overflow-y: auto;
	overflow-x: hidden;
	border: solid 1px #B2B2B2;
	background: #F9F9F9;
	padding-top: 2px;
	padding-bottom: 2px;
	min-width: 105px;
    -moz-border-radius: 3px; 
    border-radius: 3px;		
}
.multiSelectOptions LABEL {
	padding: 0px 2px;
	display: block;
	padding-top: 1px;
	padding-bottom: 1px;
	padding-left: 20px;	
}
.multiSelectOptions LABEL.optGroup {
	font-weight: bold;
}
.multiSelectOptions .optGroupContainer LABEL {
	padding-left: 10px;
}
.multiSelectOptions.optGroupHasCheckboxes .optGroupContainer LABEL {
	padding-left: 18px;
}
.multiSelectOptions input {
	vertical-align: middle;
	margin-left: -16px;
}
.multiSelectOptions LABEL.checked {
	background-color: #dce5f8;
}
.multiSelectOptions LABEL.selectAll {
	border-bottom: dotted 1px #CCC;
}
.multiSelectOptions LABEL.hover {
	background-color: #ffcc99;
	border: dotted 1px #999;
	color: #000;
}
</style>
<form method="post" action="index.php?route=report/adv_customer_order&token=<?php echo $token; ?>" id="report" name="report"> 
<div id="content">
  <div class="box">
    <div class="heading">
      <h1><div style="float:left;"><img src="view/image/adv_reports/adv_report_icon.png" width="22" height="22" alt="" /><?php echo $heading_title; ?></div></h1><span style="float:right; padding-top:5px; padding-right:5px; font-size:11px; color:#666; text-align:right;"><?php echo $heading_version; ?></span></div>
      <div align="right" style="height:38px; background-color:#F0F0F0; border: 1px solid #DDDDDD; margin-top:5px; white-space:nowrap;">
      <div style="padding-top: 5px; margin-right: 5px;"><?php echo $entry_customer_type; ?>
		<select name="filter_types" onchange="$('#report').submit();" class="styled-select-type">                      
            <?php if ($filter_types == '1') { ?>
            <option value="1" selected="selected"><?php echo $text_registered; ?></option>
            <?php } else { ?>
            <option value="1"><?php echo $text_registered; ?></option>
            <?php } ?>
            <?php if ($filter_types == '2') { ?>
            <option value="2" selected="selected"><?php echo $text_guest_customers; ?></option>
            <?php } else { ?>
            <option value="2"><?php echo $text_guest_customers; ?></option>
            <?php } ?>
            <?php if (!$filter_types or $filter_types == '3') { ?>        
            <option value="3" selected="selected"><?php echo $text_all_cust_types; ?></option> 
            <?php } else { ?>
            <option value="3"><?php echo $text_all_cust_types; ?></option> 
            <?php } ?>             
            <?php if ($filter_types == '4') { ?>
            <option value="4" selected="selected"><?php echo $text_new; ?></option>
            <?php } else { ?>
            <option value="4"><?php echo $text_new; ?></option>
            <?php } ?>             
          </select>&nbsp;&nbsp; 
          <?php echo $entry_group; ?>
          <select name="filter_group" class="styled-select" <?php echo ($filter_details == 4) ? 'disabled="disabled"' : '' ?>> 
            <?php foreach ($groups as $groups) { ?>
            <?php if ($groups['value'] == $filter_group) { ?>
            <option value="<?php echo $groups['value']; ?>" selected="selected"><?php echo $groups['text']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $groups['value']; ?>"><?php echo $groups['text']; ?></option>
            <?php } ?>
            <?php } ?>
          	<?php if ($filter_details == 4) { ?>
			<option selected="selected">----</option>
			<?php } ?>
          </select>&nbsp;&nbsp;           
          <?php echo $entry_sort_by; ?>
		  <select name="filter_sort" class="styled-select" <?php echo ($filter_details == 4) ? 'disabled="disabled"' : '' ?>>
            <?php if ($filter_sort == 'date') { ?>
            <option value="date" selected="selected"><?php echo $column_date; ?></option>
            <?php } else { ?>
            <option value="date"><?php echo $column_date; ?></option>
            <?php } ?>          
            <?php if ($filter_sort == 'customer_id') { ?>
            <option value="customer_id" selected="selected"><?php echo $column_id; ?></option>
            <?php } else { ?>
            <option value="customer_id"><?php echo $column_id; ?></option>
            <?php } ?>
            <?php if ($filter_sort == 'cust_name') { ?>
            <option value="cust_name" selected="selected"><?php echo $column_customer; ?></option>
            <?php } else { ?>
            <option value="cust_name"><?php echo $column_customer; ?></option>
            <?php } ?>
            <?php if ($filter_sort == 'cust_company') { ?>
            <option value="cust_company" selected="selected"><?php echo $column_company; ?></option>
            <?php } else { ?>
            <option value="cust_company"><?php echo $column_company; ?></option>
            <?php } ?>              
            <?php if ($filter_sort == 'cust_email') { ?>
            <option value="cust_email" selected="selected"><?php echo $column_email; ?></option>
            <?php } else { ?>
            <option value="cust_email"><?php echo $column_email; ?></option>
            <?php } ?>
            <?php if ($filter_sort == 'cust_telephone') { ?>
            <option value="cust_telephone" selected="selected"><?php echo $column_telephone; ?></option>
            <?php } else { ?>
            <option value="cust_telephone"><?php echo $column_telephone; ?></option>
            <?php } ?>               
            <?php if ($filter_sort == 'cust_country') { ?>
            <option value="cust_country" selected="selected"><?php echo $column_country; ?></option>
            <?php } else { ?>
            <option value="cust_country"><?php echo $column_country; ?></option>
            <?php } ?>            
            <?php if ($filter_sort == 'cust_group_reg') { ?>
            <option value="cust_group_reg" selected="selected"><?php echo $column_customer_group; ?></option>
            <?php } else { ?>
            <option value="cust_group_reg"><?php echo $column_customer_group; ?></option>
            <?php } ?>
            <?php if ($filter_sort == 'cust_status') { ?>
            <option value="cust_status" selected="selected"><?php echo $column_status; ?></option>
            <?php } else { ?>
            <option value="cust_status"><?php echo $column_status; ?></option>
            <?php } ?>
            <?php if ($filter_sort == 'cust_ip') { ?>
            <option value="cust_ip" selected="selected"><?php echo $column_ip; ?></option>
            <?php } else { ?>
            <option value="cust_ip"><?php echo $column_ip; ?></option>
            <?php } ?>
            <?php if ($filter_sort == 'mostrecent') { ?>
            <option value="mostrecent" selected="selected"><?php echo $column_mostrecent; ?></option>
            <?php } else { ?>
            <option value="mostrecent"><?php echo $column_mostrecent; ?></option>
            <?php } ?>                                                                                                        
            <?php if (!$filter_sort or $filter_sort == 'orders') { ?>
            <option value="orders" selected="selected"><?php echo $column_orders; ?></option>
            <?php } else { ?>
            <option value="orders"><?php echo $column_orders; ?></option>
            <?php } ?>
            <?php if ($filter_sort == 'products') { ?>
            <option value="products" selected="selected"><?php echo $column_products; ?></option>
            <?php } else { ?>
            <option value="products"><?php echo $column_products; ?></option>
            <?php } ?>
            <?php if ($filter_sort == 'total') { ?>
            <option value="total" selected="selected"><?php echo $column_value; ?></option>
            <?php } else { ?>
            <option value="total"><?php echo $column_value; ?></option>
            <?php } ?>
          	<?php if ($filter_details == 4) { ?>
			<option selected="selected">----</option>
			<?php } ?>
          </select>&nbsp;&nbsp; 
          <?php echo $entry_show_details; ?>
		  <select name="filter_details" class="styled-select">                      
            <?php if (!$filter_details or $filter_details == '0') { ?>
            <option value="0" selected="selected"><?php echo $text_no_details; ?></option>
            <?php } else { ?>
            <option value="0"><?php echo $text_no_details; ?></option>
            <?php } ?>
            <?php if ($filter_details == '1') { ?>
            <option value="1" selected="selected"><?php echo $text_order_list; ?></option>
            <?php } else { ?>
            <option value="1"><?php echo $text_order_list; ?></option>
            <?php } ?>
            <?php if ($filter_details == '2') { ?>
            <option value="2" selected="selected"><?php echo $text_product_list; ?></option>
            <?php } else { ?>
            <option value="2"><?php echo $text_product_list; ?></option>
            <?php } ?>  
            <?php if ($filter_details == '3') { ?>
            <option value="3" selected="selected"><?php echo $text_address_list; ?></option>
            <?php } else { ?>
            <option value="3"><?php echo $text_address_list; ?></option>
            <?php } ?>               
            <?php if ($filter_details == '4') { ?>
            <option value="4" selected="selected"><?php echo $text_all_details; ?></option>
            <?php } else { ?>
            <option value="4"><?php echo $text_all_details; ?></option>
            <?php } ?>                              
          </select>&nbsp;&nbsp; 
          <?php echo $entry_limit; ?>
		  <select name="filter_limit" class="styled-select"> 
            <?php if ($filter_limit == '10') { ?>
            <option value="10" selected="selected">10</option>
            <?php } else { ?>
            <option value="10">10</option>
            <?php } ?>                                
            <?php if (!$filter_limit or $filter_limit == '25') { ?>
            <option value="25" selected="selected">25</option>
            <?php } else { ?>
            <option value="25">25</option>
            <?php } ?>
            <?php if ($filter_limit == '50') { ?>
            <option value="50" selected="selected">50</option>
            <?php } else { ?>
            <option value="50">50</option>
            <?php } ?>
            <?php if ($filter_limit == '100') { ?>
            <option value="100" selected="selected">100</option>
            <?php } else { ?>
            <option value="100">100</option>
            <?php } ?>                        
          </select>&nbsp; <a onclick="$('#report').submit();" class="cbutton" style="background:#069;"><span><?php echo $button_filter; ?></span></a>&nbsp;<?php if ($customers) { ?><a id="show_tab_chart" class="cbutton" style="background:#993333;"><span><?php echo $button_chart; ?></span></a><?php } ?>&nbsp;<a id="show_tab_export" class="cbutton" style="background:#699;"><span><?php echo $button_export; ?></span></a>&nbsp;<a id="settings" class="cbutton" style="background:#666;"><span><?php echo $button_settings; ?></span></a>&nbsp;<a href="http://www.opencartreports.com/documentation/co/index.html" target="_blank" class="cbutton" style="background:#cc6633;"><span><?php echo $button_documentation; ?></span></a></div>
    </div>
    <div class="content_report">
<script type="text/javascript"><!--
$(document).ready(function() {
var prev = {start: 0, stop: 0},
    cont = $('#pagination_content #element');
	
$(".pagination_report").paging(cont.length, {
	format: '[< ncnnn! >]',
	perpage: '<?php echo $filter_limit; ?>',	
	lapping: 0,
	page: null, // we await hashchange() event
			onSelect: function() {

				var data = this.slice;

				cont.slice(prev[0], prev[1]).css('display', 'none');
				cont.slice(data[0], data[1]).fadeIn(0);

				prev = data;

				return true; // locate!
			},
			onFormat: function (type) {

				switch (type) {

					case 'block':

						if (!this.active)
							return '<span class="disabled">' + this.value + '</span>';
						else if (this.value != this.page)
							return '<em><a href="index.php?route=report/adv_customer_order&token=<?php echo $token; ?>#' + this.value + '">' + this.value + '</a></em>';
						return '<span class="current">' + this.value + '</span>';

					case 'next':

						if (this.active) {
							return '<a href="index.php?route=report/adv_customer_order&token=<?php echo $token; ?>#' + this.value + '" class="next">Next &gt;</a>';
						}
						return '';						

					case 'prev':

						if (this.active) {
							return '<a href="index.php?route=report/adv_customer_order&token=<?php echo $token; ?>#' + this.value + '" class="prev">&lt; Previous</a>';
						}	
						return '';						

					case 'first':

						if (this.active) {
							return '<?php echo $text_pagin_page; ?> ' + this.page + ' <?php echo $text_pagin_of; ?> ' + this.pages + '&nbsp;&nbsp;<a href="index.php?route=report/adv_customer_order&token=<?php echo $token; ?>#' + this.value + '" class="first">|&lt;</a>';
						}	
						return '<?php echo $text_pagin_page; ?> ' + this.page + ' <?php echo $text_pagin_of; ?> ' + this.pages + '&nbsp;&nbsp';
							
					case 'last':

						if (this.active) {
							return '<a href="index.php?route=report/adv_customer_order&token=<?php echo $token; ?>#' + this.value + '" class="prev">&gt;|</a>&nbsp;&nbsp;(' + cont.length + ' <?php echo $text_pagin_results; ?>)';
						}
						return '&nbsp;&nbsp;(' + cont.length + ' <?php echo $text_pagin_results; ?>)';					

				}
				return ''; // return nothing for missing branches
			}
});
});		
//--></script>         
<script type="text/javascript"><!--
function getStorage(key_prefix) {
    // this function will return us an object with a "set" and "get" method
    if (window.localStorage) {
        // use localStorage:
        return {
            set: function(id, data) {
                localStorage.setItem(key_prefix+id, data);
            },
            get: function(id) {
                return localStorage.getItem(key_prefix+id);
            }
        };
    }
}

$(document).ready(function() {
    // a key must is used for the cookie/storage
    var storedData = getStorage('com_mysite_checkboxes_'); 
    
    $('div.check input:checkbox').bind('change',function(){
        $('#'+this.id+'_filter').toggle($(this).is(':checked'));
        $('#'+this.id+'_title').toggle($(this).is(':checked'));
			<?php if ($customers) {
					foreach ($customers as $key => $customer) {
						echo "$('#'+this.id+'_" . $customer['order_id'] . "_title').toggle($(this).is(':checked')); ";
						echo "$('#'+this.id+'_" . $customer['order_id'] . "').toggle($(this).is(':checked')); ";						
					}			
			} 
			;?>		
        $('#'+this.id+'_total').toggle($(this).is(':checked'));			
        // save the data on change
        storedData.set(this.id, $(this).is(':checked')?'checked':'not');
    }).each(function() {
        // on load, set the value to what we read from storage:
        var val = storedData.get(this.id);
        if (val == 'checked') $(this).attr('checked', 'checked');
        if (val == 'not') $(this).removeAttr('checked');
        if (val) $(this).trigger('change');
    });
});
//--></script>
<div id="settings_window" style="display:none">
<div class="check">
<table align="center" cellspacing="0" cellpadding="0">   
    <tr><td>
      &nbsp;<span style="font-size:14px; font-weight:bold;"><?php echo $text_filtering_options; ?></span><br />        
      <table width="100%" cellspacing="0" cellpadding="3" style="background:#E7EFEF; border:1px solid #DDDDDD; margin-top:3px;">
        <tr>
          <td>
			<div class="columns_setting"><input id="co2" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co2"><?php echo substr($entry_store,0,-1); ?></label></div>
			<div class="columns_setting"><input id="co3" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co3"><?php echo substr($entry_currency,0,-1); ?></label></div>
			<div class="columns_setting"><input id="co4a" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co4a"><?php echo substr($entry_tax,0,-1); ?></label></div>
			<div class="columns_setting"><input id="co4c" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co4c"><?php echo substr($entry_tax_classes,0,-1); ?></label></div>
			<div class="columns_setting"><input id="co4b" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co4b"><?php echo substr($entry_geo_zone,0,-1); ?></label></div>
			<div class="columns_setting"><input id="co5" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co5"><?php echo substr($entry_customer_group,0,-1); ?></label></div>
            <div class="columns_setting"><input id="co6" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co6"><?php echo substr($entry_customer_status,0,-1); ?></label></div>
			<div class="columns_setting"><input id="co7" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co7"><?php echo substr($entry_customer_name,0,-1); ?></label></div>
			<div class="columns_setting"><input id="co8a" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co8a"><?php echo substr($entry_customer_email,0,-1); ?></label></div>
			<div class="columns_setting"><input id="co8b" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co8b"><?php echo substr($entry_customer_telephone,0,-1); ?></label></div>
            <div class="columns_setting"><input id="co8c" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co8c"><?php echo substr($entry_ip,0,-1); ?></label></div>
			<div class="columns_setting"><input id="co17a" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co17a"><?php echo substr($entry_payment_company,0,-1); ?></label></div>
			<div class="columns_setting"><input id="co17b" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co17b"><?php echo substr($entry_payment_address,0,-1); ?></label></div>
			<div class="columns_setting"><input id="co17c" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co17c"><?php echo substr($entry_payment_city,0,-1); ?></label></div>
			<div class="columns_setting"><input id="co17d" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co17d"><?php echo substr($entry_payment_zone,0,-1); ?></label></div>
			<div class="columns_setting"><input id="co17e" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co17e"><?php echo substr($entry_payment_postcode,0,-1); ?></label></div>
            <div class="columns_setting"><input id="co17f" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co17f"><?php echo substr($entry_payment_country,0,-1); ?></label></div>
            <div class="columns_setting"><input id="co13" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co13"><?php echo substr($entry_payment_method,0,-1); ?></label></div>
			<div class="columns_setting"><input id="co16a" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co16a"><?php echo substr($entry_shipping_company,0,-1); ?></label></div>
			<div class="columns_setting"><input id="co16b" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co16b"><?php echo substr($entry_shipping_address,0,-1); ?></label></div>
			<div class="columns_setting"><input id="co16c" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co16c"><?php echo substr($entry_shipping_city,0,-1); ?></label></div>
			<div class="columns_setting"><input id="co16d" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co16d"><?php echo substr($entry_shipping_zone,0,-1); ?></label></div>
			<div class="columns_setting"><input id="co16e" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co16e"><?php echo substr($entry_shipping_postcode,0,-1); ?></label></div>
			<div class="columns_setting"><input id="co16f" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co16f"><?php echo substr($entry_shipping_country,0,-1); ?></label></div>
            <div class="columns_setting"><input id="co14" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co14"><?php echo substr($entry_shipping_method,0,-1); ?></label></div>
			<div class="columns_setting"><input id="co9d" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co9d"><?php echo substr($entry_category,0,-1); ?></label></div>
            <div class="columns_setting"><input id="co9e" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co9e"><?php echo substr($entry_manufacturer,0,-1); ?></label></div>
            <div class="columns_setting"><input id="co9a" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co9a"><?php echo substr($entry_sku,0,-1); ?></label></div>
            <div class="columns_setting"><input id="co9b" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co9b"><?php echo substr($entry_product,0,-1); ?></label></div>
            <div class="columns_setting"><input id="co9c" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co9c"><?php echo substr($entry_model,0,-1); ?></label></div>
            <div class="columns_setting"><input id="co10" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co10"><?php echo substr($entry_option,0,-1); ?></label></div>
            <div class="columns_setting"><input id="co18" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co18"><?php echo substr($entry_attributes,0,-1); ?></label></div>
            <div class="columns_setting"><input id="co11" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co11"><?php echo substr($entry_location,0,-1); ?></label></div>
            <div class="columns_setting"><input id="co12a" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co12a"><?php echo substr($entry_affiliate_name,0,-1); ?></label></div>
            <div class="columns_setting"><input id="co12b" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co12b"><?php echo substr($entry_affiliate_email,0,-1); ?></label></div>
            <div class="columns_setting"><input id="co15a" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co15a"><?php echo substr($entry_coupon_name,0,-1); ?></label></div>
            <div class="columns_setting"><input id="co15b" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co15b"><?php echo substr($entry_coupon_code,0,-1); ?></label></div>
            <div class="columns_setting"><input id="co19" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co19"><?php echo substr($entry_voucher_code,0,-1); ?></label></div>
          </td>                                                                                                                        
        </tr>        
      </table><br />         
      &nbsp;<span style="font-size:14px; font-weight:bold;"><?php echo $text_column_settings; ?></span><br />  
      <table width="100%" cellspacing="0" cellpadding="3" style="background:#E5E5E5; border:1px solid #DDDDDD; margin-top:3px;">
        <tr>
          <td>
            &nbsp;<span style="font-size:11px; font-weight:bold;"><?php echo $text_mv_columns; ?></span><br />           
			<div class="columns_setting"><input id="co20" name="co20" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co20"><?php echo $column_id; ?></label></div>
			<div class="columns_setting"><input id="co21" name="co21" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co21"><?php echo $column_customer; ?> / <?php echo $column_company; ?></label></div>
			<div class="columns_setting"><input id="co22" name="co22" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co22"><?php echo $column_email; ?></label></div>
			<div class="columns_setting"><input id="co35" name="co35" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co35"><?php echo $column_telephone; ?></label></div>
			<div class="columns_setting"><input id="co34" name="co34" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co34"><?php echo $column_country; ?></label></div>
			<div class="columns_setting"><input id="co23" name="co23" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co23"><?php echo $column_customer_group; ?></label></div>
			<div class="columns_setting"><input id="co24" name="co24" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co24"><?php echo $column_status; ?></label></div>
			<div class="columns_setting"><input id="co25" name="co25" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co25"><?php echo $column_ip; ?></label></div>
			<div class="columns_setting"><input id="co26" name="co26" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co26"><?php echo $column_mostrecent; ?></label></div>
			<div class="columns_setting"><input id="co27" name="co27" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co27"><?php echo $column_orders; ?></label></div>
            <div class="columns_setting"><input id="co28" name="co28" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co28"><?php echo $column_products; ?></label></div>
            <div class="columns_setting"><input id="co30" name="co30" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co30"><?php echo $column_value; ?></label></div>
          </td>                                                                                                                        
        </tr>
		<tr><td>
		<span style="font-size:11px; color:#390;">* <?php echo $text_export_note; ?></span>  
		</td></tr>          
      </table>
      <table width="100%" cellspacing="0" cellpadding="3" style="background:#F0F0F0; border:1px solid #DDDDDD; margin-top:3px;">
        <tr>
          <td>
            &nbsp;<span style="font-size:11px; font-weight:bold;"><?php echo $text_ol_columns; ?></span><br />            
			<div class="columns_setting"><input id="co40" name="co40" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co40"><?php echo $column_order_order_id; ?></label></div>
			<div class="columns_setting"><input id="co41" name="co41" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co41"><?php echo $column_order_date_added; ?></label></div>
			<div class="columns_setting"><input id="co42" name="co42" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co42"><?php echo $column_order_inv_no; ?></label></div>
			<div class="columns_setting"><input id="co43" name="co43" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co43"><?php echo $column_order_customer; ?></label></div>
			<div class="columns_setting"><input id="co44" name="co44" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co44"><?php echo $column_order_email; ?></label></div>
			<div class="columns_setting"><input id="co45" name="co45" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co45"><?php echo $column_order_customer_group; ?></label></div>
			<div class="columns_setting"><input id="co46" name="co46" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co46"><?php echo $column_order_shipping_method; ?></label></div>	
            <div class="columns_setting"><input id="co47" name="co47" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co47"><?php echo $column_order_payment_method; ?></label></div>
            <div class="columns_setting"><input id="co48" name="co48" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co48"><?php echo $column_order_status; ?></label></div>
            <div class="columns_setting"><input id="co49" name="co49" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co49"><?php echo $column_order_store; ?></label></div>
            <div class="columns_setting"><input id="co50" name="co50" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co50"><?php echo $column_order_currency; ?></label></div>
            <div class="columns_setting"><input id="co51" name="co51" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co51"><?php echo $column_order_quantity; ?></label></div>
            <div class="columns_setting"><input id="co52" name="co52" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co52"><?php echo $column_order_sub_total; ?></label></div>
            <div class="columns_setting"><input id="co54" name="co54" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co54"><?php echo $column_order_shipping; ?></label></div>
            <div class="columns_setting"><input id="co55" name="co55" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co55"><?php echo $column_order_tax; ?></label></div>
            <div class="columns_setting"><input id="co56" name="co56" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co56"><?php echo $column_order_value; ?></label></div>
          </td>                                                                                                                        
        </tr>
		<tr><td>
		<span style="font-size:11px; color:#390;">* <?php echo $text_export_note; ?> - <strong><?php echo strip_tags($text_export_order_list); ?></strong></span>  
		</td></tr>          
      </table>
      <table width="100%" cellspacing="0" cellpadding="3" style="background:#F0F0F0; border:1px solid #DDDDDD; margin-top:3px;">
        <tr>
          <td>
            &nbsp;<span style="font-size:11px; font-weight:bold;"><?php echo $text_pl_columns; ?></span><br />              
			<div class="columns_setting"><input id="co60" name="co60" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co60"><?php echo $column_prod_order_id; ?></label></div>
			<div class="columns_setting"><input id="co61" name="co61" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co61"><?php echo $column_prod_date_added; ?></label></div>
			<div class="columns_setting"><input id="co62" name="co62" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co62"><?php echo $column_prod_inv_no; ?></label></div>
			<div class="columns_setting"><input id="co63" name="co63" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co63"><?php echo $column_prod_id; ?></label></div>
			<div class="columns_setting"><input id="co64" name="co64" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co64"><?php echo $column_prod_sku; ?></label></div>
			<div class="columns_setting"><input id="co65" name="co65" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co65"><?php echo $column_prod_model; ?></label></div>
			<div class="columns_setting"><input id="co66" name="co66" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co66"><?php echo $column_prod_name; ?></label></div>
			<div class="columns_setting"><input id="co67" name="co67" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co67"><?php echo $column_prod_option; ?></label></div>
			<div class="columns_setting"><input id="co77" name="co77" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co77"><?php echo $column_prod_attributes; ?></label></div>
            <div class="columns_setting"><input id="co68" name="co68" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co68"><?php echo $column_prod_manu; ?></label></div> 
            <div class="columns_setting"><input id="co79" name="co79" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co79"><?php echo $column_prod_category; ?></label></div>
            <div class="columns_setting"><input id="co69" name="co69" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co69"><?php echo $column_prod_currency; ?></label></div>
            <div class="columns_setting"><input id="co70" name="co70" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co70"><?php echo $column_prod_price; ?></label></div>
            <div class="columns_setting"><input id="co71" name="co71" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co71"><?php echo $column_prod_quantity; ?></label></div>
            <div class="columns_setting"><input id="co72a" name="co72a" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co72a"><?php echo $column_prod_total_excl_vat; ?></label></div>
            <div class="columns_setting"><input id="co73" name="co73" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co73"><?php echo $column_prod_tax; ?></label></div>
            <div class="columns_setting"><input id="co72b" name="co72b" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co72b"><?php echo $column_prod_total_incl_vat; ?></label></div>
          </td>                                                                                                                        
        </tr>
		<tr><td>
		<span style="font-size:11px; color:#390;">* <?php echo $text_export_note; ?> - <strong><?php echo strip_tags($text_export_product_list); ?></strong></span>  
		</td></tr>          
      </table>
      <table width="100%" cellspacing="0" cellpadding="3" style="background:#F0F0F0; border:1px solid #DDDDDD; margin-top:3px;">
        <tr>
          <td>
            &nbsp;<span style="font-size:11px; font-weight:bold;"><?php echo $text_al_columns; ?></span><br />             
			<div class="columns_setting"><input id="co84" name="co84" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co84"><?php echo strip_tags($column_billing_name); ?></label></div>
			<div class="columns_setting"><input id="co85" name="co85" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co85"><?php echo strip_tags($column_billing_company); ?></label></div>
			<div class="columns_setting"><input id="co86" name="co86" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co86"><?php echo strip_tags($column_billing_address_1); ?></label></div>
			<div class="columns_setting"><input id="co87" name="co87" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co87"><?php echo strip_tags($column_billing_address_2); ?></label></div>			
            <div class="columns_setting"><input id="co88" name="co88" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co88"><?php echo strip_tags($column_billing_city); ?></label></div>
            <div class="columns_setting"><input id="co89" name="co89" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co89"><?php echo strip_tags($column_billing_zone); ?></label></div>
            <div class="columns_setting"><input id="co90" name="co90" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co90"><?php echo strip_tags($column_billing_postcode); ?></label></div>
            <div class="columns_setting"><input id="co91" name="co91" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co91"><?php echo strip_tags($column_billing_country); ?></label></div>
			<div class="columns_setting"><input id="co93" name="co93" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co93"><?php echo strip_tags($column_shipping_name); ?></label></div>
			<div class="columns_setting"><input id="co94" name="co94" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co94"><?php echo strip_tags($column_shipping_company); ?></label></div>
			<div class="columns_setting"><input id="co95" name="co95" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co95"><?php echo strip_tags($column_shipping_address_1); ?></label></div>
			<div class="columns_setting"><input id="co96" name="co96" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co96"><?php echo strip_tags($column_shipping_address_2); ?></label></div>
            <div class="columns_setting"><input id="co97" name="co97" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co97"><?php echo strip_tags($column_shipping_city); ?></label></div>
            <div class="columns_setting"><input id="co98" name="co98" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co98"><?php echo strip_tags($column_shipping_zone); ?></label></div>
            <div class="columns_setting"><input id="co99" name="co99" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co99"><?php echo strip_tags($column_shipping_postcode); ?></label></div>
            <div class="columns_setting"><input id="co100" name="co100" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co100"><?php echo strip_tags($column_shipping_country); ?></label></div>
          </td>                                                                                                                        
        </tr>
		<tr><td>
		<span style="font-size:11px; color:#390;">* <?php echo $text_export_note; ?> - <strong><?php echo strip_tags($text_export_address_list); ?></strong></span>
		</td></tr>         
      </table>
      <table width="100%" cellspacing="0" cellpadding="3" style="background:#F0F0F0; border:1px solid #DDDDDD; margin-top:3px;">
        <tr>
          <td>
            &nbsp;<span style="font-size:11px; font-weight:bold;"><?php echo $text_all_columns; ?></span><br />
			<div class="columns_setting"><input id="co1000" name="co1000" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co1000"><?php echo $column_order_inv_no; ?></label></div>            
			<div class="columns_setting"><input id="co1001" name="co1001" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co1001"><?php echo $column_order_customer; ?></label></div>
			<div class="columns_setting"><input id="co1002" name="co1002" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co1002"><?php echo $column_order_email; ?></label></div>
			<div class="columns_setting"><input id="co1003" name="co1003" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co1003"><?php echo $column_order_customer_group; ?></label></div>
			<div class="columns_setting"><input id="co1004" name="co1004" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co1004"><?php echo $column_prod_id; ?></label></div>
			<div class="columns_setting"><input id="co1005" name="co1005" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co1005"><?php echo $column_prod_sku; ?></label></div>
			<div class="columns_setting"><input id="co1006" name="co1006" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co1006"><?php echo $column_prod_model; ?></label></div>
			<div class="columns_setting"><input id="co1007" name="co1007" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co1007"><?php echo $column_prod_name; ?></label></div>
			<div class="columns_setting"><input id="co1008" name="co1008" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co1008"><?php echo $column_prod_option; ?></label></div>
			<div class="columns_setting"><input id="co1009" name="co1009" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co1009"><?php echo $column_prod_attributes; ?></label></div>
			<div class="columns_setting"><input id="co1010" name="co1010" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co1010"><?php echo $column_prod_manu; ?></label></div>
			<div class="columns_setting"><input id="co1011" name="co1011" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co1011"><?php echo $column_prod_category; ?></label></div>            
			<div class="columns_setting"><input id="co1012" name="co1012" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co1012"><?php echo $column_prod_currency; ?></label></div>
			<div class="columns_setting"><input id="co1062" name="co1062" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co1062"><?php echo $column_order_quantity; ?></label></div>
			<div class="columns_setting"><input id="co1013" name="co1013" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co1013"><?php echo $column_prod_price; ?></label></div>
			<div class="columns_setting"><input id="co1014" name="co1014" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co1014"><?php echo $column_prod_quantity; ?></label></div>   
            <div class="columns_setting"><input id="co1016a" name="co1016a" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co1016a"><?php echo $column_prod_total_excl_vat; ?></label></div>
            <div class="columns_setting"><input id="co1015" name="co1015" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co1015"><?php echo $column_prod_tax; ?></label></div>
            <div class="columns_setting"><input id="co1016b" name="co1016b" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co1016b"><?php echo $column_prod_total_incl_vat; ?></label></div>
            <div class="columns_setting"><input id="co1020" name="co1020" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co1020"><?php echo $column_order_sub_total; ?></label></div>
            <div class="columns_setting"><input id="co1023" name="co1023" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co1023"><?php echo $column_order_shipping; ?></label></div>
            <div class="columns_setting"><input id="co1027" name="co1027" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co1027"><?php echo $column_order_tax; ?></label></div>
            <div class="columns_setting"><input id="co1031" name="co1031" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co1031"><?php echo $column_order_value; ?></label></div>
			<div class="columns_setting"><input id="co1040" name="co1040" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co1040"><?php echo $column_order_shipping_method; ?></label></div>
			<div class="columns_setting"><input id="co1041" name="co1041" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co1041"><?php echo $column_order_payment_method; ?></label></div>
			<div class="columns_setting"><input id="co1042" name="co1042" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co1042"><?php echo $column_order_status; ?></label></div>
			<div class="columns_setting"><input id="co1043" name="co1043" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co1043"><?php echo $column_order_store; ?></label></div>
			<div class="columns_setting"><input id="co1044" name="co1044" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co1044"><?php echo $column_customer_cust_id; ?></label></div>
			<div class="columns_setting"><input id="co1045" name="co1045" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co1045"><?php echo strip_tags($column_billing_name); ?></label></div>
			<div class="columns_setting"><input id="co1046" name="co1046" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co1046"><?php echo strip_tags($column_billing_company); ?></label></div>
			<div class="columns_setting"><input id="co1047" name="co1047" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co1047"><?php echo strip_tags($column_billing_address_1); ?></label></div>
			<div class="columns_setting"><input id="co1048" name="co1048" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co1048"><?php echo strip_tags($column_billing_address_2); ?></label></div>			
            <div class="columns_setting"><input id="co1049" name="co1049" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co1049"><?php echo strip_tags($column_billing_city); ?></label></div>
            <div class="columns_setting"><input id="co1050" name="co1050" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co1050"><?php echo strip_tags($column_billing_zone); ?></label></div>
            <div class="columns_setting"><input id="co1051" name="co1051" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co1051"><?php echo strip_tags($column_billing_postcode); ?></label></div>
            <div class="columns_setting"><input id="co1052" name="co1052" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co1052"><?php echo strip_tags($column_billing_country); ?></label></div>
            <div class="columns_setting"><input id="co1053" name="co1053" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co1053"><?php echo $column_customer_telephone; ?></label></div>
			<div class="columns_setting"><input id="co1054" name="co1054" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co1054"><?php echo strip_tags($column_shipping_name); ?></label></div>
			<div class="columns_setting"><input id="co1055" name="co1055" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co1055"><?php echo strip_tags($column_shipping_company); ?></label></div>
			<div class="columns_setting"><input id="co1056" name="co1056" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co1056"><?php echo strip_tags($column_shipping_address_1); ?></label></div>
			<div class="columns_setting"><input id="co1057" name="co1057" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co1057"><?php echo strip_tags($column_shipping_address_2); ?></label></div>
            <div class="columns_setting"><input id="co1058" name="co1058" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co1058"><?php echo strip_tags($column_shipping_city); ?></label></div>
            <div class="columns_setting"><input id="co1059" name="co1059" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co1059"><?php echo strip_tags($column_shipping_zone); ?></label></div>
            <div class="columns_setting"><input id="co1060" name="co1060" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co1060"><?php echo strip_tags($column_shipping_postcode); ?></label></div>
            <div class="columns_setting"><input id="co1061" name="co1061" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co1061"><?php echo strip_tags($column_shipping_country); ?></label></div>
            <div class="columns_setting"><input id="co1064" name="co1064" checked="checked" type="checkbox" style="vertical-align: middle;"><label for="co1064"><?php echo $column_order_comment; ?></label></div>
          </td>                                                                                                                        
        </tr>
		<tr><td>
		<span style="font-size:11px; color:#390;">* <?php echo $text_export_note; ?> - <strong><?php echo strip_tags($text_export_all_details); ?></strong></span>  
		</td></tr>         
      </table>     
	</td></tr>              
</table>     
</div>
</div>  
<script type="text/javascript"><!--
$("input[type='checkbox']").change(function() {
    if ($(this).is(":checked")) {
        $(this).parent().removeClass("set_unchecked"); 
    } else {
        $(this).parent().addClass("set_unchecked");  
    }
});
//--></script> 
<script type="text/javascript">
$("#settings").click(function() {					  
    var dlg = $("#settings_window").dialog({
            title: '<?php echo $button_settings; ?>',
            width: 900,
            height: 600,
            modal: true,			
    });
	dlg.parent().appendTo($("#report"));
});
</script> 
<script type="text/javascript">$(function(){ 
$('#show_tab_export').click(function() {
		$('#tab_export').slideToggle('fast');
	});
});
</script>    
  <div id="tab_export" style="background:#E7EFEF; border:1px solid #C6D7D7; padding:3px; margin-bottom:10px; -moz-border-radius: 3px; border-radius: 3px; display:none">
      <table width="100%" cellspacing="0" cellpadding="3">
        <tr>
          <td width="6%">&nbsp;</td>
          <td width="23%" align="center" nowrap="nowrap">
          	<span id="export_xls" class="export_item"><img src="view/image/adv_reports/XLS.png" width="48" height="48" border="0" title="XLS (Excel 97/2000)" /></span>
            <span id="export_xlsx" class="export_item"><img src="view/image/adv_reports/XLSX.png" width="48" height="48" border="0" title="XLSX (Excel 2007/2010)" /></span>
            <span id="export_csv" class="export_item"><img src="view/image/adv_reports/CSV.png" width="48" height="48" border="0" title="CSV" /></span>
            <span id="export_html" class="export_item"><img src="view/image/adv_reports/HTML.png" width="48" height="48" border="0" title="HTML" /></span>
            <span id="export_pdf" class="export_item"><img src="view/image/adv_reports/PDF.png" width="48" height="48" border="0" title="PDF" /></span></td>
          <td width="23%" align="center" nowrap="nowrap">
          	<span id="export_xls_all_details" class="export_item"><img src="view/image/adv_reports/XLS.png" width="48" height="48" border="0" title="XLS (Excel 97/2000)" /></span>
            <span id="export_xlsx_all_details" class="export_item"><img src="view/image/adv_reports/XLSX.png" width="48" height="48" border="0" title="XLSX (Excel 2007/2010)" /></span>
          	<span id="export_csv_all_details" class="export_item"><img src="view/image/adv_reports/CSV.png" width="48" height="48" border="0" title="CSV" /></span>
          	<span id="export_html_all_details" class="export_item"><img src="view/image/adv_reports/HTML.png" width="48" height="48" border="0" title="HTML" /></span>
          	<span id="export_pdf_all_details" class="export_item"><img src="view/image/adv_reports/PDF.png" width="48" height="48" border="0" title="PDF" /></span></td>
          <td width="14%" align="center" nowrap="nowrap">
            <span id="export_html_order_list" class="export_item"><img src="view/image/adv_reports/HTML.png" width="48" height="48" border="0" title="HTML" /></span>
            <span id="export_pdf_order_list" class="export_item"><img src="view/image/adv_reports/PDF.png" width="48" height="48" border="0" title="PDF" /></span></td>
          <td width="14%" align="center" nowrap="nowrap">
            <span id="export_html_product_list" class="export_item"><img src="view/image/adv_reports/HTML.png" width="48" height="48" border="0" title="HTML" /></span>
            <span id="export_pdf_product_list" class="export_item"><img src="view/image/adv_reports/PDF.png" width="48" height="48" border="0" title="PDF" /></span></td>
          <td width="14%" align="center" nowrap="nowrap">
          	<span id="export_html_address_list" class="export_item"><img src="view/image/adv_reports/HTML.png" width="48" height="48" border="0" title="HTML" /></span>
          	<span id="export_pdf_address_list" class="export_item"><img src="view/image/adv_reports/PDF.png" width="48" height="48" border="0" title="PDF" /></span></td>
          <td width="6%">&nbsp;</td>
        </tr>
        <tr>
          <td width="6%">&nbsp;</td>
          <td width="23%" align="center" nowrap="nowrap"><?php echo $text_export_no_details; ?></td>
          <td width="23%" align="center" nowrap="nowrap"><?php echo $text_export_all_details; ?></td>          
          <td width="14%" align="center" nowrap="nowrap"><?php echo $text_export_order_list; ?></td>
          <td width="14%" align="center" nowrap="nowrap"><?php echo $text_export_product_list; ?></td>
          <td width="14%" align="center" nowrap="nowrap"><?php echo $text_export_address_list; ?></td>
          <td width="6%">&nbsp;</td>
        </tr>     
        <tr>
          <td colspan="7">*<span style="font-size:10px"><?php echo $text_export_notice1; ?> <a href="view/template/module/adv_reports/adv_requirements_limitations.htm" id="adv_export_limit"><strong><?php echo $text_export_limit; ?></strong></a> <?php echo $text_export_notice2; ?></span></td>
        </tr>        
      </table>
  <input type="hidden" id="export" name="export" value="" />
<div id="adv_export_limit_text" style="display:none"></div>
<script type="text/javascript">
$("#adv_export_limit").click(function(e) {
    e.preventDefault();
    $("#adv_export_limit_text").load(this.href, function() {
        $(this).dialog({
            title: '<?php echo $text_export_limit; ?>',
            width:  800,
            height:  600,
            minWidth:  500,
            minHeight:  400,
            modal: true,
        });
    });
    return false;
});
</script>   
  </div> 
<script type="text/javascript">
$(document).ready(function() {
var $filter_range = $('#filter_range'), $date_start = $('#date-start'), $date_end = $('#date-end');
$filter_range.change(function () {
    if ($filter_range.val() == 'custom') {
        $date_start.removeAttr('disabled');
        $date_end.removeAttr('disabled');
    } else {	
        $date_start.attr('disabled', 'disabled').val('');
        $date_end.attr('disabled', 'disabled').val('');
    }
}).trigger('change');
});
</script>    
<div style="background: #E7EFEF; border: 1px solid #C6D7D7; margin-bottom: 15px; -moz-border-radius: 3px; border-radius: 3px;">
	<table width="100%" cellspacing="0" cellpadding="3">
	<tr>
	<td>
	 <table cellspacing="0" cellpadding="0">
  	 <tr>
     <td style="background:#C6D7D7;">
	 <table align="right" border="0" cellspacing="0" cellpadding="0" style="background:#C6D7D7; border:2px solid #E7EFEF; padding:5px; margin-top:3px; margin-bottom:3px;">
	 <tr><td colspan="3" align="center"><span style="font-weight:bold; color:#333;"><?php echo $entry_order_created; ?></span></td></tr>
  	 <tr><td>
       <table cellpadding="0" cellspacing="0" style="padding-top:3px;">
       <tr><td align="left"><?php echo $entry_range; ?><br />    
            <select name="filter_range" id="filter_range" class="styled-select-range">
              <?php foreach ($ranges as $range) { ?>
              <?php if ($range['value'] == $filter_range) { ?>
              <option value="<?php echo $range['value']; ?>" title="<?php echo $range['text']; ?>" style="<?php echo $range['style']; ?>" selected="selected"><?php echo $range['text']; ?></option>
              <?php } else { ?>
              <option value="<?php echo $range['value']; ?>" title="<?php echo $range['text']; ?>" style="<?php echo $range['style']; ?>"><?php echo $range['text']; ?></option>
              <?php } ?>
              <?php } ?>
            </select>
       </td><td width="5"></td></tr></table>
     </td><td>      
       <table cellpadding="0" cellspacing="0" style="padding-top:3px;">
       <tr><td align="left">&nbsp;<?php echo $entry_date_start; ?><br />
          <input type="text" name="filter_date_start" value="<?php echo $filter_date_start; ?>" id="date-start" size="12" class="styled-input-range" />
       </td><td width="5"></td></tr></table>
     </td><td>
       <table cellpadding="0" cellspacing="0" style="padding-top:3px;">
       <tr><td align="left">&nbsp;<?php echo $entry_date_end; ?><br />
          <input type="text" name="filter_date_end" value="<?php echo $filter_date_end; ?>" id="date-end" size="12" class="styled-input-range" />
       </td><td></td></tr></table>
     </td></tr></table>  
     </td>
     <td align="center" style="background:#C6D7D7;">      
	 <table border="0" cellspacing="0" cellpadding="0" style="background:#C6D7D7; border:2px solid #E7EFEF; padding:5px; margin-top:3px; margin-bottom:3px;">
	 <tr><td colspan="3" align="center"><span style="font-weight:bold; color:#333;"><?php echo $entry_status_changed; ?></span></td></tr>
  	 <tr><td>
       <table cellpadding="0" cellspacing="0" style="padding-top:3px;">
       <tr><td align="left">&nbsp;<?php echo $entry_date_start; ?><br />
          <input type="text" name="filter_status_date_start" value="<?php echo $filter_status_date_start; ?>" id="status-date-start" size="12" class="styled-input" />
       </td><td width="5"></td></tr></table>
     </td><td> 
       <table cellpadding="0" cellspacing="0" style="padding-top:3px;">
       <tr><td align="left">&nbsp;<?php echo $entry_date_end; ?><br />
          <input type="text" name="filter_status_date_end" value="<?php echo $filter_status_date_end; ?>" id="status-date-end" size="12" class="styled-input" />
       </td><td width="5"></td></tr></table>
     </td><td> 
       <table cellpadding="0" cellspacing="0" style="padding-top:3px;">
       <tr><td align="left"><?php echo $entry_status; ?><br />
          <span <?php echo (!$filter_order_status_id) ? '' : 'class="vtip"' ?> title="<?php foreach ($order_statuses as $order_status) { ?><?php if (isset($filter_order_status_id[$order_status['order_status_id']])) { ?><?php echo $order_status['name']; ?><br /><?php } ?><?php } ?>">
          <select name="filter_order_status_id" id="filter_order_status_id" multiple="multiple" size="1">
            <?php foreach ($order_statuses as $order_status) { ?>
            <?php if (isset($filter_order_status_id[$order_status['order_status_id']])) { ?>
            <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
            <?php } ?>
            <?php } ?>
          </select></span>
       </td></tr></table>
     </td></tr></table>
	 </td>
     <td style="background:#C6D7D7;">        
	 <table align="left" border="0" cellspacing="0" cellpadding="0" style="background:#C6D7D7; border:2px solid #E7EFEF; padding:5px; margin-top:3px; margin-bottom:3px;">
	 <tr><td colspan="2" align="center"><span style="font-weight:bold; color:#333;"><?php echo $entry_order_id; ?></span></td></tr>
  	 <tr><td>  
       <table cellpadding="0" cellspacing="0" style="padding-top:3px;">
       <tr><td align="left">&nbsp;<?php echo $entry_order_id_from; ?><br />
          <input type="text" name="filter_order_id_from" value="<?php echo $filter_order_id_from; ?>" size="12" class="styled-input" />
       </td><td width="5"></td></tr></table>
     </td><td> 
       <table cellpadding="0" cellspacing="0" style="padding-top:3px;">
       <tr><td align="left">&nbsp;<?php echo $entry_order_id_to; ?><br />
          <input type="text" name="filter_order_id_to" value="<?php echo $filter_order_id_to; ?>" size="12" class="styled-input" />
       </td><td></td></tr></table>
    </td></tr></table>
    </td></tr>
	<tr>
    <td colspan="3" valign="top" style="padding:5px;">  
      <table cellpadding="0" cellspacing="0" style="float:left; height:60px;" id="co2_filter">
        <tr><td><span style="font-weight:bold; color:#333;"><?php echo $entry_store; ?></span><br />
          <span <?php echo (!$filter_store_id) ? '' : 'class="vtip"' ?> title="<?php foreach ($stores as $store) { ?><?php if (isset($filter_store_id[$store['store_id']])) { ?><?php echo $store['store_name']; ?><br /><?php } ?><?php } ?>">
          <select name="filter_store_id" id="filter_store_id" multiple="multiple" size="1">
            <?php foreach ($stores as $store) { ?>
            <?php if (isset($filter_store_id[$store['store_id']])) { ?>            
            <option value="<?php echo $store['store_id']; ?>" selected="selected"><?php echo $store['store_name']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $store['store_id']; ?>"><?php echo $store['store_name']; ?></option>
            <?php } ?>
            <?php } ?>
          </select></span></td><td width="15"></td></tr>
        <tr><td>&nbsp;</td><td>&nbsp;</td>
	  </tr></table>    
      <table cellpadding="0" cellspacing="0" style="float:left; height:60px;" id="co3_filter">
        <tr><td><span style="font-weight:bold; color:#333;"><?php echo $entry_currency; ?></span><br />
          <span <?php echo (!$filter_currency) ? '' : 'class="vtip"' ?> title="<?php foreach ($currencies as $currency) { ?><?php if (isset($filter_currency[$currency['currency_id']])) { ?><?php echo $currency['title']; ?> (<?php echo $currency['code']; ?>)<br /><?php } ?><?php } ?>">
          <select name="filter_currency" id="filter_currency" multiple="multiple" size="1">
            <?php foreach ($currencies as $currency) { ?>
            <?php if (isset($filter_currency[$currency['currency_id']])) { ?>
            <option value="<?php echo $currency['currency_id']; ?>" selected="selected"><?php echo $currency['title']; ?> (<?php echo $currency['code']; ?>)</option>
            <?php } else { ?>
            <option value="<?php echo $currency['currency_id']; ?>"><?php echo $currency['title']; ?> (<?php echo $currency['code']; ?>)</option>
            <?php } ?>
            <?php } ?>
          </select></span></td><td width="15"></td></tr>
        <tr><td>&nbsp;</td><td>&nbsp;</td>          
	  </tr></table>
      <table cellpadding="0" cellspacing="0" style="float:left; height:60px;" id="co4a_filter">
        <tr><td><span style="font-weight:bold; color:#333;"><?php echo $entry_tax; ?></span><br />
          <span <?php echo (!$filter_taxes) ? '' : 'class="vtip"' ?> title="<?php foreach ($taxes as $tax) { ?><?php if (isset($filter_taxes[$tax['tax']])) { ?><?php echo $tax['tax_title']; ?><br /><?php } ?><?php } ?>">
		  <select name="filter_taxes" id="filter_taxes" multiple="multiple" size="1">
            <?php foreach ($taxes as $tax) { ?>
            <?php if (isset($filter_taxes[$tax['tax']])) { ?>              
            <option value="<?php echo $tax['tax']; ?>" selected="selected"><?php echo $tax['tax_title']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $tax['tax']; ?>"><?php echo $tax['tax_title']; ?></option>
            <?php } ?>
            <?php } ?>
          </select></span></td><td width="15"></td></tr>
        <tr><td>&nbsp;</td><td>&nbsp;</td>
	  </tr></table>
      <table cellpadding="0" cellspacing="0" style="float:left; height:60px;" id="co4c_filter">
        <tr><td><span style="font-weight:bold; color:#333;"><?php echo $entry_tax_classes; ?></span><br />
          <span <?php echo (!$filter_tax_classes) ? '' : 'class="vtip"' ?> title="<?php foreach ($tax_classes as $tax_class) { ?><?php if (isset($filter_tax_classes[$tax_class['tax_class']])) { ?><?php echo $tax_class['tax_class_title']; ?><br /><?php } ?><?php } ?>">
		  <select name="filter_tax_classes" id="filter_tax_classes" multiple="multiple" size="1">
            <?php foreach ($tax_classes as $tax_class) { ?>
            <?php if (isset($filter_tax_classes[$tax_class['tax_class']])) { ?>              
            <option value="<?php echo $tax_class['tax_class']; ?>" selected="selected"><?php echo $tax_class['tax_class_title']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $tax_class['tax_class']; ?>"><?php echo $tax_class['tax_class_title']; ?></option>
            <?php } ?>
            <?php } ?>
          </select></span></td><td width="15"></td></tr>
        <tr><td>&nbsp;</td><td>&nbsp;</td>
	  </tr></table>      
      <table cellpadding="0" cellspacing="0" style="float:left; height:60px;" id="co4b_filter">
        <tr><td><span style="font-weight:bold; color:#333;"><?php echo $entry_geo_zone; ?></span><br />
          <span <?php echo (!$filter_geo_zones) ? '' : 'class="vtip"' ?> title="<?php foreach ($geo_zones as $geo_zone) { ?><?php if (isset($filter_geo_zones[$geo_zone['geo_zone_country_id']])) { ?><?php echo $geo_zone['geo_zone_name']; ?><br /><?php } ?><?php } ?>">
		  <select name="filter_geo_zones" id="filter_geo_zones" multiple="multiple" size="1">
            <?php foreach ($geo_zones as $geo_zone) { ?>
            <?php if (isset($filter_geo_zones[$geo_zone['geo_zone_country_id']])) { ?>              
            <option value="<?php echo $geo_zone['geo_zone_country_id']; ?>" selected="selected"><?php echo $geo_zone['geo_zone_name']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $geo_zone['geo_zone_country_id']; ?>"><?php echo $geo_zone['geo_zone_name']; ?></option>
            <?php } ?>
            <?php } ?>
          </select></span></td><td width="15"></td></tr>
        <tr><td>&nbsp;</td><td>&nbsp;</td>
	  </tr></table>
      <table cellpadding="0" cellspacing="0" style="float:left; height:60px;" id="co5_filter">
        <tr><td><span style="font-weight:bold; color:#333;"><?php echo $entry_customer_group; ?></span><br />
          <span <?php echo (!$filter_customer_group_id) ? '' : 'class="vtip"' ?> title="<?php foreach ($customer_groups as $customer_group) { ?><?php if (isset($filter_customer_group_id[$customer_group['customer_group_id']])) { ?><?php echo $customer_group['name']; ?><br /><?php } ?><?php } ?>">
          <select name="filter_customer_group_id" id="filter_customer_group_id" multiple="multiple" size="1">
            <?php foreach ($customer_groups as $customer_group) { ?>
            <?php if (isset($filter_customer_group_id[$customer_group['customer_group_id']])) { ?>              
            <option value="<?php echo $customer_group['customer_group_id']; ?>" selected="selected"><?php echo $customer_group['name']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></option>
            <?php } ?>
            <?php } ?>
          </select></span></td><td width="15"></td></tr>
        <tr><td>&nbsp;</td><td>&nbsp;</td>
	  </tr></table>
      <table cellpadding="0" cellspacing="0" style="float:left; height:60px;" id="co6_filter">
        <tr><td><span style="font-weight:bold; color:#333;"><?php echo $entry_customer_status; ?></span><br />
          <span <?php echo (!$filter_status) ? '' : 'class="vtip"' ?> title="<?php foreach ($statuses as $status) { ?><?php if (isset($filter_status[$status['status']]) && $status['status'] == 1) { ?><?php echo $text_enabled; ?><br /><?php } ?><?php if (isset($filter_status[$status['status']]) && $status['status'] == 0) { ?><?php echo $text_disabled; ?><br /><?php } ?><?php } ?>">         
          <select name="filter_status" id="filter_status" multiple="multiple" size="1">
            <?php foreach ($statuses as $status) { ?>
            <?php if (isset($filter_status[$status['status']]) && $status['status'] == 1) { ?>
            <option value="<?php echo $status['status']; ?>" selected="selected"><?php echo $text_enabled; ?></option>
            <?php } elseif (!isset($filter_status[$status['status']]) && $status['status'] == 1) { ?>
            <option value="<?php echo $status['status']; ?>"><?php echo $text_enabled; ?></option>
            <?php } ?>
            <?php if (isset($filter_status[$status['status']]) && $status['status'] == 0) { ?>
            <option value="<?php echo $status['status']; ?>" selected="selected"><?php echo $text_disabled; ?></option>
            <?php } elseif (!isset($filter_status[$status['status']]) && $status['status'] == 0) { ?>
            <option value="<?php echo $status['status']; ?>"><?php echo $text_disabled; ?></option>
            <?php } ?>
            <?php } ?>
          </select></span></td><td width="15"></td></tr>
        <tr><td>&nbsp;</td><td>&nbsp;</td>
	  </tr></table>         
      <table cellpadding="0" cellspacing="0" style="float:left; height:60px;" id="co7_filter">
        <tr><td>&nbsp;<span style="font-weight:bold; color:#333;"><?php echo $entry_customer_name; ?></span><br />
        <input type="text" name="filter_customer_name" value="<?php echo $filter_customer_name; ?>" size="20" class="styled-input" onclick="this.value = '';">
		</td><td width="15"></td></tr>
        <tr><td>&nbsp;</td><td>&nbsp;</td>
	  </tr></table>  
      <table cellpadding="0" cellspacing="0" style="float:left; height:60px;" id="co8a_filter">
        <tr><td>&nbsp;<span style="font-weight:bold; color:#333;"><?php echo $entry_customer_email; ?></span><br />
        <input type="text" name="filter_customer_email" value="<?php echo $filter_customer_email; ?>" size="20" class="styled-input" onclick="this.value = '';">
        </td><td width="15"></td></tr>
        <tr><td>&nbsp;</td><td>&nbsp;</td>
	  </tr></table>  
      <table cellpadding="0" cellspacing="0" style="float:left; height:60px;" id="co8b_filter">
        <tr><td>&nbsp;<span style="font-weight:bold; color:#333;"><?php echo $entry_customer_telephone; ?></span><br />
        <input type="text" name="filter_customer_telephone" value="<?php echo $filter_customer_telephone; ?>" size="20" class="styled-input" onclick="this.value = '';">
        </td><td width="15"></td></tr>
        <tr><td>&nbsp;</td><td>&nbsp;</td>
	  </tr></table> 
      <table cellpadding="0" cellspacing="0" style="float:left; height:60px;" id="co8c_filter">
        <tr><td>&nbsp;<span style="font-weight:bold; color:#333;"><?php echo $entry_ip; ?></span><br />
        <input type="text" name="filter_ip" value="<?php echo $filter_ip; ?>" size="20" class="styled-input" onclick="this.value = '';">
        </td><td width="15"></td></tr>
        <tr><td>&nbsp;</td><td>&nbsp;</td>
	  </tr></table>       
      <table cellpadding="0" cellspacing="0" style="float:left; height:60px;" id="co17a_filter">
        <tr><td>&nbsp;<span style="font-weight:bold; color:#333;"><?php echo $entry_payment_company; ?></span><br />
        <input type="text" name="filter_payment_company" value="<?php echo $filter_payment_company; ?>" size="20" class="styled-input" onclick="this.value = '';">
        </td><td width="15"></td></tr>
        <tr><td>&nbsp;</td><td>&nbsp;</td>
	  </tr></table> 
      <table cellpadding="0" cellspacing="0" style="float:left; height:60px;" id="co17b_filter">
        <tr><td>&nbsp;<span style="font-weight:bold; color:#333;"><?php echo $entry_payment_address; ?></span><br />
        <input type="text" name="filter_payment_address" value="<?php echo $filter_payment_address; ?>" size="20" class="styled-input" onclick="this.value = '';">
        </td><td width="15"></td></tr>
        <tr><td>&nbsp;</td><td>&nbsp;</td>
	  </tr></table> 
      <table cellpadding="0" cellspacing="0" style="float:left; height:60px;" id="co17c_filter">
        <tr><td>&nbsp;<span style="font-weight:bold; color:#333;"><?php echo $entry_payment_city; ?></span><br />
        <input type="text" name="filter_payment_city" value="<?php echo $filter_payment_city; ?>" size="20" class="styled-input" onclick="this.value = '';">
		</td><td width="15"></td></tr>
        <tr><td>&nbsp;</td><td>&nbsp;</td>
	  </tr></table> 
      <table cellpadding="0" cellspacing="0" style="float:left; height:60px;" id="co17d_filter">
        <tr><td>&nbsp;<span style="font-weight:bold; color:#333;"><?php echo $entry_payment_zone; ?></span><br />
        <input type="text" name="filter_payment_zone" value="<?php echo $filter_payment_zone; ?>" size="20" class="styled-input" onclick="this.value = '';">
		</td><td width="15"></td></tr>
        <tr><td>&nbsp;</td><td>&nbsp;</td>
	  </tr></table>  
      <table cellpadding="0" cellspacing="0" style="float:left; height:60px;" id="co17e_filter">
        <tr><td>&nbsp;<span style="font-weight:bold; color:#333;"><?php echo $entry_payment_postcode; ?></span><br />
        <input type="text" name="filter_payment_postcode" value="<?php echo $filter_payment_postcode; ?>" size="20" class="styled-input" onclick="this.value = '';">
        </td><td width="15"></td></tr>
        <tr><td>&nbsp;</td><td>&nbsp;</td>
	  </tr></table> 
      <table cellpadding="0" cellspacing="0" style="float:left; height:60px;" id="co17f_filter">
        <tr><td>&nbsp;<span style="font-weight:bold; color:#333;"><?php echo $entry_payment_country; ?></span><br />
        <input type="text" name="filter_payment_country" value="<?php echo $filter_payment_country; ?>" size="20" class="styled-input" onclick="this.value = '';">
        </td><td width="15"></td></tr>
        <tr><td>&nbsp;</td><td>&nbsp;</td>
	  </tr></table> 
      <table cellpadding="0" cellspacing="0" style="float:left; height:60px;" id="co13_filter">
        <tr><td><span style="font-weight:bold; color:#333;"><?php echo $entry_payment_method; ?></span><br />
          <span <?php echo (!$filter_payment_method) ? '' : 'class="vtip"' ?> title="<?php foreach ($payment_methods as $payment_method) { ?><?php if (isset($filter_payment_method[$payment_method['payment_title']])) { ?><?php echo $payment_method['payment_name']; ?><br /><?php } ?><?php } ?>">
		  <select name="filter_payment_method" id="filter_payment_method" multiple="multiple" size="1">
            <?php foreach ($payment_methods as $payment_method) { ?>
            <?php if (isset($filter_payment_method[$payment_method['payment_title']])) { ?>              
            <option value="<?php echo $payment_method['payment_title']; ?>" selected="selected"><?php echo $payment_method['payment_name']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $payment_method['payment_title']; ?>"><?php echo $payment_method['payment_name']; ?></option>
            <?php } ?>
            <?php } ?>
          </select></span></td><td width="15"></td></tr>
        <tr><td>&nbsp;</td><td>&nbsp;</td>
	  </tr></table>   
      <table cellpadding="0" cellspacing="0" style="float:left; height:60px;" id="co16a_filter">
        <tr><td>&nbsp;<span style="font-weight:bold; color:#333;"><?php echo $entry_shipping_company; ?></span><br />
        <input type="text" name="filter_shipping_company" value="<?php echo $filter_shipping_company; ?>" size="20" class="styled-input" onclick="this.value = '';">
        </td><td width="15"></td></tr>
        <tr><td>&nbsp;</td><td>&nbsp;</td>
	  </tr></table> 
      <table cellpadding="0" cellspacing="0" style="float:left; height:60px;" id="co16b_filter">
        <tr><td>&nbsp;<span style="font-weight:bold; color:#333;"><?php echo $entry_shipping_address; ?></span><br />
        <input type="text" name="filter_shipping_address" value="<?php echo $filter_shipping_address; ?>" size="20" class="styled-input" onclick="this.value = '';">
        </td><td width="15"></td></tr>
        <tr><td>&nbsp;</td><td>&nbsp;</td>
	  </tr></table> 
      <table cellpadding="0" cellspacing="0" style="float:left; height:60px;" id="co16c_filter">
        <tr><td>&nbsp;<span style="font-weight:bold; color:#333;"><?php echo $entry_shipping_city; ?></span><br />
        <input type="text" name="filter_shipping_city" value="<?php echo $filter_shipping_city; ?>" size="20" class="styled-input" onclick="this.value = '';">
        </td><td width="15"></td></tr>
        <tr><td>&nbsp;</td><td>&nbsp;</td>
	  </tr></table> 
      <table cellpadding="0" cellspacing="0" style="float:left; height:60px;" id="co16d_filter">
        <tr><td>&nbsp;<span style="font-weight:bold; color:#333;"><?php echo $entry_shipping_zone; ?></span><br />
        <input type="text" name="filter_shipping_zone" value="<?php echo $filter_shipping_zone; ?>" size="20" class="styled-input" onclick="this.value = '';">
        </td><td width="15"></td></tr>
        <tr><td>&nbsp;</td><td>&nbsp;</td>
	  </tr></table>                     
      <table cellpadding="0" cellspacing="0" style="float:left; height:60px;" id="co16e_filter">
        <tr><td>&nbsp;<span style="font-weight:bold; color:#333;"><?php echo $entry_shipping_postcode; ?></span><br />
        <input type="text" name="filter_shipping_postcode" value="<?php echo $filter_shipping_postcode; ?>" size="20" class="styled-input" onclick="this.value = '';">
        </td><td width="15"></td></tr>
        <tr><td>&nbsp;</td><td>&nbsp;</td>
	  </tr></table> 
      <table cellpadding="0" cellspacing="0" style="float:left; height:60px;" id="co16f_filter">
        <tr><td>&nbsp;<span style="font-weight:bold; color:#333;"><?php echo $entry_shipping_country; ?></span><br />
        <input type="text" name="filter_shipping_country" value="<?php echo $filter_shipping_country; ?>" size="20" class="styled-input" onclick="this.value = '';">
        </td><td width="15"></td></tr>
        <tr><td>&nbsp;</td><td>&nbsp;</td>
	  </tr></table>           
      <table cellpadding="0" cellspacing="0" style="float:left; height:60px;" id="co14_filter">
        <tr><td><span style="font-weight:bold; color:#333;"><?php echo $entry_shipping_method; ?></span><br />
          <span <?php echo (!$filter_shipping_method) ? '' : 'class="vtip"' ?> title="<?php foreach ($shipping_methods as $shipping_method) { ?><?php if (isset($filter_shipping_method[$shipping_method['shipping_title']])) { ?><?php echo $shipping_method['shipping_name']; ?><br /><?php } ?><?php } ?>">
		  <select name="filter_shipping_method" id="filter_shipping_method" multiple="multiple" size="1">
            <?php foreach ($shipping_methods as $shipping_method) { ?>
            <?php if (isset($filter_shipping_method[$shipping_method['shipping_title']])) { ?>              
            <option value="<?php echo $shipping_method['shipping_title']; ?>" selected="selected"><?php echo $shipping_method['shipping_name']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $shipping_method['shipping_title']; ?>"><?php echo $shipping_method['shipping_name']; ?></option>
            <?php } ?>
            <?php } ?>
          </select></span></td><td width="15"></td></tr>
        <tr><td>&nbsp;</td><td>&nbsp;</td>
	  </tr></table>
      <table cellpadding="0" cellspacing="0" style="float:left; height:60px;" id="co9d_filter">
        <tr><td><span style="font-weight:bold; color:#333;"><?php echo $entry_category; ?></span><br />
          <span <?php echo (!$filter_category) ? '' : 'class="vtip"' ?> title="<?php foreach ($categories as $category) { ?><?php if (isset($filter_category[$category['category_id']])) { ?><?php echo $category['name']; ?><br /><?php } ?><?php } ?>">
          <select name="filter_category" id="filter_category" multiple="multiple" size="1">
            <?php foreach ($categories as $category) { ?>
            <?php if (isset($filter_category[$category['category_id']])) { ?>               
            <option value="<?php echo $category['category_id']; ?>" selected="selected"><?php echo $category['name']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $category['category_id']; ?>"><?php echo $category['name']; ?></option> 
            <?php } ?>
            <?php } ?>
          </select></span></td><td width="15"></td></tr>
        <tr><td>&nbsp;</td><td>&nbsp;</td>
	  </tr></table>                               
      <table cellpadding="0" cellspacing="0" style="float:left; height:60px;" id="co9e_filter">
        <tr><td><span style="font-weight:bold; color:#333;"><?php echo $entry_manufacturer; ?></span><br />
          <span <?php echo (!$filter_manufacturer) ? '' : 'class="vtip"' ?> title="<?php foreach ($manufacturers as $manufacturer) { ?><?php if (isset($filter_manufacturer[$manufacturer['manufacturer_id']])) { ?> <?php echo $manufacturer['name']; ?><br /><?php } ?><?php } ?>">
          <select name="filter_manufacturer" id="filter_manufacturer" multiple="multiple" size="1">
            <?php foreach ($manufacturers as $manufacturer) { ?>
            <?php if (isset($filter_manufacturer[$manufacturer['manufacturer_id']])) { ?>               
            <option value="<?php echo $manufacturer['manufacturer_id']; ?>" selected="selected"><?php echo $manufacturer['name']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $manufacturer['manufacturer_id']; ?>"><?php echo $manufacturer['name']; ?></option> 
            <?php } ?>
            <?php } ?>
          </select></span></td><td width="15"></td></tr>
        <tr><td>&nbsp;</td><td>&nbsp;</td>
	  </tr></table>            
      <table cellpadding="0" cellspacing="0" style="float:left; height:60px;" id="co9a_filter">
        <tr><td>&nbsp;<span style="font-weight:bold; color:#333;"><?php echo $entry_sku; ?></span><br />
        <input type="text" name="filter_sku" value="<?php echo $filter_sku; ?>" size="20" class="styled-input" onclick="this.value = '';">
        </td><td width="15"></td></tr>
        <tr><td>&nbsp;</td><td>&nbsp;</td>
	  </tr></table> 
      <table cellpadding="0" cellspacing="0" style="float:left; height:60px;" id="co9b_filter">
        <tr><td>&nbsp;<span style="font-weight:bold; color:#333;"><?php echo $entry_product; ?></span><br />
        <input type="text" name="filter_product_id" value="<?php echo $filter_product_id; ?>" size="40" class="styled-input" onclick="this.value = '';">
        </td><td width="15"></td></tr>
        <tr><td>&nbsp;</td><td>&nbsp;</td>
	  </tr></table> 
      <table cellpadding="0" cellspacing="0" style="float:left; height:60px;" id="co9c_filter">
        <tr><td>&nbsp;<span style="font-weight:bold; color:#333;"><?php echo $entry_model; ?></span><br />
        <input type="text" name="filter_model" value="<?php echo $filter_model; ?>" size="20" class="styled-input" onclick="this.value = '';">
        </td><td width="15"></td></tr>
        <tr><td>&nbsp;</td><td>&nbsp;</td>
	  </tr></table>  
	  <table cellpadding="0" cellspacing="0" style="float:left; height:60px;" id="co10_filter">
        <tr><td><span style="font-weight:bold; color:#333;"><?php echo $entry_option; ?></span><br />
          <span <?php echo (!$filter_option) ? '' : 'class="vtip"' ?> title="<?php foreach ($order_options as $order_option) { ?><?php if (isset($filter_option[$order_option['options']])) { ?><?php echo $order_option['option_name']; ?>: <?php echo $order_option['option_value']; ?><br /><?php } ?><?php } ?>">        
          <select name="filter_option" id="filter_option" multiple="multiple" size="1">
            <?php foreach ($order_options as $order_option) { ?>
            <?php if (isset($filter_option[$order_option['options']])) { ?>              
            <option value="<?php echo $order_option['options']; ?>" selected="selected"><?php echo $order_option['option_name']; ?>: <?php echo $order_option['option_value']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $order_option['options']; ?>"><?php echo $order_option['option_name']; ?>: <?php echo $order_option['option_value']; ?></option>
            <?php } ?>
            <?php } ?>
          </select></span></td><td width="15"></td></tr>
        <tr><td>&nbsp;</td><td>&nbsp;</td>
	  </tr></table>  
      <table cellpadding="0" cellspacing="0" style="float:left; height:60px;" id="co18_filter">
        <tr><td><span style="font-weight:bold; color:#333;"><?php echo $entry_attributes; ?></span><br />
          <span <?php echo (!$filter_attribute) ? '' : 'class="vtip"' ?> title="<?php foreach ($attributes as $attribute) { ?><?php if (isset($filter_attribute[$attribute['attribute_title']])) { ?><?php echo $attribute['attribute_name']; ?><br /><?php } ?><?php } ?>">
		  <select name="filter_attribute" id="filter_attribute" multiple="multiple" size="1">
            <?php foreach ($attributes as $attribute) { ?>
            <?php if (isset($filter_attribute[$attribute['attribute_title']])) { ?>              
            <option value="<?php echo $attribute['attribute_title']; ?>" selected="selected"><?php echo $attribute['attribute_name']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $attribute['attribute_title']; ?>"><?php echo $attribute['attribute_name']; ?></option>
            <?php } ?>
            <?php } ?>
          </select></span></td><td width="15"></td></tr>
        <tr><td>&nbsp;</td><td>&nbsp;</td>
	  </tr></table>                    
      <table cellpadding="0" cellspacing="0" style="float:left; height:60px;" id="co11_filter">
        <tr><td><span style="font-weight:bold; color:#333;"><?php echo $entry_location; ?></span><br />
          <span <?php echo (!$filter_location) ? '' : 'class="vtip"' ?> title="<?php foreach ($locations as $location) { ?><?php if (isset($filter_location[$location['location_title']])) { ?><?php echo $location['location_name']; ?><br /><?php } ?><?php } ?>">
		  <select name="filter_location" id="filter_location" multiple="multiple" size="1">
            <?php foreach ($locations as $location) { ?>
            <?php if (isset($filter_location[$location['location_title']])) { ?>              
            <option value="<?php echo $location['location_title']; ?>" selected="selected"><?php echo $location['location_name']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $location['location_title']; ?>"><?php echo $location['location_name']; ?></option>
            <?php } ?>
            <?php } ?>
          </select></span></td><td width="15"></td></tr>
        <tr><td>&nbsp;</td><td>&nbsp;</td>
	  </tr></table>
	  <table cellpadding="0" cellspacing="0" style="float:left; height:60px;" id="co12a_filter">
        <tr><td><span style="font-weight:bold; color:#333;"><?php echo $entry_affiliate_name; ?></span><br />
          <span <?php echo (!$filter_affiliate_name) ? '' : 'class="vtip"' ?> title="<?php foreach ($affiliate_names as $affiliate_name) { ?><?php if (isset($filter_affiliate_name[$affiliate_name['affiliate_id']])) { ?><?php echo $affiliate_name['affiliate_name']; ?><br /><?php } ?><?php } ?>">        
          <select name="filter_affiliate_name" id="filter_affiliate_name" multiple="multiple" size="1">
            <?php foreach ($affiliate_names as $affiliate_name) { ?>
            <?php if (isset($filter_affiliate_name[$affiliate_name['affiliate_id']])) { ?>              
            <option value="<?php echo $affiliate_name['affiliate_id']; ?>" selected="selected"><?php echo $affiliate_name['affiliate_name']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $affiliate_name['affiliate_id']; ?>"><?php echo $affiliate_name['affiliate_name']; ?></option>
            <?php } ?>
            <?php } ?>
          </select></span></td><td width="15"></td></tr>
        <tr><td>&nbsp;</td><td>&nbsp;</td>
	  </tr></table>
	  <table cellpadding="0" cellspacing="0" style="float:left; height:60px;" id="co12b_filter">
        <tr><td><span style="font-weight:bold; color:#333;"><?php echo $entry_affiliate_email; ?></span><br />
          <span <?php echo (!$filter_affiliate_email) ? '' : 'class="vtip"' ?> title="<?php foreach ($affiliate_emails as $affiliate_email) { ?><?php if (isset($filter_affiliate_email[$affiliate_email['affiliate_id']])) { ?><?php echo $affiliate_email['affiliate_email']; ?><br /><?php } ?><?php } ?>">
          <select name="filter_affiliate_email" id="filter_affiliate_email" multiple="multiple" size="1">
            <?php foreach ($affiliate_emails as $affiliate_email) { ?>
            <?php if (isset($filter_affiliate_email[$affiliate_email['affiliate_id']])) { ?>              
            <option value="<?php echo $affiliate_email['affiliate_id']; ?>" selected="selected"><?php echo $affiliate_email['affiliate_email']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $affiliate_email['affiliate_id']; ?>"><?php echo $affiliate_email['affiliate_email']; ?></option>
            <?php } ?>
            <?php } ?>
          </select></span></td><td width="15"></td></tr>
        <tr><td>&nbsp;</td><td>&nbsp;</td>
	  </tr></table>
	  <table cellpadding="0" cellspacing="0" style="float:left; height:60px;" id="co15a_filter">
        <tr><td><span style="font-weight:bold; color:#333;"><?php echo $entry_coupon_name; ?></span><br />
          <span <?php echo (!$filter_coupon_name) ? '' : 'class="vtip"' ?> title="<?php foreach ($coupon_names as $coupon_name) { ?><?php if (isset($filter_coupon_name[$coupon_name['coupon_id']])) { ?><?php echo $coupon_name['coupon_name']; ?><br /><?php } ?><?php } ?>">        
          <select name="filter_coupon_name" id="filter_coupon_name" multiple="multiple" size="1">
            <?php foreach ($coupon_names as $coupon_name) { ?>
            <?php if (isset($filter_coupon_name[$coupon_name['coupon_id']])) { ?>              
            <option value="<?php echo $coupon_name['coupon_id']; ?>" selected="selected"><?php echo $coupon_name['coupon_name']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $coupon_name['coupon_id']; ?>"><?php echo $coupon_name['coupon_name']; ?></option>
            <?php } ?>
            <?php } ?>
          </select></span></td><td width="15"></td></tr>
        <tr><td>&nbsp;</td><td>&nbsp;</td>
	  </tr></table>
      <table cellpadding="0" cellspacing="0" style="float:left; height:60px;" id="co15b_filter">
        <tr><td>&nbsp;<span style="font-weight:bold; color:#333;"><?php echo $entry_coupon_code; ?></span><br />
        <input type="text" name="filter_coupon_code" value="<?php echo $filter_coupon_code; ?>" size="20" class="styled-input" onclick="this.value = '';">
        </td><td width="15"></td></tr>
        <tr><td>&nbsp;</td><td>&nbsp;</td>
	  </tr></table>  
      <table cellpadding="0" cellspacing="0" style="float:left; height:60px;" id="co19_filter">
        <tr><td>&nbsp;<span style="font-weight:bold; color:#333;"><?php echo $entry_voucher_code; ?></span><br />
        <input type="text" name="filter_voucher_code" value="<?php echo $filter_voucher_code; ?>" size="20" class="styled-input" onclick="this.value = '';">
        </td><td width="15"></td></tr>
        <tr><td>&nbsp;</td><td>&nbsp;</td>
	  </tr></table>  
	   </td>
	  </tr>
	 </table>
	</td>
	</tr>
	</table>      
</div>
<?php if ($customers) { ?>
<script type="text/javascript">$(function(){ 
$('#show_tab_chart').click(function() {
		$('#tab_chart').slideToggle('slow');
	});
});
</script>  
    <div id="tab_chart">
      <table align="center" cellspacing="0" cellpadding="3">    
        <tr>
          <td><div style="float:left; width:625px; height:350px;" id="chart1_div"></div><div style="float:left; width:625px; height:350px;" id="chart2_div"></div></td>
        </tr>
      </table>
    </div>
<?php } ?> 
	<?php if (strpos($_SERVER['HTTP_USER_AGENT'], 'MSIE') !== false) { ?>
    <div id="pagination_content" style="overflow:scroll; padding:1px;"> 
    <?php } else { ?>
    <div id="pagination_content" style="overflow:auto; padding:1px;">     
    <?php } ?>
<?php if ($filter_details == 4) { ?>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">    
	<tr><td> 
	<?php if ($customers) { ?>
	<?php foreach ($customers as $customer) { ?>
    <?php if ($customer['product_pidc']) { ?>    
		<table class="list_detail" id="element" style="border-bottom:2px solid #999; border-top:2px solid #999;">
		<thead>
		<tr>
          <td class="left" nowrap="nowrap"><?php echo $column_order_order_id; ?></td>        
          <td class="left" nowrap="nowrap"><?php echo $column_order_date_added; ?></td>
          <td id="co1000_<?php echo $customer['order_id']; ?>_title" class="left"><?php echo $column_order_inv_no; ?></td>               
          <td id="co1001_<?php echo $customer['order_id']; ?>_title" class="left"><?php echo $column_order_customer; ?></td>
          <td id="co1002_<?php echo $customer['order_id']; ?>_title" class="left"><?php echo $column_order_email; ?></td>
          <td id="co1003_<?php echo $customer['order_id']; ?>_title" class="left"><?php echo $column_order_customer_group; ?></td>
          <td id="co1040_<?php echo $customer['order_id']; ?>_title" class="left"><?php echo $column_order_shipping_method; ?></td>
          <td id="co1041_<?php echo $customer['order_id']; ?>_title" class="left"><?php echo $column_order_payment_method; ?></td>          
          <td id="co1042_<?php echo $customer['order_id']; ?>_title" class="left"><?php echo $column_order_status; ?></td>
          <td id="co1043_<?php echo $customer['order_id']; ?>_title" class="left"><?php echo $column_order_store; ?></td>
          <td id="co1012_<?php echo $customer['order_id']; ?>_title" class="right"><?php echo $column_order_currency; ?></td>
          <td id="co1062_<?php echo $customer['order_id']; ?>_title" class="right"><?php echo $column_order_quantity; ?></td>  
          <td id="co1020_<?php echo $customer['order_id']; ?>_title" class="right"><?php echo $column_order_sub_total; ?></td>                               
          <td id="co1023_<?php echo $customer['order_id']; ?>_title" class="right"><?php echo $column_order_shipping; ?></td>         
          <td id="co1027_<?php echo $customer['order_id']; ?>_title" class="right"><?php echo $column_order_tax; ?></td>
          <td id="co1031_<?php echo $customer['order_id']; ?>_title" class="right"><?php echo $column_order_value; ?></td>       
		</tr>
		</thead>
        <tbody>
		<tr bgcolor="#FFFFFF">
          <td class="left" nowrap="nowrap" style="background-color:#FFC;"><a><?php echo $customer['order_ord_id']; ?></a></td>        
          <td class="left" nowrap="nowrap" style="background-color:#FFC;"><?php echo $customer['order_order_date']; ?></td>
          <td id="co1000_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['order_inv_no']; ?></td>
          <td id="co1001_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['order_name']; ?></td>
          <td id="co1002_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['order_email']; ?></td>
          <td id="co1003_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['order_group']; ?></td>
          <td id="co1040_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['order_shipping_method']; ?></td>
          <td id="co1041_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['order_payment_method']; ?></td>          
          <td id="co1042_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['order_status']; ?></td>
          <td id="co1043_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['order_store']; ?></td> 
          <td id="co1012_<?php echo $customer['order_id']; ?>" class="right" nowrap="nowrap"><?php echo $customer['order_currency']; ?></td>          
          <td id="co1062_<?php echo $customer['order_id']; ?>" class="right" nowrap="nowrap"><?php echo $customer['order_products']; ?></td> 
          <td id="co1020_<?php echo $customer['order_id']; ?>" class="right" nowrap="nowrap"><?php echo $customer['order_sub_total']; ?></td>                    
          <td id="co1023_<?php echo $customer['order_id']; ?>" class="right" nowrap="nowrap"><?php echo $customer['order_shipping']; ?></td>           
          <td id="co1027_<?php echo $customer['order_id']; ?>" class="right" nowrap="nowrap"><?php echo $customer['order_tax']; ?></td>                              
          <td id="co1031_<?php echo $customer['order_id']; ?>" class="right" nowrap="nowrap"><?php echo $customer['order_value']; ?></td>
		</tr>  
		<tr>
		<td colspan="16">
		  <table class="list_detail">
          <thead>
          <tr>
          <td id="co1004_<?php echo $customer['order_id']; ?>_title" class="left"><?php echo $column_prod_id; ?></td>                                          
		  <td id="co1005_<?php echo $customer['order_id']; ?>_title" class="left"><?php echo $column_prod_sku; ?></td>
		  <td id="co1006_<?php echo $customer['order_id']; ?>_title" class="left"><?php echo $column_prod_model; ?></td>            
          <td id="co1007_<?php echo $customer['order_id']; ?>_title" class="left"><?php echo $column_prod_name; ?></td> 
          <td id="co1008_<?php echo $customer['order_id']; ?>_title" class="left"><?php echo $column_prod_option; ?></td>           
          <td id="co1009_<?php echo $customer['order_id']; ?>_title" class="left"><?php echo $column_prod_attributes; ?></td>                      
          <td id="co1010_<?php echo $customer['order_id']; ?>_title" class="left"><?php echo $column_prod_manu; ?></td> 
          <td id="co1011_<?php echo $customer['order_id']; ?>_title" class="left"><?php echo $column_prod_category; ?></td>           
          <td id="co1013_<?php echo $customer['order_id']; ?>_title" class="right"><?php echo $column_prod_price; ?></td>                     
          <td id="co1014_<?php echo $customer['order_id']; ?>_title" class="right"><?php echo $column_prod_quantity; ?></td>
          <td id="co1016a_<?php echo $customer['order_id']; ?>_title" class="right"><?php echo $column_prod_total_excl_vat; ?></td>          
          <td id="co1015_<?php echo $customer['order_id']; ?>_title" class="right"><?php echo $column_prod_tax; ?></td>           
          <td id="co1016b_<?php echo $customer['order_id']; ?>_title" class="right"><?php echo $column_prod_total_incl_vat; ?></td> 
          </tr>
          </thead>
          <tr bgcolor="#FFFFFF">
          <td id="co1004_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['product_pid']; ?></td>  
          <td id="co1005_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['product_sku']; ?></td>
          <td id="co1006_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['product_model']; ?></td>                 
          <td id="co1007_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['product_name']; ?></td> 
          <td id="co1008_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['product_option']; ?></td>            
          <td id="co1009_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['product_attributes']; ?></td>                    
          <td id="co1010_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['product_manu']; ?></td> 
          <td id="co1011_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['product_category']; ?></td> 
          <td id="co1013_<?php echo $customer['order_id']; ?>" class="right" nowrap="nowrap"><?php echo $customer['product_price']; ?></td> 
          <td id="co1014_<?php echo $customer['order_id']; ?>" class="right" nowrap="nowrap"><?php echo $customer['product_quantity']; ?></td>
          <td id="co1016a_<?php echo $customer['order_id']; ?>" class="right" nowrap="nowrap"><?php echo $customer['product_total_excl_vat']; ?></td>  
          <td id="co1015_<?php echo $customer['order_id']; ?>" class="right" nowrap="nowrap"><?php echo $customer['product_tax']; ?></td>  
          <td id="co1016b_<?php echo $customer['order_id']; ?>" class="right" nowrap="nowrap"><?php echo $customer['product_total_incl_vat']; ?></td>
          </tr>                  
	      </table>
          <table class="list_detail">
          <thead>
          <tr>
          <td id="co1044_<?php echo $customer['order_id']; ?>_title" class="left"><?php echo $column_customer_cust_id; ?></td>           
          <td id="co1045_<?php echo $customer['order_id']; ?>_title" class="left"><?php echo $column_billing_name; ?></td> 
          <td id="co1046_<?php echo $customer['order_id']; ?>_title" class="left"><?php echo $column_billing_company; ?></td> 
          <td id="co1047_<?php echo $customer['order_id']; ?>_title" class="left"><?php echo $column_billing_address_1; ?></td> 
          <td id="co1048_<?php echo $customer['order_id']; ?>_title" class="left"><?php echo $column_billing_address_2; ?></td> 
          <td id="co1049_<?php echo $customer['order_id']; ?>_title" class="left"><?php echo $column_billing_city; ?></td>
          <td id="co1050_<?php echo $customer['order_id']; ?>_title" class="left"><?php echo $column_billing_zone; ?></td> 
          <td id="co1051_<?php echo $customer['order_id']; ?>_title" class="left"><?php echo $column_billing_postcode; ?></td>
          <td id="co1052_<?php echo $customer['order_id']; ?>_title" class="left"><?php echo $column_billing_country; ?></td>
          <td id="co1053_<?php echo $customer['order_id']; ?>_title" class="left"><?php echo $column_customer_telephone; ?></td>
          <td id="co1054_<?php echo $customer['order_id']; ?>_title" class="left"><?php echo $column_shipping_name; ?></td> 
          <td id="co1055_<?php echo $customer['order_id']; ?>_title" class="left"><?php echo $column_shipping_company; ?></td> 
          <td id="co1056_<?php echo $customer['order_id']; ?>_title" class="left"><?php echo $column_shipping_address_1; ?></td> 
          <td id="co1057_<?php echo $customer['order_id']; ?>_title" class="left"><?php echo $column_shipping_address_2; ?></td> 
          <td id="co1058_<?php echo $customer['order_id']; ?>_title" class="left"><?php echo $column_shipping_city; ?></td>
          <td id="co1059_<?php echo $customer['order_id']; ?>_title" class="left"><?php echo $column_shipping_zone; ?></td> 
          <td id="co1060_<?php echo $customer['order_id']; ?>_title" class="left"><?php echo $column_shipping_postcode; ?></td>
          <td id="co1061_<?php echo $customer['order_id']; ?>_title" class="left"><?php echo $column_shipping_country; ?></td>    
          </tr>
          </thead>
          <tr bgcolor="#FFFFFF">
          <td id="co1044_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['customer_cust_id']; ?></td>             
          <td id="co1045_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['billing_name']; ?></td>         
          <td id="co1046_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['billing_company']; ?></td> 
          <td id="co1047_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['billing_address_1']; ?></td> 
          <td id="co1048_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['billing_address_2']; ?></td> 
          <td id="co1049_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['billing_city']; ?></td> 
          <td id="co1050_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['billing_zone']; ?></td> 
          <td id="co1051_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['billing_postcode']; ?></td>                    
          <td id="co1052_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['billing_country']; ?></td>
          <td id="co1053_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['customer_telephone']; ?></td> 
          <td id="co1054_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['shipping_name']; ?></td>         
          <td id="co1055_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['shipping_company']; ?></td> 
          <td id="co1056_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['shipping_address_1']; ?></td> 
          <td id="co1057_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['shipping_address_2']; ?></td> 
          <td id="co1058_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['shipping_city']; ?></td> 
          <td id="co1059_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['shipping_zone']; ?></td> 
          <td id="co1060_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['shipping_postcode']; ?></td>                    
          <td id="co1061_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['shipping_country']; ?></td>  
          </tr>                  
	      </table>            
		</td>
		</tr> 
        </tbody>
		</table>              
	<?php } ?>
	<?php } ?>  
	<?php } else { ?>
		<table width="100%">    
		<tr>
		<td align="center"><?php echo $text_no_results; ?></td>
		</tr>
        </table>          
	<?php } ?>      
    </td></tr>
    </table>
<br />     
<?php } ?>
<?php if ($filter_details != '4') { ?>
      <table class="list_main">
        <thead>
          <tr>
		  <?php if ($filter_group == 'year') { ?>           
          <td class="left" colspan="2" nowrap="nowrap"><?php echo $column_year; ?></td>
		  <?php } elseif ($filter_group == 'quarter') { ?> 
          <td class="left" nowrap="nowrap"><?php echo $column_year; ?></td>
          <td class="left" nowrap="nowrap"><?php echo $column_quarter; ?></td>       
		  <?php } elseif ($filter_group == 'month') { ?> 
          <td class="left" nowrap="nowrap"><?php echo $column_year; ?></td>
          <td class="left" nowrap="nowrap"><?php echo $column_month; ?></td>
		  <?php } elseif ($filter_group == 'day') { ?> 
          <td class="left" colspan="2" nowrap="nowrap"><?php echo $column_date; ?></td>  
		  <?php } elseif ($filter_group == 'order') { ?> 
          <td class="left" nowrap="nowrap"><?php echo $column_order_order_id; ?></td>
          <td class="left" nowrap="nowrap"><?php echo $column_order_date_added; ?></td>                     
		  <?php } else { ?>    
          <td class="left" width="70" nowrap="nowrap"><?php echo $column_date_start; ?></td>
          <td class="left" width="70" nowrap="nowrap"><?php echo $column_date_end; ?></td>           
		  <?php } ?> 
          <td id="co20_title" class="right"><?php echo $column_id; ?></td>
          <td id="co21_title" class="left"><?php echo $column_customer; ?> / <?php echo $column_company; ?></td>         
          <td id="co22_title" class="left"><?php echo $column_email; ?></td>
          <td id="co35_title" class="left"><?php echo $column_telephone; ?></td>          
          <td id="co34_title" class="left"><?php echo $column_country; ?></td>           
          <td id="co23_title" class="left"><?php echo $column_customer_group; ?></td> 
          <td id="co24_title" class="left"><?php echo $column_status; ?></td>  
          <td id="co25_title" class="left"><?php echo $column_ip; ?></td>           
          <td id="co26_title" class="left"><?php echo $column_mostrecent; ?></td>          
          <td id="co27_title" class="right"><?php echo $column_orders; ?></td> 
          <td id="co28_title" class="right"><?php echo $column_products; ?></td>                          
          <td id="co30_title" class="right"><?php echo $column_value; ?></td>      
          <?php if ($filter_details == 1 OR $filter_details == 2 OR $filter_details == 3) { ?><td class="right" nowrap="nowrap"><?php echo $column_action; ?></td><?php } ?>
          </tr>
      	  </thead>
          <?php if ($customers) { ?>
          <?php foreach ($customers as $customer) { ?>
      	  <tbody id="element">
          <tr <?php echo ($filter_details == 1 OR $filter_details == 2 OR $filter_details == 3) ? 'style="cursor:pointer;" title="' . $text_detail . '"' : '' ?> id="show_details_<?php echo $customer['order_id']; ?>">
		  <?php if ($filter_group == 'year') { ?>           
          <td class="left" colspan="2" nowrap="nowrap" style="background-color:#F0F0F0;"><?php echo $customer['year']; ?></td>
		  <?php } elseif ($filter_group == 'quarter') { ?> 
          <td class="left" nowrap="nowrap" style="background-color:#F0F0F0;"><?php echo $customer['year']; ?></td>
          <td class="left" nowrap="nowrap" style="background-color:#F0F0F0;"><?php echo $customer['quarter']; ?></td>  
		  <?php } elseif ($filter_group == 'month') { ?> 
          <td class="left" nowrap="nowrap" style="background-color:#F0F0F0;"><?php echo $customer['year']; ?></td>
          <td class="left" nowrap="nowrap" style="background-color:#F0F0F0;"><?php echo $customer['month']; ?></td>
		  <?php } elseif ($filter_group == 'day') { ?> 
          <td class="left" colspan="2" nowrap="nowrap" style="background-color:#F0F0F0;"><?php echo $customer['date_start']; ?></td>    
		  <?php } elseif ($filter_group == 'order') { ?> 
          <td class="left" nowrap="nowrap" style="background-color:#F0F0F0;"><?php echo $customer['order_id']; ?></td>
          <td class="left" nowrap="nowrap" style="background-color:#F0F0F0;"><?php echo $customer['date_start']; ?></td>
		  <?php } else { ?>    
          <td class="left" nowrap="nowrap" style="background-color:#F0F0F0;"><?php echo $customer['date_start']; ?></td>
          <td class="left" nowrap="nowrap" style="background-color:#F0F0F0;"><?php echo $customer['date_end']; ?></td>         
		  <?php } ?>  
	  	  <td id="co20_<?php echo $customer['order_id']; ?>" class="right">
          <?php if ($customer['customer_id'] == 0) { ?>
          <?php echo $text_guest; ?>          
          <?php } else { ?>
          <?php echo $customer['customer_id']; ?>
          <?php } ?></td>           
	  	  <td id="co21_<?php echo $customer['order_id']; ?>" class="left">
          <?php if ($customer['customer_id'] == 0) { ?>
          <?php echo $customer['cust_name']; ?>
          <br /><?php echo $customer['cust_company']; ?>
          <?php } else { ?>
          <a href="<?php echo $customer['href']; ?>"><?php echo $customer['cust_name']; ?></a>
          <br /><?php echo $customer['cust_company']; ?>
          <?php } ?></td>
      	  <td id="co22_<?php echo $customer['order_id']; ?>" class="left"><?php echo $customer['cust_email']; ?></td> 
      	  <td id="co35_<?php echo $customer['order_id']; ?>" class="left"><?php echo $customer['cust_telephone']; ?></td>           
      	  <td id="co34_<?php echo $customer['order_id']; ?>" class="left"><?php echo $customer['cust_country']; ?></td>           
	  	  <td id="co23_<?php echo $customer['order_id']; ?>" class="left">
          <?php if ($customer['customer_id'] == 0) { ?>
          <?php echo $customer['cust_group_guest']; ?>         
          <?php } else { ?>
          <?php echo $customer['cust_group_reg']; ?>
          <?php } ?></td>                                
          <td id="co24_<?php echo $customer['order_id']; ?>" class="left"><?php if (!$customer['customer_id'] == 0) { ?><?php echo $customer['cust_status']; ?><?php } ?></td>
      	  <td id="co25_<?php echo $customer['order_id']; ?>" class="left"><?php echo $customer['cust_ip']; ?></td>            
          <td id="co26_<?php echo $customer['order_id']; ?>" class="left"><?php echo $customer['mostrecent']; ?></td>          
          <td id="co27_<?php echo $customer['order_id']; ?>" class="right" nowrap="nowrap"><?php echo $customer['orders']; ?></td>
          <td id="co28_<?php echo $customer['order_id']; ?>" class="right" nowrap="nowrap"><?php echo $customer['products']; ?></td>                 
          <td id="co30_<?php echo $customer['order_id']; ?>" class="right" nowrap="nowrap"><?php echo $customer['value']; ?></td>
          <?php if ($filter_details == 1 OR $filter_details == 2 OR $filter_details == 3) { ?><td class="right" nowrap="nowrap">[ <a><?php echo $text_detail; ?></a> ]</td><?php } ?>
          </tr>
<tr class="detail">         
<td colspan="19" class="center">
<?php if ($filter_details == 1) { ?> 
<script type="text/javascript">$(function(){ 
$('#show_details_<?php echo $customer["order_id"]; ?>').click(function() {
		$('#tab_details_<?php echo $customer["order_id"]; ?>').slideToggle('slow');
	});
});
</script>
<div id="tab_details_<?php echo $customer['order_id']; ?>" style="display:none">
    <table class="list_detail">
      <thead>
        <tr>
          <td id="co40_<?php echo $customer['order_id']; ?>_title" class="left" nowrap="nowrap"><?php echo $column_order_order_id; ?></td>        
          <td id="co41_<?php echo $customer['order_id']; ?>_title" class="left" nowrap="nowrap"><?php echo $column_order_date_added; ?></td>
          <td id="co42_<?php echo $customer['order_id']; ?>_title" class="left" nowrap="nowrap"><?php echo $column_order_inv_no; ?></td>                  
          <td id="co43_<?php echo $customer['order_id']; ?>_title" class="left" nowrap="nowrap"><?php echo $column_order_customer; ?></td>
          <td id="co44_<?php echo $customer['order_id']; ?>_title" class="left" nowrap="nowrap"><?php echo $column_order_email; ?></td>
          <td id="co45_<?php echo $customer['order_id']; ?>_title" class="left" nowrap="nowrap"><?php echo $column_order_customer_group; ?></td>
          <td id="co46_<?php echo $customer['order_id']; ?>_title" class="left" nowrap="nowrap"><?php echo $column_order_shipping_method; ?></td>
          <td id="co47_<?php echo $customer['order_id']; ?>_title" class="left" nowrap="nowrap"><?php echo $column_order_payment_method; ?></td>          
          <td id="co48_<?php echo $customer['order_id']; ?>_title" class="left" nowrap="nowrap"><?php echo $column_order_status; ?></td>
          <td id="co49_<?php echo $customer['order_id']; ?>_title" class="left" nowrap="nowrap"><?php echo $column_order_store; ?></td>
          <td id="co50_<?php echo $customer['order_id']; ?>_title" class="right" nowrap="nowrap"><?php echo $column_order_currency; ?></td>
          <td id="co51_<?php echo $customer['order_id']; ?>_title" class="right" nowrap="nowrap"><?php echo $column_order_quantity; ?></td>  
          <td id="co52_<?php echo $customer['order_id']; ?>_title" class="right" nowrap="nowrap"><?php echo $column_order_sub_total; ?></td>                               
          <td id="co54_<?php echo $customer['order_id']; ?>_title" class="right" nowrap="nowrap"><?php echo $column_order_shipping; ?></td>         
          <td id="co55_<?php echo $customer['order_id']; ?>_title" class="right" nowrap="nowrap"><?php echo $column_order_tax; ?></td>
          <td id="co56_<?php echo $customer['order_id']; ?>_title" class="right" nowrap="nowrap"><?php echo $column_order_value; ?></td>    
        </tr>
      </thead>
        <tr bgcolor="#FFFFFF">
          <td id="co40_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><a><?php echo $customer['order_ord_id']; ?></a></td>        
          <td id="co41_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['order_order_date']; ?></td>
          <td id="co42_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['order_inv_no']; ?></td>
          <td id="co43_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['order_name']; ?></td>
          <td id="co44_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['order_email']; ?></td>
          <td id="co45_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['order_group']; ?></td>
          <td id="co46_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['order_shipping_method']; ?></td>
          <td id="co47_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['order_payment_method']; ?></td>          
          <td id="co48_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['order_status']; ?></td>
          <td id="co49_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['order_store']; ?></td> 
          <td id="co50_<?php echo $customer['order_id']; ?>" class="right" nowrap="nowrap"><?php echo $customer['order_currency']; ?></td>          
          <td id="co51_<?php echo $customer['order_id']; ?>" class="right" nowrap="nowrap"><?php echo $customer['order_products']; ?></td> 
          <td id="co52_<?php echo $customer['order_id']; ?>" class="right" nowrap="nowrap"><?php echo $customer['order_sub_total']; ?></td>                    
          <td id="co54_<?php echo $customer['order_id']; ?>" class="right" nowrap="nowrap"><?php echo $customer['order_shipping']; ?></td>           
          <td id="co55_<?php echo $customer['order_id']; ?>" class="right" nowrap="nowrap"><?php echo $customer['order_tax']; ?></td>                              
          <td id="co56_<?php echo $customer['order_id']; ?>" class="right" nowrap="nowrap"><?php echo $customer['order_value']; ?></td>
         </tr>
    </table>
</div>  
<?php } ?> 
<?php if ($filter_details == 2) { ?>
<script type="text/javascript">$(function(){ 
$('#show_details_<?php echo $customer["order_id"]; ?>').click(function() {
		$('#tab_details_<?php echo $customer["order_id"]; ?>').slideToggle('slow');
	});
});
</script>
<div id="tab_details_<?php echo $customer['order_id']; ?>" style="display:none">
    <table class="list_detail">
      <thead>
        <tr>
          <td id="co60_<?php echo $customer['order_id']; ?>_title" class="left" nowrap="nowrap"><?php echo $column_prod_order_id; ?></td>  
          <td id="co61_<?php echo $customer['order_id']; ?>_title" class="left" nowrap="nowrap"><?php echo $column_prod_date_added; ?></td>
          <td id="co62_<?php echo $customer['order_id']; ?>_title" class="left" nowrap="nowrap"><?php echo $column_prod_inv_no; ?></td> 
          <td id="co63_<?php echo $customer['order_id']; ?>_title" class="left" nowrap="nowrap"><?php echo $column_prod_id; ?></td>                                          
          <td id="co64_<?php echo $customer['order_id']; ?>_title" class="left" nowrap="nowrap"><?php echo $column_prod_sku; ?></td>
          <td id="co65_<?php echo $customer['order_id']; ?>_title" class="left" nowrap="nowrap"><?php echo $column_prod_model; ?></td>            
          <td id="co66_<?php echo $customer['order_id']; ?>_title" class="left" nowrap="nowrap"><?php echo $column_prod_name; ?></td> 
          <td id="co67_<?php echo $customer['order_id']; ?>_title" class="left" nowrap="nowrap"><?php echo $column_prod_option; ?></td>           
          <td id="co77_<?php echo $customer['order_id']; ?>_title" class="left" nowrap="nowrap"><?php echo $column_prod_attributes; ?></td>                      
          <td id="co68_<?php echo $customer['order_id']; ?>_title" class="left" nowrap="nowrap"><?php echo $column_prod_manu; ?></td> 
          <td id="co79_<?php echo $customer['order_id']; ?>_title" class="left" nowrap="nowrap"><?php echo $column_prod_category; ?></td>           
          <td id="co69_<?php echo $customer['order_id']; ?>_title" class="right" nowrap="nowrap"><?php echo $column_prod_currency; ?></td>   
          <td id="co70_<?php echo $customer['order_id']; ?>_title" class="right" nowrap="nowrap"><?php echo $column_prod_price; ?></td>                     
          <td id="co71_<?php echo $customer['order_id']; ?>_title" class="right" nowrap="nowrap"><?php echo $column_prod_quantity; ?></td> 
          <td id="co72a_<?php echo $customer['order_id']; ?>_title" class="right" nowrap="nowrap"><?php echo $column_prod_total_excl_vat; ?></td>                    
          <td id="co73_<?php echo $customer['order_id']; ?>_title" class="right" nowrap="nowrap"><?php echo $column_prod_tax; ?></td>                   
          <td id="co72b_<?php echo $customer['order_id']; ?>_title" class="right" nowrap="nowrap"><?php echo $column_prod_total_incl_vat; ?></td>
        </tr>
      </thead>
        <tr bgcolor="#FFFFFF">
          <td id="co60_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><a><?php echo $customer['product_ord_id']; ?></a></td>  
          <td id="co61_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['product_order_date']; ?></td>
          <td id="co62_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['product_inv_no']; ?></td>
          <td id="co63_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['product_pid']; ?></td>  
          <td id="co64_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['product_sku']; ?></td>
          <td id="co65_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['product_model']; ?></td>                 
          <td id="co66_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['product_name']; ?></td> 
          <td id="co67_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['product_option']; ?></td>            
          <td id="co77_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['product_attributes']; ?></td>                    
          <td id="co68_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['product_manu']; ?></td> 
          <td id="co79_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['product_category']; ?></td>           
          <td id="co69_<?php echo $customer['order_id']; ?>" class="right" nowrap="nowrap"><?php echo $customer['product_currency']; ?></td> 
          <td id="co70_<?php echo $customer['order_id']; ?>" class="right" nowrap="nowrap"><?php echo $customer['product_price']; ?></td> 
          <td id="co71_<?php echo $customer['order_id']; ?>" class="right" nowrap="nowrap"><?php echo $customer['product_quantity']; ?></td> 
          <td id="co72a_<?php echo $customer['order_id']; ?>" class="right" nowrap="nowrap"><?php echo $customer['product_total_excl_vat']; ?></td>  
          <td id="co73_<?php echo $customer['order_id']; ?>" class="right" nowrap="nowrap"><?php echo $customer['product_tax']; ?></td>  
          <td id="co72b_<?php echo $customer['order_id']; ?>" class="right" nowrap="nowrap"><?php echo $customer['product_total_incl_vat']; ?></td>
         </tr>       
    </table>
</div> 
<?php } ?>  
<?php if ($filter_details == 3) { ?>
<script type="text/javascript">$(function(){ 
$('#show_details_<?php echo $customer["order_id"]; ?>').click(function() {
		$('#tab_details_<?php echo $customer["order_id"]; ?>').slideToggle('slow');
	});
});
</script>
<div id="tab_details_<?php echo $customer['order_id']; ?>" style="display:none">
    <table class="list_detail">
      <thead>
        <tr>       
          <td id="co84_<?php echo $customer['order_id']; ?>_title" class="left" nowrap="nowrap"><?php echo $column_billing_name; ?></td> 
          <td id="co85_<?php echo $customer['order_id']; ?>_title" class="left" nowrap="nowrap"><?php echo $column_billing_company; ?></td> 
          <td id="co86_<?php echo $customer['order_id']; ?>_title" class="left" nowrap="nowrap"><?php echo $column_billing_address_1; ?></td> 
          <td id="co87_<?php echo $customer['order_id']; ?>_title" class="left" nowrap="nowrap"><?php echo $column_billing_address_2; ?></td> 
          <td id="co88_<?php echo $customer['order_id']; ?>_title" class="left" nowrap="nowrap"><?php echo $column_billing_city; ?></td>
          <td id="co89_<?php echo $customer['order_id']; ?>_title" class="left" nowrap="nowrap"><?php echo $column_billing_zone; ?></td> 
          <td id="co90_<?php echo $customer['order_id']; ?>_title" class="left" nowrap="nowrap"><?php echo $column_billing_postcode; ?></td>
          <td id="co91_<?php echo $customer['order_id']; ?>_title" class="left" nowrap="nowrap"><?php echo $column_billing_country; ?></td>
          <td id="co93_<?php echo $customer['order_id']; ?>_title" class="left" nowrap="nowrap"><?php echo $column_shipping_name; ?></td> 
          <td id="co94_<?php echo $customer['order_id']; ?>_title" class="left" nowrap="nowrap"><?php echo $column_shipping_company; ?></td> 
          <td id="co95_<?php echo $customer['order_id']; ?>_title" class="left" nowrap="nowrap"><?php echo $column_shipping_address_1; ?></td> 
          <td id="co96_<?php echo $customer['order_id']; ?>_title" class="left" nowrap="nowrap"><?php echo $column_shipping_address_2; ?></td> 
          <td id="co97_<?php echo $customer['order_id']; ?>_title" class="left" nowrap="nowrap"><?php echo $column_shipping_city; ?></td>
          <td id="co98_<?php echo $customer['order_id']; ?>_title" class="left" nowrap="nowrap"><?php echo $column_shipping_zone; ?></td> 
          <td id="co99_<?php echo $customer['order_id']; ?>_title" class="left" nowrap="nowrap"><?php echo $column_shipping_postcode; ?></td>
          <td id="co100_<?php echo $customer['order_id']; ?>_title" class="left" nowrap="nowrap"><?php echo $column_shipping_country; ?></td>          
        </tr>
      </thead>
        <tr bgcolor="#FFFFFF">           
          <td id="co84_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['billing_name']; ?></td>         
          <td id="co85_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['billing_company']; ?></td> 
          <td id="co86_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['billing_address_1']; ?></td> 
          <td id="co87_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['billing_address_2']; ?></td> 
          <td id="co88_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['billing_city']; ?></td> 
          <td id="co89_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['billing_zone']; ?></td> 
          <td id="co90_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['billing_postcode']; ?></td>                    
          <td id="co91_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['billing_country']; ?></td>
          <td id="co93_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['shipping_name']; ?></td>         
          <td id="co94_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['shipping_company']; ?></td> 
          <td id="co95_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['shipping_address_1']; ?></td> 
          <td id="co96_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['shipping_address_2']; ?></td> 
          <td id="co97_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['shipping_city']; ?></td> 
          <td id="co98_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['shipping_zone']; ?></td> 
          <td id="co99_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['shipping_postcode']; ?></td>                    
          <td id="co100_<?php echo $customer['order_id']; ?>" class="left" nowrap="nowrap"><?php echo $customer['shipping_country']; ?></td>          
         </tr>
    </table>
</div> 
<?php } ?> 
</td>
</tr>           
        <?php } ?>
        <tr>
        <td colspan="15"></td>
        </tr>        
        <tr>
          <td colspan="2" class="right" style="background-color:#E7EFEF;"><strong><?php echo $text_filter_total; ?></strong></td>        
          <td id="co20_total" style="background-color:#DDDDDD;"></td>
          <td id="co21_total" style="background-color:#DDDDDD;"></td>
          <td id="co22_total" style="background-color:#DDDDDD;"></td>
          <td id="co35_total" style="background-color:#DDDDDD;"></td>          
          <td id="co34_total" style="background-color:#DDDDDD;"></td>
          <td id="co23_total" style="background-color:#DDDDDD;"></td>
          <td id="co24_total" style="background-color:#DDDDDD;"></td>
          <td id="co25_total" style="background-color:#DDDDDD;"></td>
          <td id="co26_total" style="background-color:#DDDDDD;"></td>            
          <td id="co27_total" class="right" nowrap="nowrap" style="background-color:#E7EFEF; color:#003A88;"><strong><?php echo $customer['orders_total']; ?></strong></td>  
          <td id="co28_total" class="right" nowrap="nowrap" style="background-color:#E7EFEF; color:#003A88;"><strong><?php echo $customer['products_total']; ?></strong></td> 
          <td id="co30_total" class="right" nowrap="nowrap" style="background-color:#E7EFEF; color:#003A88;"><strong><?php echo $customer['value_total']; ?></strong></td>
          <?php if ($filter_details == 1 OR $filter_details == 2 OR $filter_details == 3) { ?><td></td><?php } ?>                  
        </tr>        
          <?php } else { ?>
          <tr>
          <td class="noresult" colspan="15"><?php echo $text_no_results; ?></td>
          </tr>
          <?php } ?>
        </tbody>
      </table>
<?php } ?>      
    </div>
      <?php if ($customers) { ?>    
      <div class="pagination_report"></div>
      <?php } ?>        
    </div>
    </div>    
  </div>
</div>  
</form>  
<script type="text/javascript" src="view/javascript/jquery/jquery.multiselect.js"></script>
<script type="text/javascript" src="view/javascript/jquery/jquery.paging.min.js"></script>
<script type="text/javascript" src="view/javascript/jquery/vtip.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$('#date-start').datepicker({changeMonth: true, changeYear: true, dateFormat: 'yy-mm-dd'});
	$('#date-end').datepicker({changeMonth: true, changeYear: true, dateFormat: 'yy-mm-dd'});

	$('#status-date-start').datepicker({changeMonth: true, changeYear: true, dateFormat: 'yy-mm-dd'});
	$('#status-date-end').datepicker({changeMonth: true, changeYear: true, dateFormat: 'yy-mm-dd'});
	
    $('#filter_order_status_id').multiSelect({
      selectAllText:'<?php echo $text_all_status; ?>', noneSelected:'<?php echo $text_all_status; ?>', oneOrMoreSelected:'<?php echo $text_selected; ?>'
      });
	
    $('#filter_store_id').multiSelect({
      selectAllText:'<?php echo $text_all_stores; ?>', noneSelected:'<?php echo $text_all_stores; ?>', oneOrMoreSelected:'<?php echo $text_selected; ?>'
      });
	
    $('#filter_currency').multiSelect({
      selectAllText:'<?php echo $text_all_currencies; ?>', noneSelected:'<?php echo $text_all_currencies; ?>', oneOrMoreSelected:'<?php echo $text_selected; ?>'
      });

    $('#filter_taxes').multiSelect({
      selectAllText:'<?php echo $text_all_taxes; ?>', noneSelected:'<?php echo $text_all_taxes; ?>', oneOrMoreSelected:'<?php echo $text_selected; ?>'
      });

    $('#filter_tax_classes').multiSelect({
      selectAllText:'<?php echo $text_all_tax_classes; ?>', noneSelected:'<?php echo $text_all_tax_classes; ?>', oneOrMoreSelected:'<?php echo $text_selected; ?>'
      });
	
    $('#filter_geo_zones').multiSelect({
      selectAllText:'<?php echo $text_all_zones; ?>', noneSelected:'<?php echo $text_all_zones; ?>', oneOrMoreSelected:'<?php echo $text_selected; ?>'
      });
	
    $('#filter_customer_group_id').multiSelect({
      selectAllText:'<?php echo $text_all_groups; ?>', noneSelected:'<?php echo $text_all_groups; ?>', oneOrMoreSelected:'<?php echo $text_selected; ?>'
      });

    $('#filter_status').multiSelect({
      selectAllText:'<?php echo $text_all_status; ?>', noneSelected:'<?php echo $text_all_status; ?>', oneOrMoreSelected:'<?php echo $text_selected; ?>'
      });	
	
    $('#filter_payment_method').multiSelect({
      selectAllText:'<?php echo $text_all_payment_methods; ?>', noneSelected:'<?php echo $text_all_payment_methods; ?>', oneOrMoreSelected:'<?php echo $text_selected; ?>'
      });

    $('#filter_shipping_method').multiSelect({
      selectAllText:'<?php echo $text_all_shipping_methods; ?>', noneSelected:'<?php echo $text_all_shipping_methods; ?>', oneOrMoreSelected:'<?php echo $text_selected; ?>'
      });

    $('#filter_category').multiSelect({
      selectAllText:'<?php echo $text_all_categories; ?>', noneSelected:'<?php echo $text_all_categories; ?>', oneOrMoreSelected:'<?php echo $text_selected; ?>'
      });

    $('#filter_manufacturer').multiSelect({
      selectAllText:'<?php echo $text_all_manufacturers; ?>', noneSelected:'<?php echo $text_all_manufacturers; ?>', oneOrMoreSelected:'<?php echo $text_selected; ?>'
      });
	
    $('#filter_option').multiSelect({
      selectAllText:'<?php echo $text_all_options; ?>', noneSelected:'<?php echo $text_all_options; ?>', oneOrMoreSelected:'<?php echo $text_selected; ?>'
      });

    $('#filter_attribute').multiSelect({
      selectAllText:'<?php echo $text_all_attributes; ?>', noneSelected:'<?php echo $text_all_attributes; ?>', oneOrMoreSelected:'<?php echo $text_selected; ?>'
      });
	
    $('#filter_location').multiSelect({
      selectAllText:'<?php echo $text_all_locations; ?>', noneSelected:'<?php echo $text_all_locations; ?>', oneOrMoreSelected:'<?php echo $text_selected; ?>'
      });

    $('#filter_affiliate_name').multiSelect({
      selectAllText:'<?php echo $text_all_affiliate_names; ?>', noneSelected:'<?php echo $text_all_affiliate_names; ?>', oneOrMoreSelected:'<?php echo $text_selected; ?>'
      });

    $('#filter_affiliate_email').multiSelect({
      selectAllText:'<?php echo $text_all_affiliate_emails; ?>', noneSelected:'<?php echo $text_all_affiliate_emails; ?>', oneOrMoreSelected:'<?php echo $text_selected; ?>'
      });
	
    $('#filter_coupon_name').multiSelect({
      selectAllText:'<?php echo $text_all_coupon_names; ?>', noneSelected:'<?php echo $text_all_coupon_names; ?>', oneOrMoreSelected:'<?php echo $text_selected; ?>'
      });
	
    $('#export_xls').click(function() {
      $('#export').val('1') ; // export_xls: #1
      $('#report').attr('target', '_blank'); // opening file in a new window
      $('#report').submit() ;
      $('#report').attr('target', '_self'); // preserve current form      
      $('#export').val('') ; 
      return(false)
    });	
	
    $('#export_xls_order_list').click(function() {
      $('#export').val('2') ; // export_xls_order_list: #2
      $('#report').attr('target', '_blank'); // opening file in a new window
      $('#report').submit() ;
      $('#report').attr('target', '_self'); // preserve current form      
      $('#export').val('') ; 
      return(false)
    });	

    $('#export_xls_product_list').click(function() {
      $('#export').val('3') ; // export_xls_product_list: #3
      $('#report').attr('target', '_blank'); // opening file in a new window
      $('#report').submit() ;
      $('#report').attr('target', '_self'); // preserve current form      
      $('#export').val('') ; 
      return(false)
    });	

    $('#export_xls_address_list').click(function() {
      $('#export').val('4') ; // export_xls_address_list: #4
      $('#report').attr('target', '_blank'); // opening file in a new window
      $('#report').submit() ;
      $('#report').attr('target', '_self'); // preserve current form      
      $('#export').val('') ; 
      return(false)
    });	
	
    $('#export_xls_all_details').click(function() {
      $('#export').val('5') ; // export_xls_all_details: #5
      $('#report').attr('target', '_blank'); // opening file in a new window
      $('#report').submit() ;
      $('#report').attr('target', '_self'); // preserve current form      
      $('#export').val('') ; 
      return(false)
    });	
	
    $('#export_html').click(function() {
      $('#export').val('6') ; // export_html: #6
      $('#report').attr('target', '_blank'); // opening file in a new window
      $('#report').submit() ;
      $('#report').attr('target', '_self'); // preserve current form      
      $('#export').val('') ; 
      return(false)
    });	
	
    $('#export_html_order_list').click(function() {
      $('#export').val('7') ; // export_html_order_list: #7
      $('#report').attr('target', '_blank'); // opening file in a new window
      $('#report').submit() ;
      $('#report').attr('target', '_self'); // preserve current form      
      $('#export').val('') ; 
      return(false)
    });	
	
    $('#export_html_product_list').click(function() {
      $('#export').val('8') ; // export_html_product_list: #8
      $('#report').attr('target', '_blank'); // opening file in a new window
      $('#report').submit() ;
      $('#report').attr('target', '_self'); // preserve current form      
      $('#export').val('') ; 
      return(false)
    });		
	
    $('#export_html_address_list').click(function() {
      $('#export').val('9') ; // export_html_address_list: #9
      $('#report').attr('target', '_blank'); // opening file in a new window
      $('#report').submit() ;
      $('#report').attr('target', '_self'); // preserve current form      
      $('#export').val('') ; 
      return(false)
    });	
	
    $('#export_html_all_details').click(function() {
      $('#export').val('10') ; // export_html_all_details: #10
      $('#report').attr('target', '_blank'); // opening file in a new window
      $('#report').submit() ;
      $('#report').attr('target', '_self'); // preserve current form      
      $('#export').val('') ; 
      return(false)
    });	
	
    $('#export_pdf').click(function() {
      $('#export').val('11') ; // export_pdf: #11
      $('#report').attr('target', '_blank'); // opening file in a new window
      $('#report').submit() ;
      $('#report').attr('target', '_self'); // preserve current form      
      $('#export').val('') ; 
      return(false)
    });	
	
    $('#export_pdf_order_list').click(function() {
      $('#export').val('12') ; // export_pdf_order_list: #12
      $('#report').attr('target', '_blank'); // opening file in a new window
      $('#report').submit() ;
      $('#report').attr('target', '_self'); // preserve current form      
      $('#export').val('') ; 
      return(false)
    });	
	
    $('#export_pdf_product_list').click(function() {
      $('#export').val('13') ; // export_pdf_product_list: #13
      $('#report').attr('target', '_blank'); // opening file in a new window
      $('#report').submit() ;
      $('#report').attr('target', '_self'); // preserve current form      
      $('#export').val('') ; 
      return(false)
    });		
	
    $('#export_pdf_address_list').click(function() {
      $('#export').val('14') ; // export_pdf_address_list: #14
      $('#report').attr('target', '_blank'); // opening file in a new window
      $('#report').submit() ;
      $('#report').attr('target', '_self'); // preserve current form      
      $('#export').val('') ; 
      return(false)
    });	
	
    $('#export_pdf_all_details').click(function() {
      $('#export').val('15') ; // export_pdf_all_details: #15
      $('#report').attr('target', '_blank'); // opening file in a new window
      $('#report').submit() ;
      $('#report').attr('target', '_self'); // preserve current form      
      $('#export').val('') ; 
      return(false)
    });	
	
    $('#export_csv').click(function() {
      $('#export').val('16') ; // export_csv: #16
      $('#report').attr('target', '_blank'); // opening file in a new window
      $('#report').submit() ;
      $('#report').attr('target', '_self'); // preserve current form      
      $('#export').val('') ; 
      return(false)
    });
	
    $('#export_csv_all_details').click(function() {
      $('#export').val('17') ; // export_csv_all_details: #17
      $('#report').attr('target', '_blank'); // opening file in a new window
      $('#report').submit() ;
      $('#report').attr('target', '_self'); // preserve current form      
      $('#export').val('') ; 
      return(false)
    });	
	
    $('#export_xlsx').click(function() {
      $('#export').val('18') ; // export_xlsx: #18
      $('#report').attr('target', '_blank'); // opening file in a new window
      $('#report').submit() ;
      $('#report').attr('target', '_self'); // preserve current form      
      $('#export').val('') ; 
      return(false)
    });
	
    $('#export_xlsx_all_details').click(function() {
      $('#export').val('19') ; // export_xlsx_all_details: #19
      $('#report').attr('target', '_blank'); // opening file in a new window
      $('#report').submit() ;
      $('#report').attr('target', '_self'); // preserve current form      
      $('#export').val('') ; 
      return(false)
    });		
});
</script>  
<script type="text/javascript"><!--
$('input[name=\'filter_customer_name\']').autocomplete({
	delay: 0,
	source: function(request, response) {
		$.ajax({
			url: 'index.php?route=report/adv_customer_order/customer_autocomplete&token=<?php echo $token; ?>&filter_customer_name=' +  encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {		
				response($.map(json, function(item) {
					return {
						label: item.cust_name,
						value: item.customer_id
					}
				}));
			}
		});
	}, 
	select: function(event, ui) {
		$('input[name=\'filter_customer_name\']').val(ui.item.label);
						
		return false;
	}
});

$('input[name=\'filter_customer_email\']').autocomplete({
	delay: 0,
	source: function(request, response) {
		$.ajax({
			url: 'index.php?route=report/adv_customer_order/customer_autocomplete&token=<?php echo $token; ?>&filter_customer_email=' +  encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {		
				response($.map(json, function(item) {
					return {
						label: item.cust_email,
						value: item.customer_id
					}
				}));
			}
		});
	}, 
	select: function(event, ui) {
		$('input[name=\'filter_customer_email\']').val(ui.item.label);
						
		return false;
	}
});

$('input[name=\'filter_customer_telephone\']').autocomplete({
	delay: 0,
	source: function(request, response) {
		$.ajax({
			url: 'index.php?route=report/adv_customer_order/customer_autocomplete&token=<?php echo $token; ?>&filter_customer_telephone=' +  encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {		
				response($.map(json, function(item) {
					return {
						label: item.cust_telephone,
						value: item.customer_id
					}
				}));
			}
		});
	}, 
	select: function(event, ui) {
		$('input[name=\'filter_customer_telephone\']').val(ui.item.label);
						
		return false;
	}
});

$('input[name=\'filter_ip\']').autocomplete({
	delay: 0,
	source: function(request, response) {
		$.ajax({
			url: 'index.php?route=report/adv_customer_order/customer_autocomplete&token=<?php echo $token; ?>&filter_ip=' +  encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {		
				response($.map(json, function(item) {
					return {
						label: item.cust_ip,
						value: item.customer_id
					}
				}));
			}
		});
	}, 
	select: function(event, ui) {
		$('input[name=\'filter_ip\']').val(ui.item.label);
						
		return false;
	}
});

$('input[name=\'filter_payment_company\']').autocomplete({
	delay: 0,
	source: function(request, response) {
		$.ajax({
			url: 'index.php?route=report/adv_customer_order/customer_autocomplete&token=<?php echo $token; ?>&filter_payment_company=' +  encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {		
				response($.map(json, function(item) {
					return {
						label: item.payment_company,
						value: item.customer_id
					}
				}));
			}
		});
	}, 
	select: function(event, ui) {
		$('input[name=\'filter_payment_company\']').val(ui.item.label);
						
		return false;
	}
});

$('input[name=\'filter_payment_address\']').autocomplete({
	delay: 0,
	source: function(request, response) {
		$.ajax({
			url: 'index.php?route=report/adv_customer_order/customer_autocomplete&token=<?php echo $token; ?>&filter_payment_address=' +  encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {		
				response($.map(json, function(item) {
					return {
						label: item.payment_address,
						value: item.customer_id
					}
				}));
			}
		});
	}, 
	select: function(event, ui) {
		$('input[name=\'filter_payment_address\']').val(ui.item.label);
						
		return false;
	}
});

$('input[name=\'filter_payment_city\']').autocomplete({
	delay: 0,
	source: function(request, response) {
		$.ajax({
			url: 'index.php?route=report/adv_customer_order/customer_autocomplete&token=<?php echo $token; ?>&filter_payment_city=' +  encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {		
				response($.map(json, function(item) {
					return {
						label: item.payment_city,
						value: item.customer_id
					}
				}));
			}
		});
	}, 
	select: function(event, ui) {
		$('input[name=\'filter_payment_city\']').val(ui.item.label);
						
		return false;
	}
});

$('input[name=\'filter_payment_zone\']').autocomplete({
	delay: 0,
	source: function(request, response) {
		$.ajax({
			url: 'index.php?route=report/adv_customer_order/customer_autocomplete&token=<?php echo $token; ?>&filter_payment_zone=' +  encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {		
				response($.map(json, function(item) {
					return {
						label: item.payment_zone,
						value: item.customer_id
					}
				}));
			}
		});
	}, 
	select: function(event, ui) {
		$('input[name=\'filter_payment_zone\']').val(ui.item.label);
						
		return false;
	}
});

$('input[name=\'filter_payment_postcode\']').autocomplete({
	delay: 0,
	source: function(request, response) {
		$.ajax({
			url: 'index.php?route=report/adv_customer_order/customer_autocomplete&token=<?php echo $token; ?>&filter_payment_postcode=' +  encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {		
				response($.map(json, function(item) {
					return {
						label: item.payment_postcode,
						value: item.customer_id
					}
				}));
			}
		});
	}, 
	select: function(event, ui) {
		$('input[name=\'filter_payment_postcode\']').val(ui.item.label);
						
		return false;
	}
});

$('input[name=\'filter_payment_country\']').autocomplete({
	delay: 0,
	source: function(request, response) {
		$.ajax({
			url: 'index.php?route=report/adv_customer_order/customer_autocomplete&token=<?php echo $token; ?>&filter_payment_country=' +  encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {		
				response($.map(json, function(item) {
					return {
						label: item.payment_country,
						value: item.customer_id
					}
				}));
			}
		});
	}, 
	select: function(event, ui) {
		$('input[name=\'filter_payment_country\']').val(ui.item.label);
						
		return false;
	}
});

$('input[name=\'filter_shipping_company\']').autocomplete({
	delay: 0,
	source: function(request, response) {
		$.ajax({
			url: 'index.php?route=report/adv_customer_order/customer_autocomplete&token=<?php echo $token; ?>&filter_shipping_company=' +  encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {		
				response($.map(json, function(item) {
					return {
						label: item.shipping_company,
						value: item.customer_id
					}
				}));
			}
		});
	}, 
	select: function(event, ui) {
		$('input[name=\'filter_shipping_company\']').val(ui.item.label);
						
		return false;
	}
});

$('input[name=\'filter_shipping_address\']').autocomplete({
	delay: 0,
	source: function(request, response) {
		$.ajax({
			url: 'index.php?route=report/adv_customer_order/customer_autocomplete&token=<?php echo $token; ?>&filter_shipping_address=' +  encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {		
				response($.map(json, function(item) {
					return {
						label: item.shipping_address,
						value: item.customer_id
					}
				}));
			}
		});
	}, 
	select: function(event, ui) {
		$('input[name=\'filter_shipping_address\']').val(ui.item.label);
						
		return false;
	}
});

$('input[name=\'filter_shipping_city\']').autocomplete({
	delay: 0,
	source: function(request, response) {
		$.ajax({
			url: 'index.php?route=report/adv_customer_order/customer_autocomplete&token=<?php echo $token; ?>&filter_shipping_city=' +  encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {		
				response($.map(json, function(item) {
					return {
						label: item.shipping_city,
						value: item.customer_id
					}
				}));
			}
		});
	}, 
	select: function(event, ui) {
		$('input[name=\'filter_shipping_city\']').val(ui.item.label);
						
		return false;
	}
});

$('input[name=\'filter_shipping_zone\']').autocomplete({
	delay: 0,
	source: function(request, response) {
		$.ajax({
			url: 'index.php?route=report/adv_customer_order/customer_autocomplete&token=<?php echo $token; ?>&filter_shipping_zone=' +  encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {		
				response($.map(json, function(item) {
					return {
						label: item.shipping_zone,
						value: item.customer_id
					}
				}));
			}
		});
	}, 
	select: function(event, ui) {
		$('input[name=\'filter_shipping_zone\']').val(ui.item.label);
						
		return false;
	}
});

$('input[name=\'filter_shipping_postcode\']').autocomplete({
	delay: 0,
	source: function(request, response) {
		$.ajax({
			url: 'index.php?route=report/adv_customer_order/customer_autocomplete&token=<?php echo $token; ?>&filter_shipping_postcode=' +  encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {		
				response($.map(json, function(item) {
					return {
						label: item.shipping_postcode,
						value: item.customer_id
					}
				}));
			}
		});
	}, 
	select: function(event, ui) {
		$('input[name=\'filter_shipping_postcode\']').val(ui.item.label);
						
		return false;
	}
});

$('input[name=\'filter_shipping_country\']').autocomplete({
	delay: 0,
	source: function(request, response) {
		$.ajax({
			url: 'index.php?route=report/adv_customer_order/customer_autocomplete&token=<?php echo $token; ?>&filter_shipping_country=' +  encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {		
				response($.map(json, function(item) {
					return {
						label: item.shipping_country,
						value: item.customer_id
					}
				}));
			}
		});
	}, 
	select: function(event, ui) {
		$('input[name=\'filter_shipping_country\']').val(ui.item.label);
						
		return false;
	}
});

$('input[name=\'filter_sku\']').autocomplete({
	delay: 0,
	source: function(request, response) {
		$.ajax({
			url: 'index.php?route=report/adv_customer_order/product_autocomplete&token=<?php echo $token; ?>&filter_sku=' +  encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {		
				response($.map(json, function(item) {
					return {
						label: item.prod_sku,
						value: item.product_id
					}
				}));
			}
		});
	}, 
	select: function(event, ui) {
		$('input[name=\'filter_sku\']').val(ui.item.label);
						
		return false;
	}
});

$('input[name=\'filter_product_id\']').autocomplete({
	delay: 0,
	source: function(request, response) {
		$.ajax({
			url: 'index.php?route=report/adv_customer_order/product_autocomplete&token=<?php echo $token; ?>&filter_product_id=' +  encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {		
				response($.map(json, function(item) {
					return {
						label: item.prod_name,
						value: item.product_id
					}
				}));
			}
		});
	}, 
	select: function(event, ui) {
		$('input[name=\'filter_product_id\']').val(ui.item.label);
						
		return false;
	}
});

$('input[name=\'filter_model\']').autocomplete({
	delay: 0,
	source: function(request, response) {
		$.ajax({
			url: 'index.php?route=report/adv_customer_order/product_autocomplete&token=<?php echo $token; ?>&filter_model=' +  encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {		
				response($.map(json, function(item) {
					return {
						label: item.prod_model,
						value: item.product_id
					}
				}));
			}
		});
	}, 
	select: function(event, ui) {
		$('input[name=\'filter_model\']').val(ui.item.label);
						
		return false;
	}
});

$('input[name=\'filter_coupon_code\']').autocomplete({
	delay: 0,
	source: function(request, response) {
		$.ajax({
			url: 'index.php?route=report/adv_customer_order/coupon_autocomplete&token=<?php echo $token; ?>&filter_coupon_code=' +  encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {		
				response($.map(json, function(item) {
					return {
						label: item.coupon_code,
						value: item.coupon_id
					}
				}));
			}
		});
	}, 
	select: function(event, ui) {
		$('input[name=\'filter_coupon_code\']').val(ui.item.label);
						
		return false;
	}
});

$('input[name=\'filter_voucher_code\']').autocomplete({
	delay: 0,
	source: function(request, response) {
		$.ajax({
			url: 'index.php?route=report/adv_customer_order/voucher_autocomplete&token=<?php echo $token; ?>&filter_voucher_code=' +  encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {		
				response($.map(json, function(item) {
					return {
						label: item.voucher_code,
						value: item.voucher_id
					}
				}));
			}
		});
	}, 
	select: function(event, ui) {
		$('input[name=\'filter_voucher_code\']').val(ui.item.label);
						
		return false;
	}
});
//--></script> 
<?php if ($customers) { ?>    
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script type="text/javascript"><!--
	google.load('visualization', '1', {packages: ['corechart']});
      google.setOnLoadCallback(drawChart);      
	  function drawChart() { 
   		var data = google.visualization.arrayToDataTable([
			<?php echo "['" . $column_customer." / ".$column_company . "','". $column_orders . "'],";
					foreach ($sales as $key => $sale) {
						if (count($sales)==($key+1)) {
							echo "['" . ($sale['gcompany'] ? $sale['gcustomer']." / ".$sale['gcompany'] : $sale['gcustomer']) . "',". $sale['gorders'] . "]";
						} else {
							echo "['" . ($sale['gcompany'] ? $sale['gcustomer']." / ".$sale['gcompany'] : $sale['gcustomer']) . "',". $sale['gorders'] . "],";
						}
					}
			;?>
		]);


        var options = {
			title: 'Top 10 Customers by Orders',
			pieSliceText: 'none',
			tooltip: {text: 'value'},
			pieHole: 0.4,
			chartArea: {left: 45, top: 55, width: "75%", height: "65%"},
        };

			var chart = new google.visualization.PieChart(document.getElementById('chart1_div'));
			chart.draw(data, options);
	}
//--></script>
<script type="text/javascript"><!--
	google.load('visualization', '1', {packages: ['corechart']});
      google.setOnLoadCallback(drawChart);      
	  function drawChart() { 
   		var data = google.visualization.arrayToDataTable([
			<?php echo "['" . $column_customer." / ".$column_company . "','". $column_value . "'],";
					foreach ($sales as $key => $sale) {
						if (count($sales)==($key+1)) {
							echo "['" . ($sale['gcompany'] ? $sale['gcustomer']." / ".$sale['gcompany'] : $sale['gcustomer']) . "',". $sale['gtotal'] . "]";
						} else {
							echo "['" . ($sale['gcompany'] ? $sale['gcustomer']." / ".$sale['gcompany'] : $sale['gcustomer']) . "',". $sale['gtotal'] . "],";
						}
					}
			;?>
		]);

        var options = {
			colors: ['#b5e08b'],
			bar: {groupWidth: "80%"},
			chartArea: {top: 35, width: "60%", height: "70%"},
		};

			var chart = new google.visualization.BarChart(document.getElementById('chart2_div'));
			chart.draw(data, options);
	}
//--></script>
<?php } ?>
<?php echo $footer; ?>