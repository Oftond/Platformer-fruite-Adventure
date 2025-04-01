event_inherited();
index = 3;

button_press = function()
{
	if (instance_exists(obj_charactersShop_manager))
		obj_charactersShop_manager.show_previous_character();
		
	global.SaveSystemManager.Save();
}