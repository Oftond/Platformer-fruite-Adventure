event_inherited();

button_press = function()
{
	if (instance_exists(obj_button_buy))
		obj_button_buy.delete_seq();
	instance_create_depth(0, 0, 0, obj_button_showRewardVideo);
}

mouse_enter = function()
{
	image_xscale = koef_scale;
	image_yscale = koef_scale;
	var _mouse_gui_x = device_mouse_x_to_gui(0);
	var _mouse_gui_y = device_mouse_y_to_gui(0);

	if (!can_press || instance_exists(obj_transition))
	{
		if (device_mouse_check_button_pressed(0, mb_left) && collision_point(_mouse_gui_x, _mouse_gui_y, object_index, false, false) == id)
			ShakeStart(10, 8);
		exit;
	}

	if (device_mouse_check_button_pressed(0, mb_left) && collision_point(_mouse_gui_x, _mouse_gui_y, object_index, false, false) == id)
		button_press();
	else if (collision_point(_mouse_gui_x, _mouse_gui_y, object_index, false, false) == id)
	{
		image_xscale = koef_scale + (koef_scale / 8);
		image_yscale = koef_scale + (koef_scale / 8);
	}
	else
	{
		image_xscale = koef_scale;
		image_yscale = koef_scale;
	}
}