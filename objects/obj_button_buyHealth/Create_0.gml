event_inherited();

with (obj_button_parent)
{
	if (index > 0)
		index++;
}
obj_menu_manager.selected_index++;

index = 4;

buyWindow_sequence = undefined;
button_is_cooldown = false;

button_press = function()
{
	if (button_is_cooldown && obj_menu_manager.is_keyboard_control)
	{
		button_is_cooldown = false;
		return;
	}
	else
		button_is_cooldown = false;
	
	with (obj_character_show)
	{
		if (number == 2 && price > global.Moneys)
		{
			ShakeStart(10, 8);
			other.buyWindow_sequence = layer_sequence_create("GUI", global.CameraWidth / 2, global.CameraHeight / 2, seq_acceptWindow);
		}
		else if (number == 2 && price < global.Moneys)
		{
			if (name == "virtualGuy")
				global.BoughtVirtualGuy = true;
			else if (name == "pinkMan")
				global.BoughtPinkMan = true;
			else if (name == "maskDude")
				global.BoughtMaskDude = true;
			is_bought = true;
			global.SaveSystemManager.Save();
			global.Moneys -= price;
		}
	}
	obj_menu_manager.selected_index = 7;
}

delete_seq = function()
{
	if (buyWindow_sequence == undefined) return;
	layer_sequence_destroy(buyWindow_sequence);
	buyWindow_sequence = undefined;
	image_blend = c_white;
	obj_next.image_blend = c_white;
	obj_previous.image_blend = c_white;
	obj_menu_manager.selected_index = index;
}

mouse_enter = function()
{
	if (buyWindow_sequence != undefined) exit;

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