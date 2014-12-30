<div id="breadcrumb" xmlns:v="http://rdf.data-vocabulary.org/#">
   <ol class="breadcrumb">
      <?php $count=1; foreach ($breadcrumbs as $breadcrumb) { ?>
	  
      <?php if(count($breadcrumbs)==$count) {?>
	   <li typeof="v:Breadcrumb"><span><?php echo $breadcrumb['text']; ?></span></li>
	  <?php }else{ ?>
	   <li typeof="v:Breadcrumb"><a href="<?php echo $breadcrumb['href']; ?>" rel="v:url" property="v:title"><?php echo $breadcrumb['text']; ?></a><i class="fa fa-long-arrow-right"></i></li>
	  <?php }?>
     
      <?php $count++; } ?>
   </ol>
