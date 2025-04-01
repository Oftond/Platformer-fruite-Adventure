//SetMusicPlay(MP3_Welcome_Home_Main);
show_debug_message(selected_index);
if (!is_keyboard_control && (input_pressed(INPUT.DOWN) || input_pressed(INPUT.LEFT) || input_pressed(INPUT.UP) || input_pressed(INPUT.RIGHT) || input_pressed(INPUT.ACCEPT)))
{
	is_keyboard_control = true;
	if (!global.IsMovedCursor) exit;
}

if (input_pressed(INPUT.LEFT) && instance_exists(obj_button_buyCharacter))
{
	if (instance_exists(obj_accept_get_moneys_menu))
		selected_index = max(selected_index - 1, 7);
	else
		selected_index = max(selected_index - 1, 0);
}
else if (input_pressed(INPUT.LEFT))
{
	if (instance_exists(obj_accept_get_moneys_menu))
		selected_index = max(selected_index - 1, 7);
	else
		selected_index = max(selected_index - 1, 0);
}

if (input_pressed(INPUT.RIGHT))
{
	if ((instance_exists(obj_button_buyCharacter) && instance_exists(obj_accept_get_moneys_menu)) || (!instance_exists(obj_button_buyCharacter) && !instance_exists(obj_accept_get_moneys_menu)) || (instance_exists(obj_button_buyCharacter) && !instance_exists(obj_accept_get_moneys_menu)))
		selected_index = min(selected_index + 1, instance_number(obj_button_parent) - 1);
	else if (!instance_exists(obj_button_buyCharacter) && instance_exists(obj_accept_get_moneys_menu))
		selected_index = min(selected_index + 1, instance_number(obj_button_parent));
}

if (!instance_exists(obj_button_buyCharacter))
{
	if (input_pressed(INPUT.UP))
	{
		if (selected_index == 0 || selected_index == 1 ||
		selected_index == 2 || selected_index == 3 || selected_index == 4)
		selected_index = min(selected_index + 3, instance_number(obj_button_parent) - 1);
	}

	if (input_pressed(INPUT.DOWN))
	{
		if (selected_index == 2 || selected_index == 3 ||selected_index == 4) selected_index = max(selected_index - 3, 0);
		else if (selected_index == 5) selected_index = max(selected_index - 1, 0);
	}
}
else if (!instance_exists(obj_accept_get_moneys_menu))
{
	if (input_pressed(INPUT.UP))
	{
		if (selected_index == 0 || selected_index == 1 || selected_index == 2 ||
		selected_index == 3 || selected_index == 4 || selected_index == 5) 
		selected_index = min(selected_index + 3, instance_number(obj_button_parent) - 1);
	}

	if (input_pressed(INPUT.DOWN))
	{
		if (selected_index == 3 || selected_index == 4 || selected_index == 5) selected_index = max(selected_index - 3, 0);
		else if (selected_index == 6) selected_index = max(selected_index - 1, 0);
	}
}