<af_group_slider_label>
<div class="af-element slider">
    <input type="hidden" data-type="min" data-mode="slider" name="{opts.filter.name}[{opts.filter.group_id}][]" value="{opts.filter.current_min}">
    <input type="hidden" data-type="max" data-mode="slider"  name="{opts.filter.name}[{opts.filter.group_id}][]" value="{opts.filter.current_max}">
    <div id="slider-range" class="slider-range slider-label"></div>
</div>
<script>

    this.on('mount', function(){

        var values = getSelected(opts.filter.name, opts.filter.group_id);

        if(values.length == 0){
            values = opts.filter.values;
        }

        $(".slider-range").ionRangeSlider({
            type: "double",
            min: opts.filter.values[0],
            max: opts.filter.values[1],
            from: values[0],
            to: values[1],
            grid: false,
            hide_min_max: false,
            hide_from_to: false,
            onFinish: function (data) {
                this.store.updateGroupSelected(opts.filter.name, opts.filter.group_id, [data.from, data.to], opts.filter_id);
            }.bind(this)
        });
    })

    this.on('update', function(){

        var values = getSelected(opts.filter.name, opts.filter.group_id);

        var range = $('.slider-range', this.root).get(0);

        if(typeof quantity_status != 'undefined'){

            var min = getQuantity(opts.filter.name, opts.filter.group_id, 0);
            var max = getQuantity(opts.filter.name, opts.filter.group_id, 1);
            var slider = $(".slider-range", this.root).data("ionRangeSlider");

            var current_min = slider.options.min;
            var current_max = slider.options.max;

            if(slider.options.min != min){
                current_min = min;
            }
            if(slider.options.max != max){
                current_max = max;
            }

            slider.update({
                min: current_min,
                max: current_max
            });

            if(typeof values == "object"){
                var length = Object.values(values).length;
            }
            else{
                var length = values.length;
            }

            if(length > 0){
                if(values[0] < current_min){
                    slider.update({
                        from: current_min
                    });
                    $('.price-min-input', this.root).val(current_min);
                }

                if(values[1] > current_max){
                    slider.update({
                        to: current_max
                    });
                    $('.price-max-input', this.root).val(current_max);
                }

                if(values[0] < current_min || values[1] > current_max){
                    this.store.clearSelected(opts.filter.name, opts.filter.group_id);
                    slider.update({
                        from: current_min,
                        to: current_max
                    });
                }
                else{
                    slider.update({
                        from: values[0],
                        to: values[1]
                    });
                }
            }
            else{
                $('.price-min-input', this.root).val(current_min);
                $('.price-max-input', this.root).val(current_max);
                slider.update({
                    from: current_min,
                    to: current_max
                });
            }
            
        }
        else{
            if(values.length == 0){
                values = opts.filter.values;
            }

            slider.update({
                from: values[0],
                to: values[1]
            });

            $('.price-min-input', this.root).val(values[0]);
            $('.price-max-input', this.root).val(values[1]);
        }
    });
</script>
<script>
    this.on('mount', function(){
        var range = document.getElementById('slider-range');
        
    })
</script>
</af_group_slider_label>