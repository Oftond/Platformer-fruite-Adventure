if (room == rm_menu)
	if (instance_exists(obj_button_buy))
		if (obj_button_buy.acceptWindow_sequence != undefined)
			exit;

if (instance_exists(obj_menu_manager))
{
	if (!obj_menu_manager.is_keyboard_control)
		mouse_enter();
	else
		key_enter();
}
else
	mouse_enter();