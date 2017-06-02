<af_button_view_all>
<div class="af-show-all" if={count_hide_elements > getSetting(opts.filter_id).min_elemnts} onclick={click}>
    {getViewStatus(opts.filter.name, this.parent.opts.group_id, opts.filter_id)?getState().translate.text_shrink:getState().translate.text_show_more}
</div>
<script>
    this.on('before-mount', function(){
        count_hide_elements = Object.values(opts.filter.values).length - getSetting(opts.filter_id).count_elemnts;
    });
    this.on('mount', function(){
        $(this.root).parent().find('.af-element:nth-child(n+'+(parseInt(getSetting(opts.filter_id).count_elemnts)+1)+')').css('display','none');
    });
    this.on('update', function(){
        count_hide_elements = Object.values(opts.filter.values).length - getSetting(opts.filter_id).count_elemnts;
    });
    
    click(e){
        if(!getViewStatus(opts.filter.name, this.parent.opts.group_id, opts.filter_id)){
            $(this.root).parent().find('.af-element:nth-child(n+'+(parseInt(getSetting(opts.filter_id).count_elemnts)+1)+')').css('display','flex');
            setViewStatus(opts.filter.name, this.parent.opts.group_id, opts.filter_id, true);
        }
        else{
            $(this.root).parent().find('.af-element:nth-child(n+'+(parseInt(getSetting(opts.filter_id).count_elemnts)+1)+')').css('display','none');
            setViewStatus(opts.filter.name, this.parent.opts.group_id, opts.filter_id, false);
        }
    }
</script>
</af_button_view_all>