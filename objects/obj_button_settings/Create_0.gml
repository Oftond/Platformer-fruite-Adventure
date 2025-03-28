event_inherited();
pause_sequence = undefined;

button_press = function()
{	
	if (instance_exists(obj_transition) || pause_sequence != undefined || global.IsPause)
		return;
	pause_sequence = layer_sequence_create("GUI", global.CameraWidth / 2, global.CameraHeight / 2, seq_pause_menu);
	global.IsPause = true;
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
			
			if (input_pressed(INPUT.ACCEPT))
			{
				ShakeStart(10, 8);
				image_xscale = koef_scale;
				image_yscale = koef_scale;
			}
			else if (!global.IsMovedCursor) global.IsMovedCursor = true;
		}
		return;
	}

	if (device_mouse_check_button_pressed(0, mb_left) && collision_point(_mouse_gui_x, _mouse_gui_y, object_index, false, false) == id)
		button_press();
	else if (collision_point(_mouse_gui_x, _mouse_gui_y, object_index, false, false) == id)
	{
		image_xscale = koef_scale + (koef_scale / 8);
		image_yscale = koef_scale + (koef_scale / 8);
		
		if (input_pressed(INPUT.ACCEPT)  && global.IsMovedCursor)
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