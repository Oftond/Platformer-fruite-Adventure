event_inherited();
index = 3;

button_press = function()
{
	if (instance_exists(obj_charactersShop_manager))
		obj_charactersShop_manager.show_previous_character();
		
	global.SaveSystemManager.Save();
	
	window_enable_borderless_fullscreen(true);
	
	window_set_position(window_get_x(), window_get_y() - 10);
}