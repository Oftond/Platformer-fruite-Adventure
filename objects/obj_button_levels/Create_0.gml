event_inherited();
time_to_show_levels = 60;
levels_room = rm_levels_map;
index = 1;

button_press = function()
{
	if (instance_exists(obj_transition))
		return;
	instance_create_layer(x, y, "GUI", obj_transition);
	alarm[0] = time_to_show_levels;
}