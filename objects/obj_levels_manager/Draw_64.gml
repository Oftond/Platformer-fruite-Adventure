if (instance_exists(obj_transition)) exit;

draw_set_font(fnt_main);
draw_set_valign(fa_middle);
draw_set_halign(fa_left);
if (!global.is_touch)
	draw_text(camera_get_view_width(view_camera[0]) - 550, 100, $"{text[global.Language]}: ");
else
	draw_text(camera_get_view_width(view_camera[0]) - 550, 60, $"{text[global.Language]}: ");
var _score_offset_x = 0;
if (global.Language == LANGUAGES.RUS)
	_score_offset_x = 30;
else
	_score_offset_x = 25;
if (!global.is_touch)
	draw_text(camera_get_view_width(view_camera[0]) - 550 + string_length(text[global.Language]) * _score_offset_x, 100, $"{global.Score}");
else
	draw_text(camera_get_view_width(view_camera[0]) - 550 + string_length(text[global.Language]) * _score_offset_x, 60, $"{global.Score}");