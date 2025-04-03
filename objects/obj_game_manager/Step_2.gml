if (global.IsPause)
{
	with (all)
	{
		if (!array_contains(global.ObjectsPaused, object_index))
			continue;
		
		if (alarm_time != -1)
			alarm[0] = alarm_time;
	}
}

with (obj_player)
{
	if (is_death && other.sequence_loseMenu == undefined && other.is_checkpoint)
		other.sequence_loseMenu = layer_sequence_create("GUI", global.CameraWidth / 2, global.CameraHeight / 2, seq_loseWindow);
}