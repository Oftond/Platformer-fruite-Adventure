var _mouse_gui_x = device_mouse_x_to_gui(0);
var _mouse_gui_y = device_mouse_y_to_gui(0);

if (device_mouse_check_button_pressed(0, mb_left) && collision_point(_mouse_gui_x, _mouse_gui_y, object_index, false, false) == id)
	button_press();
else if (collision_point(_mouse_gui_x, _mouse_gui_y, object_index, false, false) == id)
{
	image_xscale = 1.3;
	image_yscale = 1.3;
}
else
{
	image_xscale = 1;
	image_yscale = 1;
}