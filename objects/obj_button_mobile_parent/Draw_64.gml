if ((instance_exists(obj_transition)))
	exit;
	
for (var i = 0; i < 4; i++)
{
	var _mouse_gui_x = device_mouse_x_to_gui(i);
	var _mouse_gui_y = device_mouse_y_to_gui(i);
	
	var _mobile_button = collision_point(_mouse_gui_x, _mouse_gui_y, object_index, false, false);
	if (device_mouse_check_button(i, mb_left) && _mobile_button == id)
	{
		image_alpha = 0.3;
		image_blend = c_ltgrey;
		draw_self();
		exit;
	}
	else
	{
		image_alpha = 0.6;
		image_blend = c_white;
	}
}
draw_self();