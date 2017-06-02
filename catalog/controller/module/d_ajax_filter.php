<?php
require_once(DIR_APPLICATION.'controller/extension/module/d_ajax_filter.php');
class ControllerModuleDAjaxFilter extends ControllerExtensionModuleDAjaxFilter
{
    protected $codename = 'd_ajax_filter';
    protected $route_url = 'module/d_ajax_filter';
        
    public function __construct($registry)
    {
        parent::__construct($registry);
    }
}