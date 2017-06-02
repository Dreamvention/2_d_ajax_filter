<?php
/*
*  location: admin/model
*/

class ModelExtensionModuleDAjaxFilter extends Model {

    public $codename = 'd_ajax_filter';

    public function CreateDatabase(){

        $this->db->query("CREATE TABLE `".DB_PREFIX."af_translit` (
           `type` VARCHAR(64) NOT NULL,
           `group_id` INT(11) NOT NULL,
           `value` INT(11) NOT NULL,
           `language_id` INT(11) NOT NULL,
           `text` VARCHAR(256) NOT NULL
           )
           COLLATE='utf8_general_ci' ENGINE=InnoDB;");
    }

    public function DropDatabase(){
        $this->db->query("DROP TABLE IF EXISTS ". DB_PREFIX . "af_translit");
        $this->load->model('extension/'.$this->codename.'/cache');
        $this->{'model_extension_'.$this->codename.'_cache'}->disableCache();
    }
    
    public function checkCache(){
        $this->load->model('setting/setting');
        $setting = $this->model_setting_setting->getSetting($this->codename.'_cache');

        if(!empty($setting)){
            return true;
        }
        else{
            return false;
        }
    }
    
    public function clearFileCache(){
        $this->cache->delete('af-attribute');
        $this->cache->delete('af-price');
        $this->cache->delete('af-total-attribute');
        $this->cache->delete('af-total-category');
        $this->cache->delete('af-total-ean');
        $this->cache->delete('af-total-manufacturer');
        $this->cache->delete('af-total-option');
        $this->cache->delete('af-total-rating');
        $this->cache->delete('af-total-stock-status');
        $this->cache->delete('af-total-tag');
    }

    public function getTabs($active){
        $dir = DIR_APPLICATION.'controller/extension/'.$this->codename.'/*.php';
        $files = glob($dir);
        $result = array('layout');
        foreach($files as $file){
            $name = basename($file, '.php');
            if(!in_array($name, array('setting', 'layout', 'cache'))){
                $result[] = $name;
            }
        }
        $result[] = 'setting';
        return $this->prepareTabs($result, $active);
    }

    public function prepareTabs($tabs, $active){
        $results = array();
        $icons =array('setting'=> 'fa fa-cog', 'layout' => 'fa fa-file');
        foreach ($tabs as $tab) {
            $this->load->language('extension/'.$this->codename.'/'.$tab);

            $module_setting = $this->getModuleSetting($tab);
            if(isset($icons[$tab])){
                $icon = 'fa fa-cog';
            }elseif(isset($module_setting['icon'])){
                $icon = $module_setting['icon'];
            }
            else{
                $icon = 'fa fa-list';
            }

            $results[] = array(
                'title' => $this->language->get('text_title'),
                'active' => ($tab == $active)?true:false,
                'icon' => $icon,
                'href' => $this->url->link('extension/'.$this->codename.'/'.$tab, 'token='.$this->session->data['token'], 'SSL')
                );
        }

        return $results;
    }

    public function getModuleSetting($type){
        $results = array();

        $file = DIR_CONFIG.$this->codename.'/'.$type.'.php';
        
        if (file_exists($file)) {
            $_ = array();

            require($file);

            $results = array_merge($results, $_);
        }

        return $results;
    }

    public function getStores(){
        $this->load->model('setting/store');
        $stores = $this->model_setting_store->getStores();
        $result = array();
        if($stores){
            $result[] = array(
                'store_id' => 0,
                'name' => $this->config->get('config_name')
                );
            foreach ($stores as $store) {
                $result[] = array(
                    'store_id' => $store['store_id'],
                    'name' => $store['name']
                    );
            }
        }
        return $result;
    }

    public function getGroupId(){
        if(VERSION >= '2.0.0.0'){
            $user_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "user WHERE user_id = '" . $this->user->getId() . "'");
            $user_group_id = (int)$user_query->row['user_group_id'];
        }else{
            $user_group_id = $this->user->getGroupId();
        }

        return $user_group_id;
    }
}
?>
