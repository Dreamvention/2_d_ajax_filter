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
                <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form" class="form-horizontal">
                    <div class="text-center"><?php echo $text_installation_progress; ?></div>
                    <div class="progress">
                        <div id="progress-create-cache" class="progress-bar progress-bar-info progress-bar-striped active" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 0%">
                            <span class="sr-only"></span>
                        </div>
                    </div>.
                    <div class="progress-info text-center"></div>
                </form>  
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(document).ready(function(){
        function update(data){
            var text_progress = 'Step: '+data.step+'/'+data.steps+', Progress:'+data.progress+' - 100%';
            $('.progress-info').text(text_progress);
            $('#progress-create-cache').attr('style', 'width:'+data.progress+'%');
        }
        function install(){
            $.ajax({
                url:'<?php echo $create_cache; ?>',
                dataType:'json',
                type:'post',
                success:function(json){
                    update(json);
                    if(json['success']){
                        location.href='<?php echo $create_complete; ?>';
                    }
                    else{
                        install();
                    }

                }
                
            });
        }
        install();
    });
</script>
<?php echo $footer; ?>
