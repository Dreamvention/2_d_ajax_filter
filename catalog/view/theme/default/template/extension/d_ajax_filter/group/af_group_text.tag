<af_group_text>
<div class="af-element input-field">
    <input type="text" name="{opts.filter.name}[{opts.filter.group_id}][]" onchange={change} placeholder="{getState().translate.text_search}">
</div>
<script>
    this.on('update', function(){
        var values = getSelected(opts.filter.name, opts.filter.group_id);

        if(typeof values == "object"){
            var length = getValuesFromObject(values).length;
        }
        else{
            var length = values.length;
        }

        if(length == 0){
            $("input[type=text]", this.root).val('')
        }
    });
    change(e){
        if(e.target.value != ''){
            this.store.clearSelected(opts.filter.name, opts.filter.group_id);
            this.store.updateSelected(opts.filter.name, opts.filter.group_id, e.target.value, 1, opts.filter_id, e.target);
        }
        else{
            this.store.clearSelected(opts.filter.name, opts.filter.group_id, opts.filter_id, e.target);
        }
    }
</script>
</af_group_text>