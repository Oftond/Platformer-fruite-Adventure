event_inherited();
pause_sequence = undefined;
button_press = function()
{
	if (instance_exists(obj_transition))
		return;
	if (!global.IsPause)
	{
		instance_deactivate_all(true);
		pause_sequence = layer_sequence_create("GUI", global.CameraWidth / 2, global.CameraHeight / 2, seq_pause_menu);
		global.IsPause = true;
	}
}