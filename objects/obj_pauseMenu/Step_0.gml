image_xscale = room_width;
image_yscale = room_height;

if (!is_keyboard_control && (input_pressed(INPUT.DOWN) || input_pressed(INPUT.LEFT) || input_pressed(INPUT.UP) || input_pressed(INPUT.RIGHT) || input_pressed(INPUT.ACCEPT)))
{
	is_keyboard_control = true;
	if (!global.IsMovedCursor) exit;
}

if (input_pressed(INPUT.LEFT))
	selected_index = max(selected_index - 1, 0);

if (input_pressed(INPUT.RIGHT))
	selected_index = min(selected_index + 1, instance_number(obj_button_parent) - 2);

var _mouse_gui_x = device_mouse_x_to_gui(0);
var _mouse_gui_y = device_mouse_y_to_gui(0);

var _button_to_check = collision_point(_mouse_gui_x, _mouse_gui_y, obj_button_parent, false, false);
if (_button_to_check != noone && !global.IsMovedCursor && _button_to_check.index != -1)
{
	global.IsMovedCursor = true;
	is_keyboard_control = false;
	selected_index = _button_to_check.index;
}
else if (_button_to_check == noone) global.IsMovedCursor = false;