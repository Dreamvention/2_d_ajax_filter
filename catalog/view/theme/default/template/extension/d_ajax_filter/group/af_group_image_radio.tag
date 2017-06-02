<af_group_image_radio>
<div class="af-image-grid">
    <div each={element in opts.filter.values} opts={element} class="af-element image_checkbox {checkDisabled(parent.opts.filter.name, parent.opts.filter.group_id, element.value, parent.opts.filter_id) ?'disabled':''}">
        <label id="label_image_checkbox">
            <input type="radio" name="{parent.opts.filter.name}[{parent.opts.filter.group_id}]" checked={checkSelected(parent.opts.filter.name, parent.opts.filter.group_id, element.value)} value="{element.value}" onchange={change}><img src="{element.thumb}">
        </label>
    </div>
</div>
<script>
    change(e){
        this.store.clearSelected(opts.filter.name, opts.filter.group_id);
        this.store.updateSelected(opts.filter.name, opts.filter.group_id, e.target.value, e.target.checked, opts.filter_id, e.target);
    }
</script>
</af_group_image_radio>