event_inherited();
index = 7;

button_press = function()
{
	with(obj_button_buyCharacter)
	{
		if (acceptWindow_sequence == undefined) break;
		if (obj_menu_manager.is_keyboard_control)
			button_is_cooldown = true;
		delete_seq();
	}
	
	with (obj_button_buyHealth)
	{
		if (cancelWindow_sequence != undefined)
		{
			if (obj_menu_manager.is_keyboard_control)
				button_is_cooldown = true;
			delete_seq();
			break;
		}
		
		if (acceptWindow_sequence == undefined) break;
		if (obj_menu_manager.is_keyboard_control)
			button_is_cooldown = true;
		delete_seq();
	}
	
	with(obj_game_manager)
	{
		global.RespownX = start_player_x;
		global.RespownY = start_player_y;
		global.RoomData = { };
	}
	
	if (!instance_exists(obj_menu_manager) && instance_exists(obj_game_manager) && !instance_exists(obj_transition))
	{
		instance_create_depth(0, 0, depth, obj_button_showFullscreenAds);
		instance_create_layer(0, 0, "GUI", obj_transition);
		alarm[0] = 80;
	}
}

mouse_enter = function()
{
	image_xscale = koef_scale;
	image_yscale = koef_scale;
	var _mouse_gui_x = device_mouse_x_to_gui(0);
	var _mouse_gui_y = device_mouse_y_to_gui(0);
	if (device_mouse_check_button_pressed(0, mb_left) && collision_point(_mouse_gui_x, _mouse_gui_y, object_index, false, false) == id)
		button_press();
	else if (collision_point(_mouse_gui_x, _mouse_gui_y, object_index, false, false) == id)
	{
		image_xscale = koef_scale + (koef_scale / 8);
		image_yscale = koef_scale + (koef_scale / 8);
		
		if (!can_press || instance_exists(obj_transition))
		{
			if (input_pressed(INPUT.ACCEPT))
				ShakeStart(10, 8);
			else
			{
				image_xscale = koef_scale + (koef_scale / 8);
				image_yscale = koef_scale + (koef_scale / 8);
			}
			return;
		}
		
		if (input_pressed(INPUT.ACCEPT))
			button_press();
		else
		{
			image_xscale = koef_scale + (koef_scale / 8);
			image_yscale = koef_scale + (koef_scale / 8);
		}
	}
}