<af_selected>
<div class="af-selected" onclick={click}><p>{getElementCaption(parent.name, parent.group_id, value)}</p></div>
<script>
    click(e){
        updateSelected(this.parent.name, this.parent.group_id, this.value, 0);
    }
</script>
</af_selected>