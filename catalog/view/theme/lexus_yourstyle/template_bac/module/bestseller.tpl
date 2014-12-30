<?php
        $cols = 3;
        $span = 12/$cols;
?>
<div class="box box-product special">
  <div class="box-heading"><span><?php echo $heading_title; ?></span></div>
  <div class="box-content">
    <div class="box-product" >
                          <?php foreach ($products as $i => $product) { ?>
                                 <?php if( $i++%$cols == 0 ) { ?>
                                  <div class="row">
                                <?php } ?>
                          <div class=" col-lg-<?php echo $span;?>"><div class="product-block">

          <?php if ($product['thumb']) { ?>
      <div class="image">
        <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" /></a>

      </div>
      <?php } ?>
          <div class="product-meta">
        <h3 class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h3>

        <?php if ($product['price']) { ?>
        <div class="price">
        <?php if (!$product['special']) { ?>
        <?php echo $product['price']; ?>
        <?php } else { ?>
        <span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
        <?php } ?>
      </div>
        <?php } ?>
         <?php if ($product['rating']) { ?>
      <div class="rating"><img src="catalog/view/theme/<?php echo $this->config->get('config_template');?>/image/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" /></div>
      <?php } else { ?>
           <div class="norating"><img src="catalog/view/theme/<?php echo $this->config->get('config_template');?>/image/stars-0.png" alt="star"></div>
      <?php } ?>
      <div class="product-hover">
        <div class="cart">
          <a onclick="addToCart('<?php echo $product['product_id']; ?>');"><span><?php echo  $button_cart; ?></span></a>
        </div>

        <div class="wishlist"><a class="" onclick="addToWishList('<?php echo $product['product_id']; ?>');" data-placement="top" data-toggle="tooltip" data-original-title="<?php echo $this->language->get("button_wishlist"); ?>"><span><?php echo $button_wishlist; ?></span></a></div>
        <div class="compare"><a class="" onclick="addToCompare('<?php echo $product['product_id']; ?>');" data-placement="top" data-toggle="tooltip" data-original-title="<?php echo $this->language->get("button_compare"); ?>"><span><?php echo $button_compare; ?></span></a></div>
      </div>
    </div>
                          </div></div>

                         <?php if( $i%$cols == 0 || $i==count($products) ) { ?>
                                 </div>
                                <?php } ?>

                          <?php } ?>

    </div>
  </div>
   </div>
