event_inherited();
time_to_show_levels = 60;
levels_room = rm_levels_map;
acceptWindow_sequence = undefined;

button_press = function()
{
	if (instance_exists(obj_transition))
		return;
	instance_create_layer(x, y, "GUI", obj_transition);
	alarm[0] = time_to_show_levels;
}

delete_seq = function()
{
	if (acceptWindow_sequence == undefined) return;
	layer_sequence_destroy(acceptWindow_sequence);
	acceptWindow_sequence = undefined;
}