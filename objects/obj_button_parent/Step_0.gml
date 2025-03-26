if (instance_exists(obj_menu_manager))
{
	if (!obj_menu_manager.is_keyboard_control)
		mouse_enter();
	else
		key_enter();
}
else
	mouse_enter();