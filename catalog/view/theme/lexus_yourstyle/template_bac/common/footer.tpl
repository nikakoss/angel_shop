<?php
        /******************************************************
         * @package Pav Megamenu module for Opencart 1.5.x
         * @version 1.1
         * @author http://www.pavothemes.com
         * @copyright   Copyright (C) Feb 2013 PavoThemes.com <@emai:pavothemes@gmail.com>.All rights reserved.
         * @license             GNU General Public License version 2
        *******************************************************/

        require_once( DIR_TEMPLATE.$this->config->get('config_template')."/development/libs/framework.php" );
        $themeConfig = (array)$this->config->get('themecontrol');
        $themeName =  $this->config->get('config_template');
        $helper = ThemeControlHelper::getInstance( $this->registry, $themeName );
        $LANGUAGE_ID = $this->config->get( 'config_language_id' );
?>
</div></div></section>


<?php
 /**
  * Mass Bottom Position
  * $ospans allow overrides width of columns base on thiers indexs. format array( 1=> 3 )[value from 1->12]
 */

  $modules = $helper->getModulesByPosition( 'mass_bottom' );
  $ospans = array(1 => 9, 2 => 3);

  if( count($modules) ) {
  $cols =  count($modules)?count($modules):1;
  $class = $helper->calculateSpans( $ospans, $cols );
?>
<section id="pav-mass-bottom">
 <div class="container">
  <div class="inner">
   <?php $j=1;foreach ($modules as $i =>  $module) {   ?>
    <?php if( $i++%$cols == 0 || count($modules)==1 ){  $j=1;?>
    <div class="row"><?php } ?>
        <div class="<?php echo $class[$j];?> col-sm-12 col-xs-12"><?php echo $module; ?></div>
            <?php if( $i%$cols == 0 || $i==count($modules) ){ ?></div><?php } ?>
           <?php  $j++;  } ?>
  </div>
 </div>
</section>

<?php } ?>


<section id="footer">
        <?php
        /**
         * Footer Top Position
         * $ospans allow overrides width of columns base on thiers indexs. format array( 1=> 3 )[value from 1->12]
         */
        $modules = $helper->getModulesByPosition( 'footer_top' );
        $ospans = array();

        if( count($modules) ){
        $cols = isset($themeConfig['block_footer_top'])&& $themeConfig['block_footer_top']?(int)$themeConfig['block_footer_top']:count($modules);
        //if( $cols < count($modules) ){ $cols = count($modules); }
        $class = $helper->calculateSpans( $ospans, $cols );
        ?>
        <div class="footer-top">
                <div class="container">
                        <?php $j=1;foreach ($modules as $i =>  $module) {   ?>
                                <?php if( $i++%$cols == 0 || count($modules)==1 ){  $j=1;?><div class="row"><?php } ?>
                                <div class="<?php echo $class[$j];?> "><?php echo $module; ?></div>
                                <?php if( $i%$cols == 0 || $i==count($modules) ){ ?></div><?php } ?>
                        <?php  $j++;  } ?>
                </div>
        </div>
        <?php } ?>
        <?php
        /**
         * Footer Center Position
         * $ospans allow overrides width of columns base on thiers indexs. format array( 1=> 3 )[value from 1->12]
         */
        $modules = $helper->getModulesByPosition( 'footer_center' );
        $ospans = array(1=>3,2=>2,3=>2,4=>2,5=>3);

        if( count($modules) ){
        $cols = isset($themeConfig['block_footer_center'])&& $themeConfig['block_footer_center']?(int)$themeConfig['block_footer_center']:count($modules);
        $class = $helper->calculateSpans( $ospans, $cols );
        ?>
        <!--noindex-->
        <div class="footer-center">
                <div class="container">
                <?php $j=1;foreach ($modules as $i =>  $module) {  ?>
                                <?php if( $i++%$cols == 0 || count($modules)==1 ){  $j=1;?><div class="row"><?php } ?>
                                <div class="<?php echo $class[$j];?> col-xs-12 col-sm-6"><?php echo $module; ?></div>
                                <?php if( $i%$cols == 0 || $i==count($modules) ){ ?></div><?php } ?>
                <?php  $j++;  } ?>
                </div>
        </div>
        <!--/noindex-->
        <?php } elseif((isset($themeConfig['enable_footer_center'])&&$themeConfig['enable_footer_center'])) { ?>
        <div class="footer-center">
                <div class="container">
                        <div class="row">
                                <?php if( isset($themeConfig['widget_contactus_data'][$LANGUAGE_ID]) ) { ?>
                                <div class="column col-xs-12 col-sm-6 col-lg-4">
                                        <div class="box contact-us">
                                                <div class="box-heading"><span><?php echo $this->language->get('text_contact_us'); ?></span></div>
                                                <?php echo html_entity_decode( $themeConfig['widget_contactus_data'][$LANGUAGE_ID], ENT_QUOTES, 'UTF-8' ); ?>
                                        </div>
                                </div>
                                 <?php } ?>

                                <div class="column col-xs-12 col-sm-6 col-lg-3">
                                        <div class="box">
                                                <div class="box-heading"><span><?php echo $text_account; ?></span></div>
                                                <ul class="list">
                                                  <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
                                                  <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
                                                  <li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
                                                  <li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
                                                  <li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
                                                </ul>
                                        </div>
                                </div>

                                <div class="column col-xs-12 col-sm-6 col-lg-3">
                                        <div class="box">
                                                <div class="box-heading"><span><?php echo $text_service; ?></span></div>
                                                <ul class="list">
                                                  <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
                                                  <li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
                                                  <li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
                                                  <li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
                                                </ul>
                                        </div>
                                </div>

                                <div class="column col-xs-12 col-sm-6 col-lg-2">
                                        <div class="box">
                                        <div class="box-heading"><span><?php echo $text_extra; ?></span></div>
                                        <ul class="list">
                                          <li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
                                          <li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
                                          <li><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li>
                                          <li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
                                        </ul>
                                  </div>
                                </div>

                         </div>
                </div>
        </div>
        <?php  } ?>
        <?php
        /**
         * Footer Bottom
         * $ospans allow overrides width of columns base on thiers indexs. format array( 1=> 3 )[value from 1->12]
         */
        $modules = $helper->getModulesByPosition( 'footer_bottom' );
        $ospans = array();

        if( count($modules) ){
        $cols = isset($themeConfig['block_footer_bottom'])&& $themeConfig['block_footer_bottom']?(int)$themeConfig['block_footer_bottom']:count($modules);
        $class = $helper->calculateSpans( $ospans, $cols );
        ?>
        <div class="footer-bottom">
                <div class="container">
                <?php $j=1;foreach ($modules as $i =>  $module) {  ?>
                                <?php if( $i++%$cols == 0 || count($modules)==1 ){  $j=1;?><div class="row"><?php } ?>
                                <div class="<?php echo $class[$j];?>"><?php echo $module; ?></div>
                                <?php if( $i%$cols == 0 || $i==count($modules) ){ ?></div><?php } ?>
                <?php  $j++;  } ?>
                </div>
        </div>
        <?php } ?>

        <!--
        OpenCart is open source software and you are free to remove the powered by OpenCart if you want, but its generally accepted practise to make a small donation.
        Please donate via PayPal to donate@opencart.com
        //-->
        <div id="powered">
                <div class="container">
                        <div class="copyright pull-left">
                                <?php if( isset($themeConfig['enable_custom_copyright']) && $themeConfig['enable_custom_copyright'] ) { ?>
                                        <?php echo $themeConfig['copyright'];?>
                                <?php } else { ?>
                                        <?php echo $powered; ?>.
                                <?php } ?>
                               <!-- Design By <a href="http://www.themelexus.com" title="Themelexus - opencart themes clubs">ThemeLexus</a> -->
                        </div>
                        <?php if( isset($themeConfig['widget_paypal_data'][$LANGUAGE_ID]) ) {?>
                                <div class="paypal pull-right">
                                        <?php echo html_entity_decode( $themeConfig['widget_paypal_data'][$LANGUAGE_ID], ENT_QUOTES, 'UTF-8' ); ?>
                                        
                                        
                                        
                                        
                                        
                                        
<!--LiveInternet counter-->
<script type="text/javascript"><!--
document.write("<a href='//www.liveinternet.ru/click' "+
"target=_blank><img src='//counter.yadro.ru/hit?t14.5;r"+
escape(document.referrer)+((typeof(screen)=="undefined")?"":
";s"+screen.width+"*"+screen.height+"*"+(screen.colorDepth?
screen.colorDepth:screen.pixelDepth))+";u"+escape(document.URL)+
";"+Math.random()+
"' alt='' title='LiveInternet: показано число просмотров за 24"+
" часа, посетителей за 24 часа и за сегодня' "+
"border='0' width='88' height='31'><\/a>")
//--></script>
<!--/LiveInternet-->                                        
                                        
                                        
                                        
<!-- Yandex.Metrika informer -->
<!--a href="https://metrika.yandex.ru/stat/?id=25187354&amp;from=informer"
target="_blank" rel="nofollow"><img src="//bs.yandex.ru/informer/25187354/3_0_666471FF_464451FF_1_pageviews"
style="width:88px; height:31px; border:0;" alt="Яндекс.Метрика" title="Яндекс.Метрика: данные за сегодня (просмотры, визиты и уникальные посетители)" onclick="try{Ya.Metrika.informer({i:this,id:25187354,lang:'ru'});return false}catch(e){}"/></a-->
<!-- /Yandex.Metrika informer -->

<!-- Yandex.Metrika counter -->
<script type="text/javascript">
(function (d, w, c) {
    (w[c] = w[c] || []).push(function() {
        try {
            w.yaCounter25187354 = new Ya.Metrika({id:25187354,
                    webvisor:true,
                    clickmap:true,
                    trackLinks:true,
                    accurateTrackBounce:true});
        } catch(e) { }
    });

    var n = d.getElementsByTagName("script")[0],
        s = d.createElement("script"),
        f = function () { n.parentNode.insertBefore(s, n); };
    s.type = "text/javascript";
    s.async = true;
    s.src = (d.location.protocol == "https:" ? "https:" : "http:") + "//mc.yandex.ru/metrika/watch.js";

    if (w.opera == "[object Opera]") {
        d.addEventListener("DOMContentLoaded", f, false);
    } else { f(); }
})(document, window, "yandex_metrika_callbacks");
</script>
<noscript><div><img src="//mc.yandex.ru/watch/25187354" style="position:absolute; left:-9999px;" alt="" /></div></noscript>
<!-- /Yandex.Metrika counter -->



<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-51663175-1', 'angel-moda.com');
  ga('send', 'pageview');

</script>


                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                        </div>
                         <?php } ?>
                </div>
        </div>
</section>

<!--
OpenCart is open source software and you are free to remove the powered by OpenCart if you want, but its generally accepted practise to make a small donation.
Please donate via PayPal to donate@opencart.com
//-->
<?php if( isset($themeConfig['enable_paneltool']) && $themeConfig['enable_paneltool'] ){  ?>
        <?php  echo $helper->renderAddon( 'panel' );?>
<?php } ?>
</section>
</body></html>