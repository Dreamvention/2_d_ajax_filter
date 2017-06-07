<?php

/*
*  location: admin/controller
*/

class ControllerExtensionDAjaxFilterCache extends Controller
{
    private $codename = 'd_ajax_filter';
    private $route = 'extension/d_ajax_filter/cache';
    private $extension = array();
    private $config_file = '';
    private $store_id = 0;
    private $error = array();
    
    public function __construct($registry)
    {
        parent::__construct($registry);
        $this->load->model($this->route);
        $this->load->language($this->route);
        
        //extension.json
        $this->extension = json_decode(file_get_contents(DIR_SYSTEM.'mbooth/extension/'.$this->codename.'.json'), true);
        $this->d_shopunity = (file_exists(DIR_SYSTEM.'mbooth/extension/d_shopunity.json'));
        
        //Store_id (for multistore)
        if (isset($this->request->get['store_id'])) { 
            $this->store_id = $this->request->get['store_id'];
        }
    }
    public function index()
    {

        // Add more styles, links or scripts to the project is necessary
        $url_params = array();
        $url = '';

        if (isset($this->response->get['store_id'])) {
            $url_params['store_id'] = $this->store_id;
        }

        if (isset($this->response->get['config'])) {
            $url_params['config'] = $this->response->get['config'];
        }

        $url = ((!empty($url_params)) ? '&' : '') . http_build_query($url_params);

        if(isset($this->request->get['filter_option_mode']))

        // Breadcrumbs
        $data['breadcrumbs'] = array();
        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL')
            );
        if(VERSION >= '2.3.0.0'){
            $breadcrumb_link = $this->url->link('extension/extension', 'token=' . $this->session->data['token'].'&type=module', 'SSL');
        }
        else{
            $breadcrumb_link = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');
        }
        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_module'),
            'href' => $breadcrumb_link
            );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title_main'),
            'href' => $this->url->link($this->route, 'token=' . $this->session->data['token'] . $url, 'SSL')
            );

        $this->document->setTitle($this->language->get('heading_title_main'));
        $data['heading_title'] = $this->language->get('heading_title_main');
        $data['text_edit'] = $this->language->get('text_edit');
        $data['text_list'] = $this->language->get('text_list');
        $data['text_sort_values'] = $this->language->get('text_sort_values');
        $data['text_image'] = $this->language->get('text_image');
        $data['text_form'] = $this->language->get('text_form');
        $data['text_installation_progress'] = $this->language->get('text_installation_progress');

        $data['button_cancel'] = $this->language->get('button_cancel');

        // Variable
        $data['id'] = $this->codename;
        $data['route'] = $this->route;
        $data['store_id'] = $this->store_id;
        $data['extension'] = $this->extension;
        $data['config'] = $this->config_file;

        $data['version'] = $this->extension['version'];
        $data['token'] = $this->session->data['token'];

        $url = '';

        if(isset($this->request->get['module_id'])){
            $url .= '&module_id='.$this->request->get['module_id'];
        }

        $data['create_cache'] = str_replace('&amp;', '&', $this->url->link('extension/'.$this->codename.'/cache/createCache', 'token='.$this->session->data['token'], 'SSL'));

        $data['create_complete'] =  str_replace('&amp;', '&', $this->url->link('extension/module/'.$this->codename, 'token='.$this->session->data['token'].$url, 'SSL'));

        if(VERSION>='2.3.0.0'){
            $data['cancel'] = $this->url->link('extension/extension', 'token='.$this->session->data['token'].'&type=module', 'SSL');
        }
        else
        {
            $data['cancel'] = $this->url->link('extension/module', 'token='.$this->session->data['token'], 'SSL');
        }

        $this->{'model_extension_'.$this->codename.'_cache'}->checkCache();

        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');
        $this->response->setOutput($this->load->view($this->route.'.tpl', $data));
    }

    public function createCache(){

        $json = $this->{'model_extension_'.$this->codename.'_cache'}->createCache();

        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
    }

    public function model_updateProduct(&$route, &$data, &$output){
        if(!empty($output)){
            $json = $this->{'model_extension_'.$this->codename.'_cache'}->updateProduct($output);
        }
        else{
            $json = $this->{'model_extension_'.$this->codename.'_cache'}->updateProduct($data[0]);
        }
    }
}
