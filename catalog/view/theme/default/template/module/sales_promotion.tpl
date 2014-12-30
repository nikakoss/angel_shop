<?php if(isset($promotion_title) & $promotion_title!="") { ?>
<div class="box">
  <div class="box-heading"><?php echo $promotion_title; ?> (<?php echo $heading_title; ?>)</div>
  <div class="box-content">
    <div class="box-product">
      <?php foreach ($products as $product) { ?>
      <div>
        <?php if ($product['thumb']) { ?>
        <div class="sales_promotion">
        <div class="image"><a href="<?php echo $product['href']; ?>">
        <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" />
        </a>
        </div>
        </div>
        <?php } ?>
        <div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
        <?php if ($product['price']) { ?>
        <div class="price">
          <?php if (!$product['special']) { ?>
          <?php echo $product['price']; ?>
          <?php } else { ?>
          <span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
          <?php } ?>
        </div>
        <?php } ?>
        
        <?php if($this->config->get('sales_promotion_product_display') == 1) { 
		/* Sales Promotion Extension */
		$this->load->model('checkout/sales_promotion');
		$promotions = $this->model_checkout_sales_promotion->getSalesPromotionProductDetails($product['product_id']);
		$this->language->load('module/sales_promotion');
		$text_sp_detail = $this->language->get('text_sales_promotion_product_detail');
		
		if ($promotions) { ?>
            <div class="price">
			<?php echo $text_sp_detail; ?>
			<?php $i=1; ?>
			<?php foreach ($promotions as $promotion) { ?>
			   <span style="color:red; font-weight:bold;"><?php echo $promotion; ?></span><?php if($i != count($promotions)) { echo ", "; } ?>
			   <?php $i++; ?>
			   <?php } ?>
			</div>
			<?php } ?>
		<?php } ?>	
        
        <?php if ($product['rating']) { ?>
        <div class="rating"><img src="catalog/view/theme/default/image/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" /></div>
        <?php } ?>
        <div class="cart"><a onclick="addToCart('<?php echo $product['product_id']; ?>');" class="button"><span><?php echo $button_cart; ?></span></a></div>
      </div>
      <?php } ?>
    </div>
  </div>
</div>
<?php } ?>