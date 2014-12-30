<div class="box" style="width:<?php echo $width; ?>px;">
  <div class="box-heading"><?php echo $heading_title; ?></div>
  <div class="box-content" style="height: auto;">
    <?php if ($discount_id != 'discount') { ?> 
        <table class="list">
          <thead>
            <tr>
              <?php if ($discount_id == 'discount_cumulative' && $add_row_status > 0) { ?>
              <td class="center"><b><?php echo $column_status; ?></b></td>  
              <?php } ?>
              <td class="center"><b><?php echo $column_condition; ?></b></td>
              <td class="center"><b><?php echo $column_discount; ?><b></td>
            </tr>
          </thead>
          <tbody>
          <?php foreach ($text_discount as $text_line) { ?>
            <tr>
              <?php if ($discount_id == 'discount_cumulative' && $add_row_status > 0) { ?>
                <td class="center"><b class="<?php echo $text_line['color']; ?>"><?php echo $text_line['name']; ?></b></td>
              <?php } ?>
              <?php if ($discount_id <> 'discount_count') { ?>
                <td class="center"><?php echo $this->currency->format($text_line['condition']); ?></td>
              <?php } else { ?>
                <td class="center"><?php echo $text_line['condition']; ?></td>
              <?php } ?>
                <td class="center"><?php echo $text_line['discount']; ?>%</td>
            </tr>
          <?php } ?>
          </tbody>
        </table>
        <?php if ($discount_id != 'discount_count' && $discount_id != 'discount_sum') { ?>
        <div class="cart-total">
            <table>
              <?php if (isset($your_sum)) { ?>
                <tr>
                  <td><b><?php echo $entry_your_sum; ?></b></td>
                  <td><?php echo $this->currency->format($your_sum); ?></td>
                </tr>
              <?php } ?>
              <?php if (isset($your_name) && trim($your_name) <> '') { ?>
                <tr>
                  <td><b><?php echo $entry_your_status; ?></b></td>
                  <td class="<?php echo $your_color; ?>"><b><?php echo $your_name; ?></b></td>
                </tr>
              <?php } ?>
              <?php if (isset($your_discount)) { ?>
                <tr>
                  <td><b><?php echo $entry_discount; ?></b></td>
                  <td><?php echo $your_discount; ?>%</td>
                </tr>
              <?php } ?>
           </table>
           <?php if (!isset($your_sum) && !isset($your_discount)) { ?>
                <b><?php echo $entry_need_login . ' ' . $entry_welcome; ?></b>
           <?php } ?>
        </div>
        <?php } ?>
    <?php } else { ?> 
        <?php if (isset($your_discount)) { ?>
          <table>
          <tr>
            <td><b><?php echo $entry_discount; ?></b></td>
            <td><?php echo $your_discount; ?>%</td>
          </tr>
          </table>
        <?php } else { ?> 
            <?php echo $entry_need_login_user . ' ' . $entry_welcome; ?>
        <?php } ?>
    <?php } ?>
  </div>

<style>
  .bronze { color: #CD7F32 ;} 
  .silver { color: #C0C0C0; }
  .gold { color: #FFD700; }
  .red { color: #FF0000; }
  .green { color: #00FF00; }
  .blue { color: #0000FF; }
  .black { color: #000000; }
</style>

</div>

