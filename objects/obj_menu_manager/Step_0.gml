if (!is_keyboard_control && input_pressed(INPUT.DOWN) || input_pressed(INPUT.LEFT) || input_pressed(INPUT.UP) || input_pressed(INPUT.RIGHT))
	is_keyboard_control = true;

if (input_pressed(INPUT.LEFT))
	selected_index = max(selected_index - 1, 0);
	
if (input_pressed(INPUT.RIGHT))
	selected_index = min(selected_index + 1, array_length(menu_buttons) - 1);

if (input_pressed(INPUT.UP))
{
	if (selected_index == 0 || selected_index == 1) selected_index += 2;
	else if (selected_index == 2 || selected_index == 3) selected_index = max(selected_index + 1, array_length(menu_buttons) - 1);
}

if (input_pressed(INPUT.DOWN))
{
	if (selected_index == 2 || selected_index == 3) selected_index -= 2;
	else if (selected_index == 4) selected_index--;
}

show_debug_message(selected_index);