if (instance_exists(obj_transition) || instance_exists(obj_finishLevel))
	exit;
if (!global.IsPause)
{
	pause_sequence = layer_sequence_create("GUI", global.CameraWidth / 2, global.CameraHeight / 2, seq_pause_menu);
	pause();
}
else
{
	if (pause_sequence == undefined) exit;
	layer_sequence_destroy(pause_sequence);
	pause_sequence = undefined;
	unpause();
}