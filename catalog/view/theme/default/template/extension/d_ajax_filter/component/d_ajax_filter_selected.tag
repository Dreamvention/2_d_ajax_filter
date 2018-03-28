<d_ajax_filter_selected>
<div class="selected-list clearfix">
    <div each={groups, name in store.getState().selected}>
        <div each={group, group_id in groups}>
            <af_selected each={value in group} if={!store.checkRange(parent.name, group_id)}></af_selected>
            <af_selected_range group={group} name={parent.name} group_id={group_id} if={store.checkRange(parent.name, group_id)}></af_selected>
        </div>
    </div>
    <div class="button-reset" id="resetFilter" onclick={click}>
        <span></span><p>{store.getState().translate.button_reset}</p>
    </div>
</div>
<script>
    this.mixin({store: d_ajax_filter})

    click(e){
        this.store.clearSelectedAll(this.opts.id);
    }
</script>
</d_ajax_filter_selected>