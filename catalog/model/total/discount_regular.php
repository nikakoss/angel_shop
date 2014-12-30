<?php
class ModelTotalDiscountRegular extends Model {
	public function getTotal(&$total_data, &$total) {
            
            $customer_group_id = -1;
            if ($this->customer->isLogged()) {
                $query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "customer WHERE customer_id = '" . (int)$this->customer->isLogged() . "'");
                $customer_group_id = $query->row['customer_group_id'];             
            } 

            if ($this->customer->isLogged() && ($customer_group_id == $this->config->get('discount_regular_group') || $this->config->get('discount_regular_group') == 0) && $this->config->get('discount_regular_status') > 0 && $this->config->get('discount_regular_proc') > 0) {                             
                $this->load->language('total/discount_regular');
                $query = $this->db->query("SELECT sum(total) as total FROM `" . DB_PREFIX . "order` WHERE customer_id = '" . $this->customer->isLogged() . "' AND order_status_id = '" . $this->config->get('discount_regular_order_status') . "'");
                $sum_total = $query->row['total'];

                if ($sum_total >= $this->config->get('discount_regular_total')) {
                    $discount_proc = $this->config->get('discount_regular_proc');
                    $discount = $discount_proc / 100;
                    
                    $total_data[] = array( 
                            'code'       => 'discount_regular',
                            'title'      => $this->language->get('text_discount_regular') . ' (' . $discount_proc . '%)',
                            'text'       => $this->currency->format(-$total * $discount),
                            'discount'   => $discount,
                            'value'      => -$total * $discount,
                            'sort_order' => $this->config->get('discount_regular_sort_order')
                    );         
                    $total -= $total * $discount;
                    $this->load->model('total/discount_select');
                    $this->model_total_discount_select->getSelection($total_data, $total);           
                } 
            }
       }
}
?>