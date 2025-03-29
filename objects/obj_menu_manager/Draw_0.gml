draw_set_font(fnt_main);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text(room_width / 2, 350, $"{text[global.Language]}: {global.Moneys}");
draw_text(room_width / 2, (room_height / 2) + 280, $"{text_level[global.Language]}: {global.CurrentLevel}");

draw_text(340, 384, $"{text_health[global.Language]}:\n{health_price}");
draw_set_halign(fa_left);
draw_text(340, 288, global.MaxHP);