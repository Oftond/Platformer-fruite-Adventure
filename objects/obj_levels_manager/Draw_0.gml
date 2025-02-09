draw_set_font(fnt_main);
draw_set_valign(fa_middle);
draw_set_halign(fa_left);
draw_sprite(spr_cherry, 0, room_width - 300, 100);
draw_text(room_width - 370 + sprite_get_width(spr_cherry), 100, $": {global.Score}");