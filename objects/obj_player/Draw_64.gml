draw_set_font(fnt_main);
draw_set_halign(fa_left);
draw_set_valign(fa_middle);
draw_sprite(spr_cherry, 0, camera_get_view_width(view_camera[0]) - 250, 100);
draw_text(camera_get_view_width(view_camera[0]) - 40 - (280 - sprite_get_width(spr_cherry)), 100, $": {score}");