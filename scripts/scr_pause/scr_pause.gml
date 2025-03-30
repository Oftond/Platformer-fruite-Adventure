global.ObjectsPaused = [];

function pause()
{
	global.IsPause = true;
	global.ObjectsPaused = [];
	
	with (all)
	{
		alarm_time = alarm_get(0);

		paused_speed = speed;

		paused_animation = image_speed;
		
		paused_gravity = gravity;

		speed = 0;

		image_speed = 0;
		
		gravity = 0;
		
		array_push(global.ObjectsPaused, object_index);
	}
	
	layer_vspeed("Background", 0);
	
	layer_set_visible("SFX_dust", false);
	
	if (global.HeartsParts != undefined)
		part_system_automatic_update(global.HeartsParts, false);
}

function unpause()
{
	global.IsPause = false;
	
	with (all)
	{
		if (!array_contains(global.ObjectsPaused, object_index))
			continue;
		
		alarm_time = -1;
		
		speed = paused_speed;
	
		image_speed = paused_animation;
		
		gravity = paused_gravity;
	}
	
	layer_vspeed("Background", 1);
	
	layer_set_visible("SFX_dust", true);
	
	if (global.HeartsParts != undefined)
		part_system_automatic_update(global.HeartsParts, true);
	
	global.ObjectsPaused = [];
}