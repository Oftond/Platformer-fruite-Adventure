if (!is_keyboard_control && (input_pressed(INPUT.DOWN) || input_pressed(INPUT.LEFT) || input_pressed(INPUT.UP) || input_pressed(INPUT.RIGHT) || input_pressed(INPUT.ACCEPT)))
{
	is_keyboard_control = true;
	if (!global.IsMovedCursor) exit;
}

if (input_pressed(INPUT.LEFT) && instance_exists(obj_button_buy))
{
	if (obj_button_buy.acceptWindow_sequence != undefined)
		selected_index = max(selected_index - 1, 6);
	else
		selected_index = max(selected_index - 1, 0);
}
else if (input_pressed(INPUT.LEFT))
	selected_index = max(selected_index - 1, 0);

if (input_pressed(INPUT.RIGHT))
	selected_index = min(selected_index + 1, instance_number(obj_button_parent) - 1);

if (!instance_exists(obj_button_buy))
{
	if (input_pressed(INPUT.UP))
	{
		if (selected_index == 0 || selected_index == 1) selected_index += 2;
		else if (selected_index == 2 || selected_index == 3) selected_index = max(selected_index + 1, instance_number(obj_button_parent) - 1);
	}

	if (input_pressed(INPUT.DOWN))
	{
		if (selected_index == 2 || selected_index == 3) selected_index -= 2;
		else if (selected_index == 4) selected_index--;
	}
}
else if (obj_button_buy.acceptWindow_sequence == undefined)
{
	if (input_pressed(INPUT.UP))
	{
		if (selected_index == 0) selected_index += 3;
		else if (selected_index == 1 || selected_index == 2) selected_index += 2;
		else if (selected_index == 3 || selected_index == 4) selected_index = max(selected_index + 1, instance_number(obj_button_parent) - 1);
	}

	if (input_pressed(INPUT.DOWN))
	{
		if (selected_index == 3 || selected_index == 4) selected_index -= 2;
		else if (selected_index == 5) selected_index--;
	}
}