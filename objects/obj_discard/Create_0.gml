event_inherited();

button_press = function()
{
	if (instance_exists(obj_button_buy))
		obj_button_buy.delete_seq();
}