draw_set_font(fnt_main);
draw_set_valign(fa_middle);
draw_set_halign(fa_left);
draw_text(room_width - 300, 100, $"{text[global.Language]}: ");
draw_text(room_width - 370 + string_length(text[global.Language]), 100, $"{global.Score}");