var _mouse_gui_x = device_mouse_x_to_gui(0);
var _mouse_gui_y = device_mouse_y_to_gui(0);

if (device_mouse_check_button_pressed(0, mb_left) && collision_point(_mouse_gui_x, _mouse_gui_y, object_index, false, false) == id && can_press)
	button_press();
else if (collision_point(_mouse_gui_x, _mouse_gui_y, object_index, false, false) == id && can_press)
{
	image_xscale = koef_scale + (koef_scale / 8);
	image_yscale = koef_scale + (koef_scale / 8);
}
else
{
	image_xscale = koef_scale;
	image_yscale = koef_scale;
}