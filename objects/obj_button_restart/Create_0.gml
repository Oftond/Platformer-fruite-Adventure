event_inherited();
time_to_show_levels = 60;
index = 1;

button_press = function()
{
	if (instance_exists(obj_transition))
		return;
	instance_create_layer(x, y, "GUI", obj_transition);
	alarm[0] = time_to_show_levels;
	audio_bus_main.effects[0] = undefined;
	audio_bus_main.effects[1] = undefined;
}