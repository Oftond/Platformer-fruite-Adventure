if (!obj_game_manager.endAlpha || is_death || global.IsPause) exit;

draw_set_font(fnt_main);
draw_set_halign(fa_left);
draw_set_valign(fa_middle);

draw_text((camera_get_view_width(view_camera[0]) / 2) - 100, 100, $"{text_score[global.Language]}: {score}")

if (global.TouchFruit == undefined)
	exit;

var _offset_x = 220;
ripple_fruit(global.TouchFruit, _offset_x, is_ripple_fruit, self);
draw_text((camera_get_view_width(view_camera[0]) / 2) + _offset_x - 10 + sprite_get_width(spr_cherry) / 2, 100, $": {obj_game_manager.moneys}");