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