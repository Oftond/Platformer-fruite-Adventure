if (is_death)
	exit;
draw_set_font(fnt_main);
draw_set_halign(fa_left);
draw_set_valign(fa_middle);
var _offset_x = 80;
draw_sprite(spr_cherry, 0, (camera_get_view_width(view_camera[0]) / 2) + _offset_x, 100);
draw_text((camera_get_view_width(view_camera[0]) / 2) + _offset_x - 10 + sprite_get_width(spr_cherry) / 2, 100, $": {score}");