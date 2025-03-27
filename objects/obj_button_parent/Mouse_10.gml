if (instance_exists(obj_menu_manager))
{
	obj_menu_manager.is_keyboard_control = false;
	obj_menu_manager.selected_index = index;
}
else if (instance_exists(obj_levels_manager))
{
	obj_levels_manager.is_keyboard_control = false;
	obj_levels_manager.selected_index = index;
}
if (!instance_exists(obj_pauseMenu))
	global.IsMovedCursor = true;