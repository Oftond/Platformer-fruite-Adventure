if (!instance_exists(obj_transition))
	exit;
	
if (x != in_room_pos_x || y != in_room_pos_y)
{
	x = in_room_pos_x;
	y = in_room_pos_y;
}

draw_self();
if (global.FruitsCountInRoom[number_level - 1] == -1)
	exit;

draw_set_valign(fa_bottom);
draw_set_halign(fa_center);
draw_set_font(fnt_main);
draw_text(x, y + sprite_height, $"{global.ScoreInLevel[number_level - 1]}/{global.FruitsCountInRoom[number_level - 1]}");