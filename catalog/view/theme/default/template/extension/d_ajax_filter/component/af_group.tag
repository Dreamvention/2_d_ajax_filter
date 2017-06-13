<af_group>
<div class="af-container">
    <div class="af-heading af-collapse" data-toggle="collapse" data-target="#{filter.name}_{filter.group_id}_{opts.filter_id}" aria-expanded="true">
        <p class="title">{filter.caption}</p><span></span>
    </div>
    <div id="{filter.name}_{filter.group_id}_{opts.filter_id}"  class="af-elements collapse {filter.collapse == '0'?'in':''}" aria-expanded="true">
        <div class="af-wrapper">
            <div data-is='af_group_{filter.type}' filter={filter} filter_id={opts.filter_id}></div>
        </div>
    </div>
</div>
</af_group>