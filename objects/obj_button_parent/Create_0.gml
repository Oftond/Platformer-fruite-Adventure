koef_scale = 1;
can_press = true;
index = -1;

depth = -1000;

start_x = x;
start_y = y;

in_room_pos_x = x;
in_room_pos_y = y;

button_press = function()
{
	return;
}

mouse_enter = function()
{
	if (room == rm_menu)
		if (instance_exists(obj_accept_get_moneys_menu) || instance_exists(obj_maxHealth))
			exit;
	image_xscale = koef_scale;
	image_yscale = koef_scale;
	var _mouse_gui_x = device_mouse_x_to_gui(0);
	var _mouse_gui_y = device_mouse_y_to_gui(0);

	if (!can_press || instance_exists(obj_transition))
	{
		if (device_mouse_check_button_pressed(0, mb_left) && collision_point(_mouse_gui_x, _mouse_gui_y, object_index, false, false) == id)
			ShakeStart(10, 8);
		else if (collision_point(_mouse_gui_x, _mouse_gui_y, object_index, false, false) == id)
		{
			image_xscale = koef_scale + (koef_scale / 8);
			image_yscale = koef_scale + (koef_scale / 8);
			
			if (input_pressed(INPUT.ACCEPT))
			{
				ShakeStart(10, 8);
				image_xscale = koef_scale;
				image_yscale = koef_scale;
			}
		}
		return;
	}

	if (device_mouse_check_button_pressed(0, mb_left) && collision_point(_mouse_gui_x, _mouse_gui_y, object_index, false, false) == id)
		button_press();
	else if (collision_point(_mouse_gui_x, _mouse_gui_y, object_index, false, false) == id)
	{
		image_xscale = koef_scale + (koef_scale / 8);
		image_yscale = koef_scale + (koef_scale / 8);
		
		if (!can_press || instance_exists(obj_transition))
		{
			if (input_pressed(INPUT.ACCEPT))
			{
				ShakeStart(10, 8);
				image_xscale = koef_scale;
				image_yscale = koef_scale;
			}
			else
			{
				image_xscale = koef_scale + (koef_scale / 8);
				image_yscale = koef_scale + (koef_scale / 8);
			}
			return;
		}
		
		if (input_pressed(INPUT.ACCEPT))
		{
			button_press();
			image_xscale = koef_scale;
			image_yscale = koef_scale;
		}
		else
		{
			image_xscale = koef_scale + (koef_scale / 8);
			image_yscale = koef_scale + (koef_scale / 8);
		}
	}
}

key_enter = function()
{
	image_xscale = koef_scale;
	image_yscale = koef_scale;
	
	if (instance_exists(obj_menu_manager))
	{
		if (obj_menu_manager.selected_index == index)
		{
			if (!can_press || instance_exists(obj_transition))
			{
				if (input_pressed(INPUT.ACCEPT))
					ShakeStart(10, 8);
				else
				{
					image_xscale = koef_scale + (koef_scale / 8);
					image_yscale = koef_scale + (koef_scale / 8);
					
					var _mouse_gui_x = device_mouse_x_to_gui(0);
					var _mouse_gui_y = device_mouse_y_to_gui(0);
					if (device_mouse_check_button_pressed(0, mb_left) && collision_point(_mouse_gui_x, _mouse_gui_y, object_index, false, false) == id)
					{
						ShakeStart(10, 8);
						image_xscale = koef_scale;
						image_yscale = koef_scale;
					}
				}
				return;
			}
		
			if (input_pressed(INPUT.ACCEPT))
				button_press();
			else
			{
				image_xscale = koef_scale + (koef_scale / 8);
				image_yscale = koef_scale + (koef_scale / 8);
			
				var _mouse_gui_x = device_mouse_x_to_gui(0);
				var _mouse_gui_y = device_mouse_y_to_gui(0);
				if (device_mouse_check_button_pressed(0, mb_left) && collision_point(_mouse_gui_x, _mouse_gui_y, object_index, false, false) == id)
				{
					button_press();
					image_xscale = koef_scale;
					image_yscale = koef_scale;
				}
			}
		}
	}
	else if (instance_exists(obj_levels_manager))
	{
		if (obj_levels_manager.selected_index == index)
		{
			if (!can_press || instance_exists(obj_transition))
			{
				if (input_pressed(INPUT.ACCEPT))
					ShakeStart(10, 8);
				else
				{
					image_xscale = koef_scale + (koef_scale / 8);
					image_yscale = koef_scale + (koef_scale / 8);
					
					var _mouse_gui_x = device_mouse_x_to_gui(0);
					var _mouse_gui_y = device_mouse_y_to_gui(0);
					if (device_mouse_check_button_pressed(0, mb_left) && collision_point(_mouse_gui_x, _mouse_gui_y, object_index, false, false) == id)
					{
						ShakeStart(10, 8);
						image_xscale = koef_scale;
						image_yscale = koef_scale;
					}
				}
				return;
			}
		
			if (input_pressed(INPUT.ACCEPT))
				button_press();
			else
			{
				image_xscale = koef_scale + (koef_scale / 8);
				image_yscale = koef_scale + (koef_scale / 8);
			
				var _mouse_gui_x = device_mouse_x_to_gui(0);
				var _mouse_gui_y = device_mouse_y_to_gui(0);
				if (device_mouse_check_button_pressed(0, mb_left) && collision_point(_mouse_gui_x, _mouse_gui_y, object_index, false, false) == id)
				{
					button_press();
					image_xscale = koef_scale;
					image_yscale = koef_scale;
				}
			}
		}
	}
	else if (instance_exists(obj_pauseMenu))
	{
		if (obj_pauseMenu.selected_index == index)
		{
			if (!can_press || instance_exists(obj_transition))
			{
				if (input_pressed(INPUT.ACCEPT))
					ShakeStart(10, 8);
				else
				{
					image_xscale = koef_scale + (koef_scale / 8);
					image_yscale = koef_scale + (koef_scale / 8);
					
					var _mouse_gui_x = device_mouse_x_to_gui(0);
					var _mouse_gui_y = device_mouse_y_to_gui(0);
					if (device_mouse_check_button_pressed(0, mb_left) && collision_point(_mouse_gui_x, _mouse_gui_y, object_index, false, false) == id)
					{
						ShakeStart(10, 8);
						image_xscale = koef_scale;
						image_yscale = koef_scale;
					}
				}
				return;
			}
		
			if (input_pressed(INPUT.ACCEPT))
				button_press();
			else
			{
				image_xscale = koef_scale + (koef_scale / 8);
				image_yscale = koef_scale + (koef_scale / 8);
			
				var _mouse_gui_x = device_mouse_x_to_gui(0);
				var _mouse_gui_y = device_mouse_y_to_gui(0);
				if (device_mouse_check_button_pressed(0, mb_left) && collision_point(_mouse_gui_x, _mouse_gui_y, object_index, false, false) == id)
				{
					button_press();
					image_xscale = koef_scale;
					image_yscale = koef_scale;
				}
			}
		}
	}
	else if (instance_exists(obj_finishLevel))
	{
		if (obj_finishLevel.selected_index == index)
		{
			if (!can_press || instance_exists(obj_transition))
			{
				if (input_pressed(INPUT.ACCEPT))
					ShakeStart(10, 8);
				else
				{
					image_xscale = koef_scale + (koef_scale / 8);
					image_yscale = koef_scale + (koef_scale / 8);
					
					var _mouse_gui_x = device_mouse_x_to_gui(0);
					var _mouse_gui_y = device_mouse_y_to_gui(0);
					if (device_mouse_check_button_pressed(0, mb_left) && collision_point(_mouse_gui_x, _mouse_gui_y, object_index, false, false) == id)
					{
						ShakeStart(10, 8);
						image_xscale = koef_scale;
						image_yscale = koef_scale;
					}
				}
				return;
			}
		
			if (input_pressed(INPUT.ACCEPT))
				button_press();
			else
			{
				image_xscale = koef_scale + (koef_scale / 8);
				image_yscale = koef_scale + (koef_scale / 8);
			
				var _mouse_gui_x = device_mouse_x_to_gui(0);
				var _mouse_gui_y = device_mouse_y_to_gui(0);
				if (device_mouse_check_button_pressed(0, mb_left) && collision_point(_mouse_gui_x, _mouse_gui_y, object_index, false, false) == id)
				{
					button_press();
					image_xscale = koef_scale;
					image_yscale = koef_scale;
				}
			}
		}
	}
	else if (instance_exists(obj_loseMenu))
	{
		if (obj_loseMenu.selected_index == index)
		{
			if (!can_press || instance_exists(obj_transition))
			{
				if (input_pressed(INPUT.ACCEPT))
					ShakeStart(10, 8);
				else
				{
					image_xscale = koef_scale + (koef_scale / 8);
					image_yscale = koef_scale + (koef_scale / 8);
					
					var _mouse_gui_x = device_mouse_x_to_gui(0);
					var _mouse_gui_y = device_mouse_y_to_gui(0);
					if (device_mouse_check_button_pressed(0, mb_left) && collision_point(_mouse_gui_x, _mouse_gui_y, object_index, false, false) == id)
					{
						ShakeStart(10, 8);
						image_xscale = koef_scale;
						image_yscale = koef_scale;
					}
				}
				return;
			}
		
			if (input_pressed(INPUT.ACCEPT))
				button_press();
			else
			{
				image_xscale = koef_scale + (koef_scale / 8);
				image_yscale = koef_scale + (koef_scale / 8);
			
				var _mouse_gui_x = device_mouse_x_to_gui(0);
				var _mouse_gui_y = device_mouse_y_to_gui(0);
				if (device_mouse_check_button_pressed(0, mb_left) && collision_point(_mouse_gui_x, _mouse_gui_y, object_index, false, false) == id)
				{
					button_press();
					image_xscale = koef_scale;
					image_yscale = koef_scale;
				}
			}
		}
	}
}