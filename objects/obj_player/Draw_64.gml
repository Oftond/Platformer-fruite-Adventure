if (is_death || touch_fruit == undefined || score == 0 || global.IsPause)
	exit;
draw_set_font(fnt_main);
draw_set_halign(fa_left);
draw_set_valign(fa_middle);
var _offset_x = 80;
ripple_fruit(touch_fruit, _offset_x, is_ripple_fruit, self);
if (!obj_game_manager.endAlpha)
	exit;
draw_text((camera_get_view_width(view_camera[0]) / 2) + _offset_x - 10 + sprite_get_width(spr_cherry) / 2, 100, $": {score}");