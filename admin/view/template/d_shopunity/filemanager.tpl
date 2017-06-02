<?php
/*
 *	location: admin/view
 */
?>
<?php echo $content_top; ?>
<div class="row">
	<div class="col-md-3">
		<ul class="list-group">
		<?php if($path_up){ ?>
			<li class="list-group-item list-group-item-info"><a href="<?php echo $path_up; ?>"><i class="fa fa-long-arrow-left"></i> Back</a></li>
		<?php }else{ ?>
			<li class="list-group-item list-group-item-info">Upload folder</li>
		<?php } ?>
		<?php foreach($files as $file) {?>
			<li class="list-group-item"><a href="<?php echo $file['url']; ?>"><i class="fa <?php echo ($file['type'] == 'file') ? 'fa-file-text-o' : 'fa-folder-o'; ?> "></i>   <?php echo $file['name']; ?></a></li>
		<?php } ?>
		</u>

	</div>
	<div class="col-md-9">
		
		<div class="ibox">

			<div class="ibox-title">
				<h2><?php echo $codename; ?> :: <small> 
					<a href="<?php echo $home; ?>"><i class="fa fa-home"></i></a>
					/
					<?php foreach($paths as $path){ ?>
						<?php if($path['url']) { ?>
							<a href="<?php echo $path['url']; ?>"><?php echo $path['name']; ?></a> / 
						<?php }else{ ?>
							<?php echo $path['name']; ?>
						<?php } ?>
					<?php } ?>
				</small></h2>
			</div>
			<div class="ibox-content">
				<?php if($file_type != 'dir') { ?>
					<textarea id="code"><?php echo htmlentities($file_content); ?></textarea>
				<?php }else{ ?>
					<div class="alert alert-info">This is a folder</div>
				<?php } ?>
			</div>
		</div>
	</div>
</div>
<style type="text/css">
	#code{
		display: none;
	}
	.CodeMirror {
    border: 1px solid #eee;
    height: auto;
}
</style>
<script type="text/javascript">
	var myCodeMirror = CodeMirror.fromTextArea(document.getElementById("code"),{
        lineNumbers: true,
        viewportMargin: Infinity
      });
</script>
<?php echo $content_bottom; ?>

