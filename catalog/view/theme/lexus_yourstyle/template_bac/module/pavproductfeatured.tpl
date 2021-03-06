<?php
        $cols = 4;
        $span = 12/$cols;
        $active = 'latest';
        $id = rand(1,time()+9);
        $bspan = 12-$block_width;
        $themeConfig = (array)$this->config->get('themecontrol');
        $categoryConfig = array(
                'category_pzoom'                     => 1,
                'quickview'                          => 0,
                'show_swap_image'                    => 0,
        );
        $categoryConfig     = array_merge($categoryConfig, $themeConfig );
        $categoryPzoom      = $categoryConfig['category_pzoom'];
        $quickview          = $categoryConfig['quickview'];
        $swapimg            = $categoryConfig['show_swap_image'];
        $categoryPzoom = isset($themeConfig['category_pzoom']) ? $themeConfig['category_pzoom']:0; 

?>
<div class="box featured highlighted <?php echo $addition_class;?>">
        <div class="box-heading"><span><?php echo $heading_title; ?></span></div>
        <div class="box-content" >
                <div class="box-products slide row-fluid" id="productfeatured<?php echo $id;?>">
                        <div class="featured-banner">
                                <?php if ( $banner ) { ?>
                                <img src="image/<?php echo $banner; ?>">
                                <?php } ?>
                                <?php if( trim($message) ) { ?>
                                <div class="box-description"><?php echo $message;?></div>
                                <?php } ?>
                        </div>
                        <div class="featured-products">
                                                <?php if( count($products) > $itemsperpage ) { ?>
                                                <div class="carousel-controls">
                                                <a class="carousel-control left fa fa-angle-left" href="#productfeatured<?php echo $id;?>"   data-slide="prev"></a>
                                                <a class="carousel-control right fa fa-angle-right" href="#productfeatured<?php echo $id;?>"  data-slide="next"></a>
                                                </div>
                                                <?php } ?>
                                                <div class="carousel-inner ">
                                                 <?php
                                                        $pages = array_chunk( $products, $itemsperpage);
                                                //      echo '<pre>'.print_r( $pages, 1 ); die;
                                                 ?>
                                                  <?php foreach ($pages as  $k => $tproducts ) {   ?>
                                                                <div class="item <?php if($k==0) {?>active<?php } ?>">
                                                                        <?php foreach( $tproducts as $i => $product ) {  $i=$i+1;?>
                                                                                <?php if( $i%$cols == 1 ) { ?>
                                                                                  <div class="row-fluid box-product">
                                                                                <?php } ?>
                                                                                          <div class="col-lg-<?php echo $span;?> col-md-<?php echo $span;?> col-sm-3 col-xs-12">
                                                                                                <div class="product-block">
                                                                                              <?php if ($product['thumb']) { ?>
                                                                                              <div class="image"><?php if( $product['special'] ) {   ?>
                                                                                                <span class="product-label-special-small label">-<?php echo $product['procent']; ?>%</span>
                                                                                                <?php } ?>
                                                                                                <a href="<?php echo $product['href']; ?>"><img class="img" src="<?php echo $product['thumb']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" /></a>

                                                                                                <?php //#2 Start fix quickview in fw?>
                                                                                                        <?php if ($quickview) { ?>
                                                                                                        <div class="product-quickview hidden-xs hidden-sm">
                                                                                                                        <a class="pav-colorbox fa fa-eye" href="<?php echo $this->url->link("themecontrol/product",'product_id='.$product['product_id'] );?>"><span><?php echo $this->language->get('quick_view'); ?></span></a>
                                                                                                                </div>
                                                                                                        <?php } ?>
                                                                                                <?php //#2 End fix quickview in fw?>

                                                                                                <!-- Show Swap -->
                                                                                                        <?php
                                                                                                                if( $swapimg ){
                                                                                                        $product_images = $this->model_catalog_product->getProductImages( $product['product_id'] );
                                                                                                                if(isset($product_images) && !empty($product_images)) {
                                                                                                                        $thumb2 = $this->model_tool_image->resize($product_images[0]['image'],  $this->config->get('config_image_product_width'),  $this->config->get('config_image_product_height') );
                                                                                                                ?>
                                                                                                                <a class="hover-image" href="<?php echo $product['href']; ?>"><img src="<?php echo $thumb2; ?>" alt="<?php echo $product['name']; ?>"></a>
                                                                                                        <?php } } ?>
                                                                                                        <!-- Show Swap -->
                                                                                              </div>
                                                                                              <?php } ?>
                                                                                              <div class="product-meta">
                                                                                                <div class="warp-info">
                                                                                                              <h3 class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h3>
                                                                                                              <div class="description">
                                                                                                              <?php echo utf8_substr( strip_tags($product['description']),0,50);?>...</div>

                                                                                                              <div class="price-cart">
                                                                                                                       <?php if ($product['price']) { ?>
                                                                                                                                 <div class="price">
                                                                                                                                          <?php if (!$product['special']) { ?>
                                                                                                                                          <?php echo $product['price']; ?>
                                                                                                                                          <?php } else { ?>
                                                                                                                                           <span class="price-new-akc"><?php echo $product['special']; ?></span><br /><span class="price-old"><?php echo $product['price']; ?></span>
                                                                                                                                          <?php } ?>
                                                                                                                                        </div>
                                                                                                                                  <?php } ?>

                                                                                                                  </div>
                                                                                                                  <?php if ($product['rating']) { ?>
                                                                                                              <div class="rating"><img src="catalog/view/theme/<?php echo $this->config->get('config_template');?>/image/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" /></div>
                                                                                                              <?php } else { ?>
                                                                                                                <div class="norating"><img src="catalog/view/theme/<?php echo $this->config->get('config_template');?>/image/stars-0.png" alt="star"></div>
                                                                                                              <?php } ?>
                                                                                                              
                                                                                                        </div>



                                                                                                        <div class="product-hover">
                                                                                                        <div class="cart">
                                                                                                          <a onclick="addToCart('<?php echo $product['product_id']; ?>');"><span><?php echo  $button_cart; ?></span></a>
                                                                                                        </div>

                                                                                                        <div class="wishlist">
                                                                                                                <a class="" onclick="addToWishList('<?php echo $product['product_id']; ?>');"  data-placement="top" data-toggle="tooltip" data-original-title="<?php echo $this->language->get("button_wishlist"); ?>">
                                                                                                                        <span><?php echo $this->language->get("button_wishlist"); ?></span>
                                                                                                                </a>
                                                                                                        </div>
                                                                                                        <div class="compare">
                                                                                                                <a class="" onclick="addToCompare('<?php echo $product['product_id']; ?>');"  data-placement="top" data-toggle="tooltip" data-original-title="<?php echo $this->language->get("button_compare"); ?>">
                                                                                                                        <span><?php echo $this->language->get("button_compare"); ?></span>
                                                                                                                </a>
                                                                                                        </div>
                                                                                                        
                                                                                                </div>
                                                                                                        </div>

                                                                                                </div>
                                                                                        </div>

                                                                          <?php if( $i%$cols == 0 || $i==count($tproducts) ) { ?>
                                                                                 </div>
                                                                                <?php } ?>
                                                                        <?php } //endforeach; ?>
                                                                </div>
                                                  <?php } ?>
                                                </div>
                                </div>
                </div>
 </div> </div>


