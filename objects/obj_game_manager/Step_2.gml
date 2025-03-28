if (global.IsPause)
{
	with (all)
	{
		if (!array_contains(sequence_get_objects(seq_pause_menu), object_index) && object_index != obj_transition)
			if (alarm_time != -1)
				alarm[0] = alarm_time;
	}
	
	//part_system_automatic_update(Ps_Explosion_Heart, false);
}