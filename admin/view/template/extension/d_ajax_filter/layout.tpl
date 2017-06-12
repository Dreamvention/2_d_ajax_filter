<?php
/*
*  location: admin/view
*/
?>
<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
    <div class="page-header">
        <div class="container-fluid">
            <div class="form-inline pull-right">
                <button id="save-form" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
                <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a>
            </div>
            <h1><?php echo $heading_title; ?> <?php echo $version; ?></h1>
            <ul class="breadcrumb">
                <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
                <?php } ?>
            </ul>
        </div>
    </div>
    <div class="container-fluid">
        <?php if (!empty($success)) { ?>
        <div class="alert alert-success"><i class="fa fa-exclamation-circle"></i> <?php echo $success; ?>
            <button type="button" class="close" data-dismiss="alert">&times;</button>
        </div>
        <?php } ?>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_form; ?></h3>
            </div>
            <div class="panel-body">
                <div class="d_shopunity_widget_update"></div>
                <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-layout" class="form-horizontal">
                    <?php include DIR_APPLICATION.'view/template/extension/d_ajax_filter/partials/tabs.tpl'; ?>
                    <div class="row">
                        <div class="col-sm-2">
                            <ul class="nav nav-pills s-nav-stacked" id="vertical-tabs">
                                <?php foreach ($layout_tabs as $tab ) { ?>
                                <li><a href="#<?php echo $tab['href']; ?>" data-toggle="tab"><i class="<?php echo $tab['icon']; ?>" aria-hidden="true"></i> <?php echo $tab['title']; ?></a></li>
                                <?php } ?>
                            </ul>
                        </div>
                        <div class="col-sm-10">
                            <div class="tab-content">
                                <div id="home" class="tab-pane">
                                    <div class="row">
                                        <?php if(!empty($modules)) { ?>
                                        <?php foreach ($modules as $module) { ?>
                                        <div class="col-lg-3 col-md-4 col-sm-6">
                                            <div class="tile <?php echo $module['active']?'selected':''; ?>">
                                                <div class="tile-heading clearfix">
                                                    <?php echo $module['name'] ?>
                                                    <div class="pull-right">
                                                        <a id="delete-module" data-toggle="tooltip" data-original-title="<?php echo $button_delete; ?>" data-id="<?php echo $module['module_id']; ?>"><i class="fa fa-times" aria-hidden="true"></i></a>
                                                    </div>
                                                </div>
                                                <div class="tile-body">
                                                    <a href="#" class="view-setting " data-module-id="<?php echo $module['module_id']; ?>">
                                                    </a>
                                                    <a href="<?php echo $module['link']; ?>" class="view-setting " data-setting-id="1" data-toggle="tooltip" title="" data-original-title="Edit checkout setting"><i class="fa fa-pencil"></i></a>
                                                    <div class="pull-right">
                                                        <ul class="layout-list">
                                                            <?php if(!empty($module['layouts'])) { ?>
                                                            <?php foreach ($module['layouts'] as $layout) { ?>
                                                            <li><?php echo $layout['name']; ?></li>
                                                            <?php } ?>
                                                            <?php } else { ?>
                                                            <li><?php echo $text_not_positioned; ?></li>
                                                            <?php } ?>
                                                        </ul>
                                                    </div>
                                                </div>

                                                <div class="tile-footer form-inline clearfix">
                                                    <div class="">
                                                        <?php echo $text_status; ?>
                                                        <div class="input-group pull-right">
                                                            <input type="hidden" name="module_status[<?php echo $module['module_id']; ?>]" value="0" />
                                                            <input type="checkbox" class="form-control switcher" data-size="mini" name="module_status[<?php echo $module['module_id']; ?>]" <?php if($module['setting']['status']) { echo "checked='checked'";}; ?> value="1"/>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <?php } ?>
                                        <?php } ?>
                                        <div class="col-lg-3 col-md-4 col-sm-6">
                                            <div class="tile">
                                                <div class="tile-heading"><?php echo $text_new_setting; ?></div>
                                                <a href="<?php echo $new_module; ?>" id="create_setting" class="create-setting">
                                                    <div class="tile-body">
                                                        <i class="fa fa-plus"></i>
                                                        <h3 class="pull-right"><?php echo $text_create_setting; ?></h3>
                                                    </div>
                                                </a>
                                                <div class="tile-footer"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div id="setting" class="tab-pane">
                                   
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label"
                                        for="input_status"><?php echo $entry_status; ?></label>
                                        <div class="col-sm-10">
                                            <input type="hidden" name="module_setting[status]" value="0" />
                                            <?php if ($twig_support && ($event_support || VERSION > '2.3.0.0')) {?>
                                            <input type="checkbox" class="form-control switcher" data-label-text="<?php echo $text_enabled; ?>"  name="module_setting[status]" <?php if($setting['status']) { echo "checked='checked'";}; ?> value="1" id="input_status"/>
                                            <?php } ?>
                                            <?php if(!$twig_support) { ?>
                                            <div class="alert alert-info" style="overflow: inherit;">
                                                <div class="row">
                                                    <div class="col-md-9"><?php echo $help_twig_support; ?> </div>
                                                    <div class="col-md-3"><a href="<?php echo $install_twig_support; ?>" class="btn btn-info btn-block"><?php echo $text_install_twig_support; ?></a></div>
                                                </div>
                                            </div>
                                            <?php } ?>


                                            <?php if(!$event_support && VERSION < '2.3.0.0') { ?>
                                            <div class="alert alert-info" style="overflow: inherit;">
                                                <div class="row">
                                                    <div class="col-md-9"><?php echo $help_event_support; ?> </div>
                                                    <div class="col-md-3"><a href="<?php echo $install_event_support; ?>" class="btn btn-info btn-block"><?php echo $text_install_event_support; ?></a></div>
                                                </div>
                                            </div>
                                            <?php } ?>
                                        </div>
                                    </div>
                                     <div class="form-group">
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label class="col-sm-4 control-label" for="input_name"><?php echo $entry_name; ?></label>
                                                <div class="col-sm-8">
                                                    <input class="form-control" type="text" name="module_setting[name]" value="<?php echo $setting['name']; ?>" id="input_name" data-error="name"/>
                                                    <?php if (!empty($error['name'])) { ?>
                                                    <div class="text-danger"><?php echo $error['name']; ?></div>
                                                    <?php } ?>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-4 control-label"><?php echo $entry_title; ?></label>
                                                <div class="col-sm-8">
                                                    <?php foreach ($languages as $language) { ?>
                                                    <div class="input-group pull-left" data-error="title<?php echo $language['language_id']; ?>">
                                                        <span class="input-group-addon">
                                                            <img src="<?php echo $language['flag']; ?>" title="<?php echo $language['name']; ?>" alt="<?php echo $language['name']; ?>" /> 
                                                        </span>
                                                        <input type="text" name="module_setting[title][<?php echo $language['language_id']; ?>]" value="<?php echo isset($setting['title'][$language['language_id']]) ? $setting['title'][$language['language_id']] : ''; ?>" placeholder="<?php echo $entry_title; ?>" class="form-control" />
                                                    </div>
                                                    <?php } ?>
                                                </div>
                                            </div>
                                            
                                            
                                            <div class="form-group">
                                                <label class="control-label col-sm-4" for="input_show_mode"><?php echo $entry_show_mode; ?></label>
                                                <div class="col-sm-8">
                                                    <select name="module_setting[show_mode]" class="form-control" id="input_show_mode">
                                                        <?php foreach ($show_modes as $key => $value) { ?>
                                                        <?php if($key == $setting['show_mode']) { ?>
                                                        <option value="<?php echo $key; ?>" selected="selected"><?php echo $value; ?></option>
                                                        <?php } else { ?>
                                                        <option value="<?php echo $key; ?>"><?php echo $value; ?></option>
                                                        <?php } ?>
                                                        <?php } ?>
                                                    </select>
                                                </div>
                                            </div>

                                            <div id="list-categories" class="form-group" style="display: none;">
                                                <label class="control-label col-sm-4" for="input_category"><?php echo $entry_categories; ?></label>
                                                <div class="col-sm-8">
                                                    <div class="well well-sm" style="height: 150px; overflow: auto;">
                                                        <?php foreach ($categories as $key => $value) { ?>
                                                        <div class="checkbox">
                                                            <label>
                                                                <?php if (!empty($setting['categories'])&&in_array($key, $setting['categories'])) { ?>
                                                                <input type="checkbox" name="module_setting[categories][]" value="<?php echo $key; ?>" checked="checked" />
                                                                <?php echo $value; ?>
                                                                <?php } else { ?>
                                                                <input type="checkbox" name="module_setting[categories][]" value="<?php echo $key; ?>" />
                                                                <?php echo $value; ?>
                                                                <?php } ?>
                                                            </label>
                                                        </div>
                                                        <?php } ?>
                                                    </div>
                                                    <a class="well-link well-link-all"><?php echo $text_select_all; ?></a> / <a class="well-link well-link-none"><?php echo $text_unselect_all; ?></a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label class="control-label col-sm-4" for="input_category"><?php echo $entry_layouts; ?></label>
                                                <div class="col-sm-8">
                                                    <div class="well well-sm" style="height: 150px; overflow: auto;">
                                                        <?php foreach ($layouts as $key => $value) { ?>
                                                        <div class="checkbox">
                                                            <label>
                                                                <?php if (in_array($key, $selected_layouts)) { ?>
                                                                <input type="checkbox" name="layout[layouts][]" value="<?php echo $key; ?>" checked="checked" />
                                                                <?php echo $value; ?>
                                                                <?php } else { ?>
                                                                <input type="checkbox" name="layout[layouts][]" value="<?php echo $key; ?>" />
                                                                <?php echo $value; ?>
                                                                <?php } ?>
                                                            </label>
                                                        </div>
                                                        <?php } ?>
                                                    </div>
                                                    <a class="well-link well-link-all"><?php echo $text_select_all; ?></a> / <a class="well-link well-link-none"><?php echo $text_unselect_all; ?></a>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-sm-4" for="input_position"><?php echo $entry_position; ?></label>
                                                <div class="col-sm-8">
                                                    <select name="layout[position]" class="form-control" id="input_position" onchange="$(this).next().val($(this).val());">
                                                        <?php foreach ($positions as $key => $value) { ?>
                                                        <?php if($key == $position) { ?>
                                                        <option value="<?php echo $key; ?>" selected="selected"><?php echo $value; ?></option>
                                                        <?php } else { ?>
                                                        <option value="<?php echo $key; ?>"><?php echo $value; ?></option>
                                                        <?php } ?>
                                                        <?php } ?>
                                                    </select>
                                                    <input type="hidden" name="module_setting[layout_position]" value="<?php echo $position?>" />
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-sm-4" for="input-sort-order"><?php echo $entry_sort_order; ?></label>
                                                <div class="col-sm-8">
                                                    <input type="text" class="form-control" data-error="sort_order" name="layout[sort_order]" value="<?php echo $sort_order; ?>"/>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                                <div id="base_attributes" class="tab-pane">
                                    <table class="table table-base-attribs">
                                        <thead>
                                            <tr>
                                                <td></td>
                                                <td><?php echo $column_name; ?></td>
                                                <td><?php echo $column_status; ?></td>
                                                <td class="col-sm-2"><?php echo $column_type; ?></td>
                                                <td><?php echo $column_sort_order_values; ?></td>
                                                <td><?php echo $column_collapse; ?></td>
                                            </tr>
                                        </thead>
                                        <tbody id="FiltersBody">
                                            <?php foreach ($base_attribs as $key => $value) { ?>
                                            <tr data-sort-order="<?php echo $value['sort_order']; ?>">
                                                <td style="width:1px;">
                                                    <span class="drag-handle"><span class="fa fa-bars fa-fw fa-2x"></span>&nbsp; </span>
                                                    <input type="hidden" class="form-control sort-value" name="module_setting[base_attribs][<?php echo $key; ?>][sort_order]"  value="<?php echo $value['sort_order']; ?>"/>
                                                </td>
                                                <td style="width:200px;"><?php echo $value['name']; ?></td>
                                                <td style="width:120px;" <?php echo !empty($value['status'])?'':"class='disabled-next'"; ?>>
                                                    <input type="hidden" name="module_setting[base_attribs][<?php echo $key; ?>][status]" value="0" />
                                                    <input type="checkbox" class="switcher" data-label-text="<?php echo $text_enabled; ?>" value="1"  name="module_setting[base_attribs][<?php echo $key; ?>][status]" <?php if(!empty($value['status'])) { echo "checked='checked'";}; ?>/>
                                                </td>
                                                <td>
                                                    <?php if(!empty($value['allowed_types'])) { ?>
                                                    <select class="form-control" name="module_setting[base_attribs][<?php echo $key; ?>][type]">
                                                        <?php foreach ($base_types as $base_type_key => $base_type_title) { ?>
                                                        <?php if(in_array($base_type_key, $value['allowed_types'])) {?>
                                                        <?php if($base_type_key == $value['type']) { ?>
                                                        <option value="<?php echo $base_type_key; ?>" selected="selected"><?php echo $base_type_title; ?></option>
                                                        <?php } else { ?>
                                                        <option value="<?php echo $base_type_key; ?>"><?php echo $base_type_title; ?></option>
                                                        <?php } ?>
                                                        <?php } ?>
                                                        <?php } ?>
                                                    </select>
                                                    <?php }?>
                                                </td>
                                                <td>
                                                    <?php if(isset($value['sort_order_values'])) {?>
                                                    <select class="form-control" name="module_setting[base_attribs][<?php echo $key; ?>][sort_order_values]">
                                                        <?php foreach ($sort_order_types as $sort_order_type_key => $sort_order_type_title) { ?>
                                                        <?php if($sort_order_type_key == $value['sort_order_values']) { ?>
                                                        <option value="<?php echo $sort_order_type_key; ?>" selected="selected"><?php echo $sort_order_type_title; ?></option>
                                                        <?php } else { ?>
                                                        <option value="<?php echo $sort_order_type_key; ?>"><?php echo $sort_order_type_title; ?></option>
                                                        <?php } ?>
                                                        <?php } ?>
                                                    </select>
                                                    <?php } ?>
                                                </td>
                                                <td>
                                                    <?php if(isset($value['collapse'])) {?>
                                                    <input type="hidden" name="module_setting[base_attribs][<?php echo $key; ?>][collapse]" value="0" />
                                                    <input type="checkbox" class="switcher" data-label-text="<?php echo $text_enabled; ?>" value="1"  name="module_setting[base_attribs][<?php echo $key; ?>][collapse]" <?php if(!empty($value['collapse'])) { echo "checked='checked'";}; ?>/>
                                                    <?php } ?>
                                                </td>

                                            </tr>
                                            <?php } ?>
                                        </tbody>
                                    </table>
                                </div>
                                <?php foreach ($templates as $value) { ?>
                                <?php echo $value; ?>
                                <?php } ?>
                                <div id="configuration" class="tab-pane">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="control-label col-sm-4"><?php echo $entry_event_filter; ?></label>
                                                <div class="col-sm-8">
                                                    <div class="btn-group" data-toggle="buttons">
                                                        <label class="btn btn-success <?php echo ($setting['submission'] == 0)?'active':''; ?>">
                                                            <input type="radio" name="module_setting[submission]" value="0" <?php echo ($setting['submission'] == 0)?'checked="checked"':''; ?> />
                                                            <?php echo $entry_any_change; ?>
                                                        </label>
                                                        <label class="btn btn-success <?php echo ($setting['submission'] == 1)?'active':''; ?>">
                                                            <input type="radio" name="module_setting[submission]" value="1"<?php echo ($setting['submission'] == 1)?'checked="checked"':''; ?> />
                                                            <?php echo $entry_apply_button; ?>
                                                        </label>
                                                        <label class="btn btn-success <?php echo ($setting['submission'] == 2)?'active':''; ?>">
                                                            <input type="radio" name="module_setting[submission]" value="2" <?php echo ($setting['submission'] == 2)?'checked="checked"':''; ?> />
                                                            <?php echo $entry_several_filter; ?>
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group" id="time-interval" <?php echo ($setting['submission'] != 2)?'style="display:none;"':''; ?>>
                                                <label class="col-sm-4 control-label" for="input_time"><?php echo $entry_time; ?></label>
                                                <div class="col-sm-4">
                                                    <input id="input_time" type="text" name="module_setting[time]" class="form-control" value = "<?php echo $setting['time']; ?>"/>
                                                </div>

                                            </div>
                                            <div class="form-group" id="button-position" <?php echo ($setting['submission'] != 1)?'style="display:none;"':''; ?>>
                                                <label class="col-sm-4 control-label"><?php echo $entry_position_button; ?></label>
                                                <div class="col-sm-8">
                                                    <div class="btn-group" data-toggle="buttons">
                                                        <label class="btn btn-success <?php if ($setting['button_filter_position'] == 0) { ?> active <?php } ?>">
                                                            <input type="radio" name="module_setting[button_filter_position]" value="0" <?php if ($setting['button_filter_position'] == 0) { ?> checked="checked" <?php } ?> />
                                                            <?php echo $text_place_bottom; ?>
                                                        </label>
                                                        <label class="btn btn-success <?php if ($setting['button_filter_position'] == 1) { ?> active <?php } ?>">
                                                            <input type="radio" name="module_setting[button_filter_position]" value="1" <?php if ($setting['button_filter_position'] == 1) { ?> checked="checked" <?php } ?> />
                                                            <?php echo $text_floating_button; ?>
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-4 control-label" for="input_show_selected_filters"><?php echo $entry_show_selected_filters; ?></label>
                                                <div class="col-sm-8">
                                                    <input type="hidden" name="module_setting[selected_filters]" value="0" />
                                                    <input id="input_show_selected_filters" type="checkbox" class="form-control switcher" data-label-text="<?php echo $text_enabled; ?>"  name="module_setting[selected_filters]" <?php if($setting['selected_filters']) { echo "checked='checked'";}; ?> value="1"/>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="col-sm-4 control-label" for="input_button_reset"><?php echo $entry_button_reset; ?></label>
                                                <div class="col-sm-8">
                                                    <input type="hidden" name="module_setting[button_reset]" value="0" />
                                                    <input id="input_button_reset" type="checkbox" class="form-control switcher" data-label-text="<?php echo $text_enabled; ?>"  name="module_setting[button_reset]" <?php if($setting['button_reset']) { echo "checked='checked'";}; ?> value="1"/>
                                                </div>
                                            </div>
                                            
                                            <div class="form-group">
                                                <label class="col-sm-4 control-label"
                                                for="input_status"><?php echo $entry_show_mobile; ?></label>
                                                <div class="col-sm-8">
                                                    <input type="hidden" name="module_setting[show_mobile]" value="0" />
                                                    <input type="checkbox" class="form-control switcher" data-label-text="<?php echo $text_enabled; ?>"  name="module_setting[show_mobile]" <?php if(!empty($setting['show_mobile'])) { echo "checked='checked'";}; ?> value="1" id="input_status"/>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="col-sm-4 control-label" for="input_display_quantity_product"><?php echo $entry_display_quantity_product; ?></label>
                                                <div class="col-sm-8">
                                                    <input type="hidden" name="module_setting[display_quantity]" value="0" />
                                                    <input id="input_display_quantity_product" type="checkbox" class="form-control switcher" data-label-text="<?php echo $text_enabled; ?>"  name="module_setting[display_quantity]" <?php if($setting['display_quantity']) { echo "checked='checked'";}; ?> value="1"/>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-4 control-label" for="input_limit_height"><?php echo $entry_limit_height; ?></label>
                                                <div class="col-sm-4">
                                                    <input type="hidden" name="module_setting[limit_height]" value="0" />
                                                    <input id="input_limit_height" type="checkbox" class="form-control switcher" data-label-text="<?php echo $text_enabled; ?>"  name="module_setting[limit_height]" <?php if($setting['limit_height']) { echo "checked='checked'";}; ?> value="1"/>
                                                </div>

                                            </div>
                                            <div class="form-group" id="limit-height" <?php echo !empty($setting['limit_height'])?'':'style="display:none;"'; ?>>
                                                <label class="control-label col-sm-4" for="input_height"><?php echo $entry_height; ?></label>
                                                <div class="col-sm-4">
                                                    <input id="input_height" type="text" name="module_setting[height]" class="form-control" value = "<?php echo $setting['height']; ?>"/>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="col-sm-4 control-label" for="input_limit_block"><?php echo $entry_limit_block; ?></label>
                                                <div class="col-sm-8">
                                                    <input type="hidden" name="module_setting[limit_block]" value="0" />
                                                    <input id="input_limit_block" type="checkbox" class="form-control switcher" data-label-text="<?php echo $text_enabled; ?>"  name="module_setting[limit_block]" <?php if($setting['limit_block']) { echo "checked='checked'";}; ?> value="1"/>
                                                </div>
                                            </div>
                                            <div id="limit-block" <?php echo !empty($setting['limit_block'])?'':'style="display:none;"'; ?>>
                                                <div class="form-group">
                                                    <label class="col-sm-4 control-label" for="input_count_element"><?php echo $entry_count_element; ?></label>
                                                    <div class="col-sm-8">
                                                        <input id="input_count_element" type="text" name="module_setting[count_elemnts]" class="form-control" value="<?php echo $setting['count_elemnts']; ?>">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-4 control-label" for="input_min_elemnts"><?php echo $entry_min_elemnts; ?></label>
                                                    <div class="col-sm-8">
                                                        <input id="input_min_elemnts" type="text" name="module_setting[min_elemnts]" class="form-control" value="<?php echo $setting['min_elemnts']; ?>">
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                                <div id="af_design" class="tab-pane">
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label" for="input_theme"><?php echo $entry_theme; ?></label>
                                        <div class="col-sm-10">
                                            <select name="module_setting[theme]" id="input_theme" class="form-control">
                                                <?php  foreach( $themes as $theme){ ?>
                                                <?php if($theme == $setting['theme']) { ?>
                                                <option value="<?php echo $theme; ?>" selected="selected"><?php echo $theme; ?></option>
                                                <?php } else { ?>
                                                <option value="<?php echo $theme; ?>"><?php echo $theme; ?></option>
                                                <?php } ?>
                                                <?php } ?>
                                            </select>
                                        </div>
                                    </div>
                                    <div id="custom-theme" <?php echo ($setting['theme'] != 'custom')?'style="display:none;"':''; ?>>
                                        <h3><?php echo $text_header; ?></h3>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="col-sm-2 control-label" for="input_background"><?php echo $entry_background; ?></label>
                                                    <div class="col-sm-10">
                                                        <input type="text" data-name="module_setting[design][header][background]" class="form-control color-picker" value="<?php echo $design['header']['background']; ?>" id="input_background">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="col-sm-2 control-label" for="input_text"><?php echo $entry_text; ?></label>
                                                    <div class="col-sm-10">
                                                        <input type="text" data-name="module_setting[design][header][text]" class="form-control color-picker" value="<?php echo $design['header']['text']; ?>" id="input_text">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <h3><?php echo $text_product_quantity; ?></h3>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="col-sm-2 control-label" for="input_product_quantity_background"><?php echo $entry_background; ?></label>
                                                    <div class="col-sm-10">
                                                        <input type="text" data-name="module_setting[design][product_quantity][background]" class="form-control color-picker" value="<?php echo $design['product_quantity']['background']; ?>" id="input_product_quantity_background">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="col-sm-2 control-label" for="input_product_quantity_text"><?php echo $entry_text; ?></label>
                                                    <div class="col-sm-10">
                                                        <input type="text" data-name="module_setting[design][product_quantity][text]" class="form-control color-picker" value="<?php echo $design['product_quantity']['text']; ?>" id="input_product_quantity_text">

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <h3><?php echo $text_price_slider; ?></h3>
                                        <div class="row">
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label class="col-sm-3 control-label" for="input_price_slider"><?php echo $entry_background; ?></label>
                                                    <div class="col-sm-9">
                                                        <input type="text" data-name="module_setting[design][price_slider][background]" class="form-control color-picker" value="<?php echo $design['price_slider']['background']; ?>" id="input_price_slider">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-3 control-label" for="input_area_background"><?php echo $entry_active_area_background; ?></label>
                                                    <div class="col-sm-9">
                                                        <input type="text" data-name="module_setting[design][price_slider][area_active]" class="form-control color-picker" value="<?php echo $design['price_slider']['area_active']; ?>" id="input_area_background">
                                                    </div>
                                                </div>

                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label class="col-sm-3 control-label" for="input_handle_background"><?php echo $entry_handle_background; ?></label>
                                                    <div class="col-sm-9">
                                                        <input type="text" data-name="module_setting[design][price_slider][handle_background]" class="form-control color-picker" value="<?php echo $design['price_slider']['handle_background']; ?>" id="input_handle_background">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-3 control-label" for="input_handle_border"><?php echo $entry_handle_border; ?></label>
                                                    <div class="col-sm-9">
                                                        <input type="text" data-name="module_setting[design][price_slider][handle_border]" class="form-control color-picker" value="<?php echo $design['price_slider']['handle_border']; ?>" id="input_handle_border">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label class="col-sm-3 control-label" for="input_border"><?php echo $entry_border; ?></label>
                                                    <div class="col-sm-9">
                                                        <input type="text" data-name="module_setting[design][price_slider][border]" class="form-control color-picker" value="<?php echo $design['price_slider']['border']; ?>" id="input_border">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <h3><?php echo $text_group_block_header; ?></h3>
                                        <div class="row">
                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <label class="col-sm-2 control-label" for="input_group_header_background"><?php echo $entry_background; ?></label>
                                                    <div class="col-sm-10">
                                                        <input type="text" data-name="module_setting[design][group_header][background]" class="form-control color-picker" value="<?php echo $design['group_header']['background']; ?>" id="input_group_header_background">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <label class="col-sm-2 control-label" for="input_group_header_text"><?php echo $entry_text; ?></label>
                                                    <div class="col-sm-10">
                                                        <input type="text" data-name="module_setting[design][group_header][text]" class="form-control color-picker" value="<?php echo $design['group_header']['text']; ?>" id="input_group_header_text">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <h3><?php echo $text_button_color; ?></h3>
                                        <div class="row">
                                            <div class="col-sm-4">
                                                <div class="form-group">
                                                    <label class="col-sm-3 control-label" for="input_button_filter"><?php echo $entry_color_button_filter; ?></label>
                                                    <div class="col-sm-9">
                                                        <input type="text" data-name="module_setting[design][button][button_filter]" class="form-control color-picker" value="<?php echo $design['button']['button_filter']; ?>" id="input_button_filter">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-3 control-label" for="input_border_radius_image"><?php echo $entry_border_radius_image; ?></label>
                                                    <div class="col-sm-9">
                                                        <input type="text" data-name="module_setting[design][button][border_radius_image]" class="form-control" value="<?php echo $design['button']['border_radius_image']; ?>" id="input_border_radius_image">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="form-group">
                                                    <label class="col-sm-3 control-label" for="input_border_image"><?php echo $entry_color_border_image; ?></label>
                                                    <div class="col-sm-9">
                                                        <input type="text" data-name="module_setting[design][button][border_image]" class="form-control color-picker" value="<?php echo $design['button']['border_image']; ?>" id="input_border_image">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="form-group">
                                                    <label class="col-sm-3 control-label" for="input_button_reset"><?php echo $entry_color_button_reset; ?></label>
                                                    <div class="col-sm-9">
                                                        <input type="text" data-name="module_setting[design][button][button_reset]" class="form-control color-picker" value="<?php echo $design['button']['button_filter']; ?>" id="input_button_reset">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label" for="input_theme"><?php echo $entry_custom_style; ?></label>
                                        <div class="col-sm-10">
                                            <textarea name="module_setting[custom_style]" id="input_custom_style" class="form-control" rows="5"><?php echo !empty($setting['custom_style'])?$setting['custom_style']:''; ?></textarea>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<template id="template-new-element">
    <tr id="element-{{key}}-{{id}}" data-sort-order="0">
        <td style="max-width: 175px;">{{name}}</td>
        <td class="text-center disabled-next">
            <input type="hidden" name="module_setting[{{key}}][{{id}}][sort_order]" class="sort-value" value="0"/>
            <div class="btn-group" data-toggle="buttons">
                <label class="btn btn-success btn-sm {{#ifCond 'default' setting.status}} active {{/ifCond}}">
                    {{#ifChecked setting.status 'default'}}
                    <input type="radio" name="module_setting[{{key}}][{{id}}][status]" value="default"/>
                    {{/ifChecked}}
                    <?php echo $text_default; ?>
                </label>
                <label class="btn btn-success btn-sm {{#ifCond '1' setting.status}} active {{/ifCond}}">
                    {{#ifChecked setting.status '1'}}
                    <input type="radio" name="module_setting[{{key}}][{{id}}][status]" value="1"/>
                    {{/ifChecked}}
                    <?php echo $text_yes; ?>
                </label>
                <label class="btn btn-success btn-sm {{#ifCond '0' setting.status}} active {{/ifCond}}">
                    {{#ifChecked setting.status '0'}}
                    <input type="radio" name="module_setting[{{key}}][{{id}}][status]" value="0"/>
                    {{/ifChecked}}
                    <?php echo $text_no; ?>
                </label>
            </div>
        </td>
        <td class="text-center">
            <select class="form-control" name="module_setting[{{key}}][{{id}}][type]">
                {{#select setting.type}}
                {{#each base_types as |value key|}}
                <option value="{{key}}">{{value}}</option>
                {{/each}}
                {{/select}}
            </select>

        </td>
        <td class="text-center">
            <input type="hidden" name="module_setting[{{key}}][{{id}}][collapse]" value="0" />
            {{#ifChecked setting.collapse 1}}
            <input type="checkbox" class="form-control switcher" data-label-text="<?php echo $text_enabled; ?>" value="1"  name="module_setting[{{key}}][{{id}}][collapse]" />
            {{/ifChecked}}
        </td>
        <td class="text-center">
            <select class="form-control" name="module_setting[{{key}}][{{id}}][sort_order_values]">
                {{#select setting.sort_order_values}}
                <?php foreach ($sort_order_types as $sort_order_type_key => $sort_order_type_title) { ?>
                <option value="<?php echo $sort_order_type_key; ?>"><?php echo $sort_order_type_title; ?></option>
                <?php } ?>
                {{/select}}
            </select>
        </td>
        <td><a class="delete-element-button" onclick="$(this).closest('tr').remove()"><i class="fa fa-times" aria-hidden="true"></i></a></td>
    </tr>
</template>
<script type="text/javascript">
    $(document).ready(function(){

        $('#vertical-tabs > li:first >a ').trigger('click');

        var setting = {
            form: $("#form-layout"),
            token: '<?php echo $token; ?>'
        };

        var template = {
            'new_element' : $('#template-new-element')
        };

        d_ajax_filter = d_ajax_filter||{};
        d_ajax_filter.init(setting);
        d_ajax_filter.initTemplate(template);
        d_ajax_filter.createSortable('table.table-base-attribs > tbody','tr');

        $(".switcher").bootstrapSwitch({
            'onColor': 'success',
            'onText': '<?php echo $text_yes; ?>',
            'offText': '<?php echo $text_no; ?>',
        });

        $(document).on('change', 'select[name=\'module_setting[show_mode]\']', function(){
            var mode = $(this).val();
            if(mode !== 'all'){
                $('#list-categories').show();
            }
            else{
                $('#list-categories').hide();
            }
        });
        $('select[name="module_setting[show_mode]"]').trigger('change');
        $(document).on('click', '.well-link-all', function(){
            $(this).parent().find(':checkbox').prop('checked', true);
        });
        $(document).on('click', '.well-link-none', function(){
            $(this).parent().find(':checkbox').prop('checked', false);
        });
        $("input.color-picker").ColorPickerSliders({
            size: 'sm',
            placement: 'bottom',
            swatches: false,
            sliders: false,
            hsvpanel: true
        });
        $(document).on('change', "#design input.color-picker", function(){
            $('#input_theme').val('custom');
        });
        $(document).on('change', "[name='module_setting[submission]']:radio", function(){
            var value = $(this).val();

            if(value === '2'){
                $('#time-interval').show();
            }
            else{
                $('#time-interval').hide();
            }

            if(value === '1'){
                $('#button-position').show();
            }
            else{
                $('#button-position').hide();
            }
        });
        $(document).on('switchChange.bootstrapSwitch', '.table-base-attribs input[name$="[status]"]', function(event, state) {
            $(this).closest('td').removeClass('disabled-next');
            if(!state){
                $(this).closest('td').addClass('disabled-next');
            }
        });
        $(document).on('switchChange.bootstrapSwitch', 'input[name="module_setting[limit_height]"]', function(event, state) {
            if(state){
                $('#limit-height').show();
                $('input[type=checkbox][name="module_setting[limit_block]"]').bootstrapSwitch('state', false);
            }
            else{
                $('#limit-height').hide();
            }
        });

        $(document).on('switchChange.bootstrapSwitch', 'input[name="module_setting[limit_block]"]', function(event, state) {
            if(state){
                $('#limit-block').show();
                $('input[type=checkbox][name="module_setting[limit_height]"]').bootstrapSwitch('state', false);
            }
            else{
                $('#limit-block').hide();
            }
        });
        $(document).on('switchChange.bootstrapSwitch', 'input[name="module_setting[status]"]', function(event, state){
            if(state){
                $('.tile.selected input[type=checkbox][name^="module_status"]').bootstrapSwitch('state', true);
            }
            else{
                $('.tile.selected input[type=checkbox][name^="module_status"]').bootstrapSwitch('state', false);
            }
        });

        $(document).on('switchChange.bootstrapSwitch', '.tile.selected input[type=checkbox][name^="module_status"]', function(event, state){
            if(state){
                $('input[type=checkbox][name="module_setting[status]"]').bootstrapSwitch('state', true);
            }
            else{
                $('input[type=checkbox][name="module_setting[status]"]').bootstrapSwitch('state', false);
            }
        });

        $(document).on('click', '#save-form', function(){
            d_ajax_filter.save();
        });

        $(document).on('click', '[id=delete-module]', function(){
            var module_id = $(this).data('id');
            d_ajax_filter.delete(module_id);
        });

        $(document).on('change', '[name="module_setting[theme]"]', function(){
            var value = $(this).val();
            if(value=='custom'){
                $('#custom-theme input, #custom-theme select').each(function(){
                    $(this).attr('name', $(this).data('name'));
                });
                $('#custom-theme').show();

            }
            else{
                $('#custom-theme input, #custom-theme select').each(function(){
                    $(this).removeAttr('name');
                });
                $('#custom-theme').hide();
            }
        });

        $('[name="module_setting[theme]"]').trigger('change');

        $(document).on('change', '[name="module_setting[option_default][status]"]:radio, [name="module_setting[attribute_default][status]"]:radio, [name="module_setting[filter_default][status]"]:radio, [name^="module_setting[options]"][name$="[status]"]:radio, [name^="module_setting[filters]"][name$="[status]"]:radio, [name^="module_setting[attributes]"][name$="[status]"]:radio', function(){
            var value = $(this).val();
            $(this).closest('td').removeClass('disabled-next');
            if(value == 'default' || value == '0'){
                $(this).closest('td').addClass('disabled-next');
            }

        });

        <?php  if(!isset($module_id)) { ?>
            $(document).on('change', '[name^=module_setting]', function(){
                window.onbeforeunload = function(e) {
                    return true;
                };
            });
            
            <?php } ?>

            var d_shopunity_widget_update = jQuery.extend(true, {}, d_shopunity_widget);
            d_shopunity_widget_update.init({
                class: '.d_shopunity_widget_update',
                token: '<?php echo $token; ?>',
                action: 'loadUpdate',
                extension_id: '5'
            })
        });

    </script>
    <?php echo $footer; ?>