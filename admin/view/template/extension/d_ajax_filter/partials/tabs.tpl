<ul class="nav nav-tabs">
    <?php foreach ($tabs as $tab) { ?>
    <li class="<?php echo $tab['active']?'active':''; ?>">
    <a <?php echo !$tab['active']?'href="'.$tab['href'].'"':''; ?>>
            <span  class="<?php echo $tab['icon']; ?>"></span> <?php echo $tab['title']; ?>
        </a>
    </li>
    <?php } ?>
</ul>