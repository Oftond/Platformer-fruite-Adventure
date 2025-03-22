draw_self();
if (number != 2) exit;
draw_set_font(fnt_main);
draw_set_valign(fa_middle);
draw_set_halign(fa_center);
if (!is_bought)
{
	if (price <= global.Moneys)
		draw_set_color(c_green);
	else
		draw_set_color(c_red);
	draw_text(x, y - sprite_height + 20, $"{text[global.Language]}:\n{price}");
}
else
{
	draw_set_color(c_yellow);
	draw_text(x, y - sprite_height + 20, $"{text2[global.Language]}");
}
draw_set_color(c_white);