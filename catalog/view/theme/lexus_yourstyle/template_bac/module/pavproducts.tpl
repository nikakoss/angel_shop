<?php
/******************************************************
* @package Pav Product Tabs module for Opencart 1.5.x
* @version 1.0
* @author http://www.pavothemes.com
* @copyright   Copyright (C) Feb 2012 PavoThemes.com <@emai:pavothemes@gmail.com>.All rights reserved.
* @license             GNU General Public License version 2
*******************************************************/

$span = 12/$cols;
$active = 'latest';
$id = rand(1,9)+rand();

$themeConfig = (array)$this->config->get('themecontrol');
$categoryConfig = array(
'category_pzoom' => 1,
'show_swap_image' => 0,
'quickview' => 0,
);
$categoryConfig  = array_merge($categoryConfig, $themeConfig );
$categoryPzoom      = $categoryConfig['category_pzoom'];
$quickview = $categoryConfig['quickview'];
$swapimg = ($categoryConfig['show_swap_image'])?'swap':'';

?>

<div class="box pav-categoryproducts clearfix">

    <?php if( !empty($module_description) ) { ?>
    <div class="module-description">
        <?php echo $module_description;?>
    </div>
    <?php } ?>


    <div class="box-content clearfix">
        <div class="hidden-lg hidden-md name-category">
            <span><?php foreach( $tabs as $tab => $category ) { echo $category['category_name']; } ?></span>
        </div>
        <div class="tab-nav pull-left hidden-xs hidden-sm">
            <!--a class="banner-category over" href="<?php echo $category['href'];?>"></a-->
            <ul class="h-tabs" id="producttabs<?php echo $id;?>">
                <?php foreach( $tabs as $tab => $category ) {
                if( empty($category) ){ continue;}
                $tab = 'cattabs';

                ///     echo '<pre>'.print_r( $category,1 ); die;
                $products = $category['products'];
                $icon = $this->model_tool_image->resize( $category['image'], 279, 627);
                ?>
                <li class="<?php echo $category['class'];?>">
                    <div class="banner-category">
                        <a href="#tab-<?php echo $tab.$id.$category['category_id'];?>" data-toggle="tab">
                            <?php if ( $icon ) { ?><img src="<?php echo $icon;?>" alt=""><?php } ?>
                        </a>
                        <a class="over" href="<?php echo $category['href'];?>"></a>
                        <div class="ImageOverlayC"></div>
                    </div>
                    <a href="<?php echo $category['href'];?>" class="category_name">
                        <span><?php echo $category['category_name'];?></span>
                    </a>
                </li>
                <?php } ?>
            </ul>
        </div>

        <div class="tab-content pull-left">
            <?php foreach( $tabs as $tab => $category ) {
            if( empty($category) ){ continue;}
            $tab = 'boxcats';

            $products = $category['products'];
            $icon = $this->model_tool_image->resize( $category['image'], 45,45 );
            ?>
            <div class="tab-pane cat-products-block clearfix" id="tab-cattabs<?php echo $id.$category['category_id'];?>">

                <?php if( count($products) > $itemsperpage ) { ?>
                <div class="carousel-controls">
                    <a class="carousel-control left fa fa-angle-right" href="#<?php echo $tab.$id.$category['category_id'];?>"   data-slide="prev"></a>
                    <a class="carousel-control right fa fa-angle-left" href="#<?php echo $tab.$id.$category['category_id'];?>"  data-slide="next"></a>
                </div>
                <?php } ?>

                <div class="box-products pavproducts<?php echo $id;?> slide" id="<?php echo $tab.$id.$category['category_id'];?>">
                    <div class="carousel-inner">
                        <?php $pages = array_chunk( $products, $itemsperpage);   ?>
                        <?php foreach ($pages as  $k => $tproducts ) {   ?>
                        <div class="item <?php if($k==0) {?>active<?php } ?> product-grid">
                            <?php foreach( $tproducts as $i => $product ) { ?>
                            <?php if( $i++%$cols == 0 ) { ?>
                            <div class="item-row clearfix">
                                <?php } ?>
                                <div class="product-inner pull-left">
                                    <div class="product-block  <?php echo $swapimg; ?>">
                                        <div class="product-content">
                                            <?php if ($product['thumb']) { ?>
                                            <div class="image">
                                                <div class="image_container">
                                                    <a href="<?php echo $product['href']; ?>" class="img front"><img class="img img-responsive" src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>"></a>
                                                    <!-- Show Swap -->
                                                    <?php
                                                    if( $swapimg ){
                                                    $product_images = $this->model_catalog_product->getProductImages( $product['product_id'] );
                                                    if(isset($product_images) && !empty($product_images)) {
                                                    $thumb2 = $this->model_tool_image->resize($product_images[0]['image'],  $this->config->get('config_image_product_width'),  $this->config->get('config_image_product_height') );
                                                    ?>
                                                    <a class="hover-image" href="<?php echo $product['href']; ?>"><img src="<?php echo $thumb2; ?>" alt="<?php echo $product['name']; ?>"></a>
                                                    <?php } } ?>

                                                    <?php //#2 Start fix quickview in fw?>
                                                    <?php if ($quickview) { ?>
                                                    <div class="product-quickview hidden-xs hidden-sm">
                                                        <a class="pav-colorbox fa fa-eye" href="<?php echo $this->url->link("themecontrol/product",'product_id='.$product['product_id'] );?>"><span><?php echo $this->language->get('quick_view'); ?></span></a>
                                                    </div>
                                                    <?php } ?>
                                                    <?php //#2 End fix quickview in fw?>

                                                </div>




                                            </div>
                                            <?php } ?>

                                            <div class="product-meta">
                                                <h3 class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h3>
                                                <p class="description"><?php echo utf8_substr( strip_tags($product['description']),0,60);?>...</p>

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
                                                <div class="rating"><img src="catalog/view/theme/<?php echo $this->config->get('config_template');?>/image/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>"></div>
                                                <?php } else { ?>
                                                <div class="norating"><img src="catalog/view/theme/<?php echo $this->config->get('config_template');?>/image/stars-0.png" alt="star"></div>
                                                <?php } ?>


                                                <div class="product-hover">
                                                    <div class="shopping-cart">

                                                        <a class="" onclick="addToCart('<?php echo $product['product_id']; ?>');"  data-placement="top" data-toggle="tooltip" data-original-title="<?php echo  $button_cart; ?>">
                                                            <span><?php echo  $button_cart; ?></span>
                                                        </a>

                                                    </div>

                                                    <div class="wishlist">
                                                        <a class="" onclick="addToWishList('<?php echo $product['product_id']; ?>');"  data-placement="top" data-toggle="tooltip" data-original-title="<?php echo $this->language->get("button_wishlist"); ?>">
                                                        <span><?php echo $this->language->get("button_wishlist"); ?></span>
                                                        </a>
                                                    </div>
                                                    <div class="compare">
                                                        <a class="" onclick="addToCompare('<?php echo $product['product_id']; ?>');"  data-placement="top" data-toggle="tooltip" data-original-title="<?php echo $this->language->get("button_compare");  ?>">
                                                        <span><?php echo $this->language->get("button_compare"); ?></span>
                                                        </a>
                                                    </div>


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
            <?php } // endforeach of tabs ?>
        </div>

    </div>
</div>


<script type="text/javascript">
    $(function () {
    $('.pavproducts<?php echo $id;?>').carousel({interval:99999999999999,auto:false,pause:'hover'});
    $('#producttabs<?php echo $id;?> a:first').tab('show');
    });
</script>

<script type="text/javascript">
    <!--
    $(document).ready(function() {
    $('.colorbox').colorbox({
    overlayClose: true,
    opacity: 0.5,

    });
    });
    //-->
                </script>
