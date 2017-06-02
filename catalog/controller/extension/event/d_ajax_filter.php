<?php
class ControllerExtensionEventDAjaxFilter extends Controller {

    private $codename = 'd_ajax_filter';
    private $route = 'extension/module/d_ajax_filter';
    
    private $route_model = '';
    private $common_setting;

    public function __construct($registry)
    {
        parent::__construct($registry);
        if(!empty($this->request->get['ajax'])){
            return ;
        }
        $this->load->model($this->route);
        $this->load->model('setting/setting');
        $common_setting = $this->model_setting_setting->getSetting($this->codename);

        if(empty($common_setting[$this->codename.'_setting'])){
            $this->config->load('d_ajax_filter');
            $setting = $this->config->get('d_ajax_filter_setting');

            $common_setting = $setting['general'];
        }
        else{
            $common_setting = $common_setting[$this->codename.'_setting'];
        }
        
        $this->common_setting = $common_setting;
    }

    public function view_before(&$route, &$data, &$output){
        if(isset($this->request->get['ajax'])){
            $data['header'] = $data['column_left'] = $data['column_right'] = $data['content_top'] = $data['content_bottom'] = $data['footer'] = '';
        }
        $data['content_top'] .= '<div id="ajax-filter-container">';
        $data['content_bottom'] = '</div>' . $data['content_bottom'];

        $url = '&'.$this->{'model_extension_module_'.$this->codename}->getUrlParams();
        
        if(!empty($data['pagination'])){
            $data['pagination'] = preg_replace('/&amp;page=/i', $url.'&amp;page=', $data['pagination']);
            $data['pagination'] = preg_replace('/&page=/i', $url.'&page=', $data['pagination']);
            $data['pagination'] = preg_replace('/\?page=/i', '?'.$url.'&page=', $data['pagination']);
        }

        if(!empty($data['sorts'])){
            foreach ($data['sorts'] as $key => $sort) {
                $data['sorts'][$key]['href'] .= $url;
            }
        }

        if(!empty($data['limits'])){
            foreach ($data['limits'] as $key => $limit) {
                $data['limits'][$key]['href'] .= $url;
            }
        }
    }

    public function model_getProducts_before(&$route, &$data){
        if(isset($data[0])){
            if($this->common_setting['display_sub_category']){
                $data[0]['filter_sub_category'] = true;
            }
            else{
                $data[0]['filter_sub_category'] = false;
            }
        }
    }
}