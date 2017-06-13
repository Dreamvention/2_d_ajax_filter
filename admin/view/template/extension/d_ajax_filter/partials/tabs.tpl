<?php if(!$status_cache) { ?>
<div class="alert alert-info" style="overflow: inherit;">
    <div class="row">
    <div class="col-md-9"><?php echo $help_cache_support; ?> </div>
        <div class="col-md-3"><a href="<?php echo $install_cache; ?>" class="btn btn-info btn-block"><?php echo $text_install_cache; ?></a></div>
    </div>
</div>
<?php } ?>
<ul class="nav nav-tabs">
    <?php foreach ($tabs as $tab) { ?>
    <li class="<?php echo $tab['active']?'active':''; ?>">
        <a <?php echo !$tab['active']?'href="'.$tab['href'].'"':''; ?>>
            <span  class="<?php echo $tab['icon']; ?>"></span> <?php echo $tab['title']; ?>
        </a>
    </li>
    <?php } ?>
</ul>