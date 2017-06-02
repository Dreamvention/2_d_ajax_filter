<af_group_radio_and_image>
<div each={element in opts.filter.values}  class="af-element {checkDisabled(parent.opts.filter.name, parent.opts.filter.group_id, element.value, parent.opts.filter_id)?'disabled':''}">
    <label id="label_radio_and_image">
        <input type="radio" name="{parent.opts.filter.name}[{parent.opts.filter.group_id}]" checked={element.selected == 1} value="{element.value}">
        <img src="{element.thumb}"> 
        <div class="title">{element.name} <af_quantity if={displayQuantity(parent.opts.filter.name, parent.opts.filter.group_id, element.value, parent.opts.filter_id)} quantity={getQuantity(parent.opts.filter.name, parent.opts.filter.group_id, element.value)}></af_quantity></div>
    </label>
</div>
<af_button_view_all filter_id={opts.filter_id} filter={opts.filter} if={getSetting(opts.filter_id).limit_block == '1'}></af_button_view_all>
<script>
    change(e){
        this.store.clearSelected(opts.filter.name, opts.filter.group_id);
        this.store.updateSelected(opts.filter.name, opts.filter.group_id, e.target.value, e.target.checked, opts.filter_id, e.target);
    }
</script>
</af_group_radio_and_image>