if (instance_exists(obj_transition))
	exit;

if (!instance_exists(obj_game_manager))
{
	if (x != start_x || y != start_y)
	{
		x = start_x;
		y = start_y;
	}
}

draw_self();