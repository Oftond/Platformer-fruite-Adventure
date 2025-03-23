draw_set_font(fnt_main);
draw_set_valign(fa_middle);
draw_set_halign(fa_left);
draw_text(room_width - 450, 100, $"{text[global.Language]}: ");
var _score_offset_x = 0;
if (global.Language == LANGUAGES.RUS)
	_score_offset_x = 30;
else
	_score_offset_x = 25;
draw_text(room_width - 450 + string_length(text[global.Language]) * _score_offset_x, 100, $"{global.Score}");