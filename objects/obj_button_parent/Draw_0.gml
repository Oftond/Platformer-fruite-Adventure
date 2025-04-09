if (!instance_exists(obj_transition) || instance_exists(obj_game_manager))
	exit;

if (x != in_room_pos_x || y != in_room_pos_y)
{
	x = in_room_pos_x;
	y = in_room_pos_y;
}

draw_self();