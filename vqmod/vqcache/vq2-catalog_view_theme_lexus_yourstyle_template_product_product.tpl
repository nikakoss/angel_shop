<?php require(DIR_TEMPLATE.$this->config->get('config_template')."/template/common/config.tpl");$themeConfig=(array)$this->config->get('themecontrol');$productConfig=array('product_enablezoom'=>1,'product_zoommode'=>'basic','product_zoomeasing'=>1,'product_zoomlensshape'=>"round",'product_zoomlenssize'=>"150",'product_zoomgallery'=>0,'enable_product_customtab'=>0,'product_customtab_name'=>'','product_customtab_content'=>'','enable_product_customtab1'=>0,'product_customtab_name1'=>'','product_customtab_content1'=>'','enable_product_customtab2'=>0,'product_customtab_name2'=>'','product_customtab_content2'=>'','quickview'=>0,'show_swap_image'=>0,'product_related_column'=>0,'category_pzoom'=>1,);$languageID=$this->config->get('config_language_id');$productConfig=array_merge($productConfig,$themeConfig);$quickview=$productConfig['quickview'];$swapimg=$productConfig['show_swap_image'];$categoryPzoom=$productConfig['category_pzoom'];?> <?php echo $header;?> <?php require(DIR_TEMPLATE.$this->config->get('config_template')."/template/common/breadcrumb.tpl");?> <?php if($SPAN[0]):?> 
<aside class="col-lg-<?php echo $SPAN[0];?> col-md-<?php echo $SPAN[0];?> col-sm-12 col-xs-12"> <?php echo $column_left;?> </aside>
<?php endif;?> 
<section class="col-lg-<?php echo $SPAN[1];?> col-md-<?php echo $SPAN[1];?> col-sm-12 col-xs-12">
<div id="content" itemscope="" itemtype="http://schema.org/Product">
   <?php echo $content_top;?> 
   <div class="product-info">
      <div class="row">
         <?php if($thumb||$images){?> 
         <div class="col-lg-6 col-md-6 image-container">
            <?php if($thumb){?> 
            <div class="image col-lg-9 col-md-9">
               <?php if($special){?> 
               <div class="product-label-special label">-<?php echo $procent;?>%</div>
               <?php }?> 
			   <a href="<?php echo $popup;?>" title="<?php echo $heading_title;?>" class="colorbox"> 
			   
			   <img src="<?php echo $thumb;?>" title="<?php echo $heading_title;?>, <?php echo $text_art;?> <?php echo 10000 + $product_id;?>, <?php echo $text_img;?> 1 -<?php echo $text_add_rel;?>" 
				  alt="<?php echo $heading_title;?>, <?php echo $text_art;?> <?php echo 10000 + $product_id;?>, <?php echo $text_img;?> 1" id="image" data-zoom-image="<?php echo $popup;?>" class="product-image-zoom"></a>
            </div>
            <?php }?> <?php if($images){?> 
            <div class="image-additional slide carousel col-lg-3 col-md-3" id="image-additional">
               <div id="image-additional-carousel" class="carousel-inner">
                  <?php if($productConfig['product_zoomgallery']=='slider'&&$thumb){
				  $eimages=array(0=>array('popup'=>$popup,'thumb'=>$thumb));
				  $images=array_merge($eimages,$images);}$icols=4;$i=0;
				  foreach($images as $image){?> <?php if((++$i)%$icols==1){?>   
                  <div class="item"> <?php }?> 
				  <a href="<?php echo $image['popup'];?>" title="<?php echo $heading_title;?>" class="colorbox" data-zoom-image="<?php echo $image['popup'];?>" data-image="<?php echo $image['popup'];?>"> 
				  <img src="<?php echo $image['thumb'];?>" style="max-width:<?php echo $this->config->get('config_image_additional_width');?>px" 
				  title="<?php echo $heading_title;?>, <?php echo $text_art;?> <?php echo 10000 + $product_id;?>, <?php echo $text_img;?> <?php echo $i;?> - <?php echo $text_add_rel;?>" 
				  alt="<?php echo $heading_title;?>, <?php echo $text_art;?> <?php echo 10000 + $product_id;?>, <?php echo $text_img;?> <?php echo $i;?>" 
				  data-zoom-image="<?php echo $image['popup'];?>" class="product-image-zoom" /> </a> <?php if($i%$icols==0||$i==count($images)){?> </div>
                  <?php }?> <?php }?> 
               </div>
               <div class="carousel-controls"> <a class="carousel-control left fa fa-angle-left" href="#image-additional" data-slide="prev"></a> <a class="carousel-control right fa fa-angle-right" href="#image-additional" data-slide="next"></a> </div>
            </div>
            <script type="text/javascript">
               $('#image-additional .item:first').addClass('active');
               $('#image-additional').carousel({interval:false})
            </script> <?php }?> 
			<div class="col-lg-9 col-md-9 share-block">
			<div class="review">
               <div><img src="catalog/view/theme/<?php echo $this->config->get('config_template');?>/image/stars-<?php echo $rating;?>.png" alt="<?php echo $reviews;?>">&nbsp;&nbsp;<a onclick="$('a[href=\'#tab-review\']').trigger('click');"><?php echo $reviews;?></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$('a[href=\'#tab-review\']').trigger('click');"><?php echo $text_write;?></a></div>
            </div>
			            <div class="share clearfix">
               <div class="addthis_default_style"><a class="addthis_button_compact"><?php echo $text_share;?></a> <a class="addthis_button_email"></a><a class="addthis_button_print"></a> <a class="addthis_button_facebook"></a> <a class="addthis_button_twitter"></a></div>
               <script type="text/javascript" src="//s7.addthis.com/js/250/addthis_widget.js"></script> 
            </div>
			</div>
			
			
         </div>
         <?php }?> 
         <div class="col-lg-6 col-md-6">
            <a itemprop="url" href="<?php echo $seo_url;?>"></a> 
            <h1 itemprop="name"> <?php echo $heading_title;?> </h1>
                 <?php if($price){?> 
           <div class="price" itemprop="offers" itemscope="" itemtype="http://schema.org/Offer">
   <meta itemprop="priceCurrency" content="RUB" />
   <?php echo $text_price;?> 
   <?php if(!$special){?> 
   <span itemprop="price"><?php echo $price;?></span>
   <?php }else{?> 
   <span class="price-old">
   <?php echo $price;?>
   </span> <span class="price-new" itemprop="price">
   <?php echo $special;?></span> <?php }?> 
   <br> <?php if($tax){?> <?php }?> <?php if($points){?> 
   <span class="reward"><small><?php echo $text_points;?> <?php echo $points;?></small></span><br /> <?php }?> <?php if($discounts){?> 
   <div class="discount"> <?php foreach($discounts as $discount){?> <?php echo sprintf($text_discount,$discount['quantity'],$discount['price']);?><br /> <?php }?> </div>
   <?php }?> 
</div>
            <?php }?> 
                        <div class="product-extra">
               <div class="quantity-adder"> <?php echo $text_qty;?> <input class="form-control" type="text" name="quantity" size="2" value="<?php echo $minimum;?>" /> <span class="add-up add-action">+</span> <span class="add-down add-action">-</span> </div>
               <div class="product-action"> <input type="hidden" name="product_id" value="<?php echo $product_id;?>" /> &nbsp; <span class="cart"> <span class=" fa fa-shopping-cart"></span> <input type="button" value="<?php echo $button_cart;?>" id="button-cart" class="button" /> </span> <span class="wishlist"> <a class="fa fa-heart-o btn-theme-primary" onclick="addToWishList('<?php echo $product_id;?>');" data-placement="top" data-toggle="tooltip" data-original-title="<?php echo $button_wishlist;?>"> <span><?php echo $button_wishlist;?></span> </a> </span> <span class="compare"> <a class="fa fa-files-o btn-theme-primary" onclick="addToCompare('<?php echo $product_id;?>');" data-placement="top" data-toggle="tooltip" data-original-title="<?php echo $button_compare;?>"> <span><?php echo $button_compare;?></span> </a> </span> </div>
            </div>
                    <?php if($review_status){?> 
            
            <?php }?> 

            <div class="description"> 
			<?php if($manufacturer){?> 
			<div>
			<span class="options_name"><?php echo $text_manufacturer;?></span> 
			<span class="option_value"><a href="<?php echo $manufacturers;?>"><?php echo $manufacturer;?></a> </span></div> <?php }?> 
			<div><span class="options_name"><?php echo $text_model;?></span> <span class="option_value">Италия</span></div><?php if($reward){?> <div><span class="options_name"><?php echo $text_reward;?></span><span class="option_value"> <?php echo $reward;?><span /></div> <?php }?> <div><span class="options_name"><?php echo $text_articul;?></span> <span class="option_value"> <?php echo 10000 + $product_id;?> </span></div>
			
			<?php foreach($attribute_groups as $attribute_group){?>           
               <?php foreach($attribute_group['attribute'] as $attribute){?>         
				<div>
                  <span class="options_name"><?php echo $attribute['name'];?>:</span>
                  <span class="option_value"><?php echo $attribute['text'];?></span>  
					</div>
               <?php }?> 
               <?php }?> 
			
			<?php foreach($options_plus as $item){?>
			<div>
			   <span class="options_name"><?php echo $item['name'];?>:</span>				
				<?php if($item['option_value']){?>
					<?php foreach($item['option_value'] as $option_value){?>
						<span class="option_value"><?php echo $option_value['name'];?></span><span class="option_separator">,</span>
					<?php }?>
				<?php }?>	
					</div>
				<?php }?>
			
			</div>
            <?php if($minimum>1){?> 
            <div class="minimum"><?php echo $text_minimum;?></div>
            <?php }?> <?php if($options){?> 
            <div class="options">
               <h2 class="inline_block"><?php echo $text_option;?></h2>

				<?php
					$this->load->model('module/related_options');
					if (	$this->model_module_related_options->installed() ) {
						$ro_settings = $this->config->get('related_options');
						if (isset($ro_settings['show_clear_options']) && $ro_settings['show_clear_options']) {
							if ((int)$ro_settings['show_clear_options'] == 1) {
				?>
				
				<script type="text/javascript">
				$(document).ready(function(){
					if ($('div.options').find("h2").length) {
						$('div.options').find("h2").after('<a onclick="clear_options();"><?php echo $text_ro_clear_options; ?></a><br>');
					} else {
						$('div.options').find("h3").after('<a onclick="clear_options();"><?php echo $text_ro_clear_options; ?></a><br>');
					}
				});
				</script>	
				<?php
				
							} else {
				
				?>
				<script type="text/javascript">
				$(document).ready(function(){
					$('div.options').append('<a onclick="clear_options();"> <br><?php echo $text_ro_clear_options; ?></a><br>');
				});
				</script>	
				<?php
							}
						}
					}
				?>
			
			
			   <a href="http://angel-moda.com/razmernye-ryady"><?php echo $text_size;?></a>
               <?php foreach($options as $option){?> <?php if($option['type']=='select'){?> 
               <div id="option-<?php echo $option['product_option_id'];?>" class="option">
                  <?php if($option['required']){?> <span class="required">*</span> <?php }?> <label><?php echo $option['name'];?>:</label> 
                  <select class="form-control" name="option[<?php echo $option['product_option_id'];?>]">
                     <option value=""><?php echo $text_select;?></option>
                     <?php foreach($option['option_value'] as $option_value){?> 
                     <option value="<?php echo $option_value['product_option_value_id'];?>"><?php echo $option_value['name'];?> <?php if($option_value['price']){?> (<?php echo $option_value['price_prefix'];?><?php echo $option_value['price'];?>) <?php }?> </option>
                     <?php }?> 
                  </select>
               </div>
               <?php }?> <?php if($option['type']=='radio'){?> 
               <div id="option-<?php echo $option['product_option_id'];?>" class="option">
                  <?php if($option['required']){?> <span class="required">*</span> <?php }?> <label><?php echo $option['name'];?>:</label> <?php foreach($option['option_value'] as $option_value){?> 
                  <div class="radio"><input type="radio" name="option[<?php echo $option['product_option_id'];?>]" value="<?php echo $option_value['product_option_value_id'];?>" id="option-value-<?php echo $option_value['product_option_value_id'];?>" /> <label for="option-value-<?php echo $option_value['product_option_value_id'];?>"><?php echo $option_value['name'];?> <?php if($option_value['price']){?> (<?php echo $option_value['price_prefix'];?><?php echo $option_value['price'];?>) <?php }?> </label> </div>
                  <?php }?> 
               </div>
               <?php }?> <?php if($option['type']=='checkbox'){?> 
               <div id="option-<?php echo $option['product_option_id'];?>" class="option">
                  <?php if($option['required']){?> <span class="required">*</span> <?php }?> <label><?php echo $option['name'];?>:</label> <?php foreach($option['option_value'] as $option_value){?> 
                  <div class="checkbox"><input type="checkbox" name="option[<?php echo $option['product_option_id'];?>][]" value="<?php echo $option_value['product_option_value_id'];?>" id="option-value-<?php echo $option_value['product_option_value_id'];?>" /> <label for="option-value-<?php echo $option_value['product_option_value_id'];?>"><?php echo $option_value['name'];?> <?php if($option_value['price']){?> (<?php echo $option_value['price_prefix'];?><?php echo $option_value['price'];?>) <?php }?> </label> </div>
                  <?php }?> 
               </div>
               <?php }?> <?php if($option['type']=='image'){?> 
               <div id="option-<?php echo $option['product_option_id'];?>" class="option">
                  <?php if($option['required']){?> <span class="required">*</span> <?php }?> <label><?php echo $option['name'];?>:</label> 
                  <table class="option-image">
                     <?php foreach($option['option_value'] as $option_value){?> 
                     <tr>
                        <td style="width: 1px;"><input type="radio" name="option[<?php echo $option['product_option_id'];?>]" value="<?php echo $option_value['product_option_value_id'];?>" id="option-value-<?php echo $option_value['product_option_value_id'];?>" /></td>
                        <td><label for="option-value-<?php echo $option_value['product_option_value_id'];?>"><img src="<?php echo $option_value['image'];?>" alt="<?php echo $option_value['name'].($option_value['price']?' '.$option_value['price_prefix'].$option_value['price']:'');?>" /></label></td>
                        <td><label for="option-value-<?php echo $option_value['product_option_value_id'];?>"><?php echo $option_value['name'];?> <?php if($option_value['price']){?> (<?php echo $option_value['price_prefix'];?><?php echo $option_value['price'];?>) <?php }?> </label></td>
                     </tr>
                     <?php }?> 
                  </table>
               </div>
               <?php }?> <?php if($option['type']=='text'){?> 
               <div id="option-<?php echo $option['product_option_id'];?>" class="option"> <?php if($option['required']){?> <span class="required">*</span> <?php }?> <label><?php echo $option['name'];?>:</label> <input class="form-control" type="text" name="option[<?php echo $option['product_option_id'];?>]" value="<?php echo $option['option_value'];?>" /> </div>
               <?php }?> <?php if($option['type']=='textarea'){?> 
               <div id="option-<?php echo $option['product_option_id'];?>" class="option"> <?php if($option['required']){?> <span class="required">*</span> <?php }?> <label><?php echo $option['name'];?>:</label> <textarea class="form-control" name="option[<?php echo $option['product_option_id'];?>]" cols="40" rows="5"><?php echo $option['option_value'];?></textarea> </div>
               <?php }?> <?php if($option['type']=='file'){?> 
               <div id="option-<?php echo $option['product_option_id'];?>" class="option"> <?php if($option['required']){?> <span class="required">*</span> <?php }?> <label><?php echo $option['name'];?>:</label> <input class="btn btn-theme-primary button" type="button" value="<?php echo $button_upload;?>" id="button-option-<?php echo $option['product_option_id'];?>"> <input type="hidden" name="option[<?php echo $option['product_option_id'];?>]" value="" /> </div>
               <?php }?> <?php if($option['type']=='date'){?> 
               <div id="option-<?php echo $option['product_option_id'];?>" class="option"> <?php if($option['required']){?> <span class="required">*</span> <?php }?> <label><?php echo $option['name'];?>:</label> <input class="form-control date" type="text" name="option[<?php echo $option['product_option_id'];?>]" value="<?php echo $option['option_value'];?>"/> </div>
               <?php }?> <?php if($option['type']=='datetime'){?> 
               <div id="option-<?php echo $option['product_option_id'];?>" class="option"> <?php if($option['required']){?> <span class="required">*</span> <?php }?> <label><?php echo $option['name'];?>:</label> <input class="form-control datetime" type="text" name="option[<?php echo $option['product_option_id'];?>]" value="<?php echo $option['option_value'];?>"/> </div>
               <?php }?> <?php if($option['type']=='time'){?> 
               <div id="option-<?php echo $option['product_option_id'];?>" class="option"> <?php if($option['required']){?> <span class="required">*</span> <?php }?> <label><?php echo $option['name'];?>:</label> <input class="form-control time" type="text" name="option[<?php echo $option['product_option_id'];?>]" value="<?php echo $option['option_value'];?>"/> </div>
               <?php }?> <?php }?> 
            </div>
            <?php }?> <?php if($tags){?> 
            <div class="tags"><b><?php echo $text_tags;?></b> <?php for($i=0;$i<count($tags);$i++){?> <?php if($i<(count($tags)- 1)){?> <a href="<?php echo $tags[$i]['href'];?>"><?php echo $tags[$i]['tag'];?></a>, <?php }else{?> <a href="<?php echo $tags[$i]['href'];?>"><?php echo $tags[$i]['tag'];?></a> <?php }?> <?php }?> </div>
            <?php }?> 
         </div>
      </div>
   </div>
   <div class="tabs-group">
      <div id="tabs" class="htabs clearfix"><a href="#tab-description"><?php echo $tab_description;?></a> <?php if($attribute_groups){?> <a href="#tab-attribute"><?php echo $tab_attribute;?></a> <?php }?> <?php if($review_status){?> <a href="#tab-review"><?php echo $tab_review;?></a> <?php }?> 
	  <?php if($productConfig['enable_product_customtab']&&isset($productConfig['product_customtab_name'][$languageID])){?> <a href="#tab-customtab"><?php echo $productConfig['product_customtab_name'][$languageID];?></a> <?php }?> 
	  <?php if($productConfig['enable_product_customtab1']&&isset($productConfig['product_customtab_name1'][$languageID])){?> <a href="#tab-customtab1"><?php echo $productConfig['product_customtab_name1'][$languageID];?></a> <?php }?> 
	  <?php if($productConfig['enable_product_customtab2']&&isset($productConfig['product_customtab_name2'][$languageID])){?> <a href="#tab-customtab2"><?php echo $productConfig['product_customtab_name2'][$languageID];?></a> <?php }?> 
	  </div>
      <div id="tab-description" class="tab-content" itemprop="description">
	  <?php if($description){?>
	  <?php echo $description;?>
	  <?php }else{?>
	  <?php echo $heading_title;?>
	  <?}?>
	  </div>
      <?php if($attribute_groups){?> 
      <div id="tab-attribute" class="tab-content">
         <table class="attribute">
            <?php foreach($attribute_groups as $attribute_group){?> 
            <thead>
               <tr>
                  <td colspan="2"></td>
               </tr>
            </thead>
            <tbody>
<?php if($manufacturer){?> 
<tr>
   <td><span class="options_name"><?php echo $text_manufacturer;?></span> </td>
    <td><span class="option_value"><a href="<?php echo $manufacturers;?>"><?php echo $manufacturer;?></a> </span> </td>
</tr>
<?php }?> 
<tr>
 <td><span class="options_name"><?php echo $text_model;?></span>  </td>
 <td><span class="option_value">Италия</span> </td>
</tr>
<?php if($reward){?> 
<tr>
 <td><span class="options_name"><?php echo $text_reward;?></span> </td>
 <td><span class="option_value"> <?php echo $reward;?><span /> </td>
</tr>
<?php }?> 
<tr>
 <td><span class="options_name"><?php echo $text_articul;?></span>  </td>
 <td><span class="option_value"> <?php echo 10000 + $product_id;?> </span> </td>
</tr>			
               <?php foreach($attribute_group['attribute'] as $attribute){?> 
               <tr>
                  <td><?php echo $attribute['name'];?></td>
                  <td><?php echo $attribute['text'];?></td>
               </tr>
               <?php }?> 
			   
			   <?php foreach($options_plus as $item){?>
			   <tr>
				<td><span class="options_name"><?php echo $item['name'];?>:</span></td>
				<td class="options_description">
				<?php if($item['option_value']){?>
					<?php foreach($item['option_value'] as $option_value){?>
						<span class="option_value"><?php echo $option_value['name'];?></span><span class="option_separator">,</span>
					<?php }?>
				<?php }?>
				</td>
				</tr>
				<?php }?>
            </tbody>
            <?php }?> 
         </table>
      </div>
      <?php }?> <?php if($review_status){?> 
      <div id="tab-review" class="tab-content">
         <div id="review"></div>
         <h2 id="review-title"><?php echo $text_write;?></h2>
         <div class="form-review">
            <div class="option"><label><?php echo $entry_name;?></label> <input class="form-control" type="text" name="name" value="" /> </div>
            <div class="option"> <label><?php echo $entry_review;?></label> <textarea class="form-control" name="text" cols="40" rows="8"></textarea> <span style="font-size: 11px;"><?php echo $text_note;?></span><br /> </div>
            <div class="option"> <label><?php echo $entry_rating;?></label> <span><?php echo $entry_bad;?></span>&nbsp; <input type="radio" name="rating" value="1" /> &nbsp; <input type="radio" name="rating" value="2" /> &nbsp; <input type="radio" name="rating" value="3" /> &nbsp; <input type="radio" name="rating" value="4" /> &nbsp; <input type="radio" name="rating" value="5" /> &nbsp;<span><?php echo $entry_good;?></span><br /> </div>
            <div class=" option form-inline"> <label><?php echo $entry_captcha;?></label> <span class="form-group"><img src="index.php?route=product/product/captcha" alt="" id="captcha" /></span> <span class="form-group"><input class="form-control" type="text" name="captcha" value="" /></span> </div>
            <div><a id="button-review" class="button"><?php echo $button_continue;?></a></div>
         </div>
      </div>
      <?php }?> 
	  <?php if($productConfig['enable_product_customtab']&&isset($productConfig['product_customtab_content'][$languageID])){?> 
      <div id="tab-customtab" class="tab-content custom-tab">
         <div class="inner"> <?php echo html_entity_decode($productConfig['product_customtab_content'][$languageID],ENT_QUOTES,'UTF-8');?> </div>
      </div>
      <?php }?>
		<?php if($productConfig['enable_product_customtab1']&&isset($productConfig['product_customtab_content1'][$languageID])){?> 
      <div id="tab-customtab1" class="tab-content custom-tab">
         <div class="inner"> <?php echo html_entity_decode($productConfig['product_customtab_content1'][$languageID],ENT_QUOTES,'UTF-8');?> </div>
      </div>
      <?php }?>
		<?php if($productConfig['enable_product_customtab2']&&isset($productConfig['product_customtab_content2'][$languageID])){?> 
      <div id="tab-customtab2" class="tab-content custom-tab">
         <div class="inner"> <?php echo html_entity_decode($productConfig['product_customtab_content2'][$languageID],ENT_QUOTES,'UTF-8');?> </div>
      </div>
      <?php }?>
		
   </div>
   
   <?php require(DIR_TEMPLATE.$this->config->get('config_template')."/template/product/product_other.tpl");?> 
   <?php require(DIR_TEMPLATE.$this->config->get('config_template')."/template/product/product_related.tpl");?>
   <?php echo $content_bottom;?>


			<script type="text/javascript">
				function clear_options() {
					options = $("input[type=radio][name^=option]:checked");
					for (i=0;i<options.length;i++) {
						options[i].checked = false;
					}
					options = $("select[name^=option]");
					for (i=0;i<options.length;i++) {
						options[i].value = '';
					}
					options = $("textarea[name^=option]");
					for (i=0;i<options.length;i++) {
						options[i].value = '';
					}
					options = $("input[type=text][name^=option]");
					for (i=0;i<options.length;i++) {
						options[i].value = '';
					}
					options = $("input[type=checkbox][name^=option]:checked");
					for (i=0;i<options.length;i++) {
						options[i].checked = false;
					}
					options = $("input[type=hidden][name^=option]");
					for (i=0;i<options.length;i++) {
						options[i].value = '';
					}
					
					options_values_access();
					set_block_options();
					set_journal2_options();
				}
			</script>
			
			<?php 
			$this->load->model('module/related_options');
			if (	$this->model_module_related_options->installed() ) {
			
				if (isset($ro_array)) {
					
					?>
					<script type="text/javascript">
					
					var hide_inaccessible = <?php if (isset($ro_settings['hide_inaccessible']) && $ro_settings['hide_inaccessible']) echo "true"; else echo "false"; ?>;
					var options_types = [];
					var variant_product_options = [];
					var ro_step_by_step = <?php if (isset($ro_settings['step_by_step']) && $ro_settings['step_by_step']) echo "true"; else echo "false"; ?>;
					var use_block_options = ($('a[id^=block-option]').length || $('a[id^=block-image-option]').length);
					var use_journal2 = ($('div[id^=option-]').find('li[data-value]').length);
					
					<?php
					
					if (isset($options) && is_array($options)) {
						foreach ($options as $option) {
							echo "options_types[".$option['product_option_id']."]='".$option['type']."';\n";
						}
					}
					if (isset($variant_product_options) && is_array($variant_product_options)) {
						foreach ($variant_product_options as $product_option_id) {
							echo "variant_product_options.push(".$product_option_id.");\n";
						}
					}
					
					if (isset($_GET['filter_name'])) {
						echo "var filter_name=\"".$_GET['filter_name']."\";";
					} elseif (isset($_GET['search'])) {
						echo "var filter_name=\"".$_GET['search']."\";";
					} else {
						echo "var filter_name = false;";
					}
					
					if ( count($ro_array) == 0) {
					
						echo "var ro_array = false;";
					
					} else {
					
						echo "var ro_array = {};";
					
						foreach ($ro_array as $relatedoptions_id => $relatedoptions_options) {
							echo "ro_array[".$relatedoptions_id."] = {};\n";
							foreach ($relatedoptions_options as $product_option_id => $product_option_value_id ) {
								echo "ro_array[".$relatedoptions_id."][".$product_option_id."] = ".$product_option_value_id.";\n";
							}
						}
					}
					
					if ((isset($ro_settings['spec_price']) && $ro_settings['spec_price']) || (isset($ro_settings['spec_model']) && $ro_settings['spec_model'])) {
						echo "ro_prices = {};\n";
					} else {
						echo "ro_prices = false;\n";	
					}
					
					
					
					if (isset($ro_settings['spec_price']) && $ro_settings['spec_price'] && isset($ro_prices) && is_array($ro_prices)) {
						
						foreach ($ro_prices as $relatedoptions_id => $ro_price) {
							echo "ro_prices[".$relatedoptions_id."] = {};\n";
							echo "ro_prices[".$relatedoptions_id."]['price'] = ".$ro_price['price'].";\n";
							if (isset($ro_price['discounts']) && is_array($ro_price['discounts']) ) {
								echo "ro_prices[".$relatedoptions_id."]['discounts'] = [];\n";
								foreach ($ro_price['discounts'] as $ro_discount)	{
									echo "ro_prices[".$relatedoptions_id."]['discounts'].push({quantity: ".$ro_discount['quantity'].", price: ".$ro_discount['price']."});\n";
								}
							} else {
								echo "ro_prices[".$relatedoptions_id."]['discounts'] = false;\n";
							}
						}
					
					}
					
					if (isset($ro_settings['spec_model']) && $ro_settings['spec_model'] && isset($ro_prices) && is_array($ro_prices)) {
						foreach ($ro_prices as $relatedoptions_id => $ro_price) {
							if (!isset($ro_settings['spec_price']) || !$ro_settings['spec_price']) {
							// Не было цен, инициализируем объект
								echo "ro_prices[".$relatedoptions_id."] = {};\n";
							}
							echo "ro_prices[".$relatedoptions_id."]['model'] = \"".$ro_price['model']."\";\n";
						}
					}
					
					if (isset($ro_default)) {
						if ($ro_default === FALSE) {
							echo "var ro_default = false;\n";
						} else {
							echo "var ro_default = ".(int)$ro_default.";\n";
						}
					}
					
					?>
					
					var all_select_ov = {};
					$("select[name^=option\\[]").each( function (si, sel_elem) {
						all_select_ov[sel_elem.name] = [];
						
						$.each(sel_elem.options, function (oi, op_elem) {
							all_select_ov[sel_elem.name].push(op_elem.value);
						});
						
					} );
					
						
					
					
					(function ($) {
						$.fn.toggleOption = function (value, show) {
							/// <summary>Show or hide the desired option</summary>
							return this.filter('select').each(function () {
								var select = $(this);
								if (typeof show === 'undefined') {
									show = select.find('option[value="' + value + '"]').length == 0;
								}
								if (show) {
									select.showOption(value);
								}
								else {
									select.hideOption(value);
								}
							});
						};
						$.fn.showOption = function (value) {
							/// <summary>Show the desired option in the location it was in when hideOption was first used</summary>
							return this.filter('select').each(function () {
								var select = $(this);
								var found = select.find('option[value="' + value + '"]').length != 0;
								if (found) return; // already there
					
								var info = select.data('opt' + value);
								if (!info) return; // abort... hideOption has not been used yet
					
								var targetIndex = info.data('i');
								var options = select.find('option');
								var lastIndex = options.length - 1;
								if (lastIndex == -1) {
									select.prepend(info);
								}
								else {
									options.each(function (i, e) {
										var opt = $(e);
										if (opt.data('i') > targetIndex) {
											opt.before(info);
											return false;
										}
										else if (i == lastIndex) {
											opt.after(info);
											return false;
										}
									});
								}
								return;
							});
						};
						$.fn.hideOption = function (value) {
							/// <summary>Hide the desired option, but remember where it was to be able to put it back where it was</summary>
							return this.filter('select').each(function () {
								var select = $(this);
								var opt = select.find('option[value="' + value + '"]').eq(0);
								if (!opt.length) return;
					
								if (!select.data('optionsModified')) {
									// remember the order
									select.find('option').each(function (i, e) {
										$(e).data('i', i);
									});
									select.data('optionsModified', true);
								}
					
								select.data('opt' + value, opt.detach());
								return;
							});
						};
					})(jQuery);					
					
					function get_main_price(main_price) {
					
						if (ro_prices) {
							ro_id = get_current_ro_id(get_options_values([]));
							if (ro_id != -1 && (ro_id in ro_prices)) {
								if (ro_prices[ro_id]['price'] != 0) {
									return ro_prices[ro_id]['price'];
								}
							}
						}
						return main_price;
					}
					
					function stock_control(add_to_cart) {
					
						<?php  if (!isset($ro_settings['stock_control']) || !$ro_settings['stock_control']) { ?>
						if (add_to_cart) {
							$('#button-cart').attr('allow_add_to_cart','allow_add_to_cart');
							$('#button-cart').click();
						}
						return;
						<?php } ?>
					
						var erros_msg = '<?php echo $entry_stock_control_error; ?>';
						
						var options_values = get_options_values([]);
						var roid = get_current_ro_id(options_values);
						
						$('.success, .warning').remove();
						
						if (roid!=-1) {
						
							$.ajax({
									url: '<?php echo HTTP_SERVER; ?>index.php?route=module/related_options/get_to_free_quantity&roid='+roid,
									dataType : "text",                     // тип загружаемых данных
									success: function (data) { // вешаем свой обработчик на функцию success
										
										if (parseInt(data) < parseInt( $('input[type=text][name=quantity]').val() )) {
											$('.success, .warning').remove();
											$('div.product-info').find('div[class=cart]').after('<div class="warning">'+erros_msg.replace('%s',parseInt(data))+'</div>');
											
										} else {
																					
											if (add_to_cart) {
												$('#button-cart').attr('allow_add_to_cart','allow_add_to_cart');
												$('#button-cart').click();
											}
										}
									} 
							});
						} else { // не определили связанную опцию - пусть срабатывает стандартный алгоритм	
							if (add_to_cart) {
								$('#button-cart').attr('allow_add_to_cart','allow_add_to_cart');
								$('#button-cart').click();
							}
						
						}
						
					}
					
					function get_current_ro_id(options_values) {
						var all_ok;
						for(var ro_key in ro_array) {
							all_ok = true;
							for(var ov_key in ro_array[ro_key]) {
								if (!(ov_key in options_values && options_values[ov_key]==ro_array[ro_key][ov_key])) {
									all_ok = false;
								}
							}
							if (all_ok) return ro_key; 
						}
						return -1;
					}
					
					
					function option_values_access(options_values, option_id) {
						
						
						accessible_values = [];
						
						for(var ro_key in ro_array) {
							
							all_ok = true;
							for(var ov_key in options_values) {
								if (ov_key != option_id) {
									if (options_values[ov_key]) {
										if (ro_array[ro_key][ov_key] != options_values[ov_key]) {
											all_ok = false;
										}
									}
								}
							}
							
							if (all_ok &&  ($.inArray(ro_array[ro_key][option_id], accessible_values) == -1 )) accessible_values.push(ro_array[ro_key][option_id]);
							
						}
						
						set_accessible_values(option_id, accessible_values);
						
					}
					
					function set_accessible_values(option_id, accessible_values) {
					
						var current_value = ($('input[type=radio][name=option\\['+option_id+'\\]]:checked').val() || $('select[name=option\\['+option_id+'\\]]').val());
					
						if ($("select[name=option\\["+option_id+"\\]]").length) {
						//if (options_types[option_id] == 'select' || (use_block_options && options_types[option_id] == 'radio')) {
						
							if (current_value && $.inArray(parseInt(current_value), accessible_values)==-1) {
								$("select[name=option\\["+option_id+"\\]]").val("");
							}
							
							if (hide_inaccessible) {
							
								select_options = all_select_ov["option["+option_id+"]"];
								for (var i=0;i<select_options.length;i++) {
									if (select_options[i]) {
										option_value_disabled = ($.inArray(parseInt(select_options[i]),accessible_values) == -1);
										// hiding options for IE
										$("select[name=option\\["+option_id+"\\]]").toggleOption(parseInt(select_options[i]), !option_value_disabled);
										//$("select[name=option\\["+option_id+"\\]]").find('option[value='+parseInt(select_options[i])+']').toggle(!option_value_disabled);
										
									}
								}
								
							} else {
							
								select_options = $("select[name=option\\["+option_id+"\\]]")[0].options;
								for (var i=0;i<select_options.length;i++) {
									if (select_options[i].value) {
										option_value_disabled = ($.inArray(parseInt(select_options[i].value),accessible_values) == -1);
										select_options[i].disabled = option_value_disabled;
									}
								}
								
							}
							
						} else if ($("input[type=radio][name=option\\["+option_id+"\\]]").length) {	
						//} else if (options_types[option_id] == 'radio' || options_types[option_id] == 'image') {	
							
							if (current_value && $.inArray(parseInt(current_value), accessible_values)==-1) {
								$("input[type=radio][name=option\\["+option_id+"\\]]:checked")[0].checked=false;
							}
							
							radio_options = $("input[type=radio][name=option\\["+option_id+"\\]]");
							for (var i=0;i<radio_options.length;i++) {
								option_value_disabled = ($.inArray(parseInt(radio_options[i].value),accessible_values) == -1);
								if (hide_inaccessible) {
									$("#option-value-"+radio_options[i].value+"").toggle(!option_value_disabled);
									
									//radio_options[i].hidden = option_value_disabled;
									$("label[for=option-value-"+radio_options[i].value+"]").toggle(!option_value_disabled);
									
									var radio_next_br = $("label[for=option-value-"+radio_options[i].value+"]").next();
									if (radio_next_br.length && radio_next_br[0].tagName == "BR") {
										$(radio_next_br[0]).toggle(!option_value_disabled);
									}
									
								} else {
									radio_options[i].disabled = option_value_disabled;
								}
							}
							
							
							
						}
					
					}
					
					function get_options_values(options_keys) {
						var options_values = {};
						
						for (var i=0;i<$("select[name^=option]").length;i++) {
						
							option_id = parseInt( $("select[name^=option]")[i].name.substr(7,$("select[name^=option]")[i].name.length-8) );
							if ($.inArray(option_id,variant_product_options) != -1) {
								options_values[option_id] = $("select[name^=option]")[i].value;
								options_keys.push(option_id);
							}
						}
						
						// сначала все радио
						for (var i=0;i<$("input[type=radio][name^=option]").length;i++) {
						
							option_id = parseInt( $("input[type=radio][name^=option]")[i].name.substr(7,$("input[type=radio][name^=option]")[i].name.length-8) );
							if ($.inArray(option_id,variant_product_options) != -1) {
								options_values[option_id] = 0;
								if ($.inArray(option_id,options_keys) == -1) {
									options_keys.push(option_id);
								}
							}
						}
						
						// затем только выбранные
						for (var i=0;i<$("input[type=radio][name^=option]:checked").length;i++) {
							option_id = parseInt( $("input[type=radio][name^=option]:checked")[i].name.substr(7,$("input[type=radio][name^=option]:checked")[i].name.length-8) );
							if ($.inArray(option_id,variant_product_options) != -1) {
								options_values[option_id] = $("input[type=radio][name^=option]:checked")[i].value;
							}
						}
						
						return options_values;
					}
					
					// автовыбор корректных начальных значений опций, если уже выбраны какие-то значения
					function use_first_values(set_anyway) {
						
						var options_values = get_options_values([]);
						
						var has_selected = false;
						for (var optkey in options_values) {
							if (options_values[optkey]) {
								has_selected = true;
								break;
							}
						}
						
						if ((has_selected || set_anyway) && ro_array && Object.keys(ro_array).length > 0) {
							ro_key = Object.keys(ro_array)[0];
							setSelectedRO(ro_key);
						}
						
					}
					
					function setSelectedRO(ro_key) {
					
						if (ro_array && ro_array[ro_key]) {
							
							var last_opt_id = "";
							for (var opt_id in ro_array[ro_key]) {
								
								if ($('select[name=option\\['+opt_id+'\\]]').length > 0) {
									$('[name=option\\['+opt_id+'\\]]').val(ro_array[ro_key][opt_id]);
								} else if ($('input[type=radio][name=option\\['+opt_id+'\\]]').length > 0) {
									$('input[type=radio][name=option\\['+opt_id+'\\]][value='+ro_array[ro_key][opt_id]+']').prop('checked', true);
								}
								
								last_opt_id = opt_id;
							
							}
							
							if (last_opt_id != "") {
								if ($('select[name=option\\['+last_opt_id+'\\]]').length > 0) {
									$('[name=option\\['+last_opt_id+'\\]]').change();
								} else if ($('input[type=radio][name=option\\['+last_opt_id+'\\]]').length > 0) {
									$('input[type=radio][name=option\\['+last_opt_id+'\\]][value='+ro_array[ro_key][last_opt_id]+']').change();
								}
							}
							
						}
						set_block_options();
						set_journal2_options();
					}
					
					
					// для пошагового варианта
					function get_options_steps() {
						var options_steps = [];
						var product_option_id = "";
						
						for (var i=0;i<$('[name^=option\\[]').length;i++) {
						
							product_option_id = $('[name^=option\\[]')[i].name.substr(7, $('[name^=option\\[]')[i].name.length-8);
							if (!isNaN(product_option_id)) product_option_id = parseInt(product_option_id);
							if ($.inArray(product_option_id, variant_product_options) != -1) {
								if ($.inArray(product_option_id, options_steps) == -1) {
									options_steps.push(product_option_id);
								}
							}
						}
						
						return options_steps;
					}
					
					function options_values_access() {
						
						if (!ro_array) return;
						
						if (ro_step_by_step) {
						
							var options_steps = get_options_steps();
							var prev_options_values = {};
							var prev_options = [];
							
							for (var i=0;i<options_steps.length;i++) {
								if (i>0) {
									if (prev_options[i-1]) {
										// ограничения по предыдущим
										option_values_access(prev_options_values, options_steps[i]);
										
									} else {
										// откл все
										set_accessible_values(options_steps[i], []);
									}
								}
								prev_options.push( ($('input[type=radio][name=option\\['+options_steps[i]+'\\]]:checked').val() || $('select[name=option\\['+options_steps[i]+'\\]]').val()) );
								prev_options_values[options_steps[i]] = prev_options[prev_options.length-1];
							}
						
						} else {
						
							var options_keys = [];
							var options_values = get_options_values(options_keys);
							for (var i=0;i<options_keys.length;i++) {
								option_values_access(options_values, options_keys[i]);
							}
							
						}
						
						stock_control(0);
						
						<?php
						if (isset($ro_settings['spec_model']) && $ro_settings['spec_model']) {
						?>
						set_model();
						<?php
						}
						?>
						
						check_block_options();
						
					}
					
					function set_model() {
						
						var options_values = get_options_values([]);
						var roid = get_current_ro_id(options_values);
						
						if (roid!=-1 && ro_prices[roid]['model']!='') {
							$('#product_model').html(ro_prices[roid]['model']);
							
						} else {
							$('#product_model').html("<?php	/* Related Options / Связанные опции */	echo "<font id='product_model'>".$model."</font>"; /* >> Related Options / Связанные опции */ ?>
      ");
						}
					}
					
					
					function setRObyModel(model) {
						if (model && ro_array && ro_prices) {
						
							for (var ro_key in ro_prices) {
							
								if (ro_prices[ro_key]['model'] && ro_prices[ro_key]['model'] != '') {
									if (model.toLowerCase() == ro_prices[ro_key]['model'].toLowerCase()) {
										setSelectedRO(ro_key);
										return true;
									}
								}
							}
						}
						return false;
					}
					
					// Block Option compatibility
					function check_block_options() {
				
						if (use_block_options || use_journal2) {
							
							var available_values = [];
							
							// block options use SELECTs for select & radio
							$('select[name^=option\\[]').find('option').each( function () {
								
								if ($(this).val()) {
									if (hide_inaccessible) {
										available_values.push( $(this).val() );
									} else {
										if (! $(this).attr('disabled')) {
											available_values.push( $(this).val() );
										}
									}
								}
								
							});
							
							// block options use RADIOs for images
							$('input[type=radio][name^=option\\[]').each( function () {
								
								if (hide_inaccessible) {
									if ($(this)[0].style.display != 'none') {
										available_values.push( $(this).val() );
									}
								} else {
									if (!$(this).attr('disabled')) {
										available_values.push( $(this).val() );
									}
								}
								
							});
							
							// Product Block Option Module
							if (use_block_options) {
								//console.debug(available_values);
								$('a[id^=block-option],a[id^=block-image-option]').each( function () {
									//console.debug($(this).attr('option-value'));
									if ($.inArray($(this).attr('option-value'), available_values) == -1) {
										$(this).removeClass('block-active');
										if (hide_inaccessible) {
											$(this).hide();
										} else {
											$(this).attr('disabled', true);
											$(this).fadeTo("fast", 0.2);
										}
									} else {
										if (hide_inaccessible) {
											$(this).show();
										} else {
											$(this).attr('disabled', false);
											$(this).fadeTo("fast", 1);
										}
									}
									
								} );
							}
							
							// Journal2
							if (use_journal2) {
								$('div[id^=option-]').find('li[data-value]').each(function() {
									if ($.inArray($(this).attr('data-value'), available_values) == -1) {
										$(this).removeClass('selected');
										if (hide_inaccessible) {
											$(this).hide();
										} else {
											$(this).attr('disabled', true);
											$(this).fadeTo("fast", 0.2);
										}
									} else {
										if (hide_inaccessible) {
											$(this).show();
										} else {
											$(this).attr('disabled', false);
											$(this).fadeTo("fast", 1);
										}
									}
									
									// change standart Journal2 function
									$(this).unbind('click');
									$(this).click(function () {
										if ($(this).attr('disabled')) {
											return;
										}
										$(this).siblings().removeClass('selected');
										$(this).addClass('selected');
										$(this).parent().siblings('select').find('option[value=' + $(this).attr('data-value') + ']').attr('selected', 'selected');
										$(this).parent().siblings('select').trigger('change');
									});
									
									
								});
								
							}
							
						}
						
					}
					
					// Block Option compatibility
					function set_block_options() {
						
						if (use_block_options) {
							
							$('select[name^=option\\[]').find('option').each( function () {
								var poid = $(this).parent().attr('name').substr(7, $(this).parent().attr('name').length-8);
								
								// выключаем все блоки для SELECT
								$('div[id=option-'+poid+']').find('a[id^=block-]').removeClass('block-active');
								
								if ($(this).parent().val()) {
									$('div[id=option-'+poid+']').find('a[id^=block-][option-value='+$(this).parent().val()+']').addClass('block-active');
								}
								
							});
							
							// block options use RADIOs for images
							$('input[type=radio][name^=option\\[]').each( function () {
								var poid = $(this).attr('name').substr(7, $(this).attr('name').length-8);
								
								// выключаем только текущий блок для RADIO
								$('div[id=option-'+poid+']').find('a[id^=block-][option-value='+$(this).val()+']').removeClass('block-active');
								
								if ($(this).is(':checked')) {
									$('div[id=option-'+poid+']').find('a[id^=block-][option-value='+$(this).val()+']').addClass('block-active');
								}
								
							});
							
						}
						
					}
					
					// Journal2 compatibility
					function set_journal2_options() {
						
						if (use_journal2) {
							
							$('select[name^=option\\[]').find('option').each( function () {
								var poid = $(this).parent().attr('name').substr(7, $(this).parent().attr('name').length-8);
								
								// выключаем все блоки для SELECT
								$('div[id=option-'+poid+']').find('li[data-value]').removeClass('selected');
								
								if ($(this).parent().val()) {
									$('div[id=option-'+poid+']').find('li[data-value='+$(this).parent().val()+']').addClass('selected');
								}
								
							});
							
							// block options use RADIOs for images
							$('input[type=radio][name^=option\\[]').each( function () {
								var poid = $(this).attr('name').substr(7, $(this).attr('name').length-8);
								
								// выключаем только текущий блок для RADIO
								$('div[id=option-'+poid+']').find('li[data-value]').removeClass('selected');
																
								if ($(this).is(':checked')) {
									$('div[id=option-'+poid+']').find('li[data-value='+$(this).val()+']').addClass('selected');
								}
								
							});
							
						}
						
					}
					
					
					$("select[name^=option]").each(function (i) {
						$(this).change(function(){
							options_values_access();
						})
					})
					
					$("input[type=radio][name^=option]").each(function (i) {
						$(this).change(function(){
							options_values_access();
						})
					})
					
					$("input[type=text][name=quantity]").each(function (i) {
						$(this).change(function(){
							stock_control(0);
						})
					})
					
					// если задан фильтр и он совпадает с моделью из связанных опций - должно быть выбрано именно это сочетание
					if (!setRObyModel(filter_name)) { // нет по фильтру, или нет самого фильтра, тогда...
						// если при открытии выбрана опция - надо перевыбрать доступное сочетание
						if (ro_default !== false) {
							setSelectedRO(ro_default);
						}
					}
					
					
					
					options_values_access();
					
					
					</script>
					<?php
					
				}
			
			?>
			

			
			<?php } ?>


</div>
                                        
                                        <?php if($productConfig['product_enablezoom']){?> <script type="text/javascript" src=" catalog/view/javascript/jquery/elevatezoom/elevatezoom-min.js"></script> <script type="text/javascript">
        <?php if($productConfig['product_zoomgallery']=='slider'){?>
        $("#image").elevateZoom({gallery:'image-additional-carousel', cursor: 'pointer', galleryActiveClass: 'active'});
        <?php }else{?>
        var zoomCollection = '<?php echo $productConfig["product_zoomgallery"]=="basic"?".product-image-zoom":"#image";?>';
        $( zoomCollection ).elevateZoom({
        <?php if($productConfig['product_zoommode']!='basic'){?>
        zoomType        : "<?php echo $productConfig['product_zoommode'];?>",
        <?php }?>
        lensShape : "<?php echo $productConfig['product_zoomlensshape'];?>",
        lensSize    : <?php echo(int)$productConfig['product_zoomlenssize'];?>,

        });
        <?php }?>
    </script> <?php }?> <script type="text/javascript"><!--
        $(document).ready(function() {
        $('.colorbox').colorbox({
        overlayClose: true,
        opacity: 0.5,
        rel: "colorbox"
        });
        });
    //--></script> <script type="text/javascript"><!--

        $('select[name="profile_id"], input[name="quantity"]').change(function(){
        $.ajax({
        url: 'index.php?route=product/product/getRecurringDescription',
        type: 'post',
        data: $('input[name="product_id"], input[name="quantity"], select[name="profile_id"]'),
        dataType: 'json',
        beforeSend: function() {
        $('#profile-description').html('');
        },
        success: function(json) {
        $('.success, .warning, .attention, information, .error').remove();

        if (json['success']) {
        $('#profile-description').html(json['success']);
        }
        }
        });
        });

        $('#button-cart').bind('click', function() {

	<?php
		$this->load->model('module/related_options');
		$need_to_replace = FALSE;
		if ( $this->model_module_related_options->installed() ) {
			$ro_settings = $this->config->get('related_options');
			if (isset($ro_settings['stock_control']) && $ro_settings['stock_control'] && $this->model_module_related_options->get_product_related_options_use($product_id)) {
			$need_to_replace = TRUE;
			}
		}
		if ($need_to_replace) {
	?>
	
		if (!$('#button-cart').attr('allow_add_to_cart')) {
			stock_control(1);
			return;
		}
		$('#button-cart').attr('allow_add_to_cart','');
		
	<?php
		} else {
	?>
	
		
	<?php
		}
	?>
			

        $.ajax({
        url: 'index.php?route=checkout/cart/add',
        type: 'post',
        data: $('.product-info input[type=\'text\'], .product-info input[type=\'hidden\'], .product-info input[type=\'radio\']:checked, .product-info input[type=\'checkbox\']:checked, .product-info select, .product-info textarea'),
        dataType: 'json',
        success: function(json) {
        $('.success, .warning, .attention, information, .error').remove();

        if (json['error']) {
        if (json['error']['option']) {
        for (i in json['error']['option']) {
        $('#option-' + i).after('<span class="error">' + json['error']['option'][i] + '</span>');
        }
        }

        if (json['error']['profile']) {
        $('select[name="profile_id"]').after('<span class="error">' + json['error']['profile'] + '</span>');
        }
        }

        if (json['success']) {
        $('#notification').html('<div class="success" style="display: none;">' + json['success'] + '<img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>');

        $('.success').fadeIn('slow');

        $('#cart-total').html(json['total']);

        $('html, body').animate({ scrollTop: 0 }, 'slow');
        }
        }
        });
        });
    //--></script> <?php if($options){?> <script type="text/javascript" src="catalog/view/javascript/jquery/ajaxupload.js"></script> <?php foreach($options as $option){?> <?php if($option['type']=='file'){?> <script type="text/javascript"><!--
        new AjaxUpload('#button-option-<?php echo $option['product_option_id'];?>', {
        action: 'index.php?route=product/product/upload',
        name: 'file',
        autoSubmit: true,
        responseType: 'json',
        onSubmit: function(file, extension) {
        $('#button-option-<?php echo $option['product_option_id'];?>').after('<img src="catalog/view/theme/default/image/loading.gif" class="loading" style="padding-left: 5px;" />');
        $('#button-option-<?php echo $option['product_option_id'];?>').attr('disabled', true);
        },
        onComplete: function(file, json) {
        $('#button-option-<?php echo $option['product_option_id'];?>').attr('disabled', false);

        $('.error').remove();

        if (json['success']) {
        alert(json['success']);

        $('input[name=\'option[<?php echo $option['product_option_id'];?>]\']').attr('value', json['file']);
        }

        if (json['error']) {
        $('#option-<?php echo $option['product_option_id'];?>').after('<span class="error">' + json['error'] + '</span>');
        }

        $('.loading').remove();
        }
        });
    //--></script> <?php }?> <?php }?> <?php }?> <script type="text/javascript"><!--
        $('#review .pagination a').live('click', function() {
        $('#review').fadeOut('slow');

        $('#review').load(this.href);

        $('#review').fadeIn('slow');

        return false;
        });

        $('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id;?>');

        $('#button-review').bind('click', function() {
        $.ajax({
        url: 'index.php?route=product/product/write&product_id=<?php echo $product_id;?>',
        type: 'post',
        dataType: 'json',
        data: 'name=' + encodeURIComponent($('input[name=\'name\']').val()) + '&text=' + encodeURIComponent($('textarea[name=\'text\']').val()) + '&rating=' + encodeURIComponent($('input[name=\'rating\']:checked').val() ? $('input[name=\'rating\']:checked').val() : '') + '&captcha=' + encodeURIComponent($('input[name=\'captcha\']').val()),
        beforeSend: function() {
        $('.success, .warning').remove();
        $('#button-review').attr('disabled', true);
        $('#review-title').after('<div class="attention"><img src="catalog/view/theme/default/image/loading.gif" alt="" /> <?php echo $text_wait;?></div>');
        },
        complete: function() {
        $('#button-review').attr('disabled', false);
        $('.attention').remove();
        },
        success: function(data) {
        if (data['error']) {
        $('#review-title').after('<div class="warning">' + data['error'] + '</div>');
        }

        if (data['success']) {
        $('#review-title').after('<div class="success">' + data['success'] + '</div>');

        $('input[name=\'name\']').val('');
        $('textarea[name=\'text\']').val('');
        $('input[name=\'rating\']:checked').attr('checked', '');
        $('input[name=\'captcha\']').val('');
        }
        }
        });
        });
    //--></script> <script type="text/javascript"><!--
        $('#tabs a').tabs();
    //--></script> <script type="text/javascript" src="catalog/view/javascript/jquery/ui/jquery-ui-timepicker-addon.js"></script> <script type="text/javascript"><!--
        $(document).ready(function() {
        if ($.browser.msie && $.browser.version == 6) {
        $('.date, .datetime, .time').bgIframe();
        }

        $('.date').datepicker({dateFormat: 'yy-mm-dd'});
        $('.datetime').datetimepicker({
        dateFormat: 'yy-mm-dd',
        timeFormat: 'h:m'
        });
        $('.time').timepicker({timeFormat: 'h:m'});
        });
    //--></script> </section> <?php if($SPAN[2]):?> <aside class="col-lg-<?php echo $SPAN[2];?> col-md-<?php echo $SPAN[2];?> col-sm-12 col-xs-12"> <?php echo $column_right;?> </aside> <?php endif;?> <?php echo $footer;?>