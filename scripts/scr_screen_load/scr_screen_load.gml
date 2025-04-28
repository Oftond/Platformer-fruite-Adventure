function draw_fullscreen_tricolor_gradient(color1, color2, color3, horizontal = false)
{
    var steps = 100;
    var w = display_get_gui_width();
    var h = display_get_gui_height();
    
    if (horizontal)
	{
        for (var i = 0; i < steps; i++)
		{
            var t = i / steps;
            var xx = w * t;
            var col = (t < 0.5) 
                ? merge_color(color1, color2, t * 2)
                : merge_color(color2, color3, (t - 0.5) * 2);
            
            draw_rectangle_color(
                xx, 0, xx + (w / steps), h,
                col, col, col, col, false
            );
        }
    }
	else
	{
        for (var i = 0; i < steps; i++) 
		{
            var t = i / steps;
            var yy = h * t;
            var col = (t < 0.5) 
                ? merge_color(color1, color2, t * 2)
                : merge_color(color2, color3, (t - 0.5) * 2);
            
            draw_rectangle_color(
                0, yy, w, yy + (h / steps),
                col, col, col, col, false
            );
        }
    }
}

function merge_color(col1, col2, t)
{
    var r = lerp(color_get_red(col1), color_get_red(col2), t);
    var g = lerp(color_get_green(col1), color_get_green(col2), t);
    var b = lerp(color_get_blue(col1), color_get_blue(col2), t);
    return make_color_rgb(r, g, b);
}