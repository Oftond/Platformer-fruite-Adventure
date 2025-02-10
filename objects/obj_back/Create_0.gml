event_inherited();
time_to_show_levels = 60;
room_to_return = rm_menu;

button_press = function()
{
	if (room == rm_levels_map && !instance_exists(obj_transition))
	{
		instance_create_layer(x, y, "GUI", obj_transition);
		alarm[0] = time_to_show_levels;
	}
}