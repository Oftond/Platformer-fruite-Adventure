if (!is_keyboard_control && (input_pressed(INPUT.DOWN) || input_pressed(INPUT.LEFT) || input_pressed(INPUT.UP) || input_pressed(INPUT.RIGHT) || input_pressed(INPUT.ACCEPT)))
{
	is_keyboard_control = true;
	if (!global.IsMovedCursor) exit;
}

if (input_pressed(INPUT.LEFT))
	selected_index = min(selected_index + 1, instance_number(obj_button_parent) - 2);

if (input_pressed(INPUT.RIGHT))
	selected_index = max(selected_index - 1, 0);