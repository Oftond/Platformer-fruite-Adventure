draw_set_font(fnt_main);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text(room_width / 2, 350, $"Ваш счет: {global.Score}");
draw_text(room_width / 2, (room_height / 2) + 280, $"Уровень: {global.CurrentLevel}");