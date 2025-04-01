event_inherited();
index = 4;

button_press = function()
{
	if (instance_exists(obj_charactersShop_manager))
		obj_charactersShop_manager.show_next_character();
		
	global.SaveSystemManager.Save();
}