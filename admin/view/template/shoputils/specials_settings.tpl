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

<?php if ($text_success) { ?>
<div class="success">
    <?php echo $text_success; ?>
</div>
<?php } ?>

<?php if ($text_error) { ?>
<div class="warning">
    <?php echo $text_error; ?>
</div>
<?php } ?>

<?php if ($text_info) { ?>
<div class="success" style="background:#FFF">
    <?php echo $text_info; ?>
</div>
<?php } ?>

<div class="box">
  <div class="left"></div>
  <div class="right"></div>
  <div class="heading">
    <h1 style="background-image: url('view/image/special.png');"><?php echo $heading_title; ?></h1>
    <div class="buttons">
        <a onclick="location = '<?php echo $insert; ?>'" class="button"><span><?php echo $button_insert; ?></span></a>
        <a onclick="$('#form').submit();" class="button"><span><?php echo $button_delete; ?></span></a>
        <a onclick="if (confirm('<?php echo $question_apply; ?>')) {$('#form').attr('action', '<?php echo $apply; ?>');$('#form').submit();}" class="button"><span><?php echo $button_apply; ?></span></a>
    </div>
  </div>
  <div class="content">
    <form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form">
      <table class="list">
        <thead>
          <tr>
            <td width="1" style="text-align: center;"><input type="checkbox" onclick="$('input[name*=\'selected\']').attr('checked', this.checked);" /></td>
            <td class="left" width="30%"><?php echo $column_name; ?></td>
            <td class="left"><?php echo $column_enabled; ?></td>
            <td class="left"><?php echo $column_objects; ?></td>
            <td class="right"><?php echo $column_percent; ?></td>
            <td class="right" width="100px;"><?php echo $column_date_start; ?></td>
            <td class="right" width="100px;"><?php echo $column_date_end; ?></td>
            <td class="right" width="100px;"><?php echo $column_sort_order; ?></td>
            <td class="right" width="90px;"><?php echo $column_action; ?></td>
          </tr>
        </thead>
        <tbody>
          <?php if ($specials) { ?>
          <?php foreach ($specials as $special) { ?>
          <tr>
            <td style="text-align: center;">
                <input type="checkbox" name="selected[]" value="<?php echo $special['specials_id']; ?>" />
            </td>
            <td class="left"><?php echo $special['name']; ?></td>
            <td class="left"><?php echo $special['enabled']; ?></td>
            <td class="left"><?php echo $special['objects_type']; ?></td>
            <td class="right"><?php echo $special['percent']; ?></td>
            <td class="right"><?php echo $special['date_start']; ?></td>
            <td class="right"><?php echo $special['date_end']; ?></td>
            <td class="right"><?php echo $special['sort_order']; ?></td>
            <td class="right">
                <?php foreach ($special['action'] as $action) { ?>
                    [ <a href="<?php echo $action['href']; ?>"><?php echo $action['text']; ?></a> ]
                <?php } ?>
            </td>
          </tr>
          <?php } ?>
          <?php } else { ?>
          <tr>
            <td class="center" colspan="9"><?php echo $text_no_results; ?></td>
          </tr>
          <?php } ?>
        </tbody>
      </table>
    </form>
  </div>
</div>
<?php echo $footer; ?>