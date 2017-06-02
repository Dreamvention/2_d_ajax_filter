<?php

/*
*  location: admin/controller
*/

class ControllerExtensionModuleDAjaxFilter extends Controller
{
    private $codename = 'd_ajax_filter';
    private $route = 'extension/module/d_ajax_filter';
    private $extension = array();
    private $config_file = '';
    private $store_id = 0;
    private $error = array();
    
    public function __construct($registry)
    {
        parent::__construct($registry);
        $this->load->model($this->route);
        
        //extension.json
        $this->extension = json_decode(file_get_contents(DIR_SYSTEM.'mbooth/extension/'.$this->codename.'.json'), true);
        $this->d_shopunity = (file_exists(DIR_SYSTEM.'mbooth/extension/d_shopunity.json'));
        
        //Store_id (for multistore)
        if (isset($this->request->get['store_id'])) { 
            $this->store_id = $this->request->get['store_id'];
        }
    }
    
    public function required(){
        $this->load->language($this->route);
        
        $this->document->setTitle($this->language->get('heading_title_main'));
        $data['heading_title'] = $this->language->get('heading_title_main');
        $data['text_not_found'] = $this->language->get('text_not_found');
        $data['breadcrumbs'] = array();
        
        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');
        
        $this->response->setOutput($this->load->view('error/not_found.tpl', $data));
    }
    
    public function index()
    {

        if(!$this->d_shopunity){
            $this->response->redirect($this->url->link($this->route.'/required', 'codename=d_shopunity&token='.$this->session->data['token'], 'SSL'));
        }

        $this->load->model('d_shopunity/mbooth');
        $this->model_d_shopunity_mbooth->validateDependencies($this->codename);

        $cache_status = $this->{'model_extension_module_'.$this->codename}->checkCache();

        if($cache_status){
            $this->load->controller('extension/'.$this->codename.'/layout');
        }
        else{
            $this->response->redirect($this->url->link('extension/'.$this->codename.'/cache', 'token='.$this->session->data['token'], 'SSL'));
        }
    }

    public function getFileManager() {
        if (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1'))) {
            $data['base'] = HTTPS_CATALOG;
        } else {
            $data['base'] = HTTP_CATALOG;
        }

        $this->load->model('user/user_group');
        $this->model_user_user_group->addPermission($this->{'model_extension_module_'.$this->codename}->getGroupId(), 'access', 'common/d_elfinder');
        $this->model_user_user_group->addPermission($this->{'model_extension_module_'.$this->codename}->getGroupId(), 'modify', 'common/d_elfinder');

        $data['route'] = 'common/d_elfinder';

        $data['token'] = $this->session->data['token'];

        $this->response->setOutput($this->load->view('common/d_elfinder.tpl', $data));
    }

    public function getImage() {
        $this->load->model('tool/image');

        if (isset($this->request->get['image'])) {
            $this->response->setOutput($this->model_tool_image->resize(html_entity_decode($this->request->get['image'], ENT_QUOTES, 'UTF-8'), 100, 100));
        }
    }

    public function install()
    {
        if($this->d_shopunity){
            $this->load->model('d_shopunity/mbooth');
            $this->model_d_shopunity_mbooth->installDependencies($this->codename);
        }
        
        $this->load->model('user/user_group');
        $this->model_user_user_group->addPermission($this->{'model_extension_module_'.$this->codename}->getGroupId(), 'access', 'extension/'.$this->codename);
        $this->model_user_user_group->addPermission($this->{'model_extension_module_'.$this->codename}->getGroupId(), 'access', 'extension/'.$this->codename.'/attribute');
        $this->model_user_user_group->addPermission($this->{'model_extension_module_'.$this->codename}->getGroupId(), 'access', 'extension/'.$this->codename.'/cache');
        $this->model_user_user_group->addPermission($this->{'model_extension_module_'.$this->codename}->getGroupId(), 'access', 'extension/'.$this->codename.'/filter');
        $this->model_user_user_group->addPermission($this->{'model_extension_module_'.$this->codename}->getGroupId(), 'access', 'extension/'.$this->codename.'/layout');
        $this->model_user_user_group->addPermission($this->{'model_extension_module_'.$this->codename}->getGroupId(), 'access', 'extension/'.$this->codename.'/option');
        $this->model_user_user_group->addPermission($this->{'model_extension_module_'.$this->codename}->getGroupId(), 'access', 'extension/'.$this->codename.'/setting');

        $this->model_user_user_group->addPermission($this->{'model_extension_module_'.$this->codename}->getGroupId(), 'modify', 'extension/'.$this->codename);
        $this->model_user_user_group->addPermission($this->{'model_extension_module_'.$this->codename}->getGroupId(), 'modify', 'extension/'.$this->codename.'/attribute');
        $this->model_user_user_group->addPermission($this->{'model_extension_module_'.$this->codename}->getGroupId(), 'modify', 'extension/'.$this->codename.'/cache');
        $this->model_user_user_group->addPermission($this->{'model_extension_module_'.$this->codename}->getGroupId(), 'modify', 'extension/'.$this->codename.'/filter');
        $this->model_user_user_group->addPermission($this->{'model_extension_module_'.$this->codename}->getGroupId(), 'modify', 'extension/'.$this->codename.'/layout');
        $this->model_user_user_group->addPermission($this->{'model_extension_module_'.$this->codename}->getGroupId(), 'modify', 'extension/'.$this->codename.'/option');
        $this->model_user_user_group->addPermission($this->{'model_extension_module_'.$this->codename}->getGroupId(), 'modify', 'extension/'.$this->codename.'/setting');

        $this->{'model_extension_module_'.$this->codename}->CreateDatabase();
    }
    
    public function uninstall()
    {
        $this->{'model_extension_module_'.$this->codename}->DropDatabase();
    }
}