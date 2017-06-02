<af_group_slider_inputs>
<div class="af-element slider">
    <div class="slider-range"></div>
    <div class="price">
        <div class="input-price">
            <i>{getState().translate.text_symbol_left}</i>
            <input class="price-min-input" type="text" name="{opts.filter.name}[{opts.filter.group_id}][]" onchange="{change}">
            <i>{getState().translate.text_symbol_right}</i>
        </div>
        <span class="slider-separator"></span>
        <div class="input-price">
            <i>{getState().translate.text_symbol_left}</i>
            <input class="price-max-input" type="text" name="{opts.filter.name}[{opts.filter.group_id}][]" onchange="{change}">
            <i>{getState().translate.text_symbol_right}</i>
        </div>
        
    </div>
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
            hide_min_max: true,
            hide_from_to: true,
            onChange: function (data) {
                $('.price-min-input', this.root).val(data.from);
                $('.price-max-input', this.root).val(data.to);
            }.bind(this),
            onFinish: function (data) {
                $('.price-min-input', this.root).val(data.from);
                $('.price-max-input', this.root).val(data.to);
                this.store.updateGroupSelected(opts.filter.name, opts.filter.group_id, [data.from, data.to], opts.filter_id);
            }.bind(this)
        });

        $('.price-min-input', this.root).val(values[0]);
        $('.price-max-input', this.root).val(values[1]);
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

                    var min_price = $('.price-min-input', this.root).val();
                    var max_price = $('.price-max-input', this.root).val();

                    this.store.clearSelected(opts.filter.name, opts.filter.group_id);
                    slider.update({
                        from: min_price,
                        to: max_price
                    });
                }
                else{
                    $('.price-min-input', this.root).val(values[0]);
                    $('.price-max-input', this.root).val(values[1]);
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

    change(e){
        var min_price = $('.price-min-input', this.root).val();
        var max_price = $('.price-max-input', this.root).val();

        this.store.updateGroupSelected(opts.filter.name, opts.filter.group_id, [min_price, max_price], filter_id);
    }
</script>
</af_group_slider_inputs>