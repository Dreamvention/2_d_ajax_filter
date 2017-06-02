<div class="extension-popup" id="extension_<?php echo $extension['extension_id']; ?>">
    <div class="row">
        <div class="col-md-6 text-center">
            <div class="m-b">
                <p>Purchase with voucher</p>
                <i class="fa fa-tag fa-4x"></i>
            </div>
            <a class="btn btn-primary btn-lg m-b claim-external-order" data-href="<?php echo $claim_external_order; ?>">Vaucher</a>
            <p>If you have purchased a license from another market like Opencart, you can claim your voucher to purchase the license here</p>
        </div>
        <div class="col-md-6 text-center">
            <div class="m-b">
                <p>Your current balance</p>
                <span style="font-size: 32px;"><?php echo $account['balance_format']; ?></span>
                <a href="<?php echo $add_money; ?>" target="_blank" class="btn btn-success btn-xs add-to-balance"><i class="fa fa-plus"></i></a>
            </div>
            <a class="btn btn-success btn-lg m-b" href="<?php echo $invoice['pay']; ?>" data-toggle="tooltip" data-original-title="Pay">Credit</a>
            <p>You can purchase any extension with Shopunity Credit. Simply visit the shopunity billing and add credit via paypal.</p>
        </div>

    </div>
</div>