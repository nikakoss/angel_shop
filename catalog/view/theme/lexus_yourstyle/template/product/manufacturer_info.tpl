<?php require( DIR_TEMPLATE.$this->
config->get('config_template')."/template/common/config.tpl" ); $themeConfig = (array)$this->config->get('themecontrol'); $categoryConfig = array( 'listing_products_columns' => 0, 'listing_products_columns_small' => 2, 'listing_products_columns_minismall' => 1, 'cateogry_display_mode' => 'grid', 'category_pzoom' => 1, 'quickview' => 0, 'show_swap_image' => 0, ); $categoryConfig = array_merge($categoryConfig, $themeConfig ); $DISPLAY_MODE = $categoryConfig['cateogry_display_mode']; $MAX_ITEM_ROW = $themeConfig['listing_products_columns']?$themeConfig['listing_products_columns']:3; $MAX_ITEM_ROW_SMALL = $categoryConfig['listing_products_columns_small'] ; $MAX_ITEM_ROW_MINI = $categoryConfig['listing_products_columns_minismall']; $categoryPzoom = $categoryConfig['category_pzoom']; $quickview = $categoryConfig['quickview']; $swapimg = $categoryConfig['show_swap_image']; ?> <?php echo $header; ?>
<?php require( DIR_TEMPLATE.$this->
config->get('config_template')."/template/common/breadcrumb.tpl" ); ?> <?php if( $SPAN[0] ): ?>
<aside class="col-lg-<?php echo $span[0];?> col-md-<?php echo $SPAN[0];?>
 col-sm-12 col-xs-12"> <?php echo $column_left; ?>
</aside><?php endif; ?>
<section class="col-lg-<?php echo $span[1];?> col-md-<?php echo $SPAN[1];?>
 col-sm-12 col-xs-12">
<div id="content">
<?php echo $content_top; ?>
        <h1><?php echo $heading_title; ?>
        </h1>
<?php if ($products) { ?>
<?php require( DIR_TEMPLATE.$this->
        config->get('config_template')."/template/product/product_collection.tpl" ); ?> <?php } ?>
<?php echo $content_bottom; ?>
  <div class="manufacturer-info"><?php echo $description; ?></div>

</div>
<script type="text/javascript">/*<![CDATA[*/function display(a){if(a=="list"){$(".product-grid").attr("class","product-list");$(".products-block  .product-block").each(function(b,c){$(c).parent().addClass("col-fullwidth")});$(".display").html('<span style="float: left;"><?php echo $text_display; ?></span><a class="list active"><em><?php echo $text_list; ?></em></a><a class="grid"  onclick="display(\'grid\');"><em><?php echo $text_grid; ?></em></a>');$.totalStorage("display","list")}else{$(".product-list").attr("class","product-grid");$(".products-block  .product-block").each(function(b,c){$(c).parent().removeClass("col-fullwidth")});$(".display").html('<span style="float: left;"><?php echo $text_display; ?></span><a class="list" onclick="display(\'list\');"></span><em><?php echo $text_list; ?></em></a><a class="grid active"><em><?php echo $text_grid; ?></em></a>');$.totalStorage("display","grid")}}view=$.totalStorage("display");if(view){display(view)}else{display("<?php echo $DISPLAY_MODE;?>")};/*]]>*/</script>
<?php if( $categoryPzoom ) {  ?>
<script type="text/javascript">$(document).ready(function(){$(".colorbox").colorbox({overlayClose:true,opacity:0.5,rel:false,onLoad:function(){$("#cboxNext").remove(0);$("#cboxPrevious").remove(0);$("#cboxCurrent").remove(0)}})});</script>
<?php } ?>
</section><?php if( $SPAN[2] ): ?>
<aside class="col-lg-<?php echo $span[2];?> col-md-<?php echo $SPAN[2];?>
 col-sm-12 col-xs-12"> <?php echo $column_right; ?>
</aside><?php endif; ?>
<?php echo $footer; ?>