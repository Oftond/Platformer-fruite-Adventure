function InputBind(_device, _action, _keys)
{
	if (!is_array(_keys))
	{
		if (is_undefined(ds_map_find_value(_device, _action)))
		{
			ds_map_add(_device, _action, _keys);
		}
		else
		{
			ds_map_replace(_device, _action, _keys);
		}
		return;
	}
	for (var i = 0; i < array_length(_keys); i++)
		if (is_string(_keys[i])) _keys[i] = ord(_keys[i]);
	
	if (is_undefined(ds_map_find_value(_device, _action)))
	{
		ds_map_add(_device, _action, _keys);
	}
	else
	{
		ds_map_replace(_device, _action, _keys);
	}
}

InputBind(global.Keyboard, INPUT.ACCEPT, [vk_enter, "Z"]);
InputBind(global.Keyboard, INPUT.JUMP, [vk_space, vk_up, "W"]);
InputBind(global.Keyboard, INPUT.LEFT, [vk_left, "A"]);
InputBind(global.Keyboard, INPUT.DOWN, [vk_down, "S"]);
InputBind(global.Keyboard, INPUT.RIGHT, [vk_right, "D"]);
InputBind(global.Keyboard, INPUT.UP, [vk_up, "W"]);

InputBind(global.Mobile, INPUT.RIGHT, INPUT.RIGHT);
InputBind(global.Mobile, INPUT.JUMP, INPUT.JUMP);
InputBind(global.Mobile, INPUT.LEFT, INPUT.LEFT);

function input_pressed(_action)
{
	if (global.is_touch)
	{
		var _key = ds_map_find_value(global.Mobile, _action);
		var _mouse_gui_x = device_mouse_x_to_gui(0);
		var _mouse_gui_y = device_mouse_y_to_gui(0);
		var _mobile_button = collision_point(_mouse_gui_x, _mouse_gui_y, obj_button_mobile_parent, false, false);
		if (_mobile_button == noone) return false;
		
		if (device_mouse_check_button_pressed(0, mb_left) && _mobile_button.action == _key)
			return true;
		return false;
	}
	
	var _keys = ds_map_find_value(global.Keyboard, _action);
	for (var i = 0; i < array_length(_keys); i++)
		if (keyboard_check_pressed(_keys[i])) return true;
	return false;
}

function input_held(_action)
{
	if (global.is_touch)
	{
		var _key = ds_map_find_value(global.Mobile, _action);
		var _mouse_gui_x = device_mouse_x_to_gui(0);
		var _mouse_gui_y = device_mouse_y_to_gui(0);
		var _mobile_button = collision_point(_mouse_gui_x, _mouse_gui_y, obj_button_mobile_parent, false, false);
		if (_mobile_button == noone) return false;

		if (device_mouse_check_button(0, mb_left) && _mobile_button.action == _key)
			return true;
		return false;
	}
	
	var _keys = ds_map_find_value(global.Keyboard, _action);
	for (var i = 0; i < array_length(_keys); i++)
		if (keyboard_check(_keys[i])) return true;
	return false;
}