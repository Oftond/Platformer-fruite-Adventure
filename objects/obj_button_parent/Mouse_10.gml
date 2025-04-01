if (instance_exists(obj_button_showRewardVideo)) exit;

if (instance_exists(obj_menu_manager) && !instance_exists(obj_accept_get_moneys_menu))
{
	obj_menu_manager.is_keyboard_control = false;
	obj_menu_manager.selected_index = index;
}
else if (instance_exists(obj_menu_manager))
{
	if (index == 7 || index == 8)
	{
		obj_menu_manager.is_keyboard_control = false;
		obj_menu_manager.selected_index = index;
	}
}
else if (instance_exists(obj_levels_manager))
{
	obj_levels_manager.is_keyboard_control = false;
	obj_levels_manager.selected_index = index;
}
if (!instance_exists(obj_pauseMenu))
	global.IsMovedCursor = true;