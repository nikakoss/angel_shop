<?php if (isset($products_rel) && $products_rel) { ?> <?php   
   $cols = 3;
   $span = 12/$cols; 
   ?> 
<div class="box product-related">
   <div class="box-heading"><span>Смотрите также</span></div>
   <div id="related" class="slide product-grid" data-interval="0">
      <?php if( count($products_rel) > $cols ) { ?> 
      <div class="carousel-controls"> <a class="carousel-control left fa fa-angle-left" href="#related" data-slide="prev"></a> <a class="carousel-control right fa fa-angle-right" href="#related" data-slide="next"></a> </div>
      <?php } ?> 
      <div class="box-content products-block carousel-inner">
         <?php foreach ($products_rel as $i => $product) { $i=$i+1;?> <?php if( $i%$cols == 1 && $cols > 1 ) { ?> 
         <div class="item <?php if($i==1) {?>active<?php } ?>">
            <div class="row">
               <?php } ?> 
               <div class="col-lg-<?php echo $span;?> col-md-<?php echo $span;?> col-sm-6 col-xs-12">
                  <div class="product-block">
                     <?php if ($product['thumb']) { ?> 
                     <div class="image">
                        <?php if( $product['special'] ) {   ?> <span class="product-label-special label"><?php echo $this->language->get( 'text_sale' ); ?></span> <?php } ?> <a href="<?php echo $product['href']; ?>"><img class="img" src="<?php echo $product['thumb']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" /></a> <?php if( $categoryPzoom ) { $zimage = str_replace( "cache/","", preg_replace("#-\d+x\d+#", "",  $product['thumb'] ));  ?> <a href="<?php echo $zimage;?>" id="colorbox_<?php echo $product['product_id'];?>" class="product-zoom hidden-xs hidden-sm" title="<?php echo $product['name']; ?>"><span class="fa fa-search-plus"></span></a> <script type="text/javascript">/*<![CDATA[*/$(document).ready(function(){var b=<?php echo $product['product_id'];?>;$("#colorbox_"+b).colorbox()});/*]]>*/</script> <?php } ?> <?php
                           if( $swapimg ){
                             $product_images = $this->model_catalog_product->getProductImages( $product['product_id'] );
                           if(isset($product_images) && !empty($product_images)) {
                           $thumb2 = $this->model_tool_image->resize($product_images[0]['image'],  $this->config->get('config_image_product_width'),  $this->config->get('config_image_product_height') );
                           ?> <span class="hover-image"> <a class="img" href="<?php echo $product['href']; ?>"><img src="<?php echo $thumb2; ?>" alt="<?php echo $product['name']; ?>"></a> </span> <?php } } ?> <?php //#2 Start fix quickview in fw?> <?php if ($quickview) { ?> <a class="pav-colorbox left-position" href="<?php echo $this->url->link("themecontrol/product",'product_id='.$product['product_id'] );?>"><em class="fa fa-eye"></em><span><?php echo $this->language->get('quick_view'); ?></span></a> <?php } ?> <?php //#2 End fix quickview in fw?> 
                     </div>
                     <?php } ?> 
                     <div class="product-meta">
                        <h3 class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h3>
                        <?php if ($product['price']) { ?> 
                        <div class="price"> <?php if (!$product['special']) { ?> <?php echo $product['price']; ?> <?php } else { ?> <span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span> <?php } ?> </div>
                        <?php } ?> <?php if ($product['rating']) { ?> 
                        <div class="rating"><img src="catalog/view/theme/<?php echo $this->config->get('config_template');?>/image/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" /></div>
                        <?php } else { ?> 
                        <div class="norating"><img alt="star" src="catalog/view/theme/<?php echo $this->config->get('config_template');?>/image/stars-0.png"></div>
                        <?php } ?> 
                        <div class="product-hover">
                           <div class="cart"> <a onclick="addToCart('<?php echo $product['product_id']; ?>')"><span><?php echo  $button_cart; ?></span></a> </div>
                           <div class="wishlist"><a class="" onclick="addToWishList('<?php echo $product['product_id']; ?>')" data-placement="top" data-toggle="tooltip" data-original-title="<?php echo $button_wishlist; ?>"><span><?php echo $button_wishlist; ?></span></a></div>
                           <div class="compare"><a class="" onclick="addToCompare('<?php echo $product['product_id']; ?>')" data-placement="top" data-toggle="tooltip" data-original-title="<?php echo $button_compare; ?>"><span><?php echo $button_compare; ?></span></a></div>
                        </div>
                     </div>
                  </div>
               </div>
               <?php if( $cols > 1  && ($i%$cols == 0 || $i==count($products_rel)) ) { ?> 
            </div>
         </div>
         <?php } ?> <?php } ?> 
      </div>
   </div>
</div>
<?php } ?>