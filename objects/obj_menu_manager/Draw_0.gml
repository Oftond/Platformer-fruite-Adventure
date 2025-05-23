draw_set_font(fnt_main);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text(room_width / 2, 350, $"{text[global.Language]}: {global.Moneys}");
draw_text(room_width / 2, (room_height / 2) + 280, $"{text_level[global.Language]}: {global.CurrentLevel}");

if (!global.is_touch)
{
	draw_text(372, 428, $"{text_health[global.Language]}: {health_price}");
	draw_set_halign(fa_left);
	if (global.MaxHP < global.TotalMaxHP)
		draw_text(372, 320, global.MaxHP);
	else
		draw_text(372, 320, text_maxHP[global.Language]);
}
else
{
	draw_text(478, 428, $"{text_health[global.Language]}: {health_price}");
	draw_set_halign(fa_left);
	if (global.MaxHP < global.TotalMaxHP)
		draw_text(468, 320, global.MaxHP);
	else
		draw_text(468, 320, text_maxHP[global.Language]);
}