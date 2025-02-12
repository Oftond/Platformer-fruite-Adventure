draw_self();
if (price == 0 || number != 2)
	exit;
draw_set_font(fnt_main);
draw_set_valign(fa_middle);
draw_set_halign(fa_center);
draw_set_color(c_red);
draw_text(x, y - sprite_height + 20, price);
draw_set_color(c_white);