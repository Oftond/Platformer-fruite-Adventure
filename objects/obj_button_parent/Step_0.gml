if (instance_exists(obj_button_showRewardVideo)) exit;

if (instance_exists(obj_menu_manager))
{
	if (!obj_menu_manager.is_keyboard_control)
		mouse_enter();
	else
		key_enter();
}
else if (instance_exists(obj_levels_manager))
{
	if (!obj_levels_manager.is_keyboard_control)
		mouse_enter();
	else
		key_enter();
}
else if (instance_exists(obj_pauseMenu))
{
	if (!obj_pauseMenu.is_keyboard_control)
		mouse_enter();
	else
		key_enter();
}
else
	mouse_enter();