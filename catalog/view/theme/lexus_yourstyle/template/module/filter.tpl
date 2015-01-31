<div class="box">
   <div class="box-heading"><span><?php echo $heading_title; ?></span></div>
   <div class="box-content">
      <ul class="box-filter">
         <?php foreach ($filter_groups as $filter_group) { ?> 
         <li>
            <span id="filter-group<?php echo $filter_group['filter_group_id']; ?>"><?php echo $filter_group['name']; ?></span> 
            <ul>
               <?php foreach ($filter_group['filter'] as $filter) { ?> <?php if (in_array($filter['filter_id'], $filter_category)) { ?> 
               <li> 
			   <a class="active" href="<?php echo $action; ?>tags/<?php echo $filter['seo']; ?>"><?php echo $filter['name']; ?> </a>				
			   </li>
               <?php } else { ?> 
               <li>
				 <a href="<?php echo $action; ?>tags/<?php echo $filter['seo']; ?>"><?php echo $filter['name']; ?> </a>
			   </li>
               <?php } ?> <?php } ?> 
            </ul>
         </li>
         <?php } ?> 
      </ul>     
   </div>
</div>