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
<?php echo '<?xml version="1.0" encoding="UTF-8"?>' . "\n"; ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr" lang="en" xml:lang="en">
<head>
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<link rel="stylesheet" type="text/css" href="view/stylesheet/stylesheet.css" />
<link rel="stylesheet" type="text/css" href="view/javascript/jquery/ui/themes/ui-lightness/ui.all.css" />
<script type="text/javascript" src="view/javascript/jquery/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="view/javascript/jquery/ui/ui.core.js"></script>
<script type="text/javascript" src="view/javascript/jquery/jstree/jquery.tree.min.js"></script>
<script type="text/javascript" src="view/javascript/jquery/ajaxupload.js"></script>
<script type="text/javascript" src="view/javascript/jquery/ui/ui.draggable.js"></script>
<script type="text/javascript" src="view/javascript/jquery/ui/ui.resizable.js"></script>
<script type="text/javascript" src="view/javascript/jquery/ui/ui.dialog.js"></script>
<script type="text/javascript" src="view/javascript/jquery/ui/external/bgiframe/jquery.bgiframe.js"></script>
<script type="text/javascript" src="view/javascript/jquery/ui/external/cookie/jquery.cookie.min.js "></script>
<style type="text/css">

#<?php echo $dialog_id?> {
	display: none;
}
.box {
    height: 480px;
    padding:0;
    margin:0;
}
.filter {
    float:left;
    padding-top: 8px;
    padding-left:10px;
}
.buttons{
    float:right;
}
.objects{
    height: 400px;
    overflow: scroll;
    overflow-x: hidden;
    padding:0;
    margin:0;
}
#stats{
    padding:5px;
    text-align:center;
}

</style>

</head>
<body>
<div class="box">
  <div class="heading">
        <div class="filter">
            <?php echo $entry_filter_name ?>:&nbsp;<input type="text" value="<?php echo $filter; ?>" id="filter_input"/>&nbsp;<a id="filter" class="button"><span><?php echo $button_filter; ?></span></a>
        </div>
        <div class="buttons" style="text-align:right;">
            <a id="select" class="button"><span><?php echo $button_select; ?></span></a>
            <a id="cancel" class="button"><span><?php echo $button_cancel; ?></span></a>
        </div>
  </div>
  <div id="stats"><?php echo $text_categories_selected; ?>0</div>
  <table class="list">
      <thead>
        <tr>
          <td style="padding:0;margin:0;width:4px;">&nbsp;</td>
          <td width="1" style="text-align: center;">
              <input type="checkbox" id="checkboxall" />
          </td>
          <td>
            <?php echo $column_name; ?>
          </td>
        </tr>
      </thead>
      <tbody>
        <tr>
            <td colspan="3">
                    <?php if (count($categories) > 0):?>
                        <div class="objects"  style="margin-left:-1px">
                        <table width="100%"  class="list">
                        <?php foreach ($categories as $category):?>
                            <tr>
                              <td width="1" style="text-align: center;">
                                  <input type="checkbox" name="selected" id="category_<?php echo $category['category_id']; ?>" value="<?php echo $category['category_id']; ?>"/>
                              </td>
                              <td>
                                <label for='category_<?php echo $category['category_id']; ?>'><?php echo $category['name']; ?></label>
                              </td>
                            </tr>
                        <?php endforeach;?>
                        </table>
                        </div>
                    <?php else:?>
                        <br/><div class="warning"><?php echo $text_no_categories; ?></div>
                    <?php endif;?>
            </td>
        </tr>
      </tbody>
  </table>
</div>
<script type="text/javascript"><!--
  $(document).ready(function () {
      var selected = parent.$('#<?php echo $field_id?>-selected');
      if (!selected.val()){
          selected.val(parent.$('#<?php echo $field_id?>').val());
      }

      updateStats();

      $("#checkboxall").click(function()
      {
           var checked_status = this.checked;
           $("input[name=selected]").each(function()
           {
            this.checked = checked_status;
            if ($(this).is(':checked')){
                categoryAdd($(this).val());
            } else {
                categoryRemove($(this).val());
            }
           });
      });

      $('#cancel').click(function(){
          parent.$('#<?php echo $dialog_id?>').dialog('close');
          $.cookie('filter', '');
          selected.val('');
      });
      
      $('#select').click(function(){
          parent.$('#<?php echo $field_id?>').val(selected.val());
          parent.updateCategoriesTable();
          parent.$('#<?php echo $dialog_id?>').dialog('hide');
          parent.$('#<?php echo $dialog_id?>').dialog('close');
          $.cookie('filter', '');
          selected.val('');
      });

      $('#filter').click(function(){
          $.cookie('filter', $('#filter_input').val());
          location = '<?php echo $action_filter; ?>';
      });

      $('#filter_input').keydown(function(event){
          if (event.keyCode == '13') {
              $('#filter').click();
          }
      });

      if(!Array.indexOf){
          Array.prototype.indexOf = function(obj){
              for(var i=0; i<this.length; i++){
                  if(this[i]==obj){
                      return i;
                  }
              }
              return -1;
          }
      }

      function categoryAdd(id) {
          var ids = new String(selected.val()).split(',');
          if (ids.indexOf(id) == -1){
              ids.push(id);
              selected.val(ids.join(','));
              updateStats();
          }
      }

      function categoryRemove(id) {
          var ids = new String(selected.val()).split(',');
          // bug #7654 fixed
          while (ids.indexOf(id) != -1) {
              ids.splice(ids.indexOf(id), 1);
          }
          selected.val(ids.join(','));
          updateStats();
      }

      $('input[name*=\'select\']').change(function(){
          if ($(this).is(':checked')){
              categoryAdd($(this).val());
          } else {
              categoryRemove($(this).val());
          }
      });

      function updateStats(){
          var ids = new String(selected.val()).split(',');
          if (ids.length > 0 && ids[0] == ''){
              ids.splice(0,1);
          }
          $("input[name=selected]").each(function(){
             this.checked = ids.indexOf($(this).attr('pid')) != -1;
          });
          $('#stats').html('<?php echo $text_categories_selected; ?>' + (ids.length));
      }

  });
//--></script>
</body>
</html>