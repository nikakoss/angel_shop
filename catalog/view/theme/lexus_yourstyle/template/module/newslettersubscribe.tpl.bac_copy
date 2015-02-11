<div class="box box-product"> <div class="box-heading"><span><?php echo $heading_title; ?></span></div> <div class="box-content" style="text-align:center"> <?php
   if($thickbox) { ?> <div id="frm_subscribe_hidden"> <?php } ?> <div id="frm_subscribe"> <form name="subscribe" id="subscribe"> <table> <tr> <td> <span class="title-subscribe"><b><?php echo $entry_email; ?></b></span> <input class="form-control" type="text" value="" name="subscribe_email" id="subscribe_email"></td> </tr> <tr style="display:none"> <td><?php echo $entry_name; ?>&nbsp;<br /><input type="text" value="" name="subscribe_name" id="subscribe_name"> </td> </tr> <?php 
     for($ns=1;$ns<=$option_fields;$ns++) {
     $ns_var= "option_fields".$ns;
   ?> <tr> <td> <?php 
       if($$ns_var!=""){
         echo($$ns_var."&nbsp;<br/>");
         echo('<input type="text" value="" name="option'.$ns.'" id="option'.$ns.'">');
       }
      ?> </td> </tr> <?php 
     }
   ?> <tr> <td class="button_subscribe"> <a class="button" onclick="email_subscribe()"><span><?php echo $entry_button; ?></span></a><?php if($option_unsubscribe) { ?> <a class="button" onclick="email_unsubscribe()"><span><?php echo $entry_unbutton; ?></span></a> <?php } ?> </td> </tr> <tr> <td id="subscribe_result"></td> </tr> </table> </form> </div> <?php if($thickbox) { ?> </div> <?php } ?> </div> <div class="bottom">&nbsp;</div> <script language="javascript">/*<![CDATA[*/<?php 
                if(!$thickbox) { 
        ?>function email_subscribe(){$.ajax({type:"post",url:"index.php?route=module/newslettersubscribe/subscribe",dataType:"html",data:$("#subscribe").serialize(),success:function(html){eval(html)}})}function email_unsubscribe(){$.ajax({type:"post",url:"index.php?route=module/newslettersubscribe/unsubscribe",dataType:"html",data:$("#subscribe").serialize(),success:function(html){eval(html)}})}<?php }else{ ?>function email_subscribe(){$.ajax({type:"post",url:"index.php?route=module/newslettersubscribe/subscribe",dataType:"html",data:$("#subscribe").serialize(),success:function(html){eval(html)}})}function email_unsubscribe(){$.ajax({type:"post",url:"index.php?route=module/newslettersubscribe/unsubscribe",dataType:"html",data:$("#subscribe").serialize(),success:function(html){eval(html)}})}<?php } ?>$(".fancybox_sub").fancybox({width:180,height:180,autoDimensions:false});/*]]>*/</script> </div> 