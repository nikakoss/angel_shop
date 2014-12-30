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
<table class="list" style="width:80%">
    <thead>
    <tr>
        <td style="text-align: center; width:1px;">
            <input type="checkbox" id="checkboxall" style="width:10px;"/>
        </td>
        <td style="width:40px;">
        </td>
        <td style="padding:3px; width:50px">
            <?php echo $column_id; ?>
        </td>
        <td style="padding:3px; width:50px">
            <?php echo $column_sku; ?>
        </td>
        <td style="padding:3px;">
            <?php echo $column_name; ?>
        </td>
        <td style="padding:3px; width:100px;">
            <?php echo $column_price; ?>
        </td>
    </tr>
    </thead>
    <? if (count($selected)): ?>
    <? foreach($selected as $values): ?>
    <tr>
        <td style="text-align: center; width:1px;">
            <input type="checkbox" name="selected" id="product_<?php echo $values['product_id']; ?>"
                   value="<?php echo $values['product_id']; ?>"/>
        </td>
        <td style="vertical-align:top; width:40px; text-align:center;">
            <img class="delete_product" title="<?php echo $text_delete; ?>"
                 product_id="<?php echo $values['product_id']?>" src="view/image/delete.png"
                 style="cursor:pointer"/></a>
            <a href="<?php echo $values['href']?>" title="<?php echo $text_edit; ?>"><img src="view/image/edit.png"
                                                                                          style="border:0"/></a>
        </td>
        <td style="padding:3px; width:50px">
            <?php echo $values['product_id']?>
        </td>
        <td style="padding:3px; width:50px">
            <?php echo $values['sku']?>
        </td>
        <td style="padding:3px;">
            <?php echo $values['name']?>
        </td>
        <td style="padding:3px; width:100px;">
            <?php echo $values['price']?>
        </td>
    </tr>
    <? endforeach; ?>
    <tr>
        <td style="padding:3px;" colspan="6">
            <a href="#" class="button" id="products_delete"><span><?php echo $button_delete; ?></span></a>
        </td>
    </tr>
    <? else: ?>
    <tr>
        <td style="padding:3px;" colspan="6">
            <?php echo $text_no_products; ?>
        </td>
    </tr>
    <? endif; ?>
</table>

<?php if(isset($field)):?>
<script type="text/javascript"><!--
    <?php
    $result = array();
    foreach($selected as $values){
        $result[] = $values['product_id'];
    }
    ?>
    $('#<?php echo $field; ?>').val('<?php echo implode(',', $result)?>');


    $('.delete_product').click(function(){
        var id = $(this).attr('product_id');
        var ids = new String($('#<?php echo $field; ?>').val()).split(',');
        // bug #7654 fixed
        while (ids.indexOf(id) != -1) {
            ids.splice(ids.indexOf(id), 1);
        }
        $('#<?php echo $field; ?>').val(ids.join(','));
        updateProductsTable();
    });

    $('#products_delete').click(function(event){
        event.preventDefault();
        var deleted = false;
        $('input[name=selected]:checked').each(function(){
            var id = $(this).val();
            var ids = new String($('#<?php echo $field; ?>').val()).split(',');
            // bug #7654 fixed
            while (ids.indexOf(id) != -1) {
                ids.splice(ids.indexOf(id), 1);
            }
            $('#<?php echo $field; ?>').val(ids.join(','));
            deleted = true;
        });
        if (deleted){
            updateProductsTable();
        }
    });

    $("#checkboxall").click(function()
    {
         var checked_status = this.checked;
         $("input[name=selected]").each(function()
         {
          this.checked = checked_status;
         });
    });

//--></script>

<?php endif;?>


