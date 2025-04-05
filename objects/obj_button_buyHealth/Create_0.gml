event_inherited();

index = 2;

cancelWindow_sequence = undefined;
acceptWindow_sequence = undefined;
button_is_cooldown = false;

health_cost = obj_menu_manager.health_price;

button_press = function()
{
	if (global.MaxHP >= global.TotalMaxHP)
	{
		if (cancelWindow_sequence == undefined)
		{
			cancelWindow_sequence = layer_sequence_create("GUI", global.CameraWidth / 2, global.CameraHeight / 2, seq_cancelMenu);
			obj_menu_manager.selected_index = 7;
		}
		return;
	}
	else if (button_is_cooldown && obj_menu_manager.is_keyboard_control)
	{
		button_is_cooldown = false;
		return;
	}
	else
		button_is_cooldown = false;
	
	if (global.Moneys < health_cost)
	{
		ShakeStart(10, 8);
		other.acceptWindow_sequence = layer_sequence_create("GUI", global.CameraWidth / 2, global.CameraHeight / 2, seq_acceptWindow);
		obj_menu_manager.selected_index = 7;
	}
	else
	{
		global.Moneys -= health_cost;
		global.MaxHP++;
		global.CurrentHP = global.MaxHP;
		global.SaveSystemManager.Save();
	}
}

delete_seq = function()
{
	if (cancelWindow_sequence != undefined)
	{
		layer_sequence_destroy(cancelWindow_sequence);
		cancelWindow_sequence = undefined;
		obj_button_play.image_blend = c_white;
		obj_button_levels.image_blend = c_white;
		image_blend = c_white;
		obj_next.image_blend = c_white;
		obj_previous.image_blend = c_white;
		obj_button_volume.image_blend = c_white;
		with (obj_button_buyCharacter)
		{
			image_blend = c_white;
		}
		obj_menu_manager.selected_index = index;
		obj_button_play.can_press = true;
		obj_button_levels.can_press = true;
		return;
	}
	
	if (acceptWindow_sequence == undefined) return;
	layer_sequence_destroy(acceptWindow_sequence);
	acceptWindow_sequence = undefined;
	obj_button_play.image_blend = c_white;
	obj_button_levels.image_blend = c_white;
	image_blend = c_white;
	obj_next.image_blend = c_white;
	obj_previous.image_blend = c_white;
	obj_button_volume.image_blend = c_white;
	with (obj_button_buyCharacter)
	{
		image_blend = c_white;
	}
	obj_menu_manager.selected_index = index;
	obj_button_play.can_press = true;
	obj_button_levels.can_press = true;
}

mouse_enter = function()
{
	if (acceptWindow_sequence != undefined || instance_exists(obj_maxHealth)) return;
	if (instance_exists(obj_button_buyCharacter))
	{
		if (obj_button_buyCharacter.acceptWindow_sequence != undefined)
			return;
	}
	
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
	else
	{
		image_xscale = koef_scale;
		image_yscale = koef_scale;
	}
}