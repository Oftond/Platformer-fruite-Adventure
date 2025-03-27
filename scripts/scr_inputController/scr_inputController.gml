function InputBind(_device, _action, _keys)
{
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

function input_pressed(_action)
{
	var _keys = ds_map_find_value(global.Keyboard, _action);
	for (var i = 0; i < array_length(_keys); i++)
		if (keyboard_check_pressed(_keys[i])) return true;
	return false;
}

function input_held(_action)
{
	var _keys = ds_map_find_value(global.Keyboard, _action);
	for (var i = 0; i < array_length(_keys); i++)
		if (keyboard_check(_keys[i])) return true;
	return false;
}