event_inherited();
index = 2;

button_press = function()
{
	if (obj_button_settings.pause_sequence == undefined || instance_exists(obj_transition))
		return;
	layer_sequence_destroy(obj_button_settings.pause_sequence);
	obj_button_settings.pause_sequence = undefined;
	global.IsMovedCursor = false;
	unpause();
}