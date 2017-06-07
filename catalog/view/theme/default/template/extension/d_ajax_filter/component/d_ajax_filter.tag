<d_ajax_filter>

<div class="title"><p class="title">{getSetting(opts.id).heading_title}</p></div>
<div class="af-body">
    <div class="selected-list clearfix" if={getSetting(opts.id).selected_filters == '1'}>
        <div each={groups, name in getState().selected}>
            <div each={group, group_id in groups}>
                <af_selected each={value in group} if={!checkRange(parent.name, group_id)}></af_selected>
                <af_selected_range group={group} name={parent.name} group_id={group_id} if={checkRange(parent.name, group_id)}></af_selected>
            </div>
        </div>
    </div>
    
    <div class="button-reset" if={getSetting(opts.id).button_reset == '1'} id="resetFilter" onclick={click}>
        <span></span><p>{getState().translate.button_reset}</p>
    </div>

    <virtual each={groups, name in getGroups(opts.id)}>
        <af_group each={filter in groups} filter_id="{parent.parent.opts.id}"></af_group>
    </virtual>
    <div if={getSetting(opts.id).submission == '1'} class="af-button-filter {getSetting(opts.id).button_filter_position == 1?'af-popup':''}">
        <a id="fitlers" onclick={filter_click}>{getState().translate.button_filter}</a>
        <div if={getSetting(opts.id).button_filter_position == 1} class="close">
            <i class="fa fa-times-circle-o" onclick="$(this).closest('.af-button-filter').css('display','none')" aria-hidden="true"></i>
        </div>
    </div>
</div>
<script>
    click(e){
        this.store.clearSelectedAll();
        if(getSetting(opts.id).submission == '0'){
            this.store.updateContent();
        }
    }

    filter_click(e){
        this.store.updateContent();
    }

    if(getSetting(opts.id).submission == '1' && getSetting(opts.id).button_filter_position == '1'){
        $(this.root).on('change-location', function(e, top){
            var position_top = top - Math.round($('.af-button-filter.af-popup', this.root).outerHeight(true) / 2); 
            $('.af-button-filter.af-popup', this.root).css({top:position_top});
            $('.af-button-filter.af-popup', this.root).show();
            clearTimeout(timeout_popup);
            var timeout_popup = setTimeout(function(){$('.af-button-filter.af-popup', this.root).hide();}, 2000);
        }.bind(this));
    }
    
</script>
</d_ajax_filter>