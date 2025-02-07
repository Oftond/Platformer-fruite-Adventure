time_to_show_levels = 60;
levels_room = rm_levels_map;

button_press = function()
{
	instance_create_layer(x, y, "GUI", obj_transition);
	alarm[0] = time_to_show_levels;
}