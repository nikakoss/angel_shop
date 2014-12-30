<div id="breadcrumb"><ol class="breadcrumb">
	<?php foreach ($breadcrumbs as $breadcrumb) { ?>
	<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a><i class="fa fa-long-arrow-right"></i></li>

	<?php } ?>
</ol></div>