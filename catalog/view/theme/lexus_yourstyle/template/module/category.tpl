<div class="box category">
   <div class="box-heading"><span><?php echo $heading_title; ?></span></div>
   <div class="box-content">
      <ul class="box-category list">
         <?php foreach ($categories as $category) {
            $class = "";
            if(isset($category["children"]) && !empty($category["children"])){
            $class = "haschild";
            }
            $name = str_replace("(", '<span class="badge">(',  $category['name'] );
            $category['name'] = str_replace(")", ')</span>', $name);
            ?> 
         <li class="<?php echo $class; ?>">
            <?php if ($category['category_id'] == $category_id) { ?> <a href="<?php echo $category['href']; ?>" class="active"><?php echo $category['name']; ?></a> <?php } else { ?> <a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a> <?php } ?> <?php if ($category['children']) { ?> 
            <div class="head pull-right"><a href="javascript:void(0)" class="fa fa-plus"></a></div>
            <ul>
               <?php foreach ($category['children'] as $child) { ?> <?php
                  $child['name'] = str_replace("(", '<span class="badge">(',  $child['name'] );
                  $child['name'] = str_replace(")", ')</span>', $child['name']);
                  ?> 
				  
				  <?php if($child['product_total']>0){?>
               <li>
                  <?php if ($child['category_id'] == $child_id) { ?> <a href="<?php echo $child['href']; ?>" class="active"> <?php echo $child['name']; ?></a> <?php } else { ?> <a href="<?php echo $child['href']; ?>"> <?php echo $child['name']; ?></a> <?php } ?> <?php if ($child['children2']) { ?> 
                  <div class="head pull-right"><a href="javascript:void(0)" class="fa fa-plus"></a></div>
                  <ul>
                     <?php foreach ($child['children2'] as $child2) { ?> <?php
                        $child2['name'] = str_replace("(", '<span class="badge">(',  $child2['name'] );
                        $child2['name'] = str_replace(")", ')</span>', $child2['name']);
                        ?> 
						<?php if($child2['product_total']>0){?>
							 <li> <?php if ($child2['category_id'] == $child2_id) { ?> <a href="<?php echo $child2['href']; ?>" class="active"> <?php echo $child2['name']; ?></a> <?php } else { ?> <a href="<?php echo $child2['href']; ?>"> <?php echo $child2['name']; ?></a> <?php } ?> </li>
							 <?php } ?> 
                     <?php } ?> 
                  </ul>
                  <?php } ?> 
               </li>
				<?php } ?> 
               <?php } ?> 
            </ul>
            <?php } ?> 
         </li>
         <?php } ?> 
      </ul>
      <script type="text/javascript">$(function(){var a=".box-category li a.active";if($(a).length>0){$(a).parent("li").find("ul:first").show();$(a).parent("li").find("a.fa:first").toggleClass("aToggle");$(a).parent("li").find("a.fa:first").toggleClass("fa-minus")}$(".head a").click(function(){$(".head a").removeClass("aToggle");$(".head a").removeClass("fa-minus");var b=$(this).parent("div").parent("li").find("ul:first");if(!b.is(":visible")){b.slideUp();$(this).toggleClass("aToggle");$(this).toggleClass("fa-minus")}else{$(this).removeClass("aToggle");$(this).removeClass("fa-minus")}b.stop(true,true).slideToggle()})});</script> 
   </div>
</div>