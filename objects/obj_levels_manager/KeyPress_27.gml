if (room == rm_levels_map && !instance_exists(obj_transition))
{
	with (instance_create_layer(x, y, "GUI", obj_transition))
	{
		room_to_go = rm_menu;
	}
	alarm[0] = time_to_show_levels;
}