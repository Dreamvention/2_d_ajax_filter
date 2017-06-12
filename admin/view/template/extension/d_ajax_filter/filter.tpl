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
        <?php if (!empty($error['warning'])) { ?>
        <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error['warning']; ?>
            <button type="button" class="close" data-dismiss="alert">&times;</button>
        </div>
        <?php } ?>
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
                <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-filters" class="form-horizontal">
                    <?php include DIR_APPLICATION.'view/template/extension/d_ajax_filter/partials/tabs.tpl'; ?>
                    <div class="col-sm-2">
                        <ul class="nav nav-pills s-nav-stacked">
                            <li class="active">
                                <a href="#d_list_filter" data-toggle="tab">
                                    <span class="fa fa-list fa-fw"></span> <span><?php echo $text_list; ?></span>
                                </a>
                            </li>
                            <li>
                                <a href="#d_filter_image" data-toggle="tab">
                                    <i class="fa fa-file-image-o fa-fw"></i> <span><?php echo $text_image; ?></span>
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div class="col-sm-10">
                        <div class="tab-content">
                            <div id="d_list_filter" class="tab-pane active">
                                <div class="form-group">
                                    <div class="h3 header-title"><?php echo $text_general_filter_setting; ?></div>
                                    <p>
                                        <?php echo $text_filter_default_general; ?>
                                    </p>
                                    <div>
                                        <div class="btn-group" data-toggle="buttons">
                                            <label class="btn btn-success <?php echo ($setting['default']['status'] == '1')?'active':''; ?>">
                                                <input type="radio" name="<?php echo $codename; ?>_filters[default][status]" value="1"<?php echo ($setting['default']['status'] == 1)?'checked="checked"':''; ?> />
                                                <?php echo $text_on; ?>
                                            </label>
                                            <label class="btn btn-success <?php echo ($setting['default']['status'] == '0')?'active':''; ?>">
                                                <input type="radio" name="<?php echo $codename; ?>_filters[default][status]" value="0" <?php echo ($setting['default']['status'] == 0)?'checked="checked"':''; ?> />
                                                <?php echo $text_off; ?>
                                            </label>
                                        </div>
                                    </div>

                                    <div class="container-fluid" id="filter-default-setting" <?php echo in_array($setting['default']['status'], array('default', '0'))?'style="display:none;"':''; ?>>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="control-label col-sm-2"><?php echo $entry_type; ?></label>
                                                    <div class="col-sm-10">
                                                        <select class="form-control" name="<?php echo $codename; ?>_filters[default][type]">
                                                            <?php foreach ($base_types as $base_type_key => $base_type_title) { ?>
                                                            <?php if($base_type_key == $setting['default']['type']) { ?>
                                                            <option value="<?php echo $base_type_key; ?>" selected="selected"><?php echo $base_type_title; ?></option>
                                                            <?php } else { ?>
                                                            <option value="<?php echo $base_type_key; ?>"><?php echo $base_type_title; ?></option>
                                                            <?php } ?>
                                                            <?php } ?>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-sm-2"><?php echo $entry_collapse; ?></label>
                                                    <div class="col-sm-10">
                                                        <input type="hidden" name="<?php echo $codename; ?>_filters[default][collapse]" value="0" />
                                                        <input type="checkbox" class="form-control switcher" data-label-text="<?php echo $text_enabled; ?>" value="1"  name="<?php echo $codename; ?>_filters[default][collapse]" <?php  echo ($setting['default']['collapse'])? "checked='checked'":'';?>/>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="control-label col-sm-2"><?php echo $entry_sort_order_values; ?></label>
                                                    <div class="col-sm-10">
                                                        <select class="form-control" name="<?php echo $codename; ?>_filters[default][sort_order_values]">
                                                            <?php foreach ($sort_order_types as $sort_order_type_key => $sort_order_type_title) { ?>
                                                            <?php if($sort_order_type_key == $setting['default']['sort_order_values']) { ?>
                                                            <option value="<?php echo $sort_order_type_key; ?>" selected="selected"><?php echo $sort_order_type_title; ?></option>
                                                            <?php } else { ?>
                                                            <option value="<?php echo $sort_order_type_key; ?>"><?php echo $sort_order_type_title; ?></option>
                                                            <?php } ?>
                                                            <?php } ?>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="h3 header-title"><?php echo $text_individual_filter_setting; ?></div>
                                    <p>
                                        <?php echo $text_warning_filter_individual; ?>
                                    </p>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="input-group">
                                                <input type="text" class="form-control" name="select_filter_name"/>
                                                <input type="hidden" name="select_filter_group_id"/>
                                                <span class="input-group-btn">
                                                    <a id="add-filter" class="btn btn-default"><i class="fa fa-plus"></i></a>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                    <br/>
                                    <br/>
                                    <table class="table table-filter-select <?php echo empty($setting['filters'])?'hide':''; ?>">
                                        <thead>
                                            <tr>
                                                <td></td>
                                                <td class="text-center"><?php echo $column_status; ?></td>
                                                <td class="text-center"><?php echo $column_type; ?></td>
                                                <td class="text-center"><?php echo $column_collapse; ?></td>
                                                <td class="text-center"><?php echo $column_sort_order_values; ?></td>
                                                <td></td>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php if(!empty($setting['filters'])) { ?>
                                            <?php foreach ($setting['filters'] as $filter_group_id => $filter) { ?>
                                            <tr id="element-filters-<?php echo $filter_group_id; ?>" data-sort-order="<?php echo $filter['sort_order'] ?>">
                                                <td style="max-width: 175px;"><?php echo $filter['name']; ?></td>
                                                <td class="text-center <?php echo in_array($filter['status'], array('default', '0'))?'disabled-next':''; ?>">
                                                    <input type="hidden" name="<?php echo $codename; ?>_filters[filters][<?php echo $filter_group_id; ?>][sort_order]"  class="sort-value" value="<?php echo $filter['sort_order'] ?>"/>
                                                    <div class="btn-group" data-toggle="buttons">
                                                        <label class="btn btn-success btn-sm <?php echo ($filter['status'] == '1')?'active':''; ?>">
                                                            <input type="radio" name="<?php echo $codename; ?>_filters[filters][<?php echo $filter_group_id; ?>][status]" value="1"<?php echo ($filter['status'] == 1)?'checked="checked"':''; ?> />
                                                            <?php echo $text_yes; ?>
                                                        </label>
                                                        <label class="btn btn-success btn-sm <?php echo ($filter['status'] == '0')?'active':''; ?>">
                                                            <input type="radio" name="<?php echo $codename; ?>_filters[filters][<?php echo $filter_group_id; ?>][status]" value="0" <?php echo ($filter['status'] == 0)?'checked="checked"':''; ?> />
                                                            <?php echo $text_no; ?>
                                                        </label>
                                                    </div>
                                                </td>
                                                <td class="text-center">
                                                    <select class="form-control" name="<?php echo $codename; ?>_filters[filters][<?php echo $filter_group_id; ?>][type]">
                                                        <?php foreach ($base_types as $base_type_key => $base_type_title) { ?>
                                                        <?php if($base_type_key == $filter['type']) { ?>
                                                        <option value="<?php echo $base_type_key; ?>" selected="selected"><?php echo $base_type_title; ?></option>
                                                        <?php } else { ?>
                                                        <option value="<?php echo $base_type_key; ?>"><?php echo $base_type_title; ?></option>
                                                        <?php } ?>
                                                        <?php } ?>
                                                    </select>
                                                </td>
                                                <td class="text-center">
                                                    <input type="hidden" name="<?php echo $codename; ?>_filters[filters][<?php echo $filter_group_id; ?>][collapse]" value="0" />
                                                    <input type="checkbox" class="form-control switcher" data-label-text="<?php echo $text_enabled; ?>" value="1"  name="<?php echo $codename; ?>_filters[filters][<?php echo $filter_group_id; ?>][collapse]" <?php  echo ($filter['collapse'])? "checked='checked'":'';?>/>
                                                </td>
                                                <td class="text-center">
                                                    <select class="form-control" name="<?php echo $codename; ?>_filters[filters][<?php echo $filter_group_id; ?>][sort_order_values]">
                                                        <?php foreach ($sort_order_types as $sort_order_type_key => $sort_order_type_title) { ?>
                                                        <?php if($sort_order_type_key == $filter['sort_order_values']) { ?>
                                                        <option value="<?php echo $sort_order_type_key; ?>" selected="selected"><?php echo $sort_order_type_title; ?></option>
                                                        <?php } else { ?>
                                                        <option value="<?php echo $sort_order_type_key; ?>"><?php echo $sort_order_type_title; ?></option>
                                                        <?php } ?>
                                                        <?php } ?>
                                                    </select>
                                                </td>
                                                <td><a class="delete-element-button" onclick="$(this).closest('tr').remove()"><i class="fa fa-times" aria-hidden="true"></i></a></td>
                                            </tr>
                                            <?php } ?>
                                            <?php } ?>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div id="d_filter_image" class="tab-pane">
                                <div class="bs-callout bs-callout-info">
                                    <?php echo $text_warning_image_filter; ?>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-sm-1"><?php echo $entry_filter; ?></label>
                                    <div class="col-sm-2">
                                        <select class="form-control" name="filter_languages">
                                            <?php foreach($languages as $language){?>
                                            <option value="<?php echo $language['language_id']; ?>">
                                                <?php echo $language['name']; ?>
                                            </option>
                                            <?php } ?>
                                        </select>
                                    </div>
                                    <div class="col-sm-2">
                                        <select class="form-control" name="filter_groups_images">
                                            <option value="*"><?php echo $text_none; ?></option>
                                        </select>
                                    </div>
                                    <div class="col-sm-2" id="filter_group_image">
                                        <a class="btn btn-primary" id="saveFilterImages" data-toggle="tooltip" data-original-title="<?php echo $button_save; ?>" style="display: none;"><i class="fa fa-save" aria-hidden="true"></i></a>
                                        <a class="btn btn-danger" id="reset_image_filter_group" data-toggle="tooltip" data-original-title="<?php echo $button_reset_image; ?>" style="display: none;"><i class="fa fa-repeat" aria-hidden="true"></i></a>
                                    </div>
                                </div>
                                <div id="filter_images">

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
            <input type="hidden" name="<?php echo $codename; ?>_filters[{{key}}][{{id}}][sort_order]" value="0" class="sort-value"/>
            <div class="btn-group" data-toggle="buttons">
                <label class="btn btn-success btn-sm">
                    <input type="radio" name="<?php echo $codename; ?>_filters[{{key}}][{{id}}][status]" value="1"/>
                    <?php echo $text_yes; ?>
                </label>
                <label class="btn btn-success btn-sm active">
                    <input type="radio" name="<?php echo $codename; ?>_filters[{{key}}][{{id}}][status]" value="0"  checked="checked" />
                    <?php echo $text_no; ?>
                </label>
            </div>
        </td>
        <td class="text-center">
            <select class="form-control" name="<?php echo $codename; ?>_filters[{{key}}][{{id}}][type]">
                {{#select 'checkbox'}}
                <?php foreach ($base_types as $base_type_key => $base_type_title) { ?>
                <option value="<?php echo $base_type_key; ?>"><?php echo $base_type_title; ?></option>
                <?php } ?>
                {{/select}}
            </select>
            
        </td>
        <td class="text-center">
            <input type="hidden" name="<?php echo $codename; ?>_filters[{{key}}][{{id}}][collapse]" value="0" />
            <input type="checkbox" class="form-control switcher" data-label-text="<?php echo $text_enabled; ?>" value="1"  name="<?php echo $codename; ?>_filters[{{key}}][{{id}}][collapse]" checked='checked'/>
        </td>
        <td class="text-center">
            <select class="form-control" name="<?php echo $codename; ?>_filters[{{key}}][{{id}}][sort_order_values]">
                {{#select 'default'}}
                <?php foreach ($sort_order_types as $sort_order_type_key => $sort_order_type_title) { ?>
                <option value="<?php echo $sort_order_type_key; ?>"><?php echo $sort_order_type_title; ?></option>
                <?php } ?>
                {{/select}}
            </select>
        </td>
        <td><a class="delete-element-button" onclick="$(this).closest('tr').remove()"><i class="fa fa-times" aria-hidden="true"></i></a></td>
    </tr>
</template>
<template id="template-select-option">
    {{#values}}
    <option value="{{id}}">{{name}}</option>
    {{/values}}
</template>
<template id="template-filemanager">
    <div id="modal-image" class="modal">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">X</button>
                    <h4 class="modal-title"><?php echo $text_file_manager; ?></h4>
                </div>
                <div class="modal-body">
                    <iframe src="index.php?route=extension/module/d_ajax_filter/getFileManager&token=<?php echo $token; ?>&field={{field}}&thumb={{thumb}}" style="padding:0; margin: 0; display: block; width: 100%; height: 560px;" frameborder="no" scrolling="no"></iframe>
                </div>
                <div class="modal-footer"></div>
            </div>
        </div>
    </div>
</template>
<script type="text/html" id="template-filter-images">
    <table id="images" class="table table-striped table-bordered table-hover">
        <thead>
            <tr>
                <td class="text-left"><?php echo $entry_additional_image; ?></td>
                <td class="text-left"><?php echo $entry_filter_value; ?></td>
            </tr>
        </thead>
        <tbody>
            {{#values}}
            <tr id="image-row{{filter_id}}">

                <td class="text-left">

                    <input type="hidden" name="filter_images[{{filter_id}}][image]" value="{{image}}" id="input-image-{{filter_id}}" />
                    <img id="thumb-image-{{filter_id}}" src="{{thumb}}"  class="img-thumbnail" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /><span class="fa fa-close fa-fw delete-image"></span>

                </td>
                <td>{{text}}</td>
            </tr>
            {{/values}}
        </tbody>
    </table>
</script>
<script type="text/javascript">
    $(document).ready(function(){
        var setting = {
            form: $("#form-filters"),
            token: '<?php echo $token; ?>'
        };

        var template = {
            'new_element' : $('#template-new-element'),
            'options': $("#template-select-option"),
            'filemanager': $("#template-filemanager"),
            'filter_images': $("#template-filter-images")
        };

        d_ajax_filter = d_ajax_filter||{};
        d_ajax_filter.init(setting);
        d_ajax_filter.initTemplate(template);

        d_ajax_filter.createSortable('table.table-filter-select > tbody','tr');

        $(document).on('click', '#add-attribute', function(){
            var attribute_id = $('input[name="select_attribute_id"]').val();
            var attribute_name = $('input[name="select_attribute_name"]').val();
            d_ajax_filter.addAttribute(attribute_id, attribute_name);
            $(".switcher").bootstrapSwitch({
                'onColor': 'success',
                'onText': '<?php echo $text_yes; ?>',
                'offText': '<?php echo $text_no; ?>',
            });
        });
        $(".switcher").bootstrapSwitch({
            'onColor': 'success',
            'onText': '<?php echo $text_yes; ?>',
            'offText': '<?php echo $text_no; ?>',
        });
        $(document).on('change', '[name="<?php echo $codename; ?>_filters[default][status]"]:radio, [name^="<?php echo $codename; ?>_filters[filters]"][name$="[status]"]:radio', function(){
            var value = $(this).val();
            $(this).closest('td').removeClass('disabled-next');
            if(value == 'default' || value == '0'){
                $(this).closest('td').addClass('disabled-next');
            }

        });
        $(document).on('click', '#save-form', function(){
            d_ajax_filter.save();
        });
        $('[name="select_filter_name"]').autocomplete({
            'source': function(request, response) {
                $.ajax({
                    url: 'index.php?route=extension/d_ajax_filter/filter/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
                    dataType: 'json',
                    success: function(json) {
                        response($.map(json, function(item) {
                            return {
                                label: item['name'],
                                value: item['filter_group_id']
                            }
                        }));
                    }
                });
            },
            'select': function(item) {
                $('input[name=\'select_filter_name\']').val(item['label']);
                $('input[name=\'select_filter_group_id\']').val(item['value']);
            }
        });
        $(document).on('click', '#add-filter', function(){
            var filter_group_id = $('input[name="select_filter_group_id"]').val();
            var filter_name = $('input[name="select_filter_name"]').val();
            if(filter_group_id !== ''){
                $('.table-filter-select').removeClass('hide');
                d_ajax_filter.addFilter(filter_group_id, filter_name);
                d_ajax_filter.updateSortOrder('table.table-filter-select > tbody','tr');
                $(".switcher").bootstrapSwitch({
                    'onColor': 'success',
                    'onText': '<?php echo $text_yes; ?>',
                    'offText': '<?php echo $text_no; ?>',
                });
            }
        });
        $(document).on('change','select[name=filter_languages]',function(){

            var language_id = $(this).val();
            
            $('select[name="filter_groups_images"] > option[value!="*"]').remove();
            d_ajax_filter.clearFilterImages();
            d_ajax_filter.renderFilterGroups(language_id,'select[name=filter_groups_images]');
        });
        $(document).on('click','select[name=filter_groups_images]',function(){
            var filter_group_id = $(this).val();
            var language_id = $('select[name=filter_languages]').val();
            if(filter_group_id != '*')
            {
                d_ajax_filter.renderFilterImages(filter_group_id, language_id);
            }
            else{
                d_ajax_filter.clearFilterImages();
            }
        });
        $(document).on('click','a#saveFilterImages',function(){
            var language_id = $('select[name=filter_languages]').val();

            d_ajax_filter.saveFitlerImages(language_id);
        });
        $(document).on('click', 'a#reset_image_filter_group', function(){
            d_ajax_filter.resetImageFilter();
        });
        $('select[name="filter_languages"]').trigger('change');
        $(document).on('change', '[name=\'<?php echo $codename; ?>_filters[default][status]\']', function(e){
            if($(this).val() != '1'){
                $('#filter-default-setting').slideUp();
            }
            else{
                $('#filter-default-setting').slideDown();
            }
        });
    });
function addSingleImage(imageName, field, thumb) {
    $.ajax({
        url: 'index.php?route=extension/module/d_ajax_filter/getImage&token=<?php echo $token; ?>&image=' + encodeURIComponent(imageName),
        dataType: 'text',
        success: function(imageCacheName) {
            $('#' + thumb).attr('src', imageCacheName);
            $('#' + field).val(imageName).trigger('change');
        }
    });
}
</script>
<?php echo $footer; ?>