function check_mouse_enter_to_gui()
{
	if (instance_exists(obj_button_showRewardVideo)) return;
	
	var _mouse_gui_x = device_mouse_x_to_gui(0);
	var _mouse_gui_y = device_mouse_y_to_gui(0);

	var _button_to_check = collision_point(_mouse_gui_x, _mouse_gui_y, obj_button_parent, false, false);
	if (_button_to_check != noone && !global.IsMovedCursor && _button_to_check.index != -1)
	{
		if (instance_exists(obj_menu_manager) && !instance_exists(obj_accept_get_moneys_menu) && !instance_exists(obj_maxHealth))
		{
			obj_menu_manager.is_keyboard_control = false;
			obj_menu_manager.selected_index = _button_to_check.index;
		}
		else if (instance_exists(obj_menu_manager))
		{
			if (instance_exists(obj_accept_get_moneys_menu))
			{
				if (_button_to_check.index == 7 || _button_to_check.index == 8)
				{
					obj_menu_manager.is_keyboard_control = false;
					obj_menu_manager.selected_index = _button_to_check.index;
				}
			}
			else if (instance_exists(obj_maxHealth))
			{
				if (_button_to_check.index == 7)
				{
					obj_menu_manager.is_keyboard_control = false;
					obj_menu_manager.selected_index = _button_to_check.index;
				}
			}
		}
		else if (instance_exists(obj_levels_manager))
		{
			obj_levels_manager.is_keyboard_control = false;
			obj_levels_manager.selected_index = _button_to_check.index;
		}
		if (!instance_exists(obj_pauseMenu))
			global.IsMovedCursor = true;
	}
	else if (_button_to_check == noone)
	{
		if (!instance_exists(obj_pauseMenu))
			global.IsMovedCursor = false;
	}
}