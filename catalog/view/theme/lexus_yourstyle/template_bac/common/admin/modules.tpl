<?php
	$d = array(
		'demo_widget_delivery_data' => '
			<div class="box-services"><span class="btn-info pull-left"><i class="fa fa-truck">&nbsp;</i></span>
				<div class="media-body">
				<h4>FREE DELIVERY</h4>
				<small>on order over $7.00</small></div>
				</div>

				<div class="box-services"><span class="pull-left"><i class="fa fa-phone">&nbsp;</i></span>

				<div class="media-body">
				<h4>CALL TOLL FREE</h4>
				<small>1800 - 123 - COFFEEIS</small></div>
				</div>

		',

		'demo_widget_contactus_data'=>'
			<ul>
				<li><span class="fa button"><i class="fa fa-map-marker">&nbsp;</i></span><span>Proin gravida nibh vel velit auctor aliquet aene</span></li>
				<li><span class="fa button"><i class="fa fa-mobile">&nbsp;</i></span><span>Phone: +01 888 (000) 1234</span></li>
				<li><span class="fa button"><i class="fa fa-envelope">&nbsp;</i></span><span>Email: pavfoodstore@gmail.com</span></li>
			</ul>

		',
		'demo_widget_paypal_data'=>'

			<p><img src="image/data/paypal.png" alt="" /></p>
		'
	);
	$module = array_merge( $d, $module );

//	echo '<pre>'.print_r( $languages, 1 );die;
?>

<div class="inner-modules-wrap">
	<div class="vtabs mytabs" id="my-tab-innermodules">
		<a onclick="return false;" href="#tab-imodule-header" class="selected"><?php echo $this->language->get('Header');?></a>
		<a onclick="return false;" href="#tab-imodule-footer" class="selected"><?php echo $this->language->get('Footer');?></a>
	 </div>

	 		<div class="page-tabs-wrap">
	 				<div id="tab-imodule-header">
				<h4><?php echo $this->language->get( 'Delivery Module' ) ; ?></h4>

				<div id="language-widget_delivery_data" class="htabs mytabstyle">
		            <?php foreach ($languages as $language) { ?>
		            <a href="#tab-language-widget_delivery_data-<?php echo $language['language_id']; ?>"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a>
		            <?php } ?>
		          </div>

				<?php foreach ($languages as $language) {   ?>
		          <div id="tab-language-widget_delivery_data-<?php echo $language['language_id']; ?>">

		            <table class="form">
		            	<?php $text =  isset($module['widget_delivery_data'][$language['language_id']]) ? $module['widget_delivery_data'][$language['language_id']] : $module['demo_widget_delivery_data'];  ?>

		              <tr>
		                <td><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $this->language->get('Shipping');?>: </td>
		                <td><textarea name="themecontrol[widget_delivery_data][<?php echo $language['language_id']; ?>]" id="widget_delivery_data-<?php echo $language['language_id']; ?>" rows="5" cols="60"><?php echo $text; ?></textarea></td>
		              </tr>
		            </table>
		          </div>
		          <?php } ?>

		    </div>
	 		<div id="tab-imodule-footer">
				<h4><?php echo $this->language->get( 'Contact Us' ) ; ?></h4>

				<div id="language-widget_contactus_data" class="htabs mytabstyle">
		            <?php foreach ($languages as $language) { ?>
		            <a href="#tab-language-widget_contactus_data-<?php echo $language['language_id']; ?>"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a>
		            <?php } ?>
		          </div>

				<?php foreach ($languages as $language) {   ?>
		          <div id="tab-language-widget_contactus_data-<?php echo $language['language_id']; ?>">

		            <table class="form">
		            	<?php $text =  isset($module['widget_contactus_data'][$language['language_id']]) ? $module['widget_contactus_data'][$language['language_id']] : $module['demo_widget_contactus_data'];  ?>

		              <tr>
		                <td><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $this->language->get('Contact Us Module');?>: </td>
		                <td><textarea name="themecontrol[widget_contactus_data][<?php echo $language['language_id']; ?>]" id="widget_contactus_data-<?php echo $language['language_id']; ?>" rows="5" cols="60"><?php echo $text; ?></textarea></td>
		              </tr>
		            </table>
		          </div>
		          <?php } ?>

				


		          <h4><?php echo $this->language->get( 'Payplay' ) ; ?></h4>

				<div id="language-widget_paypal_data" class="htabs mytabstyle">
		            <?php foreach ($languages as $language) { ?>
		            <a href="#tab-language-widget_paypal_data-<?php echo $language['language_id']; ?>"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a>
		            <?php } ?>
		          </div>

				<?php foreach ($languages as $language) {   ?>
		          <div id="tab-language-widget_paypal_data-<?php echo $language['language_id']; ?>">

		            <table class="form">
		            	<?php $text =  isset($module['widget_paypal_data'][$language['language_id']]) ? $module['widget_paypal_data'][$language['language_id']] : $module['demo_widget_paypal_data'];  ?>

		              <tr>
		                <td><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $this->language->get('Paypal Module');?>: </td>
		                <td><textarea name="themecontrol[widget_paypal_data][<?php echo $language['language_id']; ?>]" id="widget_paypal_data-<?php echo $language['language_id']; ?>" rows="5" cols="60"><?php echo $text; ?></textarea></td>
		              </tr>
		            </table>
		          </div>
		          <?php } ?>

				<script type="text/javascript" src="view/javascript/ckeditor/ckeditor.js"></script>
				<script type="text/javascript"><!--
				$("#language-widget_delivery_data a").tabs();
				<?php foreach( $languages as $language )  { ?>
				CKEDITOR.replace('widget_delivery_data-<?php echo $language['language_id']; ?>', {
					filebrowserBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
					filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
					filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
					filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
					filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
					filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
				});
				<?php } ?>
				//--></script>



				<script type="text/javascript"><!--
				$("#language-widget_contactus_data a").tabs();
				<?php foreach( $languages as $language )  { ?>
				CKEDITOR.replace('widget_contactus_data-<?php echo $language['language_id']; ?>', {
					filebrowserBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
					filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
					filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
					filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
					filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
					filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
				});
				<?php } ?>
				//--></script>

				<script type="text/javascript"><!--
				$("#language-widget_paypal_data a").tabs();
				<?php foreach( $languages as $language )  { ?>
				CKEDITOR.replace('widget_paypal_data-<?php echo $language['language_id']; ?>', {
					filebrowserBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
					filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
					filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
					filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
					filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
					filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
				});
				<?php } ?>
				//--></script>
			</div>
	 </div>
	 <div class="clearfix clear"></div>
</div>

