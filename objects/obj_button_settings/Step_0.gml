event_inherited();

if (!global.IsPause && !global.IsMovedCursor)
{
	var _mouse_gui_x = device_mouse_x_to_gui(0);
	var _mouse_gui_y = device_mouse_y_to_gui(0);
	if (collision_point(_mouse_gui_x, _mouse_gui_y, object_index, false, false) == id)
		global.IsMovedCursor = true;
	else
		global.IsMovedCursor = false;
}