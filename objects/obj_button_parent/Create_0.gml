koef_scale = 1;
can_press = true;
index = -1;

button_press = function()
{
	return;
}

mouse_enter = function()
{
	if (room == rm_menu)
		if (instance_exists(obj_button_buy))
			if (obj_button_buy.acceptWindow_sequence != undefined)
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
		}
		exit;
	}

	if (device_mouse_check_button_pressed(0, mb_left) && collision_point(_mouse_gui_x, _mouse_gui_y, object_index, false, false) == id)
		button_press();
	else if (collision_point(_mouse_gui_x, _mouse_gui_y, object_index, false, false) == id)
	{
		image_xscale = koef_scale + (koef_scale / 8);
		image_yscale = koef_scale + (koef_scale / 8);
	}
}

key_enter = function()
{
	if (room == rm_menu)
		if (instance_exists(obj_button_buy))
			if (obj_button_buy.acceptWindow_sequence != undefined)
				exit;
	image_xscale = koef_scale;
	image_yscale = koef_scale;
	
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
			}
			exit;
		}
		
		if (input_pressed(INPUT.ACCEPT))
			button_press();
		else
		{
			image_xscale = koef_scale + (koef_scale / 8);
			image_yscale = koef_scale + (koef_scale / 8);
		}
	}
}