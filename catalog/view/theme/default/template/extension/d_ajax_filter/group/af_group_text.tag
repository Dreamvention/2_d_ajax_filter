<af_group_text>
<div class="af-element input-field">
    <input type="text" name="{opts.filter.name}[{opts.filter.group_id}][]"  value="{opts.filter.value}" onchange={change} placeholder="{getState().translate.text_search}">
</div>
<script>
    change(e){
        this.store.clearSelected(opts.filter.name, opts.filter.group_id);
        this.store.updateSelected(opts.filter.name, opts.filter.group_id, e.target.value, 1, opts.filter_id, e.target);
    }
</script>
</af_group_text>