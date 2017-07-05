<?php if(!$status_cache) { ?>
<div class="alert alert-danger" style="overflow: inherit;">
    <div class="row">
        <div class="col-md-9"><?php echo $help_cache_support; ?> </div>
        <div class="col-md-3"><a href="<?php echo $install_cache; ?>" class="btn btn-danger pull-right"><?php echo $text_install_cache; ?></a></div>
    </div>
</div>
<?php } ?>
<?php if ($notify) { ?>
<style>
    .notify > a{
        color:inherit;
        padding: 10px;
        margin:-10px;
        display:block;
        font-size: 13px;
        font-weight: 700;
        text-align: center;
    }
</style>
<div class="notify alert alert-warning"><?php echo $text_complete_version; ?></div>
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