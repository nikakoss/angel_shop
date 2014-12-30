<?php
/*
* Shoputils
 *
 * ПРИМЕЧАНИЕ К ЛИЦЕНЗИОННОМУ СОГЛАШЕНИЮ
 *
 * Этот файл связан лицензионным соглашением, которое можно найти в архиве,
 * вместе с этим файлом. Файл лицензии называется: LICENSE.1.4.x.RUS.txt
 * Так же лицензионное соглашение можно найти по адресу:
 * http://opencart.shoputils.ru/LICENSE.1.4.x.RUS.txt
 * 
 * =================================================================
 * OPENCART 1.4.x ПРИМЕЧАНИЕ ПО ИСПОЛЬЗОВАНИЮ
 * =================================================================
 *  Этот файл предназначен для Opencart 1.4.x. Shoputils не
 *  гарантирует правильную работу этого расширения на любой другой 
 *  версии Opencart, кроме Opencart 1.4.x. 
 *  Shoputils не поддерживает программное обеспечение для других 
 *  версий Opencart.
 * =================================================================
*/
?>
<?php echo $header; ?>
<?php if ($text_error) { ?>
<div class="warning"><?php echo $text_error; ?></div>
<?php } ?>
<div class="box">
  <div class="left"></div>
  <div class="right"></div>
  <div class="heading">
    <h1 style="background-image: url('view/image/special.png');"><?php echo $heading_title; ?></h1>
    <div class="buttons"><a onclick="$('#form').submit();" class="button"><span><?php echo $button_save; ?></span></a><a onclick="location = '<?php echo $cancel; ?>';" class="button"><span><?php echo $button_cancel; ?></span></a></div>
  </div>
  <div class="content">
    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
          <table class="form">
            <tr>
              <td><span class="required">*</span> <?php echo $entry_name; ?></br><span class="help"><?php echo $entry_name_help; ?></span></td>
              <td><input type="text" size="80" name="name" value="<?php echo $name; ?>" /></td>
            </tr>
            <tr>
              <td><?php echo $entry_status; ?></br><span class="help"><?php echo $entry_status_help; ?></span></td>
              <td><select name="enabled">
                    <?php if ($enabled) { ?>
                    <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                    <option value="0"><?php echo $text_disabled; ?></option>
                    <?php } else { ?>
                    <option value="1"><?php echo $text_enabled; ?></option>
                    <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                    <?php } ?>
                  </select>
              </td>
            </tr>
            <tr>
              <td><?php echo $entry_sort_order; ?></br><span class="help"><?php echo $entry_sort_order_help; ?></span></td>
              <td><input type="text" size="6" name="sort_order" value="<?php echo $sort_order; ?>" /></td>
            </tr>
            <tr>
              <td><?php echo $entry_percent; ?></br><span class="help"><?php echo $entry_percent_help; ?></span></td>
              <td><input type="text" size="6" name="percent" value="<?php echo $percent; ?>" /></td>
            </tr>
            <tr>
              <td><?php echo $entry_priority; ?></br><span class="help"><?php echo $entry_priority_help; ?></span></td>
              <td><input type="text" size="6" name="priority" value="<?php echo $priority; ?>" /></td>
            </tr>
            <tr>
              <td><?php echo $entry_customer_group_ids; ?></br><span class="help"><?php echo $entry_customer_group_ids_help; ?></span></td>
                <td class="left">
                    <div class="scrollbox">
                        <?php $class = 'odd'; ?>
                        <?php foreach ($customer_groups as $customer_group) { ?>
                        <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                        <div class="<?php echo $class; ?>">
                            <?php if (in_array($customer_group['customer_group_id'], $customer_group_ids)) { ?>
                            <input type="checkbox" name="customer_group_ids[]" value="<?php echo $customer_group['customer_group_id']; ?>" checked />
                            <?php echo $customer_group['name']; ?>
                            <?php } else { ?>
                            <input type="checkbox" name="customer_group_ids[]; ?>" value="<?php echo $customer_group['customer_group_id']; ?>" />
                            <?php echo $customer_group['name']; ?>
                            <?php } ?>
                        </div>
                        <?php } ?>
                    </div>
                </td>
            </tr>
            <tr>
              <td><?php echo $entry_date_start; ?></br><span class="help"><?php echo $entry_date_start_help; ?></span></td>
              <td><input type="text" class="date" name="date_start" value="<?php echo $date_start; ?>" /></td>
            </tr>
            <tr>
              <td><?php echo $entry_date_end; ?></br><span class="help"><?php echo $entry_date_end_help; ?></span></td>
              <td><input type="text" class="date" name="date_end" value="<?php echo $date_end; ?>" /></td>
            </tr>
            <tr>
                <td><?php echo $entry_objects_type; ?></br><span class="help"><?php echo $entry_objects_type_help; ?></span></td>
                <td><select name="objects_type" id="object_type">
                      <?php if ((int)$objects_type == 0) { ?>
                      <option value="0" selected="selected"><?php echo $entry_objects_categories; ?></option>
                      <option value="1"><?php echo $entry_objects_products; ?></option>
                      <option value="2"><?php echo $entry_objects_manufacturers; ?></option>
                      <?php } else if ((int)$objects_type == 1) { ?>
                      <option value="0"><?php echo $entry_objects_categories; ?></option>
                      <option value="1" selected="selected"><?php echo $entry_objects_products; ?></option>
                      <option value="2"><?php echo $entry_objects_manufacturers; ?></option>
                      <?php } else if ((int)$objects_type == 2) { ?>
                      <option value="0"><?php echo $entry_objects_categories; ?></option>
                      <option value="1"><?php echo $entry_objects_products; ?></option>
                      <option value="2" selected="selected"><?php echo $entry_objects_manufacturers; ?></option>
                      <?php } ?>
                    </select>
                </td>
            </tr>
            <tr <?php echo (int)$objects_type != 0 ? 'style="display:none"':''?> id="categories_tr">
                <td><?php echo $entry_objects_categories; ?></br><span class="help"><?php echo $entry_objects_categories_help; ?></span></td>
                <td>
                    <input type="hidden" name="categories" id="categories_input" value="<?php echo $categories; ?>"/>
                    <input type="hidden" id="categories_input-selected">
                    <div id="categories_list">
                    </div>
                    <div class="buttons" style="padding-top:10px;">
                        <a href="#" class="button" id="categories_button"><span><?php echo $button_change; ?></span></a>
                    </div>
                </td>
            </tr>
            <tr <?php echo (int)$objects_type != 1 ? 'style="display:none"':''?> id="products_tr">
                <td><?php echo $entry_objects_products; ?></br><span class="help"><?php echo $entry_objects_products_help; ?></span></td>
                <td>
                    <input type="hidden" name="products" id="products_input" value="<?php echo $products; ?>"/>
                    <input type="hidden" id="products_input-selected">
                    <div id="products_list">
                    </div>
                    <div class="buttons" style="padding-top:10px;">
                        <a href="#" class="button" id="products_button"><span><?php echo $button_change; ?></span></a>
                    </div>
                </td>
            </tr>
            <tr <?php echo (int)$objects_type != 2 ? 'style="display:none"':''?> id="manufacturers_tr">
                <td><?php echo $entry_objects_manufacturers; ?></br><span class="help"><?php echo $entry_objects_manufacturers_help; ?></span></td>
                <td>
                    <div class="scrollbox" style="width:50%; height:200px">
                        <?php $class = 'odd'; ?>
                        <?php foreach ($manufacturers as $manufacturer) { ?>
                        <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                        <div class="<?php echo $class; ?>">
                          <input type="checkbox" name="manufacturers[]" value="<?php echo $manufacturer['manufacturer_id']; ?>" <?php echo in_array($manufacturer['manufacturer_id'], $manufacturers_array) ? 'checked' : ''?>/>
                          <?php echo $manufacturer['name']; ?>
                        </div>
                        <?php } ?>
                    </div>
                </td>
            </tr>
          </table>
    </form>
  </div>
</div>

<script type="text/javascript" src="view/javascript/jquery/ui/ui.dialog.js"></script>
<script type="text/javascript" src="view/javascript/jquery/ui/external/cookie/jquery.cookie.min.js"></script>
<script type="text/javascript" src="view/javascript/objectsSelector.js"></script>
<script type="text/javascript" src="view/javascript/jquery/ui/ui.datepicker.js"></script>
<script type="text/javascript"><!--
$(document).ready(function() {
	updateCategoriesTable();
    updateProductsTable();

    $('.date').datepicker({dateFormat: 'yy-mm-dd'});

    $('#object_type').change(function(){
        if ($(this).val() == 0){
            $('#categories_tr').show();
            $('#products_tr').hide()
            $('#manufacturers_tr').hide()
        } else if ($(this).val() == 1){
            $('#categories_tr').hide();
            $('#products_tr').show();
            $('#manufacturers_tr').hide()
        } else if ($(this).val() == 2){
            $('#categories_tr').hide();
            $('#products_tr').hide();
            $('#manufacturers_tr').show()
        }
    });

    $('#categories_button').click(function(event){
        event.preventDefault();
        $.cookie('selected', $('#categories_input').val());
        dialogObjectsSelector('<?php echo $text_select_categories; ?>', 'categories_dialog', 'categories_input', '<?php echo $categories_dialog; ?>')
    });

    $('#products_button').click(function(event){
        event.preventDefault();
        $.cookie('selected', $('#products_input').val());
        dialogObjectsSelector('<?php echo $text_select_products; ?>', 'products_dialog', 'products_input', '<?php echo $products_dialog; ?>')
    });

});

function updateCategoriesTable(){
    $('#categories_list').html('<img src="view/image/ajaxLoader.gif">');
    var table_action = '<?php echo $categories_table?>';
    $.ajax({
        url: table_action.replace('{selected}', $('#categories_input').val()),
        dataType: 'html',
        success: function(data) {
            $('#categories_list').html(data);
        }
    });
}

function updateProductsTable(){
    $('#products_list').html('<img src="view/image/ajaxLoader.gif">');
    var table_action = '<?php echo $products_table?>';
    $.ajax({
        url: table_action.replace('{selected}', $('#products_input').val()),
        dataType: 'html',
        success: function(data) {
            $('#products_list').html(data);
        }
    });
}

//--></script>
<?php echo $footer; ?>