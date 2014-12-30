<?php require( DIR_TEMPLATE.$this->config->get('config_template')."/template/product/product_filter.tpl" );  ?>    
  
<div class="product-list"> 
<div class="products-block">
    <?php
        $cols = $MAX_ITEM_ROW ;
        $span = floor(12/$cols);
        $small = floor(12/$MAX_ITEM_ROW_SMALL);
        $mini = floor(12/$MAX_ITEM_ROW_MINI);
        foreach ($products as $i => $product) { ?>
        <?php if( $i++%$cols == 0 ) { ?>
                  <div class="row">
        <?php } ?>
    <div class="col-xs-6 col-lg-<?php echo $span;?> col-sm-<?php echo $small;?> col-xs-<?php echo $mini;?>">
        <div class="product-block">
              <?php if ($product['thumb']) { ?>
              <div class="image"><?php if( $product['special'] ) {   ?>
                <span class="product-label-special-small label">-<?php echo $product['procent']; ?>%</span>
                <?php } ?>
                <a class="img" href="<?php echo $product['href']; ?>"><img class="img" src="<?php echo $product['thumb']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" /></a>

                <?php if( $categoryPzoom ) { $zimage = str_replace( "cache/","", preg_replace("#-\d+x\d+#", "",  $product['thumb'] ));  ?>
                <a href="<?php echo $zimage;?>" class="colorbox product-zoom" rel="nofollow" title="<?php echo $product['name']; ?>"><span class="fa fa-search-plus"></span></a>
                <?php } ?>
                
                <?php //#2 Start fix quickview in fw?>
                                <?php if ($quickview) { ?>
                                <div class="product-quickview hidden-xs hidden-sm">
                                                <a class="pav-colorbox fa fa-eye left-position" href="<?php echo $this->url->link("themecontrol/product",'product_id='.$product['product_id'] );?>"><span><?php echo $this->language->get('quick_view'); ?></span></a>
                                        </div>
                                <?php } ?>
                        <?php //#2 End fix quickview in fw?>

                        <?php
                        if( $swapimg ){
                $product_images = $this->model_catalog_product->getProductImages( $product['product_id'] );
                        if(isset($product_images) && !empty($product_images)) {
                                $thumb2 = $this->model_tool_image->resize($product_images[0]['image'],  $this->config->get('config_image_product_width'),  $this->config->get('config_image_product_height') );
                        ?>
                        <span class="hover-image">
                                <a class="img" href="<?php echo $product['href']; ?>"><img src="<?php echo $thumb2; ?>" alt="<?php echo $product['name']; ?>"></a>
                        </span>
                        <?php } } ?>

              </div>
              <?php } ?>
                <div class="product-meta">
              <h3 class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h3>
              <div class="description">
				<?php echo utf8_substr( strip_tags($product['description']),0,100);?>...
			  </div>
			  <div class="options_description">
				<?php foreach($product['options'] as $item){?>
				<div><span class="options_name"><?php echo $item['name'];?>:</span>
				<?php if($item['option_value']){?>
					<?php foreach($item['option_value'] as $option_value){?>
						<span class="option_value"><?php echo $option_value['name'];?></span><span class="option_separator">,</span>
					<?php }?>
				<?php }?> </div>
				<?php }?>
			  </div>

              <?php if ($product['price']) { ?>
              <div class="price">
                <?php if (!$product['special']) { ?>
                <?php echo $product['price']; ?>
                <?php } else { ?>
                 <span class="price-new-akc"><?php echo $product['special']; ?></span><br /><span class="price-old"><?php echo $product['price']; ?></span>
                <?php } ?>
                <?php if ($product['tax']) { ?>
                <br />
                <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
                <?php } ?>
              </div>
              <?php } ?>
              <?php if ($product['rating']) { ?>
              <div class="rating"><img src="catalog/view/theme/<?php echo $this->config->get('config_template');?>/image/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['rating']; ?>"></div>
              <?php } else { ?>
           <div class="norating"><img alt="star" src="catalog/view/theme/<?php echo $this->config->get('config_template');?>/image/stars-0.png"></div>
           <?php } ?>
              <div class="product-hover">
                    <div class="cart">
                        <a onclick="addToCart('<?php echo $product['product_id']; ?>');"><span><?php echo  $button_cart; ?></span></a>
                        </div>
                      <div class="wishlist"><a class="" onclick="addToWishList('<?php echo $product['product_id']; ?>');"  data-placement="top" data-toggle="tooltip" data-original-title="<?php echo $button_wishlist; ?>"><span><?php echo $button_wishlist; ?></span></a></div>
                      <div class="compare"><a class="" onclick="addToCompare('<?php echo $product['product_id']; ?>');"  data-placement="top" data-toggle="tooltip" data-original-title="<?php echo $button_compare; ?>"><span><?php echo $button_compare; ?></span></a></div>
                      
                          
                   </div>
          </div>
            </div>
                </div>
         <?php if( $i%$cols == 0 || $i==count($products) ) { ?>
         </div>
         <?php } ?>

    <?php } ?>
  </div>
  </div>

<div class="pagination"><?php echo $pagination; ?></div>