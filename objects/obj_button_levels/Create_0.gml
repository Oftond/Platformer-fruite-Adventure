event_inherited();
time_to_show_levels = 60;
levels_room = rm_levels_map;
index = 1;
if(instance_exists(obj_pauseMenu)) index = 3;

button_press = function()
{
	if (instance_exists(obj_transition))
		return;

	with (instance_create_layer(x, y, "GUI", obj_transition))
	{
		room_to_go = rm_levels_map;
	}
	
	alarm[0] = time_to_show_levels;
	if (audio_bus_main.effects[0] != undefined || audio_bus_main.effects[1] != undefined)
	{
		audio_bus_main.effects[0] = undefined;
		audio_bus_main.effects[1] = undefined;
	}
	
	instance_create_depth(0, 0, depth, obj_button_showFullscreenAds);
}