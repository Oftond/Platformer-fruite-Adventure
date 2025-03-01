if (instance_exists(obj_transition))
	exit;
if (!global.IsPause)
{
	instance_deactivate_all(true);
	pause_sequence = layer_sequence_create("GUI", global.CameraWidth / 2, global.CameraHeight / 2, seq_pause_menu);
	global.IsPause = true;
}
else
{
	if (pause_sequence == undefined)
		exit;
	instance_activate_all();
	layer_sequence_destroy(pause_sequence);
	global.IsPause = false;
}