event_inherited();
time_to_show_levels = 60;
room_to_return = rm_menu;

button_press = function()
{
	if (room == rm_levels_map && !instance_exists(obj_transition))
	{
		with (instance_create_layer(x, y, "GUI", obj_transition))
		{
			room_to_go = rm_menu;
		}
		alarm[0] = time_to_show_levels;
		instance_create_depth(0, 0, depth, obj_button_showFullscreenAds);
	}
}