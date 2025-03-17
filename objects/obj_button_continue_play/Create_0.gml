event_inherited();

button_press = function()
{
	if (obj_button_settings.pause_sequence == undefined || instance_exists(obj_transition))
		return;
	instance_activate_all();
	layer_sequence_destroy(obj_button_settings.pause_sequence);
	obj_button_settings.pause_sequence = undefined;
	global.IsPause = false;
}