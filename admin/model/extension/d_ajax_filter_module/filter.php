<?php
/*
*  location: admin/model
*/

class ModelExtensionDAjaxFilterModuleFilter extends Model {

    public $codename = 'd_ajax_filter';

    public function updateProduct($product_id){

        $this->load->model('extension/'.$this->codename.'/cache');

        $filters = $this->db->query("SELECT * FROM `".DB_PREFIX."product_filter` pf LEFT JOIN `".DB_PREFIX."filter` f ON (pf.filter_id = f.filter_id) WHERE product_id = '".(int)$product_id."'");
        $new_values = array();
        if($filters->num_rows){
            foreach ($filters->rows as $filter) {
                $filter_info  = $this->db->query("SELECT * FROM `".DB_PREFIX."af_values` WHERE `type` = 'filter' AND `value` = '".(int)$filter['filter_id']."'");
                if($filter_info->num_rows > 0){
                    $new_values[] = $filter_info->row['af_value_id'];
                }
                else{
                    $new_values[] = $this->{'model_extension_'.$this->codename.'_cache'}->addValue('filter', $filter['filter_group_id'], $filter['filter_id']);
                }
            }
        }

        return $new_values;
    }

    public function step($data){
        $this->load->model('extension/'.$this->codename.'/cache');
        $query = $this->db->query("SELECT f.filter_group_id, f.filter_id FROM ".DB_PREFIX."filter f LIMIT ".($data['limit']*$data['last_step']).", ".$data['limit']);
        if($query->rows){
            foreach ($query->rows as $row) {
                $this->{'model_extension_'.$this->codename.'_cache'}->addValue('filter', $row['filter_group_id'], $row['filter_id']);
            }
        }

        $count = $this->db->query("SELECT COUNT(*) as c FROM `".DB_PREFIX."filter`");;
        return $count->row['c'];
    }

    public function prepare(){
        $this->db->query('TRUNCATE TABLE '.DB_PREFIX.'af_filter');
    }

    public function installModule(){
        $this->db->query("CREATE TABLE IF NOT EXISTS " . DB_PREFIX . "af_filter (
            `filter_id` INT(11) NOT NULL,
            `language_id` INT(11) NOT NULL,
            `image` VARCHAR(255) NOT NULL,
            PRIMARY KEY (`filter_id`, `language_id`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8;");
    }

    public function uninstallModule(){
        $this->db->query("DROP TABLE IF EXISTS ". DB_PREFIX . "af_filter");
    }
}