<div class="box box-product subscribe_box">
  <div class="box-content subscribe_frm">
    <div class="col-lg-4 social_angel">
      <a class="social_vkontakte tsc_social_toony" title="vkontakte" target="_blank" href="http://vk.com/angelsitalia"></a>
      <a class="social_facebook tsc_social_toony" title="facebook" target="_blank" href="https://www.facebook.com/angelsitalia"></a>
      <a class="social_instagram tsc_social_toony" title="instagram" target="_blank" href="http://instagram.com/angelsitalia"></a>
      <a class="social_twitter tsc_social_toony" title="twitter" target="_blank" href="https://twitter.com/angelsitalia"></a>
      <a class="social_instagram tsc_social_toony" title="instagram" target="_blank" href="http://instagram.com/angeletto_jewellery"></a>
    </div>  
    <div class="col-lg-4 subscribe_descr">
      <span>Подпишитесь на стильные новости и горячие предложения</span>
    </div>
    <div class="col-lg-4">
      <?php if($thickbox) { ?> 
        <div id="frm_subscribe_hidden">
           <?php } ?> 
           <div id="frm_subscribe">
              <form name="subscribe" id="subscribe">
                 <table>
                    <tr>
                       <td><input class="form-control" type="text" value="" name="subscribe_email" id="subscribe_email"></td>
                    </tr>
                    <tr style="display:none">
                       <td><?php echo $entry_name; ?>&nbsp;<br /><input type="text" value="" name="subscribe_name" id="subscribe_name"> </td>
                    </tr>
                    <?php for($ns=1;$ns<=$option_fields;$ns++) {
                      $ns_var= "option_fields".$ns;
                      ?> 
                    <tr>
                      <td> <?php if($$ns_var!=""){
                            echo($$ns_var."&nbsp;<br/>");
                            echo('<input type="text" value="" name="option'.$ns.'" id="option'.$ns.'">');
                          }
                          ?>
                      </td>
                    </tr>
                    <?php } ?> 
                    <tr>
                       <td class="button_subscribe"> <a class="button" onclick="email_subscribe()"><span><?php echo $entry_button; ?></span></a><?php if($option_unsubscribe) { ?> <a class="button" onclick="email_unsubscribe()"><span><?php echo $entry_unbutton; ?></span></a> <?php } ?> </td>
                    </tr>
                    <tr>
                       <td id="subscribe_result"></td>
                    </tr>
                 </table>
              </form>
           </div>
           <?php if($thickbox) { ?> 
        </div>
        <?php } ?> 
    </div>     
  </div>
  <div class="bottom">&nbsp;</div>
</div>

<script language="javascript">/*<![CDATA[*/<?php if(!$thickbox) { ?>function email_subscribe(){$.ajax({type:"post",url:"index.php?route=module/newslettersubscribe/subscribe",dataType:"html",data:$("#subscribe").serialize(),success:function(html){eval(html)}})}function email_unsubscribe(){$.ajax({type:"post",url:"index.php?route=module/newslettersubscribe/unsubscribe",dataType:"html",data:$("#subscribe").serialize(),success:function(html){eval(html)}})}<?php }else{ ?>function email_subscribe(){$.ajax({type:"post",url:"index.php?route=module/newslettersubscribe/subscribe",dataType:"html",data:$("#subscribe").serialize(),success:function(html){eval(html)}})}function email_unsubscribe(){$.ajax({type:"post",url:"index.php?route=module/newslettersubscribe/unsubscribe",dataType:"html",data:$("#subscribe").serialize(),success:function(html){eval(html)}})}<?php } ?>$(".fancybox_sub").fancybox({width:180,height:180,autoDimensions:false});/*]]>*/</script>