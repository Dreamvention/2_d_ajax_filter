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
                <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-setting" class="form-horizontal">
                    <?php include DIR_APPLICATION.'view/template/extension/d_ajax_filter/partials/tabs.tpl'; ?>
                    <div class="bs-callout bs-callout-info">
                        <h4><?php echo $text_important; ?></h4>
                        <?php echo $text_warning_genaral_setting; ?>
                    </div>
                    <div class="row">
                        <div class="col-sm-2">
                            <ul class="nav nav-pills s-nav-stacked">

                                <li class="active"><a href="#general" data-toggle="tab"><i class="fa fa-cog" aria-hidden="true"></i> <?php echo $text_tab_general; ?></a></li>
                                <li><a href="#custom_script" data-toggle="tab"><i class="fa fa-edit" aria-hidden="true"></i> <?php echo $text_tab_custom_script; ?></a></li>
                            </ul>
                        </div>
                        <div class="col-sm-10">
                            <div class="tab-content">
                                <div id="general" class="tab-pane active">

                                    <div class="row">
                                        <div class='col-sm-6'>
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label" for="input_recreate_cache"><?php echo $entry_recreate_cache; ?></label>
                                                <div class="col-sm-10">
                                                    <div class="bs-callout bs-callout-info">
                                                        <h4><?php echo $text_important; ?></h4>
                                                        <?php echo $text_warning_recrate_cache; ?>
                                                    </div>
                                                    <a href="<?php echo $recreate_cache; ?>" class="btn btn-primary"><?php echo $button_recreate_cache; ?></a>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label" for="input_ajax"><?php echo $entry_ajax; ?></label>
                                                <div class="col-sm-10">
                                                    <input type="hidden" name="<?php echo $codename; ?>_setting[ajax]" value="0" />
                                                    <input type="checkbox" class="form-control switcher" data-label-text="<?php echo $text_enabled; ?>"  name="<?php echo $codename; ?>_setting[ajax]" <?php if($setting['ajax']) { echo "checked='checked'";}; ?> value="1" id="input_ajax"/>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label" for="input_fade_out_product"><?php echo $entry_fade_out_product; ?></label>
                                                <div class="col-sm-10">
                                                    <input type="hidden" name="<?php echo $codename; ?>_setting[fade_out_product]" value="0" />
                                                    <input id="input_fade_out_product" type="checkbox" class="form-control switcher" data-label-text="<?php echo $text_enabled; ?>"  name="<?php echo $codename; ?>_setting[fade_out_product]" <?php if($setting['fade_out_product']) { echo "checked='checked'";}; ?> value="1"/>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label" for="input_display_loader"><?php echo $entry_display_loader; ?></label>
                                                <div class="col-sm-10">
                                                    <input type="hidden" name="<?php echo $codename; ?>_setting[display_loader]" value="0" />
                                                    <input id="input_display_loader" type="checkbox" class="form-control switcher" data-label-text="<?php echo $text_enabled; ?>"  name="<?php echo $codename; ?>_setting[display_loader]" <?php if($setting['display_loader']) { echo "checked='checked'";}; ?> value="1"/>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label" for="input_content_path"><?php echo $entry_contant_path; ?></label>
                                                <div class="col-sm-10">
                                                    <input type="text" class="form-control" name="<?php echo $codename; ?>_setting[content_path]" value="<?php echo $setting['content_path']; ?>" id="input_content_path"/>
                                                </div>
                                            </div>
                                        </div>
                                        <div class='col-sm-6'>
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label" for="input_display_out_of_stock"><?php echo $entry_display_out_of_stock; ?></label>
                                                <div class="col-sm-10">
                                                    <input type="hidden" name="<?php echo $codename; ?>_setting[display_out_of_stock]" value="0" />
                                                    <input type="checkbox" class="form-control switcher" data-label-text="<?php echo $text_enabled; ?>"  name="<?php echo $codename; ?>_setting[display_out_of_stock]" <?php if($setting['display_out_of_stock']) { echo "checked='checked'";}; ?> value="1" id="input_display_out_of_stock"/>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label" for="input_display_sub_category"><?php echo $entry_display_sub_category; ?></label>
                                                <div class="col-sm-10">
                                                    <input type="hidden" name="<?php echo $codename; ?>_setting[display_sub_category]" value="0" />
                                                    <input type="checkbox" class="form-control switcher" data-label-text="<?php echo $text_enabled; ?>"  name="<?php echo $codename; ?>_setting[display_sub_category]" <?php if($setting['display_sub_category']) { echo "checked='checked'";}; ?> value="1" id="input_display_sub_category"/>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-sm-2" for="input_in_stock_status"><?php echo $entry_in_stock_status; ?></label>
                                                <div class="col-sm-10">
                                                    <select class="form-control" name="<?php echo $codename; ?>_setting[in_stock_status]" id="input_in_stock_status">
                                                        <?php foreach ($stock_statuses as $value) { ?>
                                                        <?php if($value['stock_status_id'] == $setting['in_stock_status']) { ?>
                                                        <option value="<?php echo $value['stock_status_id']; ?>" selected="selected"><?php echo $value['name']; ?></option>
                                                        <?php } else { ?>
                                                        <option value="<?php echo $value['stock_status_id']; ?>"><?php echo $value['name']; ?></option>
                                                        <?php } ?>
                                                        <?php } ?>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="bs-callout bs-callout-info">
                                                <h4><?php echo $text_important; ?></h4>
                                                <?php echo $text_warning_multiple_value; ?>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label" for="input_multiple_attributes_value"><?php echo $entry_multiple_attributes_value; ?></label>
                                                <div class="col-sm-10">
                                                    <input type="hidden" name="<?php echo $codename; ?>_setting[multiple_attributes_value]" value="0" />
                                                    <input id="input_multiple_attributes_value" type="checkbox" class="form-control switcher" data-label-text="<?php echo $text_enabled; ?>"  name="<?php echo $codename; ?>_setting[multiple_attributes_value]" <?php if($setting['multiple_attributes_value']) { echo "checked='checked'";}; ?> value="1"/>
                                                </div>
                                            </div>
                                            <div class="form-group" id="separator" <?php echo $setting['multiple_attributes_value']?'':'style="display:none;"'; ?>>
                                                <label class="col-sm-2 control-label" for="input_separator"><?php echo $entry_separator; ?></label>
                                                <div class="col-sm-2">
                                                    <input id="input_separator" type="text" name="<?php echo $codename; ?>_setting[separator]" class="form-control" value = "<?php echo $setting['separator']; ?>"/>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div id="custom_script" class="tab-pane">
                                    <textarea name="<?php echo $codename; ?>_setting[custom_script]" id="input_custom_script" class="form-control" rows="20"><?php echo !empty($setting['custom_script'])?$setting['custom_script']:''; ?></textarea>
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
<script type="text/javascript">
    $(document).ready(function(){
        $(".switcher").bootstrapSwitch({
            'onColor': 'success',
            'onText': '<?php echo $text_yes; ?>',
            'offText': '<?php echo $text_no; ?>'
        });

        $(document).on('switchChange.bootstrapSwitch', 'input[type=checkbox][name$="[multiple_attributes_value]"]', function(event, state) {

            if(state){
                $('#separator').show();
            }
            else{
                $('#separator').hide();
            }
        });

        $(document).on('click', '#save-form', function(){
            $.ajax({
                url:$('#form-setting').attr('action'),
                type:'post',
                dataType:'json',
                data: $('#form-setting').serializeJSON(),
                beforeSend:function(){
                 $('#form-setting').fadeTo('slow', 0.5);
             },
             success:function(json){
                $('.form-group.has-error').removeClass('has-error');
                $('.form-group .text-danger').remove();
                $('.alert').remove();
                if(json['success']){
                    location.href = json['redirect'];
                }
                if(json['error']){
                    for (var key in json['errors']){
                        $('[data-error="'+key+'"]').after('<div class="text-danger">'+json['errors'][key]+'</div>');
                        $('[data-error="'+key+'"]').closest('.form-group').addClass('has-error');
                    }
                    $('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> '+json['error']+'<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
                }
            },
            complete:function(){
                $('#form-setting').fadeTo('slow', 1);
            }
        });
        });
    })

</script>