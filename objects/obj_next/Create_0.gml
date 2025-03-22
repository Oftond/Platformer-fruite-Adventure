event_inherited();

button_press = function()
{
	if (instance_exists(obj_charactersShop_manager))
		obj_charactersShop_manager.show_next_character();
	
	with (obj_character_show)
	{
		if (number == 2 && is_bought)
		{
			global.SaveSystemManager.Save();
		}
	}
}